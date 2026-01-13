Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4332D2F345
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BNBYQG9sPYydo+QyKe9zL6d+Vyf3G6Wdb9WA7Vw470=; b=fBqHqKSbwBYqChmj35BGPmsn2z
	TcXpt/DgIiD6jfv/XwaS7Zop0V+RgomimO48WLKMiuYFgCONmZvtXBj+BF3eTZrUrPg7I+R+EaRzL
	c51vCPTxkyj9be513SbLzS85dzYaoCx0oa8sfsnPj3F+iwAusAH4Mu1sJkrnrNR864/7Pmh4m6Boc
	aQvOeGLcdwXPRJ7TWfvilYBrplYQ0kays2Hs+DlOxItZmuue7nRhpIR7OmlbFhHWVmCA3TJv5jGRU
	TQicE/eg7gglH5POZ6FJjjj66oY9zVOTADwwf1OxEc9Um9mijz2S3RqAaXADjpUW7H4PPNnJ+ynM8
	Zq9+5pJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhdw-00000007Uta-35eC;
	Tue, 13 Jan 2026 16:53:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhdv-00000007UtI-0qsh;
	Tue, 13 Jan 2026 16:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43CDB60017;
	Tue, 13 Jan 2026 16:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B3BC19422;
	Tue, 13 Jan 2026 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768323198;
	bh=rC0OyhL77kmNXl+KEp08CoigsLjuWii0z/bE8OWzVqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JmKTPS4OJL9DejfJmLT4WPvm6tN062qXjFMCp4Yi7U+HasK7WGiEuFQvrg2+X49ub
	 dlrZ+gjC8O4TRtQQF/Pf0U71LkBZAsXO8Uhw0lu6cJvl2o1/VbSRynhTsi2b22Hu6/
	 9ZBQebfWGJrdriJkjT6C6HIBr/GCWjYA+eYB9+jKvImzpW9yiY/o2o1w+tY0YSdL9G
	 BsYbLOzC4ZqniwrX8DZPGuB0FjG4LhDpzr1Z7FlYFQM/SoAX2yRVJSgb74Neha36++
	 kqnf1SUv0W7LptxhZdcWGBzRx/Q3L/tXlZaOwTE0m5gthnfpSf0Fuiy4kwBktwAblG
	 Xc5FCgJx2qNlg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 8425D5FC5C;
	Wed, 14 Jan 2026 00:53:14 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 John Watts <contact@jookia.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
Subject: Re: (subset) [PATCH v8 0/5] leds: Allwinner A100 LED controller
 support
Message-Id: <176832319449.634309.16923738719016027897.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 00:53:14 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Sun, 29 Oct 2023 16:26:54 -0500, Samuel Holland wrote:
> This series adds bindings and a driver for the RGB LED controller found
> in some Allwinner SoCs, starting with A100. The hardware in the R329 and
> D1 SoCs appears to be identical.
> 
> This series was tested on the Nezha board (one onboard LED) and the
> Dongshan Nezha STU board (with an external strip of 16/32/48 LEDs, also
> with gaps in the LED addresses).
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[3/5] arm64: dts: allwinner: a100: Add LED controller node
      commit: 4d9af1e12cd6462c53aa91b6a0b6af7861e1c0ce
[4/5] riscv: dts: allwinner: d1: Add LED controller node
      commit: c8e75e0cecd277fb585d4491a6eeaaff64546f10
[5/5] riscv: dts: allwinner: d1: Add RGB LEDs to boards
      commit: f8ad8bbb8827c5bfd83bdf5e1ab512d2dc5db643

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


