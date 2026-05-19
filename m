Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FA7CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkprrYdfWhkx6J9flFoi6L3P4YWYE5Q1VOKgEmo7LxQ=; b=BYDsafCmR3SzlV0wRbveEhCG+c
	UIVP3inMbG0Vk/uRy7gF+qKRAz5QGasG0lnaS527s/1VCpH+YoLKv8hULsOHYr/83pueyXbfMsoE5
	P9/GNivQIeoKVUFqOiJPe/G8MFU4eADmL+e5TqOhLjFyLbmQG64xG95+Ye3EJJ9OB9n4Y6OfneZcJ
	hLcAsrk81k0mC363vFML/wVpR7ClMKhYM6pu+hzJOHiieR5T62cX8+BE8LVGsvG3B1xDkh1Bydy/S
	OO0Tfu6Bygv0nKOcRexLOYQygxUrMTXNQ4kHc+HJDvdUboC+xyUlYKuPmkzqHvZVduP1+pzky6fvF
	glfX+vTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIBD-00000001Ejf-0by4;
	Tue, 19 May 2026 11:00:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIBB-00000001EjK-3Jbm;
	Tue, 19 May 2026 11:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 255466020B;
	Tue, 19 May 2026 11:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA096C2BCB3;
	Tue, 19 May 2026 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188404;
	bh=D70H8Z4eH+y64Ue+L6Bm0Ag7ZBzliT4c6WevcCypox4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iPUIODfCaMJLjvG1v/JW2fhHgzecuRBBH7AUIjfNTi71epV71OjlhZYJh4xCpQhJM
	 7e4Tqi1cmzpd7I71T6IoVh0qMQwmlMVcosJG0zIIwxfk49XfiwOVPmFTyBscfBCYDd
	 uVYF1E4N8df6Le51DRnK7qrx1BtvQtzKX6qCUs6fsL95KEWuf3fojbbLtgUcEOmOIP
	 ZofkHQxlkOvLQzcrAfXnc4fQIXhv9LLZ3+1XsLoWH+bc/1TXwoB1Ks/FM4spfRIuHs
	 78v6i5kEBUkvC77X5kJwTT6vhZlBM/0q3VlaagGXLEkZXJ9QJTmX1045li2XHmrVE7
	 F6KzNGZHPSrBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1995D3930E03;
	Tue, 19 May 2026 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/5] net: dsa: mt7530: assorted fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177918841597.2243186.15077319366803058468.git-patchwork-notify@kernel.org>
Date: Tue, 19 May 2026 11:00:15 +0000
References: <cover.1778766629.git.daniel@makrotopia.org>
In-Reply-To: <cover.1778766629.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dqfext@gmail.com, f.fainelli@gmail.com, arinc.unal@arinc9.com,
 sean.wang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 14 May 2026 15:04:06 +0100 you wrote:
> A batch of small, independent fixes for the MediaTek MT7530 family DSA
> driver, addressing long-standing correctness issues that surface on
> hardware with bridge VLAN filtering enabled, on link-local frame
> reception, and during bridge join/leave transitions.
> ---
> Changes since v1:
>  - rework patch 1/5 following up Paolo Abeni and Sashiko reviews
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] net: dsa: mt7530: fix FDB entries not aging out with short timeout
    https://git.kernel.org/netdev/net/c/e824e40d0e84
  - [net,v2,2/5] net: dsa: mt7530: preserve VLAN tags on trapped link-local frames
    https://git.kernel.org/netdev/net/c/3ac85bcfd404
  - [net,v2,3/5] net: dsa: mt7530: fix CPU port VLAN not being reset to unaware
    https://git.kernel.org/netdev/net/c/2c4c76cacc9d
  - [net,v2,4/5] net: dsa: mt7530: clear flood flags on bridge leave
    (no matching commit)
  - [net,v2,5/5] net: dsa: mt7530: untag VLAN-aware bridge PVID
    https://git.kernel.org/netdev/net/c/4cb3cd670b2a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



