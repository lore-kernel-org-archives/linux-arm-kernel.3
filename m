Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58449CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIlcfUM5yx0zo8woN7gotIggTkdWYNMGQKYLuoK3Kzo=; b=G+dFWZu6sYrxUklFuzbP7rbBsE
	xRiSeHJrlXa3tlbtOr0DMYMP+liUC7+MZBb1BPZiBjwo+un4Z6DwiVniy/XmKfWoDvVbZtHmlO0VF
	qhCNwhqWWRnkUvEiqsssoOK3agKuecUFb91O7wEa4tjGEBZsxMs8mQyl89pLWitUHGPocfCxFAdBk
	i8vdI3asNADh3dNgp9RK1lD1ye4lAB6OM5kgBGJo6MGWLufR2sJcv3Mi16IFgoNSXNaM1t3SibKuL
	ZG/jH2mjxKYcBP6zBWZQJmpozb4oS2z4+VVBQXG/WyKWM5s4HO0p4Z8aSlaToVp0Vny2UHDuZjXad
	l69jaTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgaA-0000000BFrU-0rha;
	Thu, 13 Nov 2025 23:18:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJga8-0000000BFrG-38O6;
	Thu, 13 Nov 2025 23:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UIlcfUM5yx0zo8woN7gotIggTkdWYNMGQKYLuoK3Kzo=; b=sdmNz80u4R7KIYfKjvNTKn1+o+
	3pbvxcZ9yPGh8t6sBz+/ZNnK/tPGEEeVIbHJthSLkDc/7Ry5NMnlvlA4QICE/hqfIRDOVB+oim3X3
	cX3Ndr/mmYQZ41+B2qj/k0hJRypNOHhG60fhDWl7qrvCKlxHXNDR+h5Nt14MfbJPU1ctl46cvkfRL
	wNTvgpGb0+80gUVwAx7oNo0A6/Z5QwCCRhW4sZ5OEZNRscTCRTvvhmJdv3LzLEnUGs/QwNbwgSFaZ
	9iPQlwLEujhNXAEIh1PdVUe0AP3rk2qwpiJn6fSQRcJ9pwk7wC4KOLoIQ0majw1CJnB83ft/gJsug
	BqGC/k5A==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJga5-00000008KD3-2JEc;
	Thu, 13 Nov 2025 23:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UIlcfUM5yx0zo8woN7gotIggTkdWYNMGQKYLuoK3Kzo=; b=P0aJVu7S24MIQH/+hmQ/K7aQ6m
	/cM8o48RufHby5hhUNd42IJe76BLDqHPOOFRLdIHCxX3sN+qXuFXbUYdR8JX3Gk+iz1FVA1umTBGA
	WQVeuo674VDoeW/Gf65kEYVtdvQZxzExNZXoSmCNUZqfZsdacGxmbKazeJz8o3tUiNstQwypHqaQn
	DATM186UI/MXeAmu8AV9WiyKjad27vIuLLohD9hR8zBjqAEjvbuTYvjeD1ExVCORCikrObruT6/Kz
	BrGL+jf1B6xB/K/xiQqDtwYqeCAPNB82abt2D5Frf0Iy5Il8IDOBi5Yt8XAi8rlYheN/oJUgVJCfd
	ecO4xVNA==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJga2-0005lz-T1; Fri, 14 Nov 2025 00:18:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: rockchip: disable HS400 on RK3588 Tiger
Date: Fri, 14 Nov 2025 00:18:15 +0100
Message-ID: <176307584244.496508.13187740741138486595.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251112-tiger-hs200-v1-1-b50adac107c0@cherry.de>
References: <20251112-tiger-hs200-v1-1-b50adac107c0@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231821_841015_C6FBB9EA 
X-CRM114-Status: UNSURE (   9.27  )
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


On Wed, 12 Nov 2025 16:01:53 +0100, Quentin Schulz wrote:
> We've had reports from the field that some RK3588 Tiger have random
> issues with eMMC errors.
> 
> Applying commit a28352cf2d2f ("mmc: sdhci-of-dwcmshc: Change
> DLL_STRBIN_TAPNUM_DEFAULT to 0x4") didn't help and seemed to have made
> things worse for our board.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: disable HS400 on RK3588 Tiger
      commit: baa18d577cd445145039e731d3de0fa49ca57204

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

