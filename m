Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BF4CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 01:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plG5U0sBcjaeBHfSfODAnBwtdeMzG2EnpxK6FuRkTcs=; b=4EeQrKa7TxsH9Av/iSCJq0B2DU
	XyZNhP3TQLluWO5qWvL59mAWdzxvgNG1K/yMzoZm+vM7GEAWSwR7FajkA4gg2r7+t1siA+rVzVhz4
	Hjh7HFCeKwrc2qv2Kk9vaZgTD/zXq9CWja0u1evRpkXLQwztXXnfpxZ87vFYRCTaA+EclhiZAIQYX
	4G/DpStuLsfoJ63CQMkPk0/qaZxOqXvWOIi7sVWKHv2DFEt7eJNOZOWoa4bk3F16uAfVI3ZxidnzT
	l9waSAB/80UqN+1nYXbSMjX+d8sU9LNYciDr1GZEBFLUV9h1yee+YQYEaOj4aOp700l9B+OzOmUHY
	+atyFwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1acn-00000005Aar-2PQ2;
	Thu, 25 Sep 2025 01:18:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1acj-00000005AYO-23SX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 01:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85FE544D4A;
	Thu, 25 Sep 2025 01:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC3DC4CEE7;
	Thu, 25 Sep 2025 01:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758763095;
	bh=+Rq7hiUDbbMid1ZpoqEKumtl/xgLrffLe02IvsOC8CM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P5e0RFMBUDkFAF0bn9qLxqA8XVllUHPlgPJYT5cWvu/lTZEmC/wwC+3kWbFSDFO4l
	 vjMsUV0DylmtvJiM+uPTpLKGsF7my1iaI+o43VXf1tQYHyy1Y2HfOddcR2bLKRCfVL
	 ZiFPG51reUSpv9a561Rpx2MXnOVhAn6K8VW/HCBnAVtULdBqctRWSPhCH5hIGtoYgY
	 sDHgnyKr5MM1opo6E1zBeXMgLbtOIGPso0TQlWgh/ghOElLxSTpONWrK2dmFjprF+y
	 J1joLBxJ8OG1SE83hJMoAqsXQKxKskcnnQZFjiXgDMWW/nKIA8IYjeetF/m4LDCRlv
	 ISmSkDAQdi37Q==
Date: Wed, 24 Sep 2025 20:18:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, kristo@kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, upstream@lists.phytec.de, conor+dt@kernel.org, 
 aradhya.bhatia@linux.dev, vigneshr@ti.com, nm@ti.com, 
 linux-arm-kernel@lists.infradead.org
To: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250924143916.2023919-1-w.egorov@phytec.de>
References: <20250924143916.2023919-1-w.egorov@phytec.de>
Message-Id: <175876282860.3268733.8113461594217309147.robh@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62: Add support for AM625
 OLDI IO Control
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_181817_573090_A6DD1016 
X-CRM114-Status: GOOD (  14.46  )
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


On Wed, 24 Sep 2025 16:39:14 +0200, Wadim Egorov wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Add TI DSS OLDI-IO control registers for AM625 DSS. This is a region of
> 12 32bit registers found in the TI AM625 CTRL_MMR0 register space[0].
> They are used to control the characteristics of the OLDI DATA/CLK IO as
> needed by the DSS display controller node.
> 
> [0]: https://www.ti.com/lit/pdf/spruiv7
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.17-rc1-58-g7c1d13a14e61 (best guess, 1/2 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250924143916.2023919-1-w.egorov@phytec.de:

arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'#address-cells' is a required property
	'#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@1' is a required property
	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#






