Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF1DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaO6hIhrxaXOTa4PENsNja24c92e4Z8+0p/puYqde5w=; b=V4bGCz9NHaTOVYWli05UuQDDPp
	EEf4IAbg82ixDqNMhBZHN23BW/A7rSDr1a3N4S4xi5WYdS5QASPjopAgmx3VqbYF67+PEBrga0rJg
	/xvRhXgbpFh2W7DhQYOYXfEPczNu0sYTozjnaaL2XR0X+BvRxenoRLxCA+T9XiwDuFqWFW4nA59yy
	kHfUv5tDDLU5bFOQ1A7YP9BoC33jf788sKuG/W9MGeoGgd2IJHDO2o9SLeCaChx0/QozyjQ4qMh/D
	aXBqBGVxxzNa2zf2a4TxinsFjVrRkbgJpyipCuDWlCpjfzu+ILgY22OjNZw/73MMrAtpieVOSSndO
	xGEk5uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxwz-00000000FdR-1Yuc;
	Tue, 25 Feb 2025 16:38:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmujz-0000000HK8r-3IuB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:12:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmujx-0005hF-Vy; Tue, 25 Feb 2025 14:12:50 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmujx-002mMH-2B;
	Tue, 25 Feb 2025 14:12:49 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmujx-000913-1t;
	Tue, 25 Feb 2025 14:12:49 +0100
Message-ID: <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: audiomix: Add reset ids for
 EARC and DSP
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org,  shawnguo@kernel.org, mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-remoteproc@vger.kernel.org,
 andersson@kernel.org, Frank.Li@nxp.com,  peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Date: Tue, 25 Feb 2025 14:12:49 +0100
In-Reply-To: <20250225102005.408773-2-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
	 <20250225102005.408773-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_051251_824015_6FE25BEA 
X-CRM114-Status: GOOD (  13.93  )
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
> Add reset ids used for EARC and DSP on i.MX8MP platform.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
>=20
> diff --git a/include/dt-bindings/reset/imx8mp-reset-audiomix.h b/include/=
dt-bindings/reset/imx8mp-reset-audiomix.h
> new file mode 100644
> index 000000000000..3349bf311764
> --- /dev/null
> +++ b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> +#define DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> +
> +#define IMX8MP_AUDIOMIX_EARC		0
> +#define IMX8MP_AUDIOMIX_EARC_PHY	1
> +#define IMX8MP_AUDIOMIX_DSP		2

How about calling these IMX8MP_AUDIOMIX_EARC_RESET,
IMX8MP_AUDIOMIX_EARC_PHY_RESET, and IMX8MP_AUDIOMIX_DSP_STALL instead?

regards
Philipp

