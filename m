Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4223AC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZzHub50NUiUKPaVsrqQyrqXavK1MTD7GO/OVlppjGo=; b=AOgY3+EEpxAMIZc/RYBJhaxaIi
	BmFf/07/g2hJt0jQERP4VmIl8wSbKzz2F2ygHK+a4nNd25Ig9ddQy3Ac+5OjLlzWKiipXnAYiqg7W
	/IBPu54xoHK3sDPXG2YQ5tomIffUpe+G7+m7iF+eRGrQJRAmW/5s0DmVnX9t95Z6wgF2eDmmPOL9g
	/X3uPBFlNeoE57N3D+2qdlfR5FyTi4E7I/dha3bWuqLAFCz7o3EH9d7zxMsOrLw1R8F6JWiYFkB0y
	leV5TLupjW09hk3uyKfEl1oIxsJO2X9prKP49PYRDaXlA4Pj0ydH5TMYyfE5l+NJZkOQgiRDfzLgE
	CNGQ2lDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hGc-0000000Fdmp-1R6L;
	Fri, 18 Sep 2026 22:41:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hGa-0000000Fdme-3okE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:41:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44D5840279;
	Fri, 18 Sep 2026 22:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B6F1F00899;
	Fri, 18 Sep 2026 22:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789771272;
	bh=PZzHub50NUiUKPaVsrqQyrqXavK1MTD7GO/OVlppjGo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=opI3mdhzaGjrf9VR0oq+Vweg5Pg+4c+lpro4Ht+uFlMiTu55lBYVKfl2V3KQtRlo+
	 +iapi8VMzr3Ob33vPU2Uw8ylYXQGtlxgd7/qBKQlOlT9ms5+UAeiaeD4Yq96GhNkUM
	 PTCBu42UPxZkHAnSjhSD4UNeHhZcNi4MWX92evja+kn40Tjaogf0o1IPONXDVF/4JQ
	 R7O+Ntv4xWDtTGo9h8yoWFTl9THc3y//VrIOgBf+zduJ7J7GmSIvkNXF8l0/LWgXnB
	 a9Aw3WT+quSoMTeOiybV0/p/yxBYOc+yFijPK/c0cEg+twpgr0eG0sO9pVW/aTHfY1
	 xV5RSWtJRQt3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A70381196A;
	Fri, 18 Sep 2026 22:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: snps,dwmac: allow stmmaceth-ocp reset
 name
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178977120515.1175834.1142348377403795349.git-patchwork-notify@kernel.org>
Date: Fri, 18 Sep 2026 22:40:05 +0000
References: <20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Nazle@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Asmade@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Muhammad Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, dinguyen@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  9 Sep 2026 01:05:59 -0700 you wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Arria10 SoCFPGA DWMAC nodes use reset-names = "stmmaceth",
> "stmmaceth-ocp", which matches what dwmac-socfpga looks up for the
> OCP reset. The generic snps,dwmac binding only allowed "ahb" as the
> second reset name, so Arria10 DTS failed schema validation.
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: snps,dwmac: allow stmmaceth-ocp reset name
    https://git.kernel.org/netdev/net-next/c/0a9b6e9385dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



