Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C57C77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anb81OEG4hgZhk30oTpxHvHdm1Zaf844E/3J8ziG24M=; b=IItjG3kFlLYNlKF/4il8rqe60s
	Y0+pmwTd+5lkIJ3zoWX8WB1BqnaQCgcYE8nuoqD/VzAxlbsVUpOgPBeH0+H/10RJ9CU0fpIl7gJrc
	raP4jXghH88Yz+ZEv3EyNVsSmhk7itYzd+rwUnaTKzJ1LhfF6pWSd4Ah8zj9+4q/zNNBoVBqsVZzp
	2mQ85+CinWDOr3NjLWkr3LWJQUCJrETbmeK23Tr8juAudi8RZl9+pXsFBymMuAu32JAzEnpqDMbqE
	3/b0uM0M2m/Ir6hzQV+WmCcBK60urIfVJXi7VG759O2qU4vS8Gdc19GUEIhuG2JVqcINQMOLDDnye
	ISrlHJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMSY-0000000EGhB-1RJI;
	Thu, 19 Jun 2025 21:06:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLI1-0000000E9Lt-2VuK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:51:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EE2B61132;
	Thu, 19 Jun 2025 19:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA69C4CEEA;
	Thu, 19 Jun 2025 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362672;
	bh=anb81OEG4hgZhk30oTpxHvHdm1Zaf844E/3J8ziG24M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K+LvtMM2sTUk0ihGb949GgfIiwtJROqxy/0GvXgajl3JH2BYSrI125gfojR4BeQty
	 TSYaMsKuj7A9dAq8Px2oWBMpuPTs+iVCQgSILCBtHoUUhUTaIK3xukTT3mPJurGD9L
	 63W2AWBlQMNZjQ1BVF/VbGHlDlj/kBg9X3/a9HyKRckncEqm+XIVff0w7fN1T+xUEN
	 WZZjvSIMYUPb+Fdq4Z6BbNfSYQHx16TkVrNsIyKiKvv+UlUoLvcD1wAgpJhHCaenzf
	 stjgnTopwpI8eEVKLVQJEsalaRJNfAoEfklsG9EqdfaAc7LCfg9hyHOrayO+bARk5U
	 nIaA4oxs78Mzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-3-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-3-0e6f9cb512c1@kernel.org>
Subject: Re: [PATCH 03/11] clk: apple-nco: Drop default ARCH_APPLE in Kconfig
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Janne Grunau <j@jannau.net>, Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Martin =?utf-8?q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Michael Turquette <mturquette@baylibre.com>, Neal Gompa <neal@gompa.dev>, Rafael J. Wysocki <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srini@kernel.org>, Sven Peter <sven@kernel.org>, Takashi Iwai <tiwai@suse.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>
Date: Thu, 19 Jun 2025 12:51:11 -0700
Message-ID: <175036267134.4372.17303378707831060122@lazor>
User-Agent: alot/0.11
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

Quoting Sven Peter (2025-06-12 14:11:27)
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>=20
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---

Applied to clk-next

