Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C7C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8nQPHPZF9ibSe2QeM2g0Ll1JIPfuYfJWJiXYgzvRV0=; b=XbASUqzVAO92ilZGjjIhQpP+kZ
	JckwIlvNeJzzj04fm/59LvjcSsqa1On69dF6UM1Jpy3qM82dj1d9XNS70hkAqF14UBlfviYvyakIA
	WLrl3fWERJkLf6hdufGFWSPqlPBNncJvF1vEuDKHYwqb7B/CqEuQN9dyI0eSnBPaUHVyYv4RNK6tK
	ZTpbK8NohZYuLgCn0MJMn4V/tYZYNkXh5Gm1eEhjqg+19rfN2JmOISG0FA+ozhAJjQ/lPrQVFxF+g
	klcCZmprR2NFgebJsk/aUTrUS96dTMHCUqikc6LsM5gIdlsyGo7rHNx6skpnX53nDtTmZk+HYermL
	qvxR0ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOEH-0000000GhhT-0L9y;
	Wed, 08 Jul 2026 09:06:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOEF-0000000Ghgm-1tE8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:06:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BCBB4088E;
	Wed,  8 Jul 2026 09:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23811F00A3A;
	Wed,  8 Jul 2026 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501562;
	bh=X8nQPHPZF9ibSe2QeM2g0Ll1JIPfuYfJWJiXYgzvRV0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=g0gssUXp7OyJJqvrtvPi4K+Z9iWCxIGmlPRlBsE+BlGzJEKnSLO2YNOpGTb9E5UZt
	 6wEDiSxrXYjYpeFK+edzadnyt5XU07XyGOWBiayOatzAFKOjd7+hRrR0wyXOYXAqQJ
	 eHlJAsexKCot+mTBw46/eGNT0bE4GEYUAGIGmebt+bXXuCnJ/lT6lJFjiDL+TojMGi
	 qRg7nwhxaOeLPZALfaOKDw2hFvAVDM5H5jvLoNOnjdAub40crtxFoK820s5YmVpGMl
	 G6HriwohKaO+vW4Pa8Df8fc+/CvYPIg2vI7Fc/Iy/HnHFFD1VaHzZz5pWVwfG2QGIf
	 sITPE3MI8XTag==
Date: Wed, 08 Jul 2026 04:06:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, monstr@monstr.eu, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 kishore Manne <nava.kishore.manne@amd.com>, git@amd.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Michal Simek <michal.simek@amd.com>
In-Reply-To: <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
 <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
Message-Id: <178350156210.1961721.11862849242704458553.robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
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


On Wed, 08 Jul 2026 09:18:50 +0200, Michal Simek wrote:
> The ZynqMP clock controller binding shares only #clock-cells with the
> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
> Also remove "(Optional clock)" from clock description because it is visible
> from schema itself.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> Changes in v4:
> - Update regex from previous patch
> 
> Changes in v3:
> - Cover change in zynqmp-firmware.yaml
> - Move clock-cells to be the last in the example
> - Remove comment around (Optional clock) which is obvious from schema
>   itself
> 
> Changes in v2:
> - New patch in series
> - Split zynqmp-clk from versal-clk
> 
>  .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>  .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>  3 files changed, 76 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:0: 'pss_ref_clk' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:1: 'video_clk' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names: ['ref', 'pl_alt_ref'] is too short
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks: [[4294967295], [4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0: 'xlnx,zynqmp-clk' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


