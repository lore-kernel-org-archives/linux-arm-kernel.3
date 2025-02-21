Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A2DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKVfdDWCWpSVN98ZViqpeKFA1hwhLKeuW6yriFxlsAY=; b=weJ+NSwz4RfI8Y4gNi8yvQ8BLu
	wLsjXONh6e+RhzYTPVGCStNjH8CT3GpvNr3cEaLGDLXorNx0dnIqsU1Cv444HZpVHoj2T5yHXlRTL
	5kJrel1b6ZAt4mWRd9ibx383HACdJmn2tKLMgRjuJpCT4EYlqG8I3fbgl9FVrcUAJcLjmMSeaKsLc
	+OTvQN0i9bNQxj91PYXecaDjAmq74ydbGTVWC1usgx4bu/iDcyqkc4FezdAZeNluUE+EzLcbs//Vv
	N7HFMjsC1zxfhRWq89dRe8u7BsGH7IM6aqjHRDArTxDZ/lAHmBHD3XryBB3OXUj7LxGIowtUZy+l2
	SsGhACVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV6j-000000060Q5-3SVl;
	Fri, 21 Feb 2025 15:38:29 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV5F-00000006078-0dbr;
	Fri, 21 Feb 2025 15:36:58 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-520aede8ae3so662350e0c.0;
        Fri, 21 Feb 2025 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740152215; x=1740757015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKVfdDWCWpSVN98ZViqpeKFA1hwhLKeuW6yriFxlsAY=;
        b=A0mM/wUc7E6e64uRWNoh2EJHKSMDZeHBUJxWBdEJFd9z7UiSHYp5GyFPqyQv0B/i3q
         uwUqPIDckHDVydkCocF81sjS6H59rc6k+/qevqPmUaX6NJslcmpGhh9WlgRxscAzBXY0
         IAT/jwPfZO9W0stEAAO+qZZGR2woCcr4Bh9GHi7E1gFdmMwnk9zjJdlswBAXCQ03+yRx
         Yhip9wo2GaBJAgndYLPf6vy3xKQDw90bHZNsoS4uag2BOc71jhHX+6k7xWnK9ixusuOl
         oujRGvn5JEeveAJZObGtCfAoQAPoNOZgY2tFc3OeHXwY+FDFVQxzBtGHEmxUCYZf5iAE
         OeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740152215; x=1740757015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKVfdDWCWpSVN98ZViqpeKFA1hwhLKeuW6yriFxlsAY=;
        b=H6kL5jf6s807Mss0pAIaGuz0sW+Q+EdN6Aopyc6zgTvKnP6e/v8XwFLxr3sjwrQhAy
         unPTxvvm46oD1RdwNtfxB0+4JRDcnjssIHLuOA3hnb89jIVRyVKebU1AUq8pX2wJnvZu
         vN50cnrkvLOGY84iQXSKfdoYfBDzZfkH2qpb40v//woUJQSnnta/OcNz0MQX63IdajKF
         47+OamawdXf104PfB/wMGdGXroEgkZcFSTq0U4947zyQptuoqDxNZADuLssR6fBXI+uI
         aldYZOgezmT4mWIR1IplL3ehzYqFtVkL40kkA9b0y2BFmjFZ6uavxVbgiUo3buxJc+MI
         YkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6EQ5fN6gtKFcd1Gboo+i7SuRAz0+wEEBk0Caz9vkAIhSbwRB8nZ233DUZTcGqyocO9yIfJ5yrrn0ENt1IdR1M@lists.infradead.org, AJvYcCXsS2d7rjboTx5qTSVY43S87snICD2UtzQLmGqzzjzk/l7iq9UIFrUL0HDn/0kL9oyuL4z1q5nU/u3p3YwIKHkifA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN2YPqdl6FZuRyuSxKijQR8F8impa75kKSQ4fLWUVdHH7h2GB8
	Zi0la7xadgUSvtPQ+l6NrBIC+SVkBRzi8E8JytE3yN8uDua/XLqhL3lWydM9m7NljOpyeXUZnA3
	qMlBf7KQgQ0KYnlfao0igvgHguws=
