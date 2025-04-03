Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60CBC36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 22:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksKt9YGUnAx3ZDzBlKKp8D3XqmxW53MpBBSSYbEVUlg=; b=naiVXXCZpSXTP22tiDmQnW2d2o
	dHyUygjqYMT4/DeMnBdRR/nXHU2ytClZPPPtmwtaSzGwu+Z/JeYVqpxqdQUmvZ/lkGqktEarFrqVA
	gfw89bjDvo5rhdTDjDHuuqcBMLcqXUVbhYlxy3vn5mByp/xTnkabjc8o5UgSIeG8EIkTjcEkGOp6z
	jPgS8/P4xNrCvN7XyyJDOGvUNVnmBs3rDgXXXp9cc2ugkUCn0lIgTkYSFu5vl9pE7NMakQERITtQY
	yrrygo9WETqj34cWVUgsSgeaceVXbjdZVgDvPIl8vANkFZOdQWPwe0h7AcRl+bPPpJq0mN55sVd0c
	A1Wxne/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0TPZ-0000000AHtM-3LNg;
	Thu, 03 Apr 2025 22:51:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0TNm-0000000AHdT-2SIP;
	Thu, 03 Apr 2025 22:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1F5B614BA;
	Thu,  3 Apr 2025 22:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD26C4CEE8;
	Thu,  3 Apr 2025 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720597;
	bh=8Kg/t2RqkZte6lOZ5o3u94WA0oTskjj8aJjrgnHYWv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YmJoPO28sntJNdov6hfpPioOgUIChFYyaNcVAq5XQ1Ea/Qt2bDEShy6y4VWAXObcx
	 1zb2T1wNHVMALD/WjoNyfIn0mxJ4nENsdncxzdFJgshnDefBscSqRPQqgwamy+4toW
	 nvsS3QHInywPZcMR3PX2q1BdB5ocWlgLxz/tM5Q2pBJCPe8BsSyZ/TizQKpnXwK+y4
	 wtijEf1pqC6K5D/LgTd2I4mM9n8GM6OBWhtH1wKauYmuPJw4MWvlJ2x5Vs2WUV+B8a
	 gkKNCMo6r1NJWxea4Amgv3ZggxvTwkTJsAOJ7DlDpRTaYI6oyBqiHCZc3KKu2xJfM/
	 1658t8SJrAFYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B0455380664C;
	Thu,  3 Apr 2025 22:50:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174372063424.2709734.9248725253121002171.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 22:50:34 +0000
References: <20250401-airoha-validate-egress-gdm-port-v4-1-c7315d33ce10@kernel.org>
In-Reply-To: <20250401-airoha-validate-egress-gdm-port-v4-1-c7315d33ce10@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, 01 Apr 2025 11:42:30 +0200 you wrote:
> Dev pointer in airoha_ppe_foe_entry_prepare routine is not strictly
> a device allocated by airoha_eth driver since it is an egress device
> and the flowtable can contain even wlan, pppoe or vlan devices. E.g:
> 
> flowtable ft {
>         hook ingress priority filter
>         devices = { eth1, lan1, lan2, lan3, lan4, wlan0 }
>         flags offload                               ^
>                                                     |
>                      "not allocated by airoha_eth" --
> }
> 
> [...]

Here is the summary with links:
  - [net,v4] net: airoha: Validate egress gdm port in airoha_ppe_foe_entry_prepare()
    https://git.kernel.org/netdev/net/c/09bccf56db36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



