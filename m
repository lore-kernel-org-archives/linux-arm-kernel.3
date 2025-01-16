Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB65C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKBitB2sJtACt8fbBDO2i16EuaNYnZtmuWY5Ex3ISmY=; b=ZZceVauSZmxE8OycyY0D6qtpeR
	svutkCvr6Alvopm+vBt/d16SEMRUjzBszNn5Dq7XA9rHT4eQrSzpvHj4DkDh+QRgUD+flLuTLCpUv
	TZOv+fqnOQgqyZLYdSJA14bdjJ8Qf644Yc97Jfg9k+M0sHIoEQ38CBDnCGunXm2Ko1zZngCKVJ0Na
	5JlGZR3x2Y7yw3G9iqMzX8ee6qW+vlHyKpQvRuPz4zPILYf29I0vd4uuc1/p6IUIDfWbufaN0kGzK
	8GDyO3Od4I3+OPlftlrKiBuvaUQMDDY2yQFr/WC9W4nYXckkjbe26oCBxCFVj8FbeBEH5sglUnR99
	Hm4FAURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSKP-0000000FRyp-3Nqp;
	Thu, 16 Jan 2025 16:02:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSFz-0000000FPvt-2HLc;
	Thu, 16 Jan 2025 15:58:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso1934104a12.0;
        Thu, 16 Jan 2025 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737043086; x=1737647886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKBitB2sJtACt8fbBDO2i16EuaNYnZtmuWY5Ex3ISmY=;
        b=cNzPDrpQe9D246hy1xxB01IlKweVEX/hRYDWdTZI79YIdiMZtylmCeGcG7pjP91zdt
         R1LBGJ9s56H1vsB0iRINVCP+mnN6brVD8Do3SX+WOssv//ht6SKC31hxkKG3EtlaLOlF
         BVsSLR8WYGMY4vLrUc4MIcgQrKj/5ZAhifKxSGAVf3uOY9UoJg/L68SrQIYw8ZwIdlpX
         oyy2M1OBfuiYWyUmDmpGkDh5vR970KflDE5o3idsqlD7tgFpxhF3HrflfquzPBKomByx
         He3kHOv+Cac61cZA0DVWQTgXKTS4EkWPB2kncJ+Qrf1gvAv/nuxpy/VvoQJKiDV3rFZf
         me7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043086; x=1737647886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKBitB2sJtACt8fbBDO2i16EuaNYnZtmuWY5Ex3ISmY=;
        b=XDtI8GfT+sW/61NEWKppZe9LiJfLQ5kbwIAnCwEGeLzzboUWPQSIWVsTpsIyLYabD/
         kiqJ+fRQJOtKOwrCP+z5lzrSYHIzmeKuG8RK+qUJeVA0/BCTiUzWdVjWv18wsdqV9gYn
         /5N+v++ISaiWVH5UbvbXKCN2s24j1dOqRurM81cvJwwsp0U0Db54Ls/1ps69l226TX8l
         7qidpaCBrnpfrM9wYgv3l92PM8oHidM6TNa16Sm1AYe42YYB6OMOIoB20bYk6sG5vKgy
         TAMpTOobM8ylaihGNnhS4f34dQvrScqsJqgDxV3RsuLryOKNirKvejyavy648YPK3bk/
         QLcw==
X-Forwarded-Encrypted: i=1; AJvYcCUdJqGUzd9LFLUIwoQy7wTGoOx0t6EpkgsDy5LfNw9e8o67awff/eLUoGWY6VUSzMcl9XSDvVaM7q/q3ekP4fUy@lists.infradead.org, AJvYcCVTZ4KwElSGBbrUkQVuPeghUQQA9yquZLCzn5Cu3+/vC4dpOnPSxRT2CEV/oqiBAVovyJ8HZd0k73RKMcOITfk=@lists.infradead.org, AJvYcCVzuv3UrQroEK7Pkdfkr/317kkkBhM+33CuH68CKHBlxlh4P0t44J5MoUuglGif4A9AGlWIETMq2lFC@lists.infradead.org
X-Gm-Message-State: AOJu0YyRcZe9vAoBn9m4ejzE6pBRKyUo5WITuHB+RxyGJvHcKkBqOrPg
	MuEBTsBTKfO83epF9kFovHflodE5zHxWrMDrEIYdHTclDNAw0YEjd3oEy2LjVZvajBHwY3r3suP
	uwA2Qs4r4qcu7fNHYm6SenmPCBFzb02Ol
