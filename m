Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A89C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 05:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr5j3HktXmdBuql9hRLpcA8htD63sRgEruV9zFxQJSk=; b=vVffY2Co3kjM0Cfr36ZFWXBz9T
	+23UdOR4yR80lIx2seIQo8f7WdYJ/3fh8BVGpFEQ9cc7WNKXGIMGXl7hZ2Oa4GgPhQ6jo5YvOAmhf
	koXFyE+rDDQgkb3dJiwoQuC0x9nO4k1A8K8H0pKh/qv+gYGnBTWhmR5QsiDDLVHXCMgZmDVd6A3Ja
	Ydks9S6wVPUeUfcd+NobDHeH0nkfKQB+1qL/3uJATRvqP4GlEMVbfilHO6uIEyjjmzGYxX6I5VUkr
	VvI7wNdrPjC1c5Fv+ar1CHbgB1xxc2FVj+yB5lPzlBaJ1ENi/lFRJbRyDRZ7AyVUQbgDCumIZ22jS
	N+7nkk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ0RJ-00000004HwO-0bwq;
	Tue, 08 Jul 2025 05:00:21 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ0Ow-00000004Hhc-2PxA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 04:57:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4137851e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751950673; x=1752555473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr5j3HktXmdBuql9hRLpcA8htD63sRgEruV9zFxQJSk=;
        b=bct2CJWwEY/YrxttZ2PY21XwLPzbvKi0DyrCMGpyaWNyTjXW3wJbeW7ATiuj9264pX
         yGiEDoOP7wypDlCAsMYDJwvG1VEKw2ybsa6xbDvtXkJuOnKQ72P0lVMQvdRXOfWIMsKU
         +e0247//+oR/a/1bphIb/O5oKNND91Dkpt5zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751950673; x=1752555473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr5j3HktXmdBuql9hRLpcA8htD63sRgEruV9zFxQJSk=;
        b=R344wikI2NKqxyKYH5JtqMd4sHafhgsGIi1t0EcYveMWOUVRTXc4rEmorE3/wWmZYz
         Ja3sulWXBsDtGY+DxF9Ky7gMj4byE7BJBbofZnv4PwW1bwLez1g9RyblhB/Q2NHMGDWz
         Zi+ozAujLDq/xgFbDOq8ZoBSsAmbLb0DVzDl3D1ohqyzuViuJfTr9IrkZlgOlbF6y32Q
         Ixc30dq7EPIhDg+tN1+HebGLhRxM/iJU53WJhb/pzIi70VWvCDQI0Xi+/HOWk8bzlYuI
         SHSR/QwqEOyX7x90WAjQKzAJKRE2o7RHvbA5EbqSTs1YsetiIKvAG5ZEnyJUnGzl3ox+
         //5w==
X-Forwarded-Encrypted: i=1; AJvYcCXRoIQ6kv4DKVi/tvcKGWMTmF3zn+qv08PJxoJh7MWGHlfvoSxQDuI15POMwyxdqNwzkMk3rpXOix2hliKadER8@lists.infradead.org
X-Gm-Message-State: AOJu0YwaEuv6vBary9f2HKqXnxEfUCfWrlBkRQf8sevSKD5Lkfb2Lh12
	1tvoi3fQpVtFDzsaNnHWpsLuZEleuceVfQfLkaNPsZaSkgHZhvb9ZJPzsae0fmdnZRA7DyIeUAE
	CWVQmNgI96BDxbYa9ws9dQeQMnOatCWs6M7sNcvhI
X-Gm-Gg: ASbGncvXohd+zAZa76/wkW4FDiRjUYwtdJoC9uydUeo+pc7R5/YlnirzseaE33mUQF7
	G1riLXzjUuLVGHV53EvSepZ7vMzFVVScHuYBYLlZ4p11bKALKWpQ2h2Os7VpaJFo1TCEHluHf60
	QvzLhZTuG+9MXx9NdP4Xk2R1zXNROQfoR2eZoxO1LjyCBAy4oz6p6mH1QG7VSx0B/cnUzGqSM=
