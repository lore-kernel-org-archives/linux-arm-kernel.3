Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D8BD6C288
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrTn/7rSGKkdLfBOAcUSvtVasFAVwxg9Ht3qmWHbO4k=; b=tKxw9SZMG+OoN4Dp61Eh736kW0
	DV5+Qzn9yzzqEmFLekiCNMPFVD7Yg1NVyFJFODb/NesQdNIJSWMLqi3PUHBDmgc/O9ldaO+CyB8wV
	04wK6rxcv/6Vh/DKHG0OCLSUwKUYzizLu4wmyGXjPRxcDXaVcPMHmU1HDXCXsVJKqx91NGI7DukTC
	bfQ1cY7wQq5ZA8K4LpfRKm99eUL5fMMNrnW6KE3IpgwEjcS0iSCJh+h434E16cZfLmnEHoXyS7jEC
	LfaSCD27wE1gSQAlQzUbR0NNlkpnrUUcw7UQkLLWAEgjnhJWsiGv8TKK/gudc9TYD7hk+uZc2oT+z
	wQg8GE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDTUM-0000000DSzo-1rMF;
	Tue, 19 Nov 2024 19:02:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDTTO-0000000DSnh-39yu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 19:01:17 +0000
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 3F0A51FAC7;
	Tue, 19 Nov 2024 20:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1732042871;
	bh=UrTn/7rSGKkdLfBOAcUSvtVasFAVwxg9Ht3qmWHbO4k=; h=From:To:Subject;
	b=dO0X1I9gtg95s0+CuA9dLwF/VeTrEI8NLVnAfWrYYnOouPz6U4RIPdUBXHDFAcjaf
	 dLMZUP9TXMcmrB+IZh8VT9Im5nRDsEuanxgcko04Ym5mamhSrUGfhBjaON9TFigj5Z
	 CO0J2xJCKRJP5+Tx49eHyM64XI68NuSyx3ci6EbGWW4AUyJBMXGvomSyjbSUSdBXFV
	 Bi5AZ3fmQOHng5iebh0qZsrboI6Uf/P1hyZNZB0W9Jnkrid9OUHR/inLRcCzYm3zlF
	 pwo16o4Troc1wpXDkevHJIQOgRSaBkMzeawtOBWhSUaUs2gBOMnM1H4J0hL2azK+h2
	 f/8/0Cw7TJWoQ==
Date: Tue, 19 Nov 2024 20:01:06 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Thomas Richard <thomas.richard@bootlin.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, u-kumar1@ti.com
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com, richard.genoud@bootlin.com
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf
 compatible
Message-ID: <20241119190106.GA70080@francesco-nb>
References: <20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_110115_692695_CCFE870C 
X-CRM114-Status: GOOD (  11.39  )
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

Hello Thomas and TI folks,

On Wed, Nov 13, 2024 at 11:43:05AM +0100, Thomas Richard wrote:
> Like on j7200, pinctrl contexts shall be saved and restored during
> suspend-to-ram.
> 
> So use ti,j7200-padconf compatible.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
> Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
> suspend-to-ram.
> ---
>  arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       |  6 +++---
>  arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi | 12 ++++++------

Do j784s4 supports any kind of low power mode and/or suspend to ram? My
understanding was that this was not supported, but maybe there is some
details that was lost when I was told this information.

Thanks,
Francesco