X-Gm-Gg: ASbGncvjQ20FiZOWE20tH0d9XSaKBBZEAYoGou1gmPjKbOBmps4Q8lktAFPzBRAB5cF
	6k+MsZmbDyxqj6CEVll4QMHMhBymKELoUFS4H7UU=
X-Google-Smtp-Source: AGHT+IF6kdfwrwD2Gw5N7j4+mAfHkKXddC2MFGV3l/RFiEW+P7+9drJlkCV9fN+OboiVtb7ErE9EHd4tztg4oLmMeZ0=
X-Received: by 2002:a05:6402:26c7:b0:5da:a78:4c8b with SMTP id
 4fb4d7f45d1cf-5da0a784f3amr6866036a12.2.1737043085695; Thu, 16 Jan 2025
 07:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <20250115012628.1035928-4-pgwipeout@gmail.com>
 <D73LPTRK7A74.38A4OEKK37ZGV@cknow.org>
In-Reply-To: <D73LPTRK7A74.38A4OEKK37ZGV@cknow.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 10:57:54 -0500
X-Gm-Features: AbW1kvbxmLOaQEaG1tWAxdSbHKoJpeY4I9dA6pBmv7t79CjzRmlwQWxOajhxE00
Message-ID: <CAMdYzYpTU2YfNJTa3+sRe5hWgnR3pGOb_kmK_P85Ea_w2P9cRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/6] phy: rockchip: add driver for rk3328 usb3 phy
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Algea Cao <algea.cao@rock-chips.com>, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, frank.wang@rock-chips.com, 
	william.wu@rock-chips.com, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-rockchip@lists.infradead.org, 
	Vinod Koul <vkoul@kernel.org>, Zhang Yubing <yubing.zhang@rock-chips.com>, zyw@rock-chips.com, 
	wulf@rock-chips.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_075807_608879_934E1756 
X-CRM114-Status: GOOD (  31.72  )
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

On Thu, Jan 16, 2025 at 10:27=E2=80=AFAM Diederik de Haas <didi.debian@ckno=
w.org> wrote:
>
> Hi Peter,
>
> Thanks for working on this :-)
>
> On Wed Jan 15, 2025 at 2:26 AM CET, Peter Geis wrote:
> > The rk3328 has a combined usb2 and usb3 phy block for the usb3 dwc
> > interface. The implementation up until now has been bugged, with
> > multiple issues ranging from disconnect detection failures to low
> > performance. This driver fixes the majority of the original issues and
> > allows better performance for the rk3328 usb3 port.
> >
> > This driver sources data from multiple sources, including the rk3328
> > trm, the rk3228h trm, emails from Rockchip, and both the 4.4 and 5.10
> > downstream drivers. The current implementation allows for basic bring u=
p
> > of the phy block and fixes the detection issues. Interrupts are enabled=
,
> > but currently only used for debugging. Features missing currently are
> > power management, OTG handling, board specific tuning, regulator contro=
l,
> >
> > Currently the only known bugs are a AX88179 usb3 gigabit adapter crashe=
s
> > when operating at usb3 speeds and transmitting large amounts of data an=
d
> > full disconnection detections may be slower than expected (~5-10 second=
s).
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >
> >  drivers/phy/rockchip/Kconfig                  |  10 +
> >  drivers/phy/rockchip/Makefile                 |   1 +
> >  drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
> >  3 files changed, 880 insertions(+)
> >  create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> >
> > diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfi=
g
> > index 2f7a05f21dc5..aac623e84f96 100644
> > --- a/drivers/phy/rockchip/Kconfig
> > +++ b/drivers/phy/rockchip/Kconfig
> > @@ -48,6 +48,16 @@ config PHY_ROCKCHIP_INNO_USB2
> >       help
> >         Support for Rockchip USB2.0 PHY with Innosilicon IP block.
> >
> > +config PHY_ROCKCHIP_INNO_USB3
> > +     tristate "Rockchip INNO USB3PHY Driver"
> > +     depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> > +     depends on COMMON_CLK
> > +     depends on USB_SUPPORT
> > +     select GENERIC_PHY
> > +     select USB_COMMON
> > +     help
> > +       Support for Rockchip USB3.0 PHY with Innosilicon IP block.
> > +
> >  config PHY_ROCKCHIP_INNO_CSIDPHY
> >       tristate "Rockchip Innosilicon MIPI CSI PHY driver"
> >       depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> > diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makef=
ile
> > index 010a824e32ce..ec15dcf37fba 100644
> > --- a/drivers/phy/rockchip/Makefile
> > +++ b/drivers/phy/rockchip/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY)       +=3D phy-=
rockchip-inno-csidphy.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY)      +=3D phy-rockchip-inno-ds=
idphy.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI) +=3D phy-rockchip-inno-hdmi.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2) +=3D phy-rockchip-inno-usb2.o
> > +obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB3) +=3D phy-rockchip-inno-usb3.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY)  +=3D phy-rockchip-naneng-=
combphy.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_PCIE)              +=3D phy-rockchip-pcie.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX)     +=3D phy-rockchip-samsung=
-hdptx.o
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb3.c b/drivers/ph=
y/rockchip/phy-rockchip-inno-usb3.c
> > new file mode 100644
> > index 000000000000..51b9f3b7fbfa
> > --- /dev/null
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > @@ -0,0 +1,869 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * phy-rockchip-inno-usb3.c - USB3 PHY based on Innosilicon IP as
> > + * implemented on Rockchip rk3328. Tuning data magic bits are taken as=
 is
