Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233E0C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OWssQdGeKsyE+yPPzL9NID088rXE6n1NT7d9aLNuLU=; b=HVVGwFM2b3FranJTCyA9jYCCu2
	PVR32G9T8AhdFzmKu24L1sxgStRSGVqCZXVWE4r8P5KM6Tn4soy0vGtdMPQ3RaWjR9xQfLhxfPW6E
	UcZo7OCQCHdYaotDAibxf9x09RNOuCX9NNh20IeNY/Tq6FQpgDUlXTY7yTVnBAsaTnoqoOkHtjex3
	z6822Xl8h29dHqq33+FiRAqqotMKyvjRETjLHJFgtNKyH82olz4Qw/WvN+b5B5B3UZ3e4Xf8GmvQf
	hmYVLb5lLJiF5NKB97iRuT33cXc4KVRsCzZHmoSj0RfUgg8Xm7U1RE2SK3xt4oSrfwtGOpUjD/Xca
	eq+CVO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kum-0000000814V-2ty4;
	Wed, 23 Sep 2026 11:13:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kul-0000000813w-0sRE;
	Wed, 23 Sep 2026 11:13:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1B33415F7;
	Wed, 23 Sep 2026 11:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E821F000FF;
	Wed, 23 Sep 2026 11:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790162006;
	bh=6OWssQdGeKsyE+yPPzL9NID088rXE6n1NT7d9aLNuLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f255DHjPL7qcmuNQwMipvzvnDX+7hQ2EPoy15lFc3RlpueYEfKHfvnoUqEYqM1sNb
	 NWBIafoReygqiJurrwkepfMrWtm4dmdciZcGPHZj/UXcGVhT/gUEj9o7ycAyOsvv1H
	 VqqSVjZjXHtHcvciU24arw2rlEWeASuZ4V6Pee7xW62cur2hfF2P1a2knuHbqR+q42
	 gMBblt0TMmXcHqNunum5Arm0/pdXZWQDgCJyQiuCPlGnyePwTCIA4Udngv9vfkhOae
	 NuuKuLY3Qe+HkhbVscCeNe2wrBS53RY93ZrUlKLi0/K3QG2Yu63tslB35MvSjcWKk7
	 qFkKtFqTPodkg==
From: Lee Jones <lee@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 mfd@lists.linux.dev
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
Subject: Re: (subset) [PATCH v12 0/6] Add VIM4 MCU/FAN support
Message-Id: <179016200216.3991538.9729498500468458301.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:13:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 17 Sep 2026 09:58:59 +0200, Ronald Claveau wrote:
> The Khadas VIM4 board features a different MCU variant compared to
> previous VIM boards.
> While it shares the same I2C-based communication model,
> it differs in some ways:
> 
>   - A distinct register map with its own volatile/writeable register set
>   - A fan control with 0–100 levels instead of the 0–3 levels previously
>   - A fan power supply gated through a regulator
> 
> [...]

Applied, thanks!

[1/6] mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
      commit: 6277c3cd74f54c26bf4d5e88182a378ee7190d90
[2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell declarations
      commit: f9f61c21b942ac387acd7fb3ef1f950cba59755f
[3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
      commit: c94c97f8c97e684d44ef5483d7f2ad6b3dfa55ac
[4/6] thermal: khadas-mcu-fan: Add fan config from platform data Add regulator support
      commit: dad6f7897a93b4e1614664dbbcae0f61e57d1ac0

--
Lee Jones [李琼斯]


