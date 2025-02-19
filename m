Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B549C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8pbDKzjWiuwuWhsZo8DGoQt4Dsj7wm3Wu7+TWe9hRE=; b=p9+I2AOn7yIh+Kf9JAVcCOdPMk
	bcl1HRHiq4ZIZTnHA4gd+5AqHYSBOdVZ1OR3Hn/Uk+RIsRVSnY22Z0DDcFAvPAeY6icfJkfV9j7T/
	I9Ggqzvu20GLYr3l2chcNqcx1O+Kb0NbaXnqcH5+LU8/f7VVY+sTHLOYhyUqeV2mQcI+C2qw8U05Q
	D1e9ki13c2YvcT3Tjcml291f8HbirV7qkkQt5ce9WYmrjJt61LUM8NGdi/rfjjUcY7hvQGvEFQpZb
	4RzdGo9CXB9i5mxsbqo5qDUle+dczppycJshYDWdRKK+ezgiMxoYfDuz35RAZUwBjTEJr4+Fs3Q+G
	65vKKuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjhs-0000000CpeE-2RjS;
	Wed, 19 Feb 2025 13:01:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjdw-0000000CoEj-0owO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:57:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tkjdd-0006Hn-38; Wed, 19 Feb 2025 13:57:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tkjdc-001lmY-0U;
	Wed, 19 Feb 2025 13:57:16 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tkjdc-006G9p-02;
	Wed, 19 Feb 2025 13:57:16 +0100
Date: Wed, 19 Feb 2025 13:57:15 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: thermal: fsl,imx91-tmu: add bindings
 for NXP i.MX91 thermal module
Message-ID: <20250219125715.octrfw47q2rxy7ai@pengutronix.de>
References: <20250218-imx91tmu-v5-0-76c0b27673e6@nxp.com>
 <20250218-imx91tmu-v5-1-76c0b27673e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-imx91tmu-v5-1-76c0b27673e6@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_045736_230982_55F1A19D 
X-CRM114-Status: GOOD (  17.03  )
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

On 25-02-18, Frank Li wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Add bindings documentation for i.MX91 thermal modules.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v3 to v4
> - add interrupts propperty
> 
> Change from v2 to v3
> - add ref thermal-sensor
> - restrict #thermal-sensor-cells to 0 only
> - Change to unevaluatedProperties
> ---
>  .../devicetree/bindings/thermal/fsl,imx91-tmu.yaml | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/fsl,imx91-tmu.yaml b/Documentation/devicetree/bindings/thermal/fsl,imx91-tmu.yaml
> new file mode 100644
> index 0000000000000..2dafec8b37024
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/fsl,imx91-tmu.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/fsl,imx91-tmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX91 Thermal
> +
> +maintainers:
> +  - Pengfei Li <pengfei.li_1@nxp.com>
> +
> +description:
> +  i.MX91 features a new temperature sensor. It includes programmable
> +  temperature threshold comparators for both normal and privileged
> +  accesses and allows a programmable measurement frequency for the
> +  Periodic One-Shot Measurement mode. Additionally, it provides
> +  status registers for indicating the end of measurement and threshold
> +  violation events.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: fsl,imx91-tmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Comparator 1 irq
> +      - description: Comparator 2 irq
> +      - description: Data ready irq

missing "interrupt-names" property.

Regards,
  Marco

