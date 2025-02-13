Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7671C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 04:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpG/X92CWnMdpmxP4abdXtAgCygQA19P9d/qpK5HzEo=; b=0q1HCgkTChD4OYfe+olVjXSw2X
	MSo9uuTSQmF9JGzNeqKrypDyIJIBELCoLa8DxdjnQAM2ykRAKkNqp6qXstc+CNkaPP9MhIELCwTyH
	iZlLHnb+plxsIMZ9W/8LJtCyH4gPsk7Xcsoih5Ef6niMy/QRyMzypVWZgirSTkBspoWKL5o/Xnius
	UFMNmOZtdJsftnObAygdtXMD+9t3NZVKaf48N6cnCx4st5rr6pKXdDfrQhJMV/Lb34QOxYB2k5Ie9
	aSUXxQJXUupjqV0kA3mNaujWgo7CSFCzPj2QESOu6qb9xheLmLfwM/+2zUoMBZ+HllxX1ln4ZDjt9
	g6vm2RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQs5-00000009in0-3bEa;
	Thu, 13 Feb 2025 04:30:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQqe-00000009iZr-1T8C;
	Thu, 13 Feb 2025 04:29:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so2381285e9.2;
        Wed, 12 Feb 2025 20:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739420950; x=1740025750; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpG/X92CWnMdpmxP4abdXtAgCygQA19P9d/qpK5HzEo=;
        b=UW3QcAr0rjGmDC58kEzsb8tHWWgA6fZimpQVtM4s3x3IvHWC9pgFG/zmqmT+4rTwFR
         ZtpaT1hfAMPh/f/91gXKlwoBI+h2rfPxZZiFVE0kZD1a8syyu10tNVTNhYzs2r//egsb
         ynB55FzN9N7nE8GaAUY08HU99pfoxWNaplpn9oa7Lt4OAr9EsRNzbnQHe1Dyu87YG6Di
         8SzT/MshXuvJE/R+Fw2bLHHV4TclgIx3ZgjTec8aEkeYkdSUUgnYO3V1W5tJU+4bf7QE
         c6OEgcLPWe6a1w5U67F1p+FheALlnGL0MG4RyQesY7oWyAJJQFaI+/Cbe/247D5hal4g
         Lyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739420950; x=1740025750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpG/X92CWnMdpmxP4abdXtAgCygQA19P9d/qpK5HzEo=;
        b=HvPI2agqOhTfB804PJiXx5PLpp/JcFf6oOjgBC6IOsEX4ZgpT417OSg+n+1ZeQKcqM
         A0Yaa/EWTttfKvfnN1RCFUcBBPbzyFg8+Yquq8BwOgBnKlvcx9lEBxLImi1W9ogRWEQv
         Z5DUxQcU7bW0UMYX6bzbcZZXJcNpTQAgiLoZOpdNS+THvEmqjoBPyG9RqGyhCr3kRr3J
         sK/5fI1PA7kgoGimXRp3Td9qmRbgDXkCiVmEBOqnW7m4E113cdY0CE907XA+6TqtC95N
         6EycX4mJb5hU/zWlg8XSkFw8ExK7aaUCg6JUOB/tV0SOUrcwzTp077YAM3XNw/FPUF46
         O0bA==
X-Forwarded-Encrypted: i=1; AJvYcCWUFFcAlREE1Yr2P1e58Nsmxw+0B+44MyVsZTdK77Bcb7OJaPqYFvF2sNonMpkshKNxdyWWnbuTWus6q2bG6/ML@lists.infradead.org
X-Gm-Message-State: AOJu0YypK2JF2WYgFTtAeGxh4tRl37nuNX5O1y1vMJtGSA4QE5dGWm/9
	JTZ4Qvw3HUze5+TOHYbEM52Llphoosi2pnze0Ah553SPTL/GunqF09E0K7TMP+9FvXZvY/1Cb+E
	+XxjzTXQkXneeA/NyolaAw4Kc0co=
