Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB90DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LGqYkutsXEQTJEorRPuUJ19pqZ4LDK26/ddI+uUW0s=; b=wkopWHtgfb4FbhbQ5f3hRIVYCu
	Sx7kV9L2AxAWTXgXf9V6OcTDGjhTVmSwLXSJ/hp1iNyrjyK01HRjsjEoMvhEYiesu5FhZu2sl4w6e
	Dj3MMl8Pona76ylr0Vt+ASBu5Xr1IAJG6K+4KBU3qk8lmNAAZxNXPEl1oEu4yQihDSiphPq1ckJsh
	lOM6FY8SujSdr8SLLlyPo09gINc0LDwnr60slrLHWlKaGB6NUOQ344JHwTa9unlAqmO+41LPF9iwl
	qFcpk2kJE0oI9ptVRiqn/B0DnVr1LKGqgRLGd90PMM2IqxdyZXU5PAlIYJlqJ6GQ3HHa7v7zPFRck
	blSpEIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tglyr-0000000D4uu-1rB9;
	Sat, 08 Feb 2025 14:38:49 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tglxR-0000000D4oo-2V2J;
	Sat, 08 Feb 2025 14:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1739025419; x=1739630219; i=wahrenst@gmx.net;
	bh=8LGqYkutsXEQTJEorRPuUJ19pqZ4LDK26/ddI+uUW0s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h4yttAVWiOif3LuGi37mVc7B/VrNYZi6uWYYlbD9ok61NLQIT6/gK/5i8tWan/op
	 CYqsWMyalos501xG1zPE1vvDj0As8ApbU6IqPhBHzyxt6wDPhBIVUD9DY9PCZiDDX
	 6RyEmC/NJFLNHwf2KrEG10H3wR+rw1D/ZrSp14L8rx5op7KiohBSk2+b7CIV+8tiS
	 SwxHYJmW4fy5zPZC4OH3wa9nkiCohArVRWN4/RBRP9dK3yLIGqffyZykJDGtWl0lj
	 jdEzRtpqY72ZjLsIO4SG4J9BhWGCF9Rn4SibHlAFq+4/huhJaUKPpmukTWyAdEdK5
	 3w7xyOSK+8sJZ11FRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQeA2-1u14GL1mRK-00SHy0; Sat, 08
 Feb 2025 15:36:59 +0100
Message-ID: <8e2b0e05-cd60-4b79-8763-005c3f72a64d@gmx.net>
Date: Sat, 8 Feb 2025 15:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c4b60fda4b9c87a5efaf5103507fb568413c841a.1738963156.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <c4b60fda4b9c87a5efaf5103507fb568413c841a.1738963156.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SPGQzxowB1xOY142DEIdKfyJ0pS465KUt28OSdSvuCiqw3vzYVe
 PSzOuMzmHFlx/jyJcwkwynDrQjAWBYADt4fHKk7iZ5q+cX7LoziS5/iBGGf9ZrYpSrRYwHj
 M41CoyUhmPbJ86NO/tYWjSZFw9niEAyqtaHhbkJCdhH3DuigquRB4Ss8lYXBTxq9+j+WHTE
 pLBOdlP9N1vEqTwEdlHhQ==
UI-OutboundReport: notjunk:1;M01:P0:2HoehToIt8I=;jnzwTdSdXcYJ7chEMN5M25xFNcP
 bm0a18pHtYZtan/D+lr+TuIp+naO63IrzpVEwBHgvGHuav2YH148qspyj3TZwGcuhvgxALf4k
 h/yTR1ZwuVXJFpZx6DxY/fIgtRnMR9vXMBPxtucOIZ1p+aLwXGfAdxQr3T43MIt5wadAINFwf
 X++qRIYQEqIRhC+4TxjB1B0ZnwkEQIgl3Xk2CA5I57uA2PjgieVre0q09C8pKncM7wrQTAJqD
 2tKWV9ZXXy3S4s0wEYmZEBAw+wL4V81EOYUBR4z5f9pczkTX9Q2ie0/h/0TeBXOSYPioEUNuD
 pvbyowm993BkGqNy4w63kBVjPnR4FJJ6xcHVOn9Kkka2TTXVMmeVm/CfQFtiflEBvB/2rG01T
 +EHW5Sdwwz1iSt6mbt93/XDDtUaA/ypxzyeVKTaSqKcZKGDDY+gAKmXCnst/I0MZ5TT15/DIG
 xFX7g8Io4o95u9dbY4ErqDpZcqMwxjYXUBHiBsn/U9XNfkpFIjufmhAQhL2qOEc8ekge7djJU
 Vbik1uLWvUrvLwzCG6+WxuIUaZKDf3AYmo7NgNYwcGk0wp63xW/86yxfi4llMfCxt9CF5apFK
 kMYX7la0w3SFXvtqK4BzRW45F1L7jFJuRNMX+V3HIfusmrCDTQYzr7lmOCFE/IVk8BNtx0PKL
 o8od9rjY0TNfRdwz5ymj2T/7ENvesUhW26owY2jduta2q0dhbtguAnvVz8Kmr8FxlVdBEtvac
 8lRXpjTFroQ3Fjp8/jxU8261VMbzFU5E6Dlg0kEWi8rK1Zv4MY3PtqMeb0YaCwbfr5DbmL8nL
 nva6ZDElivHgOC6gTnQWLALM3W8TyLiy6YDCnXI1WM43tgHKnoXFvWdG14B3d8VYVL4Fo+4N5
 NevW5cBoA3Is2su9ddBtUz8fZvR9pfgnjJSkA+qdgpvTPiSMwfIxIpfQvYG5ZLDbH+VgekkfA
 pbe1fL1kq3lSRh5hOwxaE63dfWiMJiuZGykpOl2TugAj9dSYY7BtHcq65ewc/m5XfH0O2MoKt
 diBB+x0jX/4TG02w1J5jc6KNf7CLZDcmTofShbiAVolxbJp1sZeoK5P1GqUf4p9sjlPbLq8Uv
 VTUZZx7UGXi83mWQiup27QQZ8Ptpkg1X1dw4r712a/meXsHKCXEWc21+FJf80/HRzxTWoiqpK
 aQ6/6mHlRrXear40MbiDiLLK8zXLUW+aKOwqOCc5OucDhRNzRqpTaIASW/sZc7RjdP8Xq1dU3
 7ISW2hkKrY+t51Qz8+wdrOOk1HcADM2WRO2K1M8g1saCpuaBIa0Ow4bf2ty2/3VOLrO3NmYgb
 tQy1u1wCSsAMWoTtgzslq4hLwpgjXjxvHN80le4PrxGI+tYZvDlRJ3rQYOFB9C0AbzOwaCEj4
 4f0Kkm+ABG02ry+st1n9mSu5T8ZZPVBOc9A/60mTsLgBcLmlL6IJABu3oh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_063721_940545_90A01073 
