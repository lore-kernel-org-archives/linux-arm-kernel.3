Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30015C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 02:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/vxp0rlelwMI8+MNA/pad+thFUYQLcx3HcPeGzNk6k=; b=xCUM/nGXHYrvmBEVcW40lbT072
	9Pq3TghRmh6RIMlwY0fijmtPFbvQWRjdMP7Ap7mUPwHrYTKbnQPeR3/gMbTBwlDS46MpN/TLv85ZK
	B+ctZyX0TKilLnhggBVvV9GXRiTeb2Qm2sRbhPLvtyIpgheXNakQf+Ii/6iSzcDwfqidG9BMtscJ4
	vHR/7YSAcu0+GmNFFw2yASKw2Fv446NWT9bE+aF852BrdfZOWDG1vLEaLlPOe+LZs5btgVL8FJe57
	mTnzbJgTRarWk8hmGQHkKP6LWW4+Z83oEUpQgPUdL1raUQKvEG5yMQ831iMAJRXW5oBXvUmM9Ol93
	HqGIYkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PaZ-000000091X6-2fLv;
	Wed, 23 Apr 2025 02:11:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PYd-000000091BO-2XfC;
	Wed, 23 Apr 2025 02:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6A434A965;
	Wed, 23 Apr 2025 02:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073F4C4CEEC;
	Wed, 23 Apr 2025 02:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374191;
	bh=9Eq6F5rNFpCaMiyqHi+sGGOWlrMFXjbKYuY+wV7w51U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AxgRkm7iSqpy2pItlu4TMsQH/qP9CltUAWA/2h/JIakeTqGhgWgXBEJwc/zGJaNvk
	 ZEGz6jcQIp3+0y+iX+iJ2KtQJo3MHUT57yENhZfSs8e+tA1yNBJ/NIrUPqEWU8G+Wo
	 omx4oYNbHSpKd5Vcc1Dy2r6OMjnzpCGabMcKrd63otAeeCHX5YYdSQUP5TtZQ4IswQ
	 Scm/0/lBcvGD99vpdnEsCYnvpznAkA3pgjLLx783lz27Zq9glqSwiDId6q2lURu8VB
	 +xV5ZbMCyos9DVbug3tIc6+PpY3Rr2QIapcmWZarklSAMkah0zK4/89MDufe5Bx32p
	 Er9YAkN85jcQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF33380CEF4;
	Wed, 23 Apr 2025 02:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: ethernet: mtk_eth_soc: net: revise NETSYSv3
 hardware  configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174537422950.2115098.6975575929534366973.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:10:29 +0000
References: <b71f8fd9d4bb69c646c4d558f9331dd965068606.1744907886.git.daniel@makrotopia.org>
In-Reply-To: <b71f8fd9d4bb69c646c4d558f9331dd965068606.1744907886.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_190951_664003_658C8EAE 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

On Thu, 17 Apr 2025 17:41:07 +0100 you wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> Change hardware configuration for the NETSYSv3.
>  - Enable PSE dummy page mechanism for the GDM1/2/3
>  - Enable PSE drop mechanism when the WDMA Rx ring full
>  - Enable PSE no-drop mechanism for packets from the WDMA Tx
>  - Correct PSE free drop threshold
>  - Correct PSE CDMA high threshold
> 
> [...]

Here is the summary with links:
  - [net,v3] net: ethernet: mtk_eth_soc: net: revise NETSYSv3 hardware configuration
    https://git.kernel.org/netdev/net/c/491ef1117c56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



