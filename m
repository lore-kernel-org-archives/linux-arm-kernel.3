Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2BDC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrRt0P/2BpKsjDQKJGSYoURZrzgU45J+4lvyY5L7RU4=; b=UartoqISsGUaLKsL0WwD77Ctim
	QLeUVURRkwQTAShqO7WRvzagdbt6O77D0Rs38eNDyV/06UCeuFa8J2nSWd98VqU0Fs4hXRaCXitFn
	TNcD/YkQfd4ujYELv+AwUtGuwtEVyxuG0Mm3PTELR7QM4KfHMI3B38t1eg24FpyU/GUmm14mOjkYo
	YyS31Ru1GpWTgiSPLOAloiYO+Mej/0ugyiuOGIKsVrZBMzuN6yrW+zt8Js1m88aGYxzgsbLnDeqOw
	ud+P7sDL7ZznhoDenF+QtF9JJnrKE+vJnNor8yoG5E8lI0rByKeq7zCsXdJQqJKQCu38gFd/JzNi4
	ZxkYZmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmG3-0000000Bc4t-0csG;
	Thu, 26 Jun 2025 13:03:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmCe-0000000BbV2-47cU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 12:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C99D43B14;
	Thu, 26 Jun 2025 12:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7669C4CEEB;
	Thu, 26 Jun 2025 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750942783;
	bh=IAXNpebqwGnH811nNw8L01SUPSZ3BgHcGCCaxklgrRE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d/qqZ7dyCecxQKoEp5C35mf0tY4Xei9auWHqGsR+F9UrbkKr69tVvLudUDG4XxJ09
	 a5j1CYSj1xHNmcd0LbVblPMIKgRvy8tfKOy0xJzN9cHuat4mwXLEYVGZA1ISN1xecQ
	 s9SabDo+LhrpJg1ySV25ND1qwaGJD8hXKTTgELIBRjG0aVXT5MAr1w6j9TwHLbj3z8
	 M7E777DhFQny545XpEmMRd5hWi4lKZYEaUjq9AJrh8u4znu+tDflQ6+VXnHsKS7G/M
	 A6zti8w8PaQTBbMDTp9zckisrJcRDg6P1p7qDekkFhJNofeAkWFb1Do96sC2iIDzCY
	 VRQHpRth77i4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D883A40FCB;
	Thu, 26 Jun 2025 13:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] Follow-up to RGMII mode clarification:
 am65-cpsw fix + checkpatch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175094281025.1193227.2852193769422273929.git-patchwork-notify@kernel.org>
Date: Thu, 26 Jun 2025 13:00:10 +0000
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, apw@canonical.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, joe@perches.com, corbet@lwn.net, nm@ti.com,
 vigneshr@ti.com, s-vadapalli@ti.com, rogerq@kernel.org, kristo@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_055945_038856_D2B00524 
X-CRM114-Status: GOOD (  10.37  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 24 Jun 2025 12:53:31 +0200 you wrote:
> Following previous discussion [1] and the documentation update by
> Andrew [2]:
> 
> Fix up the mode to account for the fixed TX delay on the AM65 CPSW
> Ethernet controllers, similar to the way the icssg-prueth does it. For
> backwards compatibility, the "impossible" modes that claim to have a
> delay on the PCB are still accepted, but trigger a warning message.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example
    https://git.kernel.org/netdev/net-next/c/9b357ea52523
  - [net-next,v2,2/3] net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay
    https://git.kernel.org/netdev/net-next/c/ca13b249f291
  - [net-next,v2,3/3] checkpatch: check for comment explaining rgmii(|-rxid|-txid) PHY modes
    https://git.kernel.org/netdev/net-next/c/e02adac7c84b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