X-Gm-Gg: ASbGnct2CblK1zW18gnHxEqKdSys5DEPhBaYBC2zzm2v8Wojizd0WDAXZliMEGlf5/4
	NfqCz4MsusMO1QqOijSYX96ggfg/1qM8JadWhjFgF+XUIQ3QJCdQ6K2z2upeV3HXNVj2eo5WHhx
	weTit+O/t5
X-Google-Smtp-Source: AGHT+IGULYiG+SFcnDn3kW+A4QVrxmiMwLRoDveCDDtF/IAQxExxxRnf1A+x3EuYtJ8YlDz/oaMmX8PsVQUcflMNBEI=
X-Received: by 2002:a05:6122:ec3:b0:518:6286:87a4 with SMTP id
 71dfb90a1353d-521ee253c9dmr2584836e0c.4.1740152215442; Fri, 21 Feb 2025
 07:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20250120130119.671119-1-svarbanov@suse.de> <20250120130119.671119-5-svarbanov@suse.de>
 <CANCKTBsm6o9yaSenj-wft+n0uX-HNRjpJjkZaQcn4t474fXtow@mail.gmail.com>
In-Reply-To: <CANCKTBsm6o9yaSenj-wft+n0uX-HNRjpJjkZaQcn4t474fXtow@mail.gmail.com>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Fri, 21 Feb 2025 10:36:44 -0500
X-Gm-Features: AWEUYZnuDltcLE3YhHUG-c34IxQo-M0R56q9qwlO9Ca-s2cx58AqO_sDEtfBnbs
Message-ID: <CANCKTBuMOk9ASfPydcKHQgaQF4p7m7ryYezcLPdBEM2ao3LY3g@mail.gmail.com>
Subject: Re: [PATCH v5 -next 04/11] PCI: brcmstb: Reuse config structure
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_073657_196464_F9CACCEF 
X-CRM114-Status: GOOD (  27.99  )
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

On Fri, Jan 31, 2025 at 11:10=E2=80=AFAM Jim Quinlan <jim2101024@gmail.com>=
 wrote:
>
> On Mon, Jan 20, 2025 at 8:01=E2=80=AFAM Stanimir Varbanov <svarbanov@suse=
.de> wrote:
> >
> > Instead of copying fields from pcie_cfg_data structure to
> > brcm_pcie reference it directly.
> >
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Reviewed-by: Florian Fainelil <florian.fainelli@broadcom.com>
> > ---
> > v4 -> v5:
> >  - No changes.
> >
> >  drivers/pci/controller/pcie-brcmstb.c | 70 ++++++++++++---------------
> >  1 file changed, 31 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index e733a27dc8df..48b2747d8c98 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -191,11 +191,11 @@
> >  #define SSC_STATUS_PLL_LOCK_MASK       0x800
> >  #define PCIE_BRCM_MAX_MEMC             3
> >
> > -#define IDX_ADDR(pcie)                 ((pcie)->reg_offsets[EXT_CFG_IN=
DEX])
> > -#define DATA_ADDR(pcie)                        ((pcie)->reg_offsets[EX=
T_CFG_DATA])
> > -#define PCIE_RGR1_SW_INIT_1(pcie)      ((pcie)->reg_offsets[RGR1_SW_IN=
IT_1])
> > -#define HARD_DEBUG(pcie)               ((pcie)->reg_offsets[PCIE_HARD_=
DEBUG])
> > -#define INTR2_CPU_BASE(pcie)           ((pcie)->reg_offsets[PCIE_INTR2=
_CPU_BASE])
> > +#define IDX_ADDR(pcie)                 ((pcie)->cfg->offsets[EXT_CFG_I=
NDEX])
> > +#define DATA_ADDR(pcie)                        ((pcie)->cfg->offsets[E=
XT_CFG_DATA])
> > +#define PCIE_RGR1_SW_INIT_1(pcie)      ((pcie)->cfg->offsets[RGR1_SW_I=
NIT_1])
> > +#define HARD_DEBUG(pcie)               ((pcie)->cfg->offsets[PCIE_HARD=
_DEBUG])
> > +#define INTR2_CPU_BASE(pcie)           ((pcie)->cfg->offsets[PCIE_INTR=
2_CPU_BASE])
> >
> >  /* Rescal registers */
> >  #define PCIE_DVT_PMU_PCIE_PHY_CTRL                             0xc700
> > @@ -276,8 +276,6 @@ struct brcm_pcie {
> >         int                     gen;
> >         u64                     msi_target_addr;
> >         struct brcm_msi         *msi;
> > -       const int               *reg_offsets;
> > -       enum pcie_soc_base      soc_base;
> >         struct reset_control    *rescal;
> >         struct reset_control    *perst_reset;
> >         struct reset_control    *bridge_reset;
> > @@ -285,17 +283,14 @@ struct brcm_pcie {
> >         int                     num_memc;
> >         u64                     memc_size[PCIE_BRCM_MAX_MEMC];
> >         u32                     hw_rev;
> > -       int                     (*perst_set)(struct brcm_pcie *pcie, u3=
2 val);
> > -       int                     (*bridge_sw_init_set)(struct brcm_pcie =
*pcie, u32 val);
> >         struct subdev_regulators *sr;
> >         bool                    ep_wakeup_capable;
> > -       bool                    has_phy;
> > -       u8                      num_inbound_wins;
> > +       const struct pcie_cfg_data      *cfg;
> >  };
> >
> >  static inline bool is_bmips(const struct brcm_pcie *pcie)
> >  {
> > -       return pcie->soc_base =3D=3D BCM7435 || pcie->soc_base =3D=3D B=
CM7425;
> > +       return pcie->cfg->soc_base =3D=3D BCM7435 || pcie->cfg->soc_bas=
e =3D=3D BCM7425;
> >  }
> >
> >  /*
> > @@ -855,7 +850,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_p=
cie *pcie,
> >          * security considerations, and is not implemented in our moder=
n
> >          * SoCs.
> >          */
> > -       if (pcie->soc_base !=3D BCM7712)
> > +       if (pcie->cfg->soc_base !=3D BCM7712)
> >                 add_inbound_win(b++, &n, 0, 0, 0);
> >
> >         resource_list_for_each_entry(entry, &bridge->dma_ranges) {
> > @@ -872,10 +867,10 @@ static int brcm_pcie_get_inbound_wins(struct brcm=
_pcie *pcie,
> >                  * That being said, each BARs size must still be a powe=
r of
> >                  * two.
> >                  */
> > -               if (pcie->soc_base =3D=3D BCM7712)
> > +               if (pcie->cfg->soc_base =3D=3D BCM7712)
> >                         add_inbound_win(b++, &n, size, cpu_start, pcie_=
start);
> >
> > -               if (n > pcie->num_inbound_wins)
> > +               if (n > pcie->cfg->num_inbound_wins)
> >                         break;
> >         }
> >
> > @@ -889,7 +884,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_p=
cie *pcie,
> >          * that enables multiple memory controllers.  As such, it can r=
eturn
> >          * now w/o doing special configuration.
> >          */
> > -       if (pcie->soc_base =3D=3D BCM7712)
> > +       if (pcie->cfg->soc_base =3D=3D BCM7712)
> >                 return n;
> >
> >         ret =3D of_property_read_variable_u64_array(pcie->np, "brcm,scb=
-sizes", pcie->memc_size, 1,
> > @@ -1012,7 +1007,7 @@ static void set_inbound_win_registers(struct brcm=
_pcie *pcie,
> >                  * 7712:
> >                  *     All of their BARs need to be set.
> >                  */
> > -               if (pcie->soc_base =3D=3D BCM7712) {
> > +               if (pcie->cfg->soc_base =3D=3D BCM7712) {
> >                         /* BUS remap register settings */
> >                         reg_offset =3D brcm_ubus_reg_offset(i);
> >                         tmp =3D lower_32_bits(cpu_addr) & ~0xfff;
> > @@ -1036,15 +1031,15 @@ static int brcm_pcie_setup(struct brcm_pcie *pc=
ie)
> >         int memc, ret;
> >
> >         /* Reset the bridge */
> > -       ret =3D pcie->bridge_sw_init_set(pcie, 1);
> > +       ret =3D pcie->cfg->bridge_sw_init_set(pcie, 1);
> >         if (ret)
> >                 return ret;
> >
> >         /* Ensure that PERST# is asserted; some bootloaders may deasser=
t it. */
> > -       if (pcie->soc_base =3D=3D BCM2711) {
> > -               ret =3D pcie->perst_set(pcie, 1);
> > +       if (pcie->cfg->soc_base =3D=3D BCM2711) {
> > +               ret =3D pcie->cfg->perst_set(pcie, 1);
> >                 if (ret) {
> > -                       pcie->bridge_sw_init_set(pcie, 0);
> > +                       pcie->cfg->bridge_sw_init_set(pcie, 0);
> >                         return ret;
> >                 }
> >         }
> > @@ -1052,7 +1047,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie=
)
> >         usleep_range(100, 200);
> >
> >         /* Take the bridge out of reset */
> > -       ret =3D pcie->bridge_sw_init_set(pcie, 0);
> > +       ret =3D pcie->cfg->bridge_sw_init_set(pcie, 0);
> >         if (ret)
> >                 return ret;
> >
> > @@ -1072,9 +1067,9 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie=
)
> >          */
> >         if (is_bmips(pcie))
> >                 burst =3D 0x1; /* 256 bytes */
> > -       else if (pcie->soc_base =3D=3D BCM2711)
> > +       else if (pcie->cfg->soc_base =3D=3D BCM2711)
> >                 burst =3D 0x0; /* 128 bytes */
> > -       else if (pcie->soc_base =3D=3D BCM7278)
> > +       else if (pcie->cfg->soc_base =3D=3D BCM7278)
> >                 burst =3D 0x3; /* 512 bytes */
> >         else
> >                 burst =3D 0x2; /* 512 bytes */
> > @@ -1199,7 +1194,7 @@ static void brcm_extend_rbus_timeout(struct brcm_=
pcie *pcie)
> >         u32 timeout_us =3D 4000000; /* 4 seconds, our setting for L1SS =
*/
> >
> >         /* 7712 does not have this (RGR1) timer */
> > -       if (pcie->soc_base =3D=3D BCM7712)
> > +       if (pcie->cfg->soc_base =3D=3D BCM7712)
> >                 return;
> >
> >         /* Each unit in timeout register is 1/216,000,000 seconds */
> > @@ -1277,7 +1272,7 @@ static int brcm_pcie_start_link(struct brcm_pcie =
*pcie)
> >         int ret, i;
> >
> >         /* Unassert the fundamental reset */
> > -       ret =3D pcie->perst_set(pcie, 0);
> > +       ret =3D pcie->cfg->perst_set(pcie, 0);
> >         if (ret)
> >                 return ret;
> >
> > @@ -1463,12 +1458,12 @@ static int brcm_phy_cntl(struct brcm_pcie *pcie=
, const int start)
> >
> >  static inline int brcm_phy_start(struct brcm_pcie *pcie)
> >  {
> > -       return pcie->has_phy ? brcm_phy_cntl(pcie, 1) : 0;
> > +       return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 1) : 0;
> >  }
> >
> >  static inline int brcm_phy_stop(struct brcm_pcie *pcie)
> >  {
> > -       return pcie->has_phy ? brcm_phy_cntl(pcie, 0) : 0;
> > +       return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 0) : 0;
> >  }
> >
> >  static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
> > @@ -1479,7 +1474,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *p=
cie)
> >         if (brcm_pcie_link_up(pcie))
> >                 brcm_pcie_enter_l23(pcie);
> >         /* Assert fundamental reset */
> > -       ret =3D pcie->perst_set(pcie, 1);
> > +       ret =3D pcie->cfg->perst_set(pcie, 1);
> >         if (ret)
> >                 return ret;
> >
> > @@ -1582,7 +1577,7 @@ static int brcm_pcie_resume_noirq(struct device *=
dev)
> >                 goto err_reset;
> >
> >         /* Take bridge out of reset so we can access the SERDES reg */
> > -       pcie->bridge_sw_init_set(pcie, 0);
> > +       pcie->cfg->bridge_sw_init_set(pcie, 0);
> >
> >         /* SERDES_IDDQ =3D 0 */
> >         tmp =3D readl(base + HARD_DEBUG(pcie));
> > @@ -1803,12 +1798,7 @@ static int brcm_pcie_probe(struct platform_devic=
e *pdev)
> >         pcie =3D pci_host_bridge_priv(bridge);
> >         pcie->dev =3D &pdev->dev;
> >         pcie->np =3D np;
> > -       pcie->reg_offsets =3D data->offsets;
> > -       pcie->soc_base =3D data->soc_base;
> > -       pcie->perst_set =3D data->perst_set;
> > -       pcie->bridge_sw_init_set =3D data->bridge_sw_init_set;
> > -       pcie->has_phy =3D data->has_phy;
> > -       pcie->num_inbound_wins =3D data->num_inbound_wins;
> > +       pcie->cfg =3D data;
> >
> >         pcie->base =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(pcie->base))
> > @@ -1843,7 +1833,7 @@ static int brcm_pcie_probe(struct platform_device=
 *pdev)
> >         if (ret)
> >                 return dev_err_probe(&pdev->dev, ret, "could not enable=
 clock\n");
> >
> > -       pcie->bridge_sw_init_set(pcie, 0);
> > +       pcie->cfg->bridge_sw_init_set(pcie, 0);
> >
> >         if (pcie->swinit_reset) {
> >                 ret =3D reset_control_assert(pcie->swinit_reset);
> > @@ -1882,7 +1872,8 @@ static int brcm_pcie_probe(struct platform_device=
 *pdev)
> >                 goto fail;
> >
> >         pcie->hw_rev =3D readl(pcie->base + PCIE_MISC_REVISION);
> > -       if (pcie->soc_base =3D=3D BCM4908 && pcie->hw_rev >=3D BRCM_PCI=
E_HW_REV_3_20) {
> > +       if (pcie->cfg->soc_base =3D=3D BCM4908 &&
> > +           pcie->hw_rev >=3D BRCM_PCIE_HW_REV_3_20) {
> >                 dev_err(pcie->dev, "hardware revision with unsupported =
PERST# setup\n");
> >                 ret =3D -ENODEV;
> >                 goto fail;
> > @@ -1897,7 +1888,8 @@ static int brcm_pcie_probe(struct platform_device=
 *pdev)
> >                 }
> >         }
> >
> > -       bridge->ops =3D pcie->soc_base =3D=3D BCM7425 ? &brcm7425_pcie_=
ops : &brcm_pcie_ops;
> > +       bridge->ops =3D pcie->cfg->soc_base =3D=3D BCM7425 ?
> > +                               &brcm7425_pcie_ops : &brcm_pcie_ops;
> >         bridge->sysdata =3D pcie;
> >
> >         platform_set_drvdata(pdev, pcie);
>
> Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>

Hi Stan,

Sorry for the late notice but I get a compilation error on this commit:

drivers/pci/controller/pcie-brcmstb.c: In function 'brcm_pcie_turn_off':
drivers/pci/controller/pcie-brcmstb.c:1492:14: error: 'struct
brcm_pcie' has no member named 'bridge_sw_init_set'; did you mean
'bridge_reset'?
  ret =3D pcie->bridge_sw_init_set(pcie, 1);
              ^~~~~~~~~~~~~~~~~~
              bridge_reset
make[5]: *** [scripts/Makefile.build:194:
drivers/pci/controller/pcie-brcmstb.o] Error 1

It appears to be fixed with the subsequent commit "PCI: brcmstb: Add
bcm2712 support".

Can you please look into this and see if you get the same results?

Regards,
Jim Quinlan
Broadcom STB/CM


> > --
> > 2.47.0
> >