X-Gm-Gg: ASbGncvTXh6BN4RAUOmS/8k+xolqconzrnO46+V43ABaPiw1adx2BdYD22ax9aUly5Y
	24v6y2ieNmn87APN56ePFhTrbfj0h4N+3lUO8liYpbbv6qf5W9qbQlWWQTiUi8xeDJNu0xiZV4u
	+/8oIA8giC6Av2paTrRFyX9ngSHVS7
X-Google-Smtp-Source: AGHT+IF3MLudSFVnNY7klY1SEt5ogElGI4HfqObuRC7k5kXvKAxlXf08Y0jTlDnCHx2XzTyWFmqcq9hbMH/xhQHroM0=
X-Received: by 2002:a05:600c:8509:b0:439:4858:3c77 with SMTP id
 5b1f17b1804b1-439601a12b0mr15576355e9.19.1739420949976; Wed, 12 Feb 2025
 20:29:09 -0800 (PST)
MIME-Version: 1.0
References: <Z60MU05JLtI9VzuU@windev.fritz.box> <Z60MiujaPpWNYmBE@windev.fritz.box>
In-Reply-To: <Z60MiujaPpWNYmBE@windev.fritz.box>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Wed, 12 Feb 2025 22:28:59 -0600
X-Gm-Features: AWEUYZl_RV7h_eBDUzo5-bNaWEOJWWryUGI0L0oblCDcfiOMUP1xSlcFRXyIMWg
Message-ID: <CALWfF7KHagN=ef1C01PmmpfumdthBy6PKPi3U+9K+rgP8sNrOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add MNT Reform 2
To: Patrick Wildt <patrick@blueri.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_202912_418923_72778B81 
X-CRM114-Status: GOOD (  12.59  )
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

Hi,

A few questions below.

[ snip ]
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
> new file mode 100644
> index 000000000000..898a7b29692f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi

That's interesting, the Firefly Core 3588Q SoM's dtsi is more than 95%
the same as the Core 3588J SoM's dtsi.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi?h=v6.14-rc1

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
> new file mode 100644
> index 000000000000..cd7a82a3b0de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2024 MNT Research GmbH
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +
> +#include "rk3588-firefly-icore-3588q.dtsi"
> +
> +/ {
> +       model = "MNT Reform 2 with RCORE RK3588 Module";
> +       compatible = "mntre,reform2-rcore", "firefly,icore-3588q", "rockchip,rk3588";
Will you be adding "chassis-type"?

> +
> +       aliases {
> +               ethernet0 = &gmac0;
> +               mmc1 = &sdmmc;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial2:1500000n8";
> +       };
> +
> +       backlight: backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&pwm8 0 10000 0>;
> +               enable-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> +               brightness-levels = <0 8 16 32 64 128 160 200 255>;
> +               default-brightness-level = <128>;
Interestingly, the brightness curve is more fine-grained than one used
for the IMX8MQ SoM and the A311D SoM. Should those be updated
eventually?

brightness-levels = <0 32 64 128 160 200 255>;
default-brightness-level = <6>;

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts?h=v6.14-rc1#n24
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts?h=v6.14-rc1#n198

[ snip ]
> +
> +&combphy1_ps {
> +       status = "okay";
> +};
Should this be left out? It doesn't look like pcie2x1l0 or sata1 is being used.

> +
> +&combphy2_psu {
> +       status = "okay";
> +};
Should this be left out? It doesn't look like pcie2x1l1, sata2, or
usb_host2_xhci is being used.

> +
> +&saradc {
> +       vref-supply = <&avcc_1v8_s0>;
> +       status = "okay";
> +};
> +
> +&tsadc {
> +       status = "okay";
> +};
These nodes should be sorted alphabetically

> +
> +&sdmmc {
> +       bus-width = <4>;
> +       max-frequency = <40000000>;
> +       no-sdio;
> +       no-mmc;
> +       no-1-8-v;
> +       cap-sd-highspeed;
> +       vqmmc-supply = <&vcc3v3_pcie30>;
> +       vmmc-supply = <&vcc3v3_pcie30>;
> +       cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> +       disable-wp;
> +       status = "okay";
> +};
> +
> +&mdio0 {
> +       rgmii_phy: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0x0>;
> +       };
> +};

Jimmy