X-CRM114-Status: GOOD (  23.40  )
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

Hi Andrea,

Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> Add minimum support for the gpio only portion. The driver is in
> pinctrl folder since upcoming patches will add the pinmux/pinctrl
> support where the gpio part can be seen as an addition.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   MAINTAINERS                   |   1 +
>   drivers/pinctrl/Kconfig       |  11 +
>   drivers/pinctrl/Makefile      |   1 +
>   drivers/pinctrl/pinctrl-rp1.c | 789 ++++++++++++++++++++++++++++++++++
>   4 files changed, 802 insertions(+)
>   create mode 100644 drivers/pinctrl/pinctrl-rp1.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a4a9555c07c5..f2ba6f565d30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19756,6 +19756,7 @@ F:	Documentation/devicetree/bindings/misc/pci1de=
4,1.yaml
>   F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
>   F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>   F:	drivers/clk/clk-rp1.c
> +F:	drivers/pinctrl/pinctrl-rp1.c
>   F:	include/dt-bindings/clock/rp1.h
>   F:	include/dt-bindings/misc/rp1.h
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 95a8e2b9a614..53b265cabc26 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -612,6 +612,17 @@ config PINCTRL_MLXBF3
>   	  each pin. This driver can also be built as a module called
>   	  pinctrl-mlxbf3.
>
> +config PINCTRL_RP1
> +	tristate "Pinctrl driver for RP1"
> +	depends on MISC_RP1
> +	default MISC_RP1
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	help
> +	  Enable the gpio and pinctrl/mux driver for RaspberryPi RP1
> +	  multi function device.
> +
>   source "drivers/pinctrl/actions/Kconfig"
>   source "drivers/pinctrl/aspeed/Kconfig"
>   source "drivers/pinctrl/bcm/Kconfig"
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index fba1c56624c0..6fb77de58545 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+=3D pinctrl-pic32.o
>   obj-$(CONFIG_PINCTRL_PISTACHIO)	+=3D pinctrl-pistachio.o
>   obj-$(CONFIG_PINCTRL_RK805)	+=3D pinctrl-rk805.o
>   obj-$(CONFIG_PINCTRL_ROCKCHIP)	+=3D pinctrl-rockchip.o
> +obj-$(CONFIG_PINCTRL_RP1)       +=3D pinctrl-rp1.o
>   obj-$(CONFIG_PINCTRL_SCMI)	+=3D pinctrl-scmi.o
>   obj-$(CONFIG_PINCTRL_SINGLE)	+=3D pinctrl-single.o
>   obj-$(CONFIG_PINCTRL_ST) 	+=3D pinctrl-st.o
> diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1=
.c
> new file mode 100644
> index 000000000000..0d081f75d2ec
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-rp1.c
> @@ -0,0 +1,789 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Raspberry Pi RP1 GPIO unit
> + *
> + * Copyright (C) 2023 Raspberry Pi Ltd.
> + *
> + * This driver is inspired by:
> + * pinctrl-bcm2835.c, please see original file for copyright informatio=
n
> + */
> +
...
> +
> +static struct irq_chip rp1_gpio_irq_chip =3D {
> +	.name =3D MODULE_NAME,
> +	.irq_enable =3D rp1_gpio_irq_enable,
> +	.irq_disable =3D rp1_gpio_irq_disable,
> +	.irq_set_type =3D rp1_gpio_irq_set_type,
> +	.irq_ack =3D rp1_gpio_irq_ack,
> +	.irq_mask =3D rp1_gpio_irq_disable,
> +	.irq_unmask =3D rp1_gpio_irq_enable,
> +	.flags =3D IRQCHIP_IMMUTABLE,
Sorry not sure, but doesn't this miss GPIOCHIP_IRQ_RESOURCE_HELPERS here?

Thanks

