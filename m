Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA8DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGYoeDmiTIlfdYj/SmCDvoBmEjqLBYvUYlicIdwKfgw=; b=HgtqMUtQH7qWqWS4w6jbX1Y2zc
	bQ2hBB3QvjMZ22FAC9BBPeo2JNJQack8l9imtDf8j28Do5vs13HcCnX17xvM4knvSOPg4Hf2NBC93
	/mkCuugevKiOQfixtRNhGg/d0PWndvMJQc8iOhN1graSxHjRqnw5yOUhVcRHdHB5kkNz1AhAKNAYv
	gVQr2Lqj6SazdSFg7H7nOivOSp4VzZYeE2V9XqaOJsgcDrYed+xUtNrixpwEiUBgR395Ds2ks89RB
	HQwKPAZXTPx3sa+Tj53uub9+soGkOso2oBDdDYrp2WYcEl+EO5MvENzNupNwCVKIA0Ow1u1p4Z5vM
	MyXHBLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24PU-0000000H2vd-1P9F;
	Thu, 03 Sep 2026 10:11:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24PS-0000000H2ux-1WBA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:11:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76A13601EF;
	Thu,  3 Sep 2026 10:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A21D1F000E9;
	Thu,  3 Sep 2026 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788430265;
	bh=WGYoeDmiTIlfdYj/SmCDvoBmEjqLBYvUYlicIdwKfgw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RG5l4Wr43OAfnf70QcrrsdqVdV1oDRbVe+GRSrmN4DU6pkevZFSxBmI2Mr7gM+0Qx
	 kCM6EKyqQigs3Z3Q7rU6wzt2fkCYoKJecFDclkSRwv+ypXCBEz9sXwfv4Ze+OoAT1+
	 TGWPPrBrp0kNPOHZYpbhQ7uFrCMpjEZWL4hS3Yi9dQJbPOYnOXq5Omb+e51AE12DL7
	 ZaxnQLkVIsgtxBWH1arxoJn4JrN2l2GEifWzWFFFlng9Z5LP9VDWnhP3HymZ0ZDrWw
	 nf+lD6d/zzPO6dW4fz0yCiS0qRAyueA2A2NLESv71ZNMpe2u3TvyyOmQ3Ak4Hl6/eT
	 DITiwOqCemKZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D099E3811965;
	Thu,  3 Sep 2026 10:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: stmmac: drop the queue-0 pinning for GSO
 frames
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178843020640.3244835.6785391854454806070.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 10:10:06 +0000
References: <20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85@oss.qualcomm.com>
In-Reply-To: <20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 31 Aug 2026 08:48:33 +0200 you wrote:
> stmmac_select_queue() forces every GSO frame (TCPv4/TCPv6/UDP-L4) onto
> TX queue 0, relying on the legacy assumption that at least queue 0 is
> always TSO/USO capable. This is no longer needed since
> stmmac_features_check() already validates each GSO frame against the
> capabilities of the queue it is mapped to, clearing the checksum and GSO
> features for queues that cannot perform TSO (e.g. TBS queues or queues
> without TX checksum offload support).
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: stmmac: drop the queue-0 pinning for GSO frames
    https://git.kernel.org/netdev/net-next/c/8e2faf945a13

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



