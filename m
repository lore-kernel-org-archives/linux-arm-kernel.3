Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605BCFE521D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ypa/cqrytyM+1H9RpSsOupIi5q1jAKowsKKWvyqdp7Y=; b=mXEFhsTQUg3IAcCXwiELX+peZy
	8QAEZLdhZsVD0+Gvj4TibkIvanrIeVtuSjP8AQwxQP9lK3IfraHFup+qcpSXxy7ohf2ALMCcxCUgo
	Xee9jMqFEpjyJJkQWVwQh0iKyYf5pgFkSUscBppRz239YJFRdqnKTH2GYLjaUBsbZ4x5YKKEPWhiP
	EYDEYhIb3nYleVF08IrEjc/ZiNOWKu5aEd2Yv/k6kVuwjRCqdRluDeAaicEGWn5+juQHNuDWCDCr2
	wu0pMGnAz19hcdwG79bu0CwPL98vd5fW+9736LhGIlxABZ8KRqV3OeSOzOzGinTzd1QvcGoV3ZRXx
	AT3XRk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFhP-0000000DBQt-1HL6;
	Fri, 24 Apr 2026 12:31:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFhN-0000000DBQj-1if7;
	Fri, 24 Apr 2026 12:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E17D6012A;
	Fri, 24 Apr 2026 12:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D19C2BCB7;
	Fri, 24 Apr 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777033916;
	bh=GK9+WQJM6GBNOao/w4LCrjLyab9AiYr/M0fE61fgAJM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Vdcj+rsSglufIK1l5d/RKfQmIk9HLv2UFu/VkLvzs2kJBUkM35zJAhIqTVx+Cb4UL
	 J3jsgCrSAVzi02XOP6INESfEUdH2gsb6zD6s6n9Pqba7Cudhr+hTrQECmlGohg+V7i
	 jFWlo8aRFzutXiKjLwyHxsp1CY/v2iUnhjsEbK8izKZT8rR1LUfsYR9vLLDNgxXStV
	 mQku5XO+NGJkc/nKtrVvKe3Nxhxqc/7h7csVYIO0pb1JW90Qr0zQ1m0qpV4miUTqcf
	 4OtPj8ssr7JYLD6O2uuvAkL5AqDBgWM6SFIkDeH8BNa7sbt72cWU/NFzOKANErELoW
	 HaCKwbLGg6vlQ==
Date: Fri, 24 Apr 2026 07:31:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, 
 imx@lists.linux.dev, linux@ew.tq-group.com, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Robert Foss <rfoss@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Ying Liu <victor.liu@nxp.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20260424-dcss-hdmi-upstreaming-v22-3-30a28f89298d@oss.nxp.com>
References: <20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d@oss.nxp.com>
 <20260424-dcss-hdmi-upstreaming-v22-3-30a28f89298d@oss.nxp.com>
Message-Id: <177703391401.3671402.9330071570952735700.robh@kernel.org>
Subject: Re: [PATCH v22 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
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


On Fri, 24 Apr 2026 11:07:16 +0000, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp8501.yaml     | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml: Unresolvable reference: /schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.example.dtb: display-bridge@32c00000 (fsl,imx8mq-mhdp8501): phy: False schema does not allow {'compatible': ['fsl,imx8mq-hdptx-phy'], '#phy-cells': 0, 'clocks': [[4294967295], [4294967295, 248]], 'clock-names': ['ref', 'apb'], 'phandle': 2}
	from schema $id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml
Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.example.dtb: /example-0/display-bridge@32c00000/phy: failed to match any schema with compatible: ['fsl,imx8mq-hdptx-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424-dcss-hdmi-upstreaming-v22-3-30a28f89298d@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


