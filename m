Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D466ACD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOU9/tYof1dSscl0YyYa/NT/mvDEHEr7Uam/zQROsdk=; b=cAaJk2ZtrXjfJkKBxTyniepfXO
	RSbY/jT/L98gZnC7ILW0F89UxcEkOzsymTkzXhvJgPWWVSzXM88I31SoqWO1TkwuV59xZS4xF2wVP
	5fgjgHtuAcIL+aYJGq4jesBMVNCHjKsf5tm/55C8MtQtGe1JnVnHicA2LbyCt/T48rNNksRG3F6gP
	ho9mcG1ysndTLQzGKABTV4bsBepIroEv/E8uitsetLJsQFLq5uPdpkwta0DtNpH/0H5/PspgdcIiH
	ALhO9IrFBjdSQpcEIg51NDlHEDDMR6zvH5lNOgMkEAsFW93aBSNksYiua0y6K//61WyBX40J/ym0O
	/wcK2yug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPF7t-00000000Y5s-3jRI;
	Tue, 19 May 2026 07:44:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPF7r-00000000Y4k-0rOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:44:28 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowADXQ2_QFAxqX3u+EA--.2222S2;
	Tue, 19 May 2026 15:44:17 +0800 (CST)
Message-ID: <4d3c239ff1c560791668e571c5e6ab58c08ea002.camel@iscas.ac.cn>
Subject: Re: [PATCH v2 4/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite
 display controller support
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 19 May 2026 15:44:16 +0800
In-Reply-To: <20260519055114.1886525-5-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
	 <20260519055114.1886525-5-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXQ2_QFAxqX3u+EA--.2222S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr15KrWkGFWxuw45WFyrCrg_yoW3tw4xpF
	Wvyay8ur4rAa4I9r9rJFy0yF98Cw1xt3yfW3y7W3s093s0yFyUWFW0kFy8XFWDXr97AryI
	qrsY9w47CrW7AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqVcEUUUUU
X-Originating-IP: [112.94.102.150]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_004427_618123_5004880C 
X-CRM114-Status: GOOD (  23.75  )
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

=E5=9C=A8 2026-05-19=E4=BA=8C=E7=9A=84 13:51 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> The Nuvoton MA35D1 SoC integrates a Verisilicon DCU Lite display
> controller.=C2=A0 While its register layout is broadly similar to the
> DC8200,
> several differences require dedicated hardware ops:
>=20
> 1. No CONFIG_EX commit path: framebuffer updates use enable (bit 0)
> and
> =C2=A0=C2=A0 reset (bit 4) bits in FB_CONFIG instead of the DC8200 stagin=
g
> registers
> =C2=A0=C2=A0 (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG=
,
> =C2=A0=C2=A0 PANEL_CONFIG_EX).
>=20
> 2. No PANEL_START register: panel output starts when
> =C2=A0=C2=A0 PANEL_CONFIG.RUNNING is set; no multi-display sync start reg=
ister
> =C2=A0=C2=A0 is used.
>=20
> 3. Different IRQ registers: DCU Lite uses DISP_IRQ_STA (0x147C) /
> =C2=A0=C2=A0 DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
> =C2=A0=C2=A0 TOP_IRQ_EN (0x0014).
>=20
> 4. Per-frame commit cycle: DCU Lite requires the VALID bit in
> FB_CONFIG
> =C2=A0=C2=A0 to be set at the start of each atomic commit (crtc_begin) an=
d
> cleared
> =C2=A0=C2=A0 after (crtc_flush).
>=20
> 5. Simpler clock topology: only "core" (bus gate) and "pix0" (pixel
> =C2=A0=C2=A0 divider) clocks; no axi or ahb clocks.=C2=A0 Make axi_clk an=
d ahb_clk
> =C2=A0=C2=A0 optional (devm_clk_get_optional_enabled) so DCU Lite nodes w=
ithout
> =C2=A0=C2=A0 those clocks are handled gracefully.
>=20
> Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
> differences.=C2=A0 After chip identity detection, vs_dc_probe() now
> selects
> vs_dcu_lite_funcs when the identified model is VSDC_MODEL_DCU_LITE
> (model register reads 0, revision 0x5560, customer_id 0x305).
>=20
> Extend Kconfig to allow building on ARCH_MA35 platforms.
>=20
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/verisilicon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 9 ++-
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78
> +++++++++++++++++++++++
> =C2=A05 files changed, 87 insertions(+), 5 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>=20
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
> b/drivers/gpu/drm/verisilicon/Kconfig
> index 7cce86ec8603..295d246eb4b4 100644
> --- a/drivers/gpu/drm/verisilicon/Kconfig
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -2,7 +2,7 @@
> =C2=A0config DRM_VERISILICON_DC
> =C2=A0	tristate "DRM Support for Verisilicon DC-series display
> controllers"
> =C2=A0	depends on DRM && COMMON_CLK
> -	depends on RISCV || COMPILE_TEST
> +	depends on RISCV || ARCH_MA35 || COMPILE_TEST
> =C2=A0	select DRM_BRIDGE_CONNECTOR
> =C2=A0	select DRM_CLIENT_SELECTION
> =C2=A0	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/verisilicon/Makefile
> b/drivers/gpu/drm/verisilicon/Makefile
> index f4fbd9f7d6a2..bf88f627e65c 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -1,5 +1,5 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0
> -verisilicon-dc-objs :=3D vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
> vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
> +verisilicon-dc-objs :=3D vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
> vs_dcu_lite.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
> =C2=A0
> =C2=A0obj-$(CONFIG_DRM_VERISILICON_DC) +=3D verisilicon-dc.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
> b/drivers/gpu/drm/verisilicon/vs_dc.c
> index c94957024189..77bc63c629f7 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
> *pdev)
> =C2=A0		return PTR_ERR(dc->core_clk);
> =C2=A0	}
> =C2=A0
> -	dc->axi_clk =3D devm_clk_get_enabled(dev, "axi");
> +	dc->axi_clk =3D devm_clk_get_optional_enabled(dev, "axi");
> =C2=A0	if (IS_ERR(dc->axi_clk)) {
> =C2=A0		dev_err(dev, "can't get axi clock\n");
> =C2=A0		return PTR_ERR(dc->axi_clk);
> =C2=A0	}
> =C2=A0
> -	dc->ahb_clk =3D devm_clk_get_enabled(dev, "ahb");
> +	dc->ahb_clk =3D devm_clk_get_optional_enabled(dev, "ahb");
> =C2=A0	if (IS_ERR(dc->ahb_clk)) {
> =C2=A0		dev_err(dev, "can't get ahb clock\n");
> =C2=A0		return PTR_ERR(dc->ahb_clk);
> @@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device
> *pdev)
> =C2=A0	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
> >identity.model,
> =C2=A0		 dc->identity.revision, dc->identity.customer_id);
> =C2=A0
> -	dc->funcs =3D &vs_dc8200_funcs;
> +	if (dc->identity.model =3D=3D VSDC_MODEL_DC8200)