X-Google-Smtp-Source: AGHT+IGiKmRVVctKEN/87vc8xFNDgCG4gqbvI6NjBIPAZYuz9GsA3JMVpKP+W+7I3VmAlOaA1Oceumi0sItLoIdM0rg=
X-Received: by 2002:a05:6512:ad2:b0:553:a456:a0d4 with SMTP id
 2adb3069b0e04-557f830d866mr441986e87.15.1751950672522; Mon, 07 Jul 2025
 21:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com> <20250707134451.154346-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250707134451.154346-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Jul 2025 12:57:41 +0800
X-Gm-Features: Ac12FXxoiikXF1-TFEleSvh2qQAz2WaU9ADuyjClvcWDyJXjaLPqVQRaBRPRGBU
Message-ID: <CAGXv+5GbcyEEBaEhB1QY5uZ-CnKpvRgOYhqv==d72KXkVSSB3g@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_215754_934588_03273CD1 
X-CRM114-Status: GOOD (  33.18  )
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

On Mon, Jul 7, 2025 at 10:29=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a driver for the regulators found on the MT6363 PMIC, fully
> controlled by SPMI interface.
> This PMIC regulates voltage with an input range of 2.6-5.0V, and
> features 10 buck converters and 26 LDOs.
>
> Link: https://lore.kernel.org/r/20250624073548.29732-5-angelogioacchino.d=
elregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/regulator/Kconfig                  |    9 +
>  drivers/regulator/Makefile                 |    1 +
>  drivers/regulator/mt6363-regulator.c       | 1076 ++++++++++++++++++++
>  include/linux/regulator/mt6363-regulator.h |  326 ++++++
>  4 files changed, 1412 insertions(+)
>  create mode 100644 drivers/regulator/mt6363-regulator.c
>  create mode 100644 include/linux/regulator/mt6363-regulator.h
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 81f2acd0f960..d770e51f7ad1 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -936,6 +936,15 @@ config REGULATOR_MT6360
>           2-channel buck with Thermal Shutdown and Overload Protection
>           6-channel High PSRR and Low Dropout LDO.
>
> +config REGULATOR_MT6363
> +       tristate "MT6363 SPMI PMIC regulator driver"
> +       depends on SPMI || COMPILE_TEST
> +       help
> +          Say Y here to enable support for regulators found in the Media=
Tek
> +          MT6363 SPMI PMIC.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6370
>         tristate "MT6370 SubPMIC Regulator"
>         depends on MFD_MT6370
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 46c0e75f6107..41eaeac5547d 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -111,6 +111,7 @@ obj-$(CONFIG_REGULATOR_MT6357)      +=3D mt6357-regul=
ator.o
>  obj-$(CONFIG_REGULATOR_MT6358) +=3D mt6358-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6359) +=3D mt6359-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6360) +=3D mt6360-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6363) +=3D mt6363-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6370) +=3D mt6370-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380) +=3D mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397) +=3D mt6397-regulator.o
> diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6=
363-regulator.c
> new file mode 100644
> index 000000000000..ea7d4e4f38cb
> --- /dev/null
> +++ b/drivers/regulator/mt6363-regulator.c
> @@ -0,0 +1,1076 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 MediaTek Inc.
> +// Copyright (c) 2025 Collabora Ltd
> +//                    AngeloGioacchino Del Regno <angelogioacchino.delre=
gno@collabora.com>
> +
> +#include <linux/delay.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6363-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define MT6363_REGULATOR_MODE_NORMAL   0
> +#define MT6363_REGULATOR_MODE_FCCM     1
> +#define MT6363_REGULATOR_MODE_LP       2
> +#define MT6363_REGULATOR_MODE_ULP      3
> +
> +#define EN_SET_OFFSET  0x1
> +#define EN_CLR_OFFSET  0x2
> +#define OP_CFG_OFFSET  0x5
> +
> +#define NORMAL_OP_CFG  0x10
> +#define NORMAL_OP_EN   0x800000
> +
> +#define OC_IRQ_ENABLE_DELAY_MS         10
> +
> +/* Unlock keys for TMA and BUCK_TOP */
> +#define MT6363_TMA_UNLOCK_VALUE                0x9c9c
> +#define MT6363_BUCK_TOP_UNLOCK_VALUE   0x5543
> +
> +#define MT6363_RG_BUCK_EFUSE_RSV1      0x1447
> +#define MT6363_RG_BUCK_EFUSE_RSV1_MASK GENMASK(7, 4)
> +
> +enum {
> +       MT6363_ID_VS2,
> +       MT6363_ID_VBUCK1,
> +       MT6363_ID_VBUCK2,
> +       MT6363_ID_VBUCK3,
> +       MT6363_ID_VBUCK4,
> +       MT6363_ID_VBUCK5,
> +       MT6363_ID_VBUCK6,
> +       MT6363_ID_VBUCK7,
> +       MT6363_ID_VS1,
> +       MT6363_ID_VS3,

This ordering is a bit weird. Is there any particular reason for this?
Order of the registers perhaps?

> +       MT6363_ID_VBUCK1_SSHUB,
> +       MT6363_ID_VBUCK2_SSHUB,
> +       MT6363_ID_VBUCK4_SSHUB,
> +       MT6363_ID_VSRAM_DIGRF,
> +       MT6363_ID_VSRAM_MDFE,
> +       MT6363_ID_VSRAM_MODEM,
> +       MT6363_ID_VSRAM_CPUB,
> +       MT6363_ID_VSRAM_CPUM,
> +       MT6363_ID_VSRAM_CPUL,
> +       MT6363_ID_VSRAM_APU,
> +       MT6363_ID_VEMC,
> +       MT6363_ID_VCN13,
> +       MT6363_ID_VTREF18,
> +       MT6363_ID_VAUX18,
> +       MT6363_ID_VCN15,
> +       MT6363_ID_VUFS18,
> +       MT6363_ID_VIO18,
> +       MT6363_ID_VM18,
> +       MT6363_ID_VA15,
> +       MT6363_ID_VRF18,
> +       MT6363_ID_VRFIO18,
> +       MT6363_ID_VIO075,
> +       MT6363_ID_VUFS12,
> +       MT6363_ID_VA12_1,
> +       MT6363_ID_VA12_2,
> +       MT6363_ID_VRF12,
> +       MT6363_ID_VRF13,
> +       MT6363_ID_VRF09,
> +       MT6363_ID_ISINK_LOAD
> +};
> +