> > + * from the downstream driver. Downstream driver is located at:
> > + * https://github.com/rockchip-linux/kernel/blob/240a5660d7c23841ccf7b=
7cc489078bf521b9802/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > + *
> > + * Author: Peter Geis <pgwipeout@gmail.com>
> > + * TODO:
> > + * - Find the rest of the register names / definitions.
> > + * - Implement pm functions.
> > + * - Implement board specific tuning from dts.
> > + * - Implement regulator control.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/usb/of.h>
> > +
> > +#define REG_WRITE_MASK               GENMASK(31, 16)
> > +#define REG_WRITE_SHIFT              16
> > +#define DISABLE_BITS         0x0
> > +
> > +/* USB3PHY GRF Registers */
> > +#define USB3PHY_WAKEUP_CON_REG       0x40
> > +#define USB3PHY_WAKEUP_STAT_REG      0x44
> > +#define USB3_LINESTATE_IRQ_EN        BIT(0)
> > +#define USB3_RXDET_IRQ_EN            BIT(1)
> > +#define USB3_BVALID_RISE_IRQ_EN      BIT(2)
> > +#define USB3_BVALID_FALL_IRQ_EN      BIT(3)
> > +#define USB3_BVALID_CLEAR_MASK       GENMASK(3, 2)
> > +#define USB3_ID_RISE_IRQ_EN          BIT(4)
> > +#define USB3_ID_FALL_IRQ_EN          BIT(5)
> > +#define USB3_ID_CLEAR_MASK           GENMASK(5, 4)
> > +#define USB3_RXDET_EN                        BIT(6)
> > +
> > +/* PIPE registers */
> > +/* 0x08 for SSC, default 0x0e */
> > +#define UNKNOWN_PIPE_REG_000                 0x000
> > +#define UNKNOWN_SSC_000_MASK                 GENMASK(2, 1)
> > +#define UNKNOWN_SSC_000_ENABLE                       (0x00 << 1)
> > +
> > +/* 0x83 for 24m, 0x01 for 25m, default 0x86 */
> > +#define PIPE_REG_020                                 0x020
> > +/* RX CDR multiplier high bits [7:6], as P, default 0x2, RX data rate =
=3D (2*refclk*P)/Q */
> > +#define PIPE_RX_CDR_MULT_HIGH_MASK           GENMASK(7, 6)
> > +/* TX PLL divider bits [4:0], as N, default 0x6, TX data rate =3D (2*r=
efclk*M)/N */
> > +#define PIPE_TX_PLL_DIV_MASK                 GENMASK(4, 0)
> > +
> > +/* 0x71 for 24m, 0x64 for 25m, default 0x71 */
> > +#define PIPE_REG_028                                 0x028
> > +/* RX CDR multiplier low bits [7:0], as P, default 0x71, RX data rate =
=3D (2*refclk*P)/Q */
> > +#define PIPE_RX_CDR_MULT_LOW_MASK            GENMASK(7, 0)
> > +
> > +/* 0x26 for 24m?, 0x21 for 25m, default 0x26 */
> > +#define PIPE_REG_030                                 0x030
> > +/* RX CDR divider bits [4:0], as Q, default 0x6, RX data rate =3D (2*r=
efclk*P)/Q */
> > +#define PIPE_RX_CDR_DIV_MASK                 GENMASK(4, 0)
> > +
> > +/* 1'b1 Disable bandgap power, default 0x00 */
> > +#define PIPE_REG_044                                 0x044
> > +#define BANDGAP_POWER_DISABLE                        BIT(4)
> > +
> > +/* 0xe0 for rx tune?, default 0xe1 */
> > +#define PIPE_REG_060                                 0x060
> > +#define PIPE_TX_DETECT_BYPASS_DEBUG          BIT(4) /* enable to alway=
s force detection */
> > +/* RX CTLE frequency bandwidth response tuning bits [1:0], default 0x1=
 */