Don't do that. The model value is only for matching hardware values,
not for detecting what's present. Don't forget that DC8000 has a model
value of 0x8000, but behaves similarly with DCUltraLite with a model
value of 0x0.

I suggest adding another field for assigning helper functions.

My suggestion is here:

```
enum vs_dc_generation {
	VSDC_GEN_DC8000,
	VSDC_GEN_DC8200
};
```

Thanks,
Icenowy

> +		dc->funcs =3D &vs_dc8200_funcs;
> +	else
> +		dc->funcs =3D &vs_dcu_lite_funcs;
> =C2=A0
> =C2=A0	if (port_count > dc->identity.display_count) {
> =C2=A0		dev_err(dev, "too many downstream ports than HW
> capability\n");
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
> b/drivers/gpu/drm/verisilicon/vs_dc.h
> index 45172c1a525c..d77d4a1babdf 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
> @@ -66,5 +66,6 @@ struct vs_dc {
> =C2=A0};
> =C2=A0
> =C2=A0extern const struct vs_dc_funcs vs_dc8200_funcs;
> +extern const struct vs_dc_funcs vs_dcu_lite_funcs;
> =C2=A0
> =C2=A0#endif /* _VS_DC_H_ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
> b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
> new file mode 100644
> index 000000000000..11ef57d5ebaa
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
> + */
> +
> +#include <linux/regmap.h>
> +
> +#include "vs_crtc_regs.h"
> +#include "vs_dc.h"
> +#include "vs_primary_plane_regs.h"
> +
> +static void vs_dcu_lite_bridge_enable(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_RESET);
> +}
> +
> +static void vs_dcu_lite_bridge_disable(struct vs_dc *dc, unsigned
> int output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			=C2=A0 VSDC_FB_CONFIG_RESET);
> +}
> +
> +static void vs_dcu_lite_crtc_begin(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_VALID);
> +}
> +
> +static void vs_dcu_lite_crtc_flush(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			=C2=A0 VSDC_FB_CONFIG_VALID);
> +}
> +
> +static void vs_dcu_lite_crtc_enable(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_ENABLE);
> +}
> +
> +static void vs_dcu_lite_crtc_disable(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			=C2=A0 VSDC_FB_CONFIG_ENABLE);
> +}
> +
> +static void vs_dcu_lite_enable_vblank(struct vs_dc *dc, unsigned int
> output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
> +			VSDC_DISP_IRQ_VSYNC(output));
> +}
> +
> +static void vs_dcu_lite_disable_vblank(struct vs_dc *dc, unsigned
> int output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
> +			=C2=A0 VSDC_DISP_IRQ_VSYNC(output));
> +}
> +
> +static u32 vs_dcu_lite_irq_handler(struct vs_dc *dc)
> +{
> +	u32 irqs;
> +
> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
> +	return irqs;
> +}
> +
> +const struct vs_dc_funcs vs_dcu_lite_funcs =3D {
> +	.bridge_enable		=3D vs_dcu_lite_bridge_enable,
> +	.bridge_disable		=3D
> vs_dcu_lite_bridge_disable,
> +	.crtc_begin		=3D vs_dcu_lite_crtc_begin,
> +	.crtc_flush		=3D vs_dcu_lite_crtc_flush,
> +	.crtc_enable		=3D vs_dcu_lite_crtc_enable,
> +	.crtc_disable		=3D vs_dcu_lite_crtc_disable,
> +	.enable_vblank		=3D vs_dcu_lite_enable_vblank,
> +	.disable_vblank		=3D
> vs_dcu_lite_disable_vblank,
> +	.irq_handler		=3D vs_dcu_lite_irq_handler,
> +};


