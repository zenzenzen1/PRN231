using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;

namespace Service.MangaOnline.Hubs
{
    public class PaymentHub : Hub
    {
        private static readonly Dictionary<string, string> _userConnections = new();
        public static readonly string SendMessageToUserMessage = "ReceiveMessage";
        
        public static string GetConnectionId(string userId) {
            if (_userConnections.TryGetValue(userId, out string? connectionId))
            {
                return connectionId;
            }
            // throw new Exception("User not found");
            return "";
        } 
        
        public override async Task OnConnectedAsync()
        {
            var userId = Context.GetHttpContext()?.Request.Query["userId"];

            if (!string.IsNullOrEmpty(userId))
            {
                // Store the userId with the connection ID
                _userConnections[userId] = Context.ConnectionId;
            }
            _userConnections.ToList().ForEach(x => Console.WriteLine("key: " + x.Key + " Value: " + x.Value + " ConnectionId: " + Context.ConnectionId + "\n"));
            await base.OnConnectedAsync();
        }
        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            var userId = _userConnections.FirstOrDefault(x => x.Value == Context.ConnectionId).Key;

            if (!string.IsNullOrEmpty(userId))
            {
                _userConnections.Remove(userId);
            }

            await base.OnDisconnectedAsync(exception);
        }

        public async Task SendMessageToUser(string userId, string message)
        {
            
            if (_userConnections.TryGetValue(userId, out string? connectionId))
            {
                await Clients.Client(connectionId).SendAsync(SendMessageToUserMessage, message);
            }
        }
    }
}