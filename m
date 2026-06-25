Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED9CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3p64QLxeoSw9Yq4VL1TE72ZFtwb/GGd34Qq6hX/+TA=; b=TbaA4op9uhoPoQCTA7hrnThBGV
	8fxulxw46nzEHNu8C7iTPIpDgzpknMGOAto6yv8Wr1rI69MUpoSVXjRFGouz3KojrriAQ7Bd2aYKO
	qhABKcdf8WjMhzFcNDYwZskVqfETaKuW82LKFpAKpxVP6T0ZuTtd9mfACT45Y7uK/1kx590OrnTV4
	MSyVdiiB6laQfMFblsE4uYR7rSyeCbxVhw3qtNd0Dy/sKQOA0Za7lkdq1ej6ahvkTCjaNlCNMX2df
	nuvhbs7lbEdJLck2iWHpKpfiPdnSYmt6fbQ1D/ValQ2M4YMojvIHMGJS9lAcpem0GsmCpopmtEoX6
	kCJxdDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca14-00000008a0p-0cjK;
	Thu, 25 Jun 2026 02:40:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca11-00000008ZyM-22vB;
	Thu, 25 Jun 2026 02:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C23C540587;
	Thu, 25 Jun 2026 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A318D1F000E9;
	Thu, 25 Jun 2026 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782355230;
	bh=p3p64QLxeoSw9Yq4VL1TE72ZFtwb/GGd34Qq6hX/+TA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=P7na+PilaTea4ySP01h/CB9/1d51ZEgJcB7t4yjiyW9Ebe7bbB7g6R4goX2Rmjp0H
	 cLTNwxK3eGUO/45R/Th60rbmu7WVB71uVsdxW6Eug3N7pygfq0v/uHvrGk3WSpYxYk
	 woZZHkRYnTntt0wUy7+jl6jsPvOAVL5NrKXIH26Ej6JVfwLVHAXh93JXiyoT+NOPMM
	 Mx1HIGld4tyrEBuL39iT9CmYKVGY59II1ErPcDFch1hfcX3mf24hIiJqp+ijX8Ic0Z
	 AM1gKYE6qD2JJJPKsFnv22Cg//Hmj/3qWuDHLSkuJPoGGNFJKA6ATQwzlhLbARGgl2
	 1mhHuKPw/iXLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199423AAA6DE;
	Thu, 25 Jun 2026 02:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: stmmac: dwmac-spacemit: Fix wrong macro
 definition
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178235521877.3091545.4674535688381617061.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 02:40:18 +0000
References: <20260623074637.503864-1-inochiama@gmail.com>
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dlan@kernel.org, rmk+kernel@armlinux.org.uk,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, dlan@gentoo.org,
 looong.bin@gmail.com
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 23 Jun 2026 15:46:33 +0800 you wrote:
> Fix Wrong macro definition of the Spacemit K3.
> 
> Changed from v1:
> - https://lore.kernel.org/netdev/20260618064143.1102179-1-inochiama@gmail.com
> 1. Separate the patch into two patches
> 2. Use the right macro name for the LPI interrupt.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
    https://git.kernel.org/netdev/net/c/d1e3a4c3b24d
  - [net,v2,2/2] net: stmmac: dwmac-spacemit: Fix wrong irq definition
    https://git.kernel.org/netdev/net/c/bf5cd5d4ca42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