[...]

> +#define MT6363_LDO_LINEAR_OPS(match, vreg, vops, min, max, step,       \
> +                             en_reg, en_bit, vs_reg, vs_mask,          \
> +                             lp_reg, lp_bit)                           \
> +[MT6363_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D match,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &vops,                                          =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6363_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D (max - min) / step + 1,                  =
 \
> +               .min_uV =3D min,                                         =
 \
> +               .uV_step =3D step,                                       =
 \
> +               .enable_reg =3D en_reg,                                  =
 \
> +               .enable_mask =3D BIT(en_bit),                            =
 \
> +               .vsel_reg =3D vs_reg,                                    =
 \
> +               .vsel_mask =3D vs_mask,                                  =
 \
> +               .of_map_mode =3D mt6363_map_mode,                        =
 \
> +       },                                                              \
> +       .lp_mode_reg =3D lp_reg,                                         =
 \
> +       .lp_mode_mask =3D BIT(lp_bit),                                   =
 \
> +       .hw_lp_mode_reg =3D MT6363_LDO_##vreg##_HW_LP_MODE,              =
 \
> +       .hw_lp_mode_mask =3D 0x4,                                        =
 \
> +}

Some of the LDOs have an extra "calibration" setting that can tweak
the output in 0.01V intervals. Could we support that. At least for
VRF12, VRF13, VRF18, the default is an extra 0.04V. It would be
misleading for the DT to specify 1.8V while the regulator is actually
outputting 1.84V.

You could look at the MT6358 driver to see how I implemented it.

[...]