> > +#define PIPE_RX_CTLE_FREQ_BW_MASK            GENMASK(1, 0)
> > +#define PIPE_RX_CTLE_FREQ_BW_TUNE            0x0
> > +
> > +/* default 0x49 */
> > +#define PIPE_REG_064                                 0x064
> > +/* RX equalizer tail current control bits [6:4], default 0x4 */
> > +#define PIPE_RX_EQ_TAIL_CURR_MASK            GENMASK(6, 4)
> > +
> > +/* 0x08 for rx tune?, default 0x07 */
> > +#define PIPE_REG_068                                 0x068
> > +/* RX equalizer low frequency gain control bits [7:4], default 0x0 */
> > +#define PIPE_RX_EQ_LOW_GAIN_MASK             GENMASK(7, 4)
> > +#define PIPE_RX_EQ_LOW_GAIN_TUNE             (0x1 << 4)
> > +/* RX CTLE gain tuning bits [3:0], higher =3D more gain default 0x7 */
> > +#define PIPE_RX_CTLE_GAIN_MASK                       GENMASK(3, 0)
> > +#define PIPE_RX_CTLE_GAIN_TUNE                       0x7 /* 0x5 lowest=
 functional value, 0xf highest */
> > +
> > +/* RX ODT manual resistance config, higher =3D less resistance, depend=
s on REG_1C4 BIT(5) set */
> > +#define PIPE_REG_06C                                 0x06c
> > +/* RX ODT manual resistance high bits [3:0], default 0x0 */
> > +#define PIPE_RX_ODT_RES_HIGH_MASK            GENMASK(3, 0)
> > +#define PIPE_RX_ODT_RES_HIGH_TUNE            0xf
> > +
> > +#define PIPE_REG_070                                 0x070
> > +/* RX ODT manual resistance mid bits [7:0], default 0x03 */
> > +#define PIPE_RX_ODT_RES_MID_MASK             GENMASK(7, 0)
> > +#define PIPE_RX_ODT_RES_MID_TUNE             0xff
> > +
> > +#define PIPE_REG_074                                 0x074
> > +/* RX ODT manual resistance low bits [7:0], default 0xff */
> > +#define PIPE_RX_ODT_RES_LOW_MASK             GENMASK(7, 0)
> > +#define PIPE_RX_ODT_RES_LOW_TUNE             0xff
> > +
> > +/* default 0x08 */
> > +#define PIPE_REG_080                                 0x080
> > +#define PIPE_TX_COMMON_MODE_DIS                      BIT(2)  /* 1'b1 d=
isable TX common type */
> > +
> > +/* default 0x33 */
> > +#define PIPE_REG_088                                 0x088
> > +#define PIPE_TX_DRIVER_PREEMP_EN             BIT(4)  /* 1'b1 enable pr=
e-emphasis */
> > +
> > +/* default 0x18 */
> > +#define PIPE_REG_0C0                                 0x0c0
> > +#define PIPE_RX_CM_EN                                        BIT(3)  /=
* 1'b1 enable RX CM */
> > +#define PIPE_TX_OBS_EN                                       BIT(4)  /=
* 1'b1 enable TX OBS */
> > +
> > +/* 0x12 for rx tune?, default 0x14 */
> > +#define PIPE_REG_0C8                                 0x0c8
> > +/* RX CDR charge pump current bits [3:1], default 0x2 */
> > +#define PIPE_RX_CDR_CHG_PUMP_MASK            GENMASK(3, 1)
> > +#define PIPE_RX_CDR_CHG_PUMP_TUNE            (0x2 << 1)
> > +
> > +/* 0x02 for 24m, 0x06 for 25m, default 0x06 */
> > +#define UNKNOWN_PIPE_REG_108                 0x108
> > +#define UNKNOWN_REFCLK_108_24M                       0x02
> > +
> > +/* 0x80 for 24m, default 0x00 */
> > +#define UNKNOWN_PIPE_REG_10C                 0x10c
> > +#define UNKNOWN_REFCLK_10C_24M                       BIT(7)
> > +
> > +/* 0x01 for 24m, 0x00 for 25m, default 0x02 */
> > +#define PIPE_REG_118                                 0x118
> > +/* TX PLL multiplier high bits [3:0], as M, default 0x2, TX data rate =
=3D (2*refclk*M)/N */
> > +#define PIPE_TX_PLL_MUL_HIGH_MASK            GENMASK(3, 0)
> > +
> > +/* 0x38 for 24m, 0x64 for 25m, default 0x71 */
> > +#define PIPE_REG_11C                                 0x11c
> > +/* TX PLL multiplier low bits [7:0], as M, default 0x71, TX data rate =
=3D (2*refclk*M)/N */
> > +#define PIPE_TX_PLL_MUL_LOW_MASK             GENMASK(7, 0)
> > +
> > +/* 0x0c for SSC, default 0x1c */
> > +#define UNKNOWN_PIPE_REG_120                 0x120
> > +#define UNKNOWN_SSC_120_MASK                 BIT(4)
> > +#define UNKNOWN_SSC_120_ENABLE                       (0x0 << 4)
> > +
> > +/* default 0x40 */
> > +#define PIPE_REG_12C                                 0x12c
> > +#define PIPE_TX_PLL_ALWAYS_ON                        BIT(0) /* disable=
 for PLL control by pipe_pd */
