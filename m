Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6425C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGl+cRUMLXVnvKIf/rnmqDvo3VKvU0ua/6Eh096d23s=; b=Lay+NJ9IWAUnB9UlrcFVp9/iFV
	Lfs2tUKgAJWU78qHbkel1SdWdlyo9FhF9j83hSdMgTyc0gghzVjqt62v1SbXj7eHNf/TvxaVx3pKe
	3DSujucasup4WvKULzHv+MVF6llGmKZEbMv/85R7hqrYjdrHMBFGBllREoLkMxCATAaAQP2eREQTS
	akv0U17sUIgdhglgZTNFQb4UwyT5dwQcwRgXrlHZkgaWNgjAgBq2ZzWD/iFaMIvA6tujScSuQfsQR
	xEX/BSeO5eoi/PrEjltULhO7YHRMjx8c8oK8JeSDjudMcwS4d6pxa8fnOVGSeRbF742owWKFAcPF4
	4a1KEIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8nM-00000001fF9-1lvZ;
	Thu, 20 Feb 2025 15:49:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8kP-00000001eGe-1wHw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:45:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tl8kB-0003Py-2B; Thu, 20 Feb 2025 16:45:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tl8kA-001xUj-2g;
	Thu, 20 Feb 2025 16:45:42 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tl8kA-000Cm6-2O;
	Thu, 20 Feb 2025 16:45:42 +0100
Message-ID: <f69d6076f5b41bcf56ddbf24a72a600fa51466dc.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org, 
	shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Date: Thu, 20 Feb 2025 16:45:42 +0100
In-Reply-To: <20250219192102.423850-3-daniel.baluta@nxp.com>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
	 <20250219192102.423850-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_074557_498432_168BC68E 
X-CRM114-Status: GOOD (  19.61  )
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

On Mi, 2025-02-19 at 21:20 +0200, Daniel Baluta wrote:
> On i.MX8MP we introduced support for using a reset controller
> to control DSP operation.
>=20
> This patch adds reset property which is required for i.MX8MP.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documen=
tation/devicetree/bindings/dsp/fsl,dsp.yaml
> index ab93ffd3d2e5..923e7f079f1b 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -82,6 +82,13 @@ properties:
>      description:
>        Phandle to syscon block which provide access for processor enablem=
ent
> =20
> +  resets:
> +    description:
> +      A pair consisting of phandle to audio-blk-control and an index ref=
erencing
> +      the DSP Run/Stall bit in audiomix registers.
> +      See include/dt-bindings/reset/imx8mp-reset-audiomix.h for each ind=
ex meaning.
> +    maxItems: 1

This is going to be confusing when there is an actual (undocumented?)
DSP core reset that is not described in the device tree bindings, see
patch 8.

To me this looks like a bit of a gray zone, as I don't know how the
hardware actually works, but if you wouldn't call the Run/Stall bit a
reset, it probably shouldn't be described as such in the device tree
bindings.

I'm not sure. Should both core and runstall reset be described in the
device tree? Or only the core reset, or neither? Either way we should
try not to lie about the hardware here.

regards
Philipp