> +static irqreturn_t mt6363_oc_isr(int irq, void *data)
> +{
> +       struct regulator_dev *rdev =3D (struct regulator_dev *)data;
> +       struct mt6363_regulator_info *info =3D rdev_get_drvdata(rdev);
> +
> +       disable_irq_nosync(info->irq);
> +
> +       if (regulator_is_enabled_regmap(rdev))
> +               regulator_notifier_call_chain(rdev, REGULATOR_EVENT_OVER_=
CURRENT, NULL);
> +
> +       schedule_delayed_work(&info->oc_work, msecs_to_jiffies(OC_IRQ_ENA=
BLE_DELAY_MS));

Is this needed for debouncing?

> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int mt6363_set_ocp(struct regulator_dev *rdev, int lim, int sever=
ity, bool enable)
> +{
> +       struct mt6363_regulator_info *info =3D rdev_get_drvdata(rdev);
> +
> +       /* MT6363 supports only enabling protection and does not support =
limits */
> +       if (lim || severity !=3D REGULATOR_SEVERITY_PROT || !enable)
> +               return -EINVAL;
> +
> +       /* If there is no OCP interrupt, there's nothing to set */
> +       if (info->irq <=3D 0)
> +               return -EINVAL;

-EOPNOTSUPP instead? One gives an error while the other gives a warning.

> +
> +       return devm_request_threaded_irq(&rdev->dev, info->irq, NULL,
> +                                        mt6363_oc_isr, IRQF_ONESHOT,
> +                                        info->desc.name, rdev);
> +}
> +

[...]

> +/* The array is indexed by id(MT6363_ID_XXX) */
> +static struct mt6363_regulator_info mt6363_regulators[] =3D {
> +       MT6363_BUCK("buck-vs2", VS2, 0, 1600000, 12500,
> +                   MT6363_RG_BUCK0_EN_ADDR,
> +                   MT6363_RG_BUCK_VS2_EN_BIT,
> +                   MT6363_RG_BUCK_VS2_VOSEL_ADDR,
> +                   MT6363_RG_BUCK_VS2_VOSEL_MASK,
> +                   MT6363_RG_BUCK0_LP_ADDR,
> +                   MT6363_RG_BUCK_VS2_LP_BIT,
> +                   MT6363_RG_BUCK0_FCCM_ADDR,
> +                   MT6363_RG_VS2_FCCM_BIT),

All this doesn't need to be spelled out. Perhaps you could use some
preprocessor magic to assemble all the register names so that the
entry could be simplified to just

        MT6363_BUCK("buck-vs2", VS2, 0, 1600000, 12500,
MT6363_RG_BUCK0_FCCM_ADDR),

[...]

> +       MT6363_SSHUB("buck-sshub1", VBUCK1_SSHUB, 0, 1193750, 6250,
> +                    MT6363_RG_BUCK_VBUCK1_SSHUB_EN_ADDR,
> +                    MT6363_RG_BUCK_VBUCK1_SSHUB_VOSEL_ADDR,
> +                    MT6363_RG_BUCK_VBUCK1_SSHUB_VOSEL_MASK),
> +       MT6363_SSHUB("buck-sshub2", VBUCK2_SSHUB, 0, 1193750, 6250,
> +                    MT6363_RG_BUCK_VBUCK2_SSHUB_EN_ADDR,
> +                    MT6363_RG_BUCK_VBUCK2_SSHUB_VOSEL_ADDR,
> +                    MT6363_RG_BUCK_VBUCK2_SSHUB_VOSEL_MASK),
> +       MT6363_SSHUB("buck-sshub4", VBUCK4_SSHUB, 0, 1193750, 6250,
> +                    MT6363_RG_BUCK_VBUCK4_SSHUB_EN_ADDR,
> +                    MT6363_RG_BUCK_VBUCK4_SSHUB_VOSEL_ADDR,
> +                    MT6363_RG_BUCK_VBUCK4_SSHUB_VOSEL_MASK),

As mentioned in my reply to the binding patch, these aren't real regulators=
.

> +       MT6363_LDO_L_SC("ldo-vsram-digrf", VSRAM_DIGRF, 400000, 1193750, =
6250,
> +                       MT6363_RG_BUCK1_EN_ADDR,
> +                       MT6363_RG_LDO_VSRAM_DIGRF_EN_BIT,
> +                       MT6363_RG_LDO_VSRAM_DIGRF_VOSEL_ADDR,
> +                       MT6363_RG_LDO_VSRAM_DIGRF_VOSEL_MASK,
> +                       MT6363_RG_BUCK1_LP_ADDR,
> +                       MT6363_RG_LDO_VSRAM_DIGRF_LP_BIT),

Same here, these could be compressed smaller with some preprocessor magic.

[...]

ChenYu