> > +
> > +/* 0x05 for rx tune, default 0x01 */
> > +#define PIPE_REG_148                                 0x148
> > +#define PIPE_RX_CHG_PUMP_DIV_2                       BIT(2) /* RX CDR =
charge pump div/2, default 0 */
> > +
> > +/* 0x70 for rx tune, default 0x72 */
> > +#define PIPE_REG_150                                 0x150
> > +#define PIPE_TX_BIAS_EN                                      BIT(6)  /=
* 1'b1 Enable TX Bias */
> > +/* RX CDR phase tracking speed bits [3:0], default 0x2 */
> > +#define PIPE_RX_CDR_SPEED_MASK                       GENMASK(3, 0)
> > +#define PIPE_RX_CDR_SPEED_TUNE                       0x00
> > +
> > +/* default 0xd4 */
> > +#define PIPE_REG_160
> > +/* RX common mode voltage strength bits [5:4], default 0x1 */
> > +#define PIPE_RX_CDR_COM_VOLT_MASK            GENMASK(5, 4)
> > +#define PIPE_RX_CDR_COM_VOLT_TUNE            (0x1 << 4)
> > +
> > +/* default 0x00 */
> > +#define PIPE_REG_180                                 0x180
> > +/* TX driver bias reference voltage bits [3:2], in mv */
> > +#define PIPE_TX_BIAS_REF_VOLT_MASK           GENMASK(3, 2)
> > +#define PIPE_TX_BIAS_REF_VOLT_200            (0x0 << 2)
> > +#define PIPE_TX_BIAS_REF_VOLT_175            (0x1 << 2)
> > +#define PIPE_TX_BIAS_REF_VOLT_225            (0x2 << 2) /* downstream =
5.10 driver setting */
> > +#define PIPE_TX_BIAS_REF_VOLT_250            (0x3 << 2)
> > +
> > +/* default 0x01 */
> > +#define PIPE_REG_1A8                 0x1a8
> > +#define PIPE_LDO_POWER_DIS                           BIT(4)  /* 1'b1 D=
isable LDO Power */
> > +
> > +/* default 0x07 */
> > +#define PIPE_REG_1AC                 0x1ac
> > +/* TX driver output common voltage bits [5:4], in mv */
> > +#define PIPE_TX_COMMON_VOLT_MASK             GENMASK(5, 4)
> > +#define PIPE_TX_COMMON_VOLT_800                      (0x0 << 4)
> > +#define PIPE_TX_COMMON_VOLT_750                      (0x1 << 4)
> > +#define PIPE_TX_COMMON_VOLT_950                      (0x2 << 4)
> > +#define PIPE_TX_COMMON_VOLT_1100             (0x3 << 4)
>
> Just a question:
> In this list as well as the one above it (PIPE_TX_BIAS_xyz) I noticed
> the values are not sequential (800, 750, 950, 1100) and (200, 175, 225,
> 250). Is that correct?

According to the rk3228h trm, that's accurate. I'm hoping someone with
access to Innosilicon's IP can confirm the registers I've found and
provide insight to the rest.

>
> Cheers,
>   Diederik

