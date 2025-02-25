Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BE9C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2UVl0PIBDWVJVakclXYLz5UTe/VrRWuCtYKlrl6994=; b=TLpRVGsPBdC5vpYVXOYGFsYjsj
	pjVEuRaz+TT6HaSEfHSdTgZb1DNVcxjKxgHDg7AfPLh2Q/Vd/YtSK7wGL1le/2aF/KWDeZZh5qEJY
	36wCcvOc1VhXGyNVPn6tB319SkJ4HdyDnPea6Ii84Bt6LBcT2ppa6ASlIvjAa8+RmmvQFQPA9LNDV
	HWhJrY63Jo5WAioRBZUhBNpgmMVmWqxADVw299FYtLx1wqx7SBDKoP0IYPRnUwIgB4C8Fd1+dejI3
	0KcD7j+/9mXo4F3MMxUE1hzxcUjggNN5ZvMazX4NJp0ezvhIGpju+ViPumGzwzN4SK9A/yQIIlWAr
	KvbfoJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxwy-00000000FdM-3Y6H;
	Tue, 25 Feb 2025 16:38:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmujH-0000000HJzq-2XHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:12:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmujE-0005WL-BO; Tue, 25 Feb 2025 14:12:04 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmujD-002mM0-2S;
	Tue, 25 Feb 2025 14:12:03 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmujD-0008y2-29;
	Tue, 25 Feb 2025 14:12:03 +0100
Message-ID: <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org,  shawnguo@kernel.org, mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-remoteproc@vger.kernel.org,
 andersson@kernel.org, Frank.Li@nxp.com,  peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Date: Tue, 25 Feb 2025 14:12:03 +0100
In-Reply-To: <20250225102005.408773-3-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
	 <20250225102005.408773-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_051207_645188_09B304C2 
X-CRM114-Status: GOOD (  19.67  )
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

On Di, 2025-02-25 at 12:19 +0200, Daniel Baluta wrote:
> Assert and deassert functionality of the DSP found on i.MX8MP is
> realized by combining control bits from two modules: Audio Block
> Control and Debug Access Port.
>=20
> Audio block control bits are used to for Run/Stall the DSP core
> while the DAP bits are used for software reset the core.
>=20
> The original plan was to use fsl,dsp-ctrl property and to refer the
> audiomix bits via syscon interface. This proposal received NACK from
> community we shouldn't abuse the syscon interface [1].
>=20
> So remove fsl,dsp-ctrl property for i.MX8MP and use reset control
> interface instead.
>=20
> [1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-=
6-daniel.baluta@nxp.com/
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml         | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documen=
tation/devicetree/bindings/dsp/fsl,dsp.yaml
> index ab93ffd3d2e5..b3550c9d12e7 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -82,6 +82,9 @@ properties:
>      description:
>        Phandle to syscon block which provide access for processor enablem=
ent
> =20
> +  resets:
> +    maxItems: 1

The DAP core reset is mentioned in the commit message. Why is it
missing here? After reading the discussion in [1], I'd expect both the
stall and the (core) reset signal to be documented, something like:

  resets:
    maxItems: 2

  reset-names:
    items:
      - const: core
      - const: stall

> +
>  required:
>    - compatible
>    - reg
> @@ -164,6 +167,16 @@ allOf:
>              - const: txdb1
>              - const: rxdb0
>              - const: rxdb1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mp-dsp
> +              - fsl,imx8mp-hifi4
> +    then:
> +      required:
> +        - resets
> =20
>  additionalProperties: false
> =20
> @@ -186,6 +199,7 @@ examples:
>      };
>    - |
>      #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
>      dsp_reserved: dsp@92400000 {
>        reg =3D <0x92400000 0x1000000>;
>        no-map;
> @@ -220,5 +234,5 @@ examples:
>                 <&mu2 3 0>;
>        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
>                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;

Is there nothing else in this range that will have to be controlled by
the DSP driver in the future, such as the IMPWIRE register or the
XOCDMODE[OCDHALTONRESET] bit?

regards
Philipp

