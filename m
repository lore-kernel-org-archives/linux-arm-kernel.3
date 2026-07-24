Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF45C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlB2rHbkyocBl2DyyirfIuC5sUNXkf3WFZtNn8yWboU=; b=0B68m9Vq21Jch8cUIXsWyWOae6
	z2qkJOOJb6AZu3awUzSallHcCIXwjmi9jB/iDRRLGwJgAlFbou5vbMS+U5PXxIV+lW+vGkBqwFVvF
	PGyPUxgOi10eco507ILH6t4WTmqTa2zxgkwY//YaTE9zv2Tt1GdmfAsPG6tFTCUFJqQZ0/NXSpOAr
	rOD8ah+fSJeG+y3f5MM0VygXyLr+9gnlyrveaVn7FVAB1CRUIcSuunozfR3Ma6qTEgjIoK9Zxf6ub
	rIzDz85NMtJ+DjWRfTnrX6YkBt2wnvzp3rRBbGuiQI6w3seJwtdXcXWspzDu7Oun7FlXJTKnOV1sD
	Wd5QfQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA3V-0000000Ff5K-0n18;
	Fri, 24 Jul 2026 07:10:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA3T-0000000Ff59-2AMG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:10:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E02874088A;
	Fri, 24 Jul 2026 07:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B591F00A3A;
	Fri, 24 Jul 2026 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877046;
	bh=wlB2rHbkyocBl2DyyirfIuC5sUNXkf3WFZtNn8yWboU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fTDE9oGeOmKus3fdDEuPk4jMyBN0V6r/AOl59/k3g3zDTBGxjKml3NnXxhtUNXXiX
	 M+BwrPOcWJFZIJ2rJGILvAXBxw+LXnukCro9MnC1t7ncjT7crWcIO0JTpiTLWH0HYb
	 JYUQmyMUbSp6xd5iFcW46kjlrMfLzNL7h3uzIA0NshKzjQjYa7ilPzPmJuGHzFTBMa
	 f0ZD3i79zkfjQ+/1ueQ1UG2Fb2noxJNcRXAE2xlZDPkNCZ6wF3y/E4ap/8FCUBZOrS
	 D6Vrn0ePIQClOVqqckTxXTBU/AFcqnca7lbPZBx4OGH2GAVrKAPp7H/D2A9F5C93Do
	 0GXlX1YGUcZfA==
Date: Fri, 24 Jul 2026 09:10:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?U8O2cmVu?= Hantel <fugininsane@gmail.com>
Cc: linux-pm@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Rossak <embed3d@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?utf-8?B?U8O2cmVu?= Hantel <fugininsane@googlemail.com>, Claude Fable 5 <noreply@anthropic.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/sun8i: Add support for the A80 THS
Message-ID: <20260724-independent-humble-lion-931e6a@quoll>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
 <20260722210046.2932498-3-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722210046.2932498-3-fugininsane@googlemail.com>
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

On Wed, Jul 22, 2026 at 11:00:45PM +0200, S=C3=B6ren Hantel wrote:
> The Allwinner A80 thermal sensor is an early relative of the THS found
> in the A83T and later SoCs. It shares its register block, bus gate,
> 4 MHz module clock and reset line with the GPADC; the THS registers
> live at offset 0x40 of the shared block, with four data registers for
> the four sensors (0: big cluster, 1: DRAM, 2: GPU, 3: little cluster).
>=20
> Register layout, initialization values and the temperature formula
> (T =3D 190 - raw * 1000 / 14543, i.e. offset 190000 / scale 688 in this
> driver's convention) are taken from the vendor BSP kernel. The init
> sequence also programs the hardware alarm (~90 degC) and emergency
> shutdown (~105 degC) thresholds the BSP uses, since their reset
> defaults are undefined.
>=20
> Unlike on later SoCs the data-ready interrupt fires at the conversion
> rate (tens of kHz), and the level triggered alarm interrupt would
> retrigger for as long as an over-temperature condition persists, so
> both stay disabled and the thermal core polls the sensors; only the
> emergency shutdown event keeps its interrupt enabled.
>=20
> Since the A80 chip description has no calibrate callback, guard the
> callback invocation in sun8i_ths_calibrate(); the A80 SID is not yet
> supported by the sunxi nvmem driver anyway, so calibration data is
> currently unavailable and the driver falls back to the defaults,
> which yield plausible results (idle temperatures around 40 degC,
> full-load peaks in the mid 50s on a Cubieboard4).
>=20
> Tested on a Cubietech Cubieboard4: all four zones report load-reactive
> temperatures via polling.
>=20
> Co-authored-by: Claude Fable 5 <noreply@anthropic.com>

Same as for binding: nope. Claude is not a person.

Best regards,
Krzysztof


