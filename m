Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C07E9A050
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rpi5B9mieofuRvn4aUQgU1WELLotMUCncPEC7vcJmQ=; b=A78mbrdYWYL3B6DD7/wAAxucX5
	AP4bH3wEoYgeNTTEmgkar5JYCc/xITJ+bsGoTiFVmVIyZ1x/yevw8cG61oRdjq2Fic7RrQd8RNHiE
	oFVx8tZN+iicweTcyBbLeqCgDy25I4C/VvfdpL45gpJ4GGnnHciEZwOv6E1080YnoKd+84AE5MbRb
	h6ZICmhxg7poB5Qbehq8Txfd2HrD8b7dj7Y4poxiPbLhzfMuPD16UOiAgA2/5azGGurAuVtKZ98yn
	BvUJFURJ8jGH764nTcLW4ookfnAY5qQS9p1zN96HpJXeL7u+r0aHc89OkpoIOJC+Yr6YwfuF6Ws92
	8rwJMILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt77N-0000000Be5N-3JCp;
	Thu, 19 Feb 2026 16:43:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt77L-0000000Be4k-1XWr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 16:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+Rpi5B9mieofuRvn4aUQgU1WELLotMUCncPEC7vcJmQ=; b=HeL4Yi7uHthOqg7HIMXDPjEeSs
	T8KR2XIToBHFMuoU1k9u7uWKxwLThW5JgSs+1gH7h/vtYsGVC1yFdTxesf6qZovamS4vb4qhhKmqV
	pA2fGflVHNoBhm2+7xHWfEg2N9rXdEb7BthfX8ZVQT6JfzDelsenC6++UWU43B7JfDaY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt77A-007wRj-FZ; Thu, 19 Feb 2026 17:42:56 +0100
Date: Thu, 19 Feb 2026 17:42:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com
Subject: Re: [RFC PATCH 0/8] xilinx: tsn: Add TSN Endpoint Ethernet MAC
 driver support
Message-ID: <5f884e29-151a-4ee7-9e1a-d7e1f84d9f6c@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219054911.2017362-1-srinivas.neeli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_084307_411753_0CBB6CF6 
X-CRM114-Status: GOOD (  21.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 19, 2026 at 11:19:03AM +0530, Srinivas Neeli wrote:
> Introduce a new network driver for the AMD LogiCORE 100M/1G TSN
> Subsystem IP, also known as the TSN Endpoint Ethernet MAC, which
> implements IEEE 802.1 Time-Sensitive Networking (TSN) features for
> deterministic and low-latency Ethernet communication in real-time and
> industrial automation use cases.
> 
> IP Core Overview:
> The AMD LogiCORE 100M/1G TSN Subsystem IP solution (named as TSN Endpoint
> Ethernet MAC IP in the IP catalog) implements IEEE 802.1 Time Sensitive
> Networking (TSN) Standards and provides a low latency Bridged Endpoint or
> Endpoint only solutions.

So an Endpoint only solution is not connected to the switch? It
outputs RGMII, can have a PHY connected to it, and so is a single
netdev interface? You would typically use this in a client?

But you can also instantiate the same MAC multiple times, connected to
an Ethernet switch? That would be the bridged endpoint?

> The bridged endpoint solution consists of a 3-port
> switch that connects to an endpoint including Linux software drivers. For
> Bridged Endpoint (Switch Endpoint), two ports connects to the network and
> one port connects to an internal Endpoint.

To the host, does the internal endpoint just look like a standard
netdev?

What i'm trying to do is get an answer to: Is this a DSA switch, or a
pure switchdev switch. If the host sees a netdev which is connected to
a port of the switch, it is probably a DSA switch. If the host only
sees the user ports, it is probably a pure switchdev switch.

> It supports the use of
> GMII/RGMII interfaces connecting to a physical-side interface (PHY) chip
> with full duplex 100 Mb/s and 1 Gb/s operations.

No 10Mbps support?

> - Provides feature rich Ethernet Switch that caters to various network
>   needs
> 	* 3-port Switch (2-external, 1-internal)
> 	* Programmable cut-through and store-forward operations
> 	* 4-port Switch (2-external, 2-internal) extension through
>           'Endpoint Extension' and 'Endpoint Packet Switching' features

Why not N-ports? Is it really set to 3 or 4? It cannot be synthesised
for 5, 8?

> Sample hardware architecture diagram for Bidge End Point like below:
> 
>              +------------------+
>              |      MCDMA       |
>              +---------+--------+
>                     Q0---Q7
>                        |
>           +------------------------------------------------------------ +
>           |            |	 TSN sub system(Bridge End Point)	|
>           |            |                                                |
>           |     +------+----+  Port 0   +-----------------------+       |
>           |     |  EndPoint |<--------->|       TSN Switch      |       |
>           |     |    (EP)   |           +----+-------------+----+       |
>           |     +-----------+                |             |            |
>           |                                  |             |            |
>           |                              Port 1         Port 2          |
>           |                                  |             |            |
>           |                            +-----------+  +-----------+     |
>           |                            |  MAC-1    |  |  MAC-2    |     |
>           |                            |  (ETH1)   |  |  (ETH2)   |     |
>           |                            +-----+-----+  +-----+-----+     |
> 	  |			             |		    |           |
>           |				     |              |           |
>           +-------------------------------------------------------------+
>                                              |              |           
>                                           RGMII           RGMII
>                                              |              |
>                                       +-----------+  +-----------+
>                                       |  PHY1     |  |  PHY2     |
>                                       | (Port 0)  |  | (Port 2)  |
>                                       +-----------+  +-----------+
> 									  

So how does the host send a frame out Port 2? Is there an extra header
on the frame sent by EndPoint, which the switch interprets?

FYI: Seems like PHY1 (port 0) is a typO.

> - During driver initialization, all switch ports (Endpoint, MAC1, MAC2)
>   are configured into the Forwarding state to enable data flow across the
>   fabric.

Which is wrong. The Linux model is that switch ports are just
netdevs. You configure them just like every other netdev in the
system. Newly created netdevs are standalone. They only allow frames
to pass between the wire and the host. If you want them to L2 forwards
frames between ports you need to add them to a bridge.

	Andrew

