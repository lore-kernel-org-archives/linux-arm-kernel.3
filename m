Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27512C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0vJ70hhxSe/9wgI2ckHbu59NI2o4+g8q2RxinOK0C8=; b=BEFmfz8cdDHb0s7WVrT8mxi0Gq
	tbwHfvBLtUdPb0jMJH/b0l5BlPbZVr01GFx6xoCdHGBY33jAzcZWRemuTcB0qtltHpsBcTb8R7vp3
	pVR9NgVJPoy0w6J6HNeCqYYkw/P9SrrCA+m8KSU9e9RVQQOdF7t1d2QVe9unvIEY7uk0etnL58J7e
	2zwohpoT+XPFabhtqBJ0fUptxvyw11aAeVOGZ1joNQCShLWNteUhiNT04Oq6QMlOa6FFAxqJyPduB
	ahDpwxZskb4C5vHIKF6Kqn9sjkg3GfJymFKUI3H9kRetf1yAh3nTYNKqHsPhCCZPRZedfWDjlD34d
	/tr6Yprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVBz-0000000GOlg-044v;
	Sat, 12 Jul 2025 08:02:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV6r-0000000GOG4-0Oix
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15EE460008;
	Sat, 12 Jul 2025 07:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61EFC4CEEF;
	Sat, 12 Jul 2025 07:57:23 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id AA99B5F939;
	Sat, 12 Jul 2025 15:57:21 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 iuncuim <iuncuim@gmail.com>
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Allwinner: A523: add support for A523
 THS0/1 controllers
Message-Id: <175230704168.812199.2009708647014789629.b4-ty@csie.org>
Date: Sat, 12 Jul 2025 15:57:21 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 03 Jul 2025 23:11:24 +0800, iuncuim wrote:
> This patch series adds temperature sensor support for the Allwinner A523
> family of processors (same die with H728/A527/T527)
> 
> Changes:
> 1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
>  - added new patch
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[7/8] arm64: dts: allwinner: A523: Add SID controller node
      commit: 082c6a2d06c0831d236760a29953355845eee988

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


