Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E4CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+g0XX9J8t8Nqb+uRU32vvhFxMEa0z6b7cNxVe9VKeo=; b=vHkkgifj5tkE0xuza7itl2AXbh
	RaKyFiEG3CNjdm3DwVVGBUI/mWW6xNDTJ1+lQmWZSIUthsVPkeSOqd7HTz4p4MY1mlubzt5mKGZ+5
	UbKfhhh3ZQalhGzlAfA0hwSrO1jPKIwbafB6mxdCmJYzSwSnVqX9nMhG6pcrvIUcRLRs5xUIAzlQ8
	1hsoNJZxH9W/sOCUFI6pWakNxlVwVOT+d9ft83dpUOHUKAlyAQqWrdTgGUpR7pzdU2wvRejFHKXvW
	ZEgWwhLUUjB+2MpkvsN06MBUORvDU3y517HItQqdV+ExrhR4qlPac96mEGaHUsRHNAQQb5oB0Tppq
	JQXOTQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyH2-00000008KyM-16xy;
	Sat, 06 Sep 2025 19:08:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxnk-00000008Gr4-0Pru;
	Sat, 06 Sep 2025 18:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=g+g0XX9J8t8Nqb+uRU32vvhFxMEa0z6b7cNxVe9VKeo=; b=nWYjEPyeVmOOKhYOXkH2Wm+4xK
	Lsofo0YkbSTFpL34whsCZ1ncc/Wr5VHDHc4DV2TH03/iXMzXyjnKXIUA+ev2CRQ9FmwiYotp55gi6
	NZ+4QC3iHyLsWtP6fedoAPMwxvxDw4124kRLj724Nkcs5VIN9OBTZ0TISD3ETQcXL53/94PLuxwee
	ejLvW1iye+oQljoJXH9cU9ssBTuh3BCmwyHOp1C8gWCBG2/RuthsfBSi6MJiB+lA+0v6PROVlBA26
	sQ/R+O0CGdRJ/kL7WdHwt8KBpKvIZcxLXk90b36G2hCa67ZFcxFlU2NPk7krBTh7rJV0W2miV5FVQ
	lntim3VQ==;
Received: from i53875a53.versanet.de ([83.135.90.83] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uuxnc-0006tH-5x; Sat, 06 Sep 2025 20:38:08 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Chanwoo Choi <chanwoo@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
Date: Sat, 06 Sep 2025 20:38:07 +0200
Message-ID: <24752023.ouqheUzb2q@diego>
In-Reply-To: <CAGTfZH1DzC9odJVDfYCYw4+Ph5_1CjmrpqR_NUFh1SsVVVLM0g@mail.gmail.com>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
 <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
 <CAGTfZH1DzC9odJVDfYCYw4+Ph5_1CjmrpqR_NUFh1SsVVVLM0g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113816_287551_6C0DC697 
X-CRM114-Status: GOOD (  51.33  )
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

Am Samstag, 6. September 2025, 18:09:53 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Chanwoo Choi:
> I'm sorry for late reply.
>=20
> Looks good to me. But, this patch contains the change of following header.
> If there are ACK about change in include/soc/rockchip, I'll merge this se=
ries.
>=20
> include/soc/rockchip/rk3588_grf.h    |  8 +++-
> include/soc/rockchip/rockchip_grf.h  |  1 +

done :-)

Thanks
Heiko


