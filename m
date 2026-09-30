Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A371CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 23:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DgZxlDzZ/OisfGA71vu7g2dsC1OBMa3nR+gsYol/NU=; b=Az1MdCVm2Ka9F7Wm164PH/Aigs
	ze2THV6NRZkcorrk20VWWabG5ipovPX3RlPINhLQP1fSkjPENrFDr6V25n1Zb7nTFNzRDQF7IAtVp
	IJ8O9p9H/EREsDF0OhUX1IiHLIObO6qyBIFnPQSeeoOe7S2Emh15EA+9JuqlP2EawFYC2KlQGiOyt
	Iq/f2QfT5OKm/qNvoBrKyIbrBE8srb6kv0AWtxKTbWoorm9TfoXFZCs40ZmDnQrGozElKIe0Zd9Go
	JhzqOrjM/MAHfa0unHZSIMfZBlkWjBEIOqEopaeSoZQx6eR2ieFm1VqHamy9lgcWuyHMkymvCKbz9
	2VSimAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3as-00000007RTJ-1eU1;
	Wed, 30 Sep 2026 23:20:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3aq-00000007RT9-1ARw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 23:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 530FE6021A;
	Wed, 30 Sep 2026 23:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071011F000FF;
	Wed, 30 Sep 2026 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790810407;
	bh=4DgZxlDzZ/OisfGA71vu7g2dsC1OBMa3nR+gsYol/NU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fkEzbIqFcbDoagTWp8AWr0jVC85j8olUHANZ703VvEDZGBGEQoXI7q/PwSlR5jTua
	 7AuuPeJ1nF4ebXpqfq4kA1jpVjTnCNtRnYbIlVEa7H9AwNlPGf3V4YdYMqVOvExX77
	 o+dLGH+a4/BD4ClDTk00tOJW97b1uRxD7Z/IU+AtvyZSDYJd+BJrdkv7wyjImb0sFa
	 eCWFea8XyyR+rxAV7ngWYnpbVHlliSeVPUdSJlQKIhUnEjYeDOIFZbZ7uBMR5Ctjfh
	 5Zm925J9BJNUuwbov2jEOzufh1aGY3xZqOgJwrbP1KEPa8kerhRC0H4dF/z60zmNSm
	 CL9401WqJE3mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F147C39EAF51;
	Wed, 30 Sep 2026 23:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5: make ports inherit the switch base mac
 address type
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179081040578.2169244.17245869964651407465.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 23:20:05 +0000
References: <20260928045012.30178-1-quentin@q-lab.dev>
In-Reply-To: <20260928045012.30178-1-quentin@q-lab.dev>
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, lars.povlsen@microchip.com,
 bjarni.jonasson@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 27 Sep 2026 21:50:12 -0700 you wrote:
> When the switch uses a random base MAC address it does not mark each
> port's address as random:
> 
>   $ dmesg | grep "MAC addr"
>   sparx5-switch e00c0000.switch: MAC addr was not set, use random MAC
>   $ cat /sys/class/net/eth0/addr_assign_type
>   0
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5: make ports inherit the switch base mac address type
    https://git.kernel.org/netdev/net/c/5642b1648d5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



