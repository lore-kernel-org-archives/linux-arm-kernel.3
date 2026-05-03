Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC26CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 02:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jmyfPlNX23L/mOTTiiXLgc1RStN2ndJcGiPbqaR3dc=; b=J2ifK8NRngqTOaprZEPQxcodvY
	UWSM8rnn4apXsnpEZ3blSMB9o/UbGciJQzEZN6g6oM9UcOjAqIIFaEnOBD5jyv3E+k/5TjynfBDT3
	CgSIO4ljxA68jlo8YYIkWUp6Od+dAruEDn2a7o2GcbNKwBotfPga66wUru8L3bHNscefXbc2wd5Wp
	lxhHuFLq4/gduVBQrpkWucZ07wwo0f3qzavK/tRQQMvu8xg4R4+oRzTFiqyS7lmMbLbBSU2HBlNlh
	xLLcPdXZicC1gHcc691TOkrKhuK3CXbKCzzQfAJ5nrNQWmeLYVZPvF2nLKgxGNIxJEt2pnOHvTGN4
	G81nSGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMv6-0000000AC6e-165n;
	Sun, 03 May 2026 02:51:00 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMv1-0000000AC5C-35tG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 02:50:57 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g7TmT5w3Xz9t9n;
	Sun,  3 May 2026 04:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777776649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jmyfPlNX23L/mOTTiiXLgc1RStN2ndJcGiPbqaR3dc=;
	b=yKfjR2zDF2QVZrLp6pEZKOu5gV9mYEU6Mk+OazS9IYYjoW0P1NXTpKq7Ae5UQJSoN1fMVk
	Py0EhjKLEREv1fLBw1nLuWuG+8b6Nchn/RSJY2fNe/PM6J1JTzxhW/UZq/7vIoLUtFW0yv
	s/PhL+ePEglLuFZ2T85rkVBy2g3mxQr9ESJxq7FeavP7m/KsikGyglB8V6Qyl7ADK2vsQs
	Lxhmp7Xe6woXw6Mnbz99982wWZTODw85yb/GWfgkOKPdRZ/cyznxkWLCjKUekPCqE/xvOl
	Y1dm6O0e2sCtnnsQk52zamiI5kTPe7Pgs+s5gkLBMtHXR9qEtHKQGw5gdQ8nHg==
Message-ID: <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
Date: Sun, 3 May 2026 03:25:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org>
 <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: btp1myu5i1sycqg3wd8pncfykxy8hp97
X-MBO-RS-ID: 0401f179b09affd0292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_195055_927162_8B74D8A0 
X-CRM114-Status: GOOD (  18.08  )
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

On 4/29/26 3:59 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
> 
> This include is not needed?

It is not.

>> +#include "salvator-panel-aa104xd12.dtso"
>> +
>> +&{/panel} {
>> +       data-mapping = "jeida-24";
> 
> Is there any specific reason Geist needs "jeida-24", while all other
> boards use "jeida-18"?

This is a leftover, it should be jeida-18 , the Geist board pulls LVDS 
output(LVDS0) pin 19 MODE=L , which on the aa104xd12 means 6-bit mode.

> It looks like the major difference between Salvator-X(S) and Geist vs.
> Draak and Ebisu is that the former connect to lvds0, and the latter to lvds1.
> So what about renaming
> salvator-panel-aa104xd12.dtso to lvds0-panel-aa104xd12.dtso, and
> draak-ebisu-panel-aa104xd12.dtso to lvds1-panel-aa104xd12.dtso?

Will do in V2, although in a slightly different way.

[...]

>> +       x22_clk: x22-clock {
>> +               compatible = "fixed-clock";
>> +               #clock-cells = <0>;
>> +               clock-frequency = <33000000>;
>> +       };
> 
> X22 is not wired to anything; should we keep it?

DT is supposed to be hardware description, the xtal is there and the 
resistor footprint to connect it to the SoC is on the PCB, so someone 
might populate it and use the xtal. This isn't a particularly convincing 
argument for keeping the x22 node though.

[...]

>> +&audio_clk_a {
>> +       clock-frequency = <22579200>;
>> +};
>> +
>> +&avb {
>> +       pinctrl-0 = <&avb_pins>;
>> +       pinctrl-names = "default";
>> +       phy-handle = <&phy0>;
>> +       tx-internal-delay-ps = <2000>;
>> +       status = "okay";
>> +
>> +       phy0: ethernet-phy@0 {
> 
> compatible = "ethernet-phy-id0022.1622";
> 
>> +               rxc-skew-ps = <1500>;
>> +               reg = <0>;
>> +               interrupt-parent = <&gpio2>;
>> +               interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> 
> interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> 
>> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>> +               reset-assert-us = <100>;
>> +               reset-deassert-us = <100>;
> 
> Do we need these two? We don't have them in e.g.
> arch/arm64/boot/dts/renesas/salvator-common.dtsi

I believe we should add them, the KSZ9031 PHY does require 100us delay 
after reset is deasserted and before MDIO access is possible:

https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf

FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING

"
Note 2: After the de-assertion of reset, wait a minimum of 100 µs before 
starting programming on the MIIM (MDC/MDIO)
interface
"

[...]

>> +       pwm2_pins: pwm2 {
>> +               groups = "pwm2_a";
>> +               function = "pwm2";
>> +       };
> 
> What is pwm2 used for?

The signal is accessible on the EXIO connector D (LBSC) .
It is up to user to use the pin for their purposes.

[...]

The rest is addressed, thanks !

