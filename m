Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB246CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rJ8yldAwa8Y+pEi2kVPXwBaw6JezOCiIdvnX6kFLC0=; b=xsLtAE2+xEnDLtmlY0Axyc9GuG
	+GnOn3cPJNKp4lnHnAugRyzlkjWkw/4PcH5bcQqs4RLPFCz1QryuOKKZdbLjbIsj4MWwZwaAwDfLL
	j0pQOMVKNlBhc0eZxe2ula6Zsy4M9yPF18oFUJcOB+iVeGfa/+iwdxlp08zpqlYM9VCazeeHm9Nt0
	em/yorcHalrCzpdgnenLId0gBR4I8tM3TWx8MNBQxbV4ULt6s4CdJbTtXVm/I+VR+GHuJCpRYIXUh
	JY3fJeD5/wL1jVbNICFmPdcoKrLvKtrxhrvWNw/ho9Q0x8WPCNEnWJDk0Fq1Edf1i3iiohakOZDP1
	jvoXEzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GpL-0000000D1gv-3QAd;
	Mon, 13 Oct 2025 11:34:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GpJ-0000000D1gF-2uMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 815C740713;
	Mon, 13 Oct 2025 11:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F80C4CEFE;
	Mon, 13 Oct 2025 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760355292;
	bh=qHo5Ociuz3ISYbBTktS8mV4hBaTdUD1TNltNhHxPHe8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EMUYgqQJBaG9oIHosv/b1lUaybryPArFGOXVa3RxUD2oBMMMGC6h7mCPW3TGu+e+5
	 9e9RCfdDUkgMqStiDigqgKp/n2/H0REgZWT0kblWrhVnMqv5gv5eKS4XQ+HsECSiNC
	 XjdMiRrsIDBevkWHEKHjrjEOQwjkaPjrmo2RfZiyeU4VQUuZOEnO8AYYOUaxSYNPcu
	 3bdrPemORMWeT9WzPKMCCC2RQcNeSKALOB1asoC2qDdwn9xM5jMegR5Woipdx+NeA9
	 /SGv+4b7iDIHPixpgn9q3i9wDiTi2Wz2wvF8m7176XLaS3itqELAthUS1p7z9T+lwQ
	 iTSo2LCa0mUgw==
Date: Mon, 13 Oct 2025 06:34:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
 Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Liu Ying <victor.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org
To: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-35-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-35-marek.vasut@mailbox.org>
Message-Id: <176035524848.2736280.3284568560507441062.robh@kernel.org>
Subject: Re: [PATCH 34/39] dt-bindings: display: bridge: ldb: Add an i.MX95
 entry
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_043453_771378_5C22E1B6 
X-CRM114-Status: GOOD (  10.96  )
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


On Sat, 11 Oct 2025 18:51:49 +0200, Marek Vasut wrote:
> i.MX95 has twice a single LVDS port and share a similar LDB_CTRL register
> layout with i.MX8MP and i.MX93. Unlike the other SoCs, i.MX95 does have a
> mapping bridge in front of this LDB PHY.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.example.dtb: ldb (fsl,imx95-ldb): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.example.dtb: ldb (fsl,imx95-ldb): clock-names:0: 'ldb' was expected
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.example.dtb: ldb (fsl,imx95-ldb): clock-names: ['pixel', 'bypass'] is too long
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.example.dtb: ldb (fsl,imx95-ldb): clocks: [[4294967295, 266, 2], [4294967295, 266, 4]] is too long
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.example.dtb: ldb (fsl,imx95-ldb): 'ports' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251011170213.128907-35-marek.vasut@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