> On Fri, May 30, 2025 at 10:39=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > The Rockchip RK3588 SoC can also support LPDDR5 memory. This type of
> > memory needs some special case handling in the rockchip-dfi driver.
> >
> > Add support for it in rockchip-dfi, as well as the needed GRF register
> > definitions.
> >
> > This has been tested as returning both the right cycle count and
> > bandwidth on a LPDDR5 board where the CKR bit is 1. I couldn't test
> > whether the values are correct on a system where CKR is 0, as I'm not
> > savvy enough with the Rockchip tooling to know whether this can be set
> > in the DDR init blob.
> >
> > Downstream has some special case handling for a hardware version where
> > not just the control bits differ, but also the register. Since I don't
> > know whether that hardware version is in any production silicon, it's
> > left unimplemented for now, with an error message urging users to report
> > if they have such a system.
> >
> > There is a slight change of behaviour for non-LPDDR5 systems: instead of
> > writing 0 as the control flags to the control register and pretending
> > everything is alright if the memory type is unknown, we now explicitly
> > return an error.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/devfreq/event/rockchip-dfi.c | 84 ++++++++++++++++++++++++++++=
=2D-------
> >  include/soc/rockchip/rk3588_grf.h    |  8 +++-
> >  include/soc/rockchip/rockchip_grf.h  |  1 +
> >  3 files changed, 73 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/eve=
nt/rockchip-dfi.c
> > index 54effb63519653d20b40eed88681330983399a77..5a2c9badcc64c552303c2f5=
5c52e5420dec5ffc1 100644
> > --- a/drivers/devfreq/event/rockchip-dfi.c
> > +++ b/drivers/devfreq/event/rockchip-dfi.c
> > @@ -34,15 +34,18 @@
> >
> >  /* DDRMON_CTRL */
> >  #define DDRMON_CTRL    0x04
> > +#define DDRMON_CTRL_LPDDR5             BIT(6)
> >  #define DDRMON_CTRL_DDR4               BIT(5)
> >  #define DDRMON_CTRL_LPDDR4             BIT(4)
> >  #define DDRMON_CTRL_HARDWARE_EN                BIT(3)
> >  #define DDRMON_CTRL_LPDDR23            BIT(2)
> >  #define DDRMON_CTRL_SOFTWARE_EN                BIT(1)
> >  #define DDRMON_CTRL_TIMER_CNT_EN       BIT(0)
> > -#define DDRMON_CTRL_DDR_TYPE_MASK      (DDRMON_CTRL_DDR4 | \
> > +#define DDRMON_CTRL_DDR_TYPE_MASK      (DDRMON_CTRL_LPDDR5 | \
> > +                                        DDRMON_CTRL_DDR4 | \
> >                                          DDRMON_CTRL_LPDDR4 | \
> >                                          DDRMON_CTRL_LPDDR23)
> > +#define DDRMON_CTRL_LP5_BANK_MODE_MASK GENMASK(8, 7)
> >
> >  #define DDRMON_CH0_WR_NUM              0x20
> >  #define DDRMON_CH0_RD_NUM              0x24
> > @@ -116,13 +119,60 @@ struct rockchip_dfi {
> >         int buswidth[DMC_MAX_CHANNELS];
> >         int ddrmon_stride;
> >         bool ddrmon_ctrl_single;
> > +       u32 lp5_bank_mode;
> > +       bool lp5_ckr;   /* true if in 4:1 command-to-data clock ratio m=
ode */
> >         unsigned int count_multiplier;  /* number of data clocks per co=
unt */
> >  };
> >
> > +static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 =
*ctrl,
> > +                                       u32 *mask)
> > +{
> > +       u32 ddrmon_ver;
> > +
> > +       *mask =3D DDRMON_CTRL_DDR_TYPE_MASK;
> > +
> > +       switch (dfi->ddr_type) {
> > +       case ROCKCHIP_DDRTYPE_LPDDR2:
> > +       case ROCKCHIP_DDRTYPE_LPDDR3:
> > +               *ctrl =3D DDRMON_CTRL_LPDDR23;
> > +               break;
> > +       case ROCKCHIP_DDRTYPE_LPDDR4:
> > +       case ROCKCHIP_DDRTYPE_LPDDR4X:
> > +               *ctrl =3D DDRMON_CTRL_LPDDR4;
> > +               break;
> > +       case ROCKCHIP_DDRTYPE_LPDDR5:
> > +               ddrmon_ver =3D readl_relaxed(dfi->regs);
> > +               if (ddrmon_ver < 0x40) {
> > +                       *ctrl =3D DDRMON_CTRL_LPDDR5 | dfi->lp5_bank_mo=
de;
> > +                       *mask |=3D DDRMON_CTRL_LP5_BANK_MODE_MASK;
> > +                       break;
> > +               }
> > +
> > +               /*
> > +                * As it is unknown whether the unpleasant special case
> > +                * behaviour used by the vendor kernel is needed for any
> > +                * shipping hardware, ask users to report if they have
> > +                * some of that hardware.
> > +                */
> > +               dev_err(&dfi->edev->dev,
> > +                       "unsupported DDRMON version 0x%04X, please let =
linux-rockchip know!\n",
> > +                       ddrmon_ver);
> > +               return -EOPNOTSUPP;
> > +       default:
> > +               dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\=
n",
> > +                       dfi->ddr_type);
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
> >  {
> >         void __iomem *dfi_regs =3D dfi->regs;
> >         int i, ret =3D 0;
> > +       u32 ctrl;
> > +       u32 ctrl_mask;
> >
> >         mutex_lock(&dfi->mutex);
> >
> > @@ -136,8 +186,11 @@ static int rockchip_dfi_enable(struct rockchip_dfi=
 *dfi)
> >                 goto out;
> >         }
> >
> > +       ret =3D rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl, &ctrl_mask);
> > +       if (ret)
> > +               goto out;
> > +
> >         for (i =3D 0; i < dfi->max_channels; i++) {
> > -               u32 ctrl =3D 0;
> >
> >                 if (!(dfi->channel_mask & BIT(i)))
> >                         continue;
> > @@ -147,21 +200,7 @@ static int rockchip_dfi_enable(struct rockchip_dfi=
 *dfi)
> >                                DDRMON_CTRL_SOFTWARE_EN | DDRMON_CTRL_HA=
RDWARE_EN),
> >                                dfi_regs + i * dfi->ddrmon_stride + DDRM=
ON_CTRL);
> >
> > -               /* set ddr type to dfi */
> > -               switch (dfi->ddr_type) {
> > -               case ROCKCHIP_DDRTYPE_LPDDR2:
> > -               case ROCKCHIP_DDRTYPE_LPDDR3:
> > -                       ctrl =3D DDRMON_CTRL_LPDDR23;
> > -                       break;
> > -               case ROCKCHIP_DDRTYPE_LPDDR4:
> > -               case ROCKCHIP_DDRTYPE_LPDDR4X:
> > -                       ctrl =3D DDRMON_CTRL_LPDDR4;
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> > -
> > -               writel_relaxed(HIWORD_UPDATE(ctrl, DDRMON_CTRL_DDR_TYPE=
_MASK),
> > +               writel_relaxed(HIWORD_UPDATE(ctrl, ctrl_mask),
> >                                dfi_regs + i * dfi->ddrmon_stride + DDRM=
ON_CTRL);
> >
> >                 /* enable count, use software mode */
> > @@ -652,6 +691,7 @@ static int rockchip_ddr_perf_init(struct rockchip_d=
fi *dfi)
> >                 break;
> >         case ROCKCHIP_DDRTYPE_LPDDR4:
> >         case ROCKCHIP_DDRTYPE_LPDDR4X:
> > +       case ROCKCHIP_DDRTYPE_LPDDR5:
> >                 dfi->burst_len =3D 16;
> >                 break;
> >         }
> > @@ -730,7 +770,7 @@ static int rk3568_dfi_init(struct rockchip_dfi *dfi)
> >  static int rk3588_dfi_init(struct rockchip_dfi *dfi)
> >  {
> >         struct regmap *regmap_pmu =3D dfi->regmap_pmu;
> > -       u32 reg2, reg3, reg4;
> > +       u32 reg2, reg3, reg4, reg6;
> >
> >         regmap_read(regmap_pmu, RK3588_PMUGRF_OS_REG2, &reg2);
> >         regmap_read(regmap_pmu, RK3588_PMUGRF_OS_REG3, &reg3);
> > @@ -757,6 +797,14 @@ static int rk3588_dfi_init(struct rockchip_dfi *df=
i)
> >         dfi->ddrmon_stride =3D 0x4000;
> >         dfi->count_multiplier =3D 2;
> >
> > +       if (dfi->ddr_type =3D=3D ROCKCHIP_DDRTYPE_LPDDR5) {
> > +               regmap_read(regmap_pmu, RK3588_PMUGRF_OS_REG6, &reg6);
> > +               dfi->lp5_bank_mode =3D FIELD_GET(RK3588_PMUGRF_OS_REG6_=
LP5_BANK_MODE, reg6) << 7;
> > +               dfi->lp5_ckr =3D FIELD_GET(RK3588_PMUGRF_OS_REG6_LP5_CK=
R, reg6);
> > +               if (dfi->lp5_ckr)
> > +                       dfi->count_multiplier *=3D 2;
> > +       }
> > +
> >         return 0;
> >  };
> >
> > diff --git a/include/soc/rockchip/rk3588_grf.h b/include/soc/rockchip/r=
k3588_grf.h
> > index 630b35a550640e57f1b5a50dfbe362653a7cbcc1..02a7b2432d9942e15a77424=
c44fefec189faaa33 100644
> > --- a/include/soc/rockchip/rk3588_grf.h
> > +++ b/include/soc/rockchip/rk3588_grf.h
> > @@ -12,7 +12,11 @@
> >  #define RK3588_PMUGRF_OS_REG3_DRAMTYPE_INFO_V3         GENMASK(13, 12)
> >  #define RK3588_PMUGRF_OS_REG3_SYSREG_VERSION           GENMASK(31, 28)
> >
> > -#define RK3588_PMUGRF_OS_REG4           0x210
> > -#define RK3588_PMUGRF_OS_REG5           0x214
> > +#define RK3588_PMUGRF_OS_REG4                          0x210
> > +#define RK3588_PMUGRF_OS_REG5                          0x214
> > +#define RK3588_PMUGRF_OS_REG6                          0x218
> > +#define RK3588_PMUGRF_OS_REG6_LP5_BANK_MODE            GENMASK(2, 1)
> > +/* Whether the LPDDR5 is in 2:1 (=3D 0) or 4:1 (=3D 1) CKR a.k.a. DQS =
mode */
> > +#define RK3588_PMUGRF_OS_REG6_LP5_CKR                  BIT(0)
> >
> >  #endif /* __SOC_RK3588_GRF_H */
> > diff --git a/include/soc/rockchip/rockchip_grf.h b/include/soc/rockchip=
/rockchip_grf.h
> > index e46fd72aea8d1f649768a3269b85176dacceef0e..41c7bb26fd5387df85e5b58=
186b67bf74706f360 100644
> > --- a/include/soc/rockchip/rockchip_grf.h
> > +++ b/include/soc/rockchip/rockchip_grf.h
> > @@ -13,6 +13,7 @@ enum {
> >         ROCKCHIP_DDRTYPE_LPDDR3 =3D 6,
> >         ROCKCHIP_DDRTYPE_LPDDR4 =3D 7,
> >         ROCKCHIP_DDRTYPE_LPDDR4X =3D 8,
> > +       ROCKCHIP_DDRTYPE_LPDDR5 =3D 9,
> >  };
> >
> >  #endif /* __SOC_ROCKCHIP_GRF_H */
> >
> > --
> > 2.49.0
> >
> >
>=20
>=20
>=20





