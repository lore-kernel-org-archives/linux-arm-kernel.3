Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F15CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 03:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ofi7IOAlD2B9ISGtcfH1gxIUK1uiRhCrzNPhUEt77e0=; b=mpfPq//pnlHRWfCecfuuGp+Imp
	/7vYJZ9SxAo4CWsY435/aX8ZXFUJw3+O1bYNCx2cb73Ey10FNOmZHD1Lxza6qWqWO+5r7HKNmKN8I
	MzYSwbpCFsaKHMMLHVJ7usiFnXP0XKW7ZsWEQE4nT4tOjJcSEdrVzuMcNTyxLRUF8gCSBfCg8v5W3
	rU172K4zEeED8PCpoAchtZgt+Z5URci4XUKsJctxCQAaIJJhXoMU9jSaXDMazgjZ84zLu/0fSYpTu
	n/3PbyE47zfx1cySpW7TAllxuNoAR4eUSRjURar5LCruyD+b9Qji/FKCqYvkV9+Q1vU5z20bclGCu
	Wou5lJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOozC-0000000HVrO-0T8G;
	Fri, 28 Nov 2025 03:17:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOozA-0000000HVqx-2PYw;
	Fri, 28 Nov 2025 03:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8655D6013C;
	Fri, 28 Nov 2025 03:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DF0C4CEF8;
	Fri, 28 Nov 2025 03:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764299847;
	bh=ryPXwfuMaZzBXoYMo/9eVTKnHFtI3lVtoZXMBixOIc4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=R1Ec+14ZjpPF5TvGD5MwhTACaQKRf4CPFDQlWnS3iKcnA8nYJoHgtULZac5QL0R8e
	 ONuNr0QhVzGQQpBd9bAMc1HDkJTHGmkM+T4u3EYEry/bXjqhlfnzkJ148xc96GDTWS
	 9m44RRHE9/pa6qqT19+hA/3uKMQ2VlMa/O1lNQSYr2D7vVq8xL5+nhR0SPDO0iTntq
	 f/ldas7ZXnM+NMMiIVPZ0xtlmSLav22QSnLLOw/JE1y6uSSXurk3KHRR9Zrbm1mnqz
	 R9TMfNxqW8aiwae9iBkcsN7xtjhBhTn7smCfb7sO/wYSYR0TxnNyu3olV+kHpfMGwO
	 8NTnuNSIdcdtA==
Date: Thu, 27 Nov 2025 21:17:25 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Diederik de Haas <didi.debian@cknow.org>, Dragan Simic <dsimic@manjaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-phy@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-rockchip@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Peter Robinson <pbrobinson@gmail.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, 
 Frank Wang <frank.wang@rock-chips.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20251128020405.90-6-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-6-kernel@airkyi.com>
Message-Id: <176429984551.1030074.10716294618988682110.robh@kernel.org>
Subject: Re: [PATCH v11 05/11] dt-bindings: phy: rockchip:
 rk3399-typec-phy: Support mode-switch
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


On Fri, 28 Nov 2025 10:03:59 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> supports software-configurable pin mapping and DisplayPort lane
> assignment. These capabilities enable the PHY itself to handle both
> mode switching and orientation switching, based on the Type-C plug
> orientation and USB PD negotiation results.
> 
> While an external Type-C controller is still required to detect cable
> attachment and report USB PD events, the actual mode and orientation
> switching is performed internally by the PHY through software
> configuration. This allows the PHY to act as a Type-C multiplexer for
> both data role and DP altmode configuration.
> 
> To reflect this hardware design, this patch introduces a new
> "mode-switch" property for the dp-port node in the device tree bindings.
> This property indicates that the connected PHY is capable of handling
> Type-C mode switching itself.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> (no changes since v5)
> 
> Changes in v4:
> - Remove "|" in description.
> 
> Changes in v3:
> - Add more descriptions to clarify the role of the PHY in switching.
> 
> Changes in v2:
> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> 
>  .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251128020405.90-6-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


