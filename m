Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2EFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGYvPm9EHDvM5n3fqTyYcFJ3LWlrFBgOIhuNZO+Di+4=; b=YpTwif0xrUu7+DlVz14YARbON7
	TQq9p6FOBnlXO+BH7c5B5PAhdfc/E7WcBAHWLs9S6QCz/MvPsSS+QKgRi118AeRwZey0UQcu9Ho5D
	OS84NXDl/Ag64aa9KBx7B36/r1uJPdXvKSWyy+2TbK3qzD2+Lvo7F2j0hKibtBHn1jttabIc/mErj
	mTmS8skeG2yfBb1BNRPCs/twQTxvFktS5vSWtTfd2P9oXLVKWKgCyWpb1ZL5iR5ISXHWBYnQvgAUC
	RtwUruunlLdnsOP36Gj17ls6tlPAcf2i3VYUNY6z29gLcpk/aPbqZEj6uGF+6mi0mAGNkuQ5vaWnp
	f/trE9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwbg-00000002w6l-1CdM;
	Wed, 29 Apr 2026 04:33:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwbf-00000002w6Z-1Zuy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 721456015B;
	Wed, 29 Apr 2026 04:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04192C19425;
	Wed, 29 Apr 2026 04:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777437182;
	bh=zL4sgyuJMxIsM2E2dtPOAZjNBTFqu4lmyQnSOXu4cHU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P2PATKTGF+1qIQ2DmnHxv66NG8Lq++QfeuVie9RJG+XQby9F+tsEleIRWhaphKwE9
	 Rh6dG9WJjUsH6hILTBAYHUjPCCoQbJ3yiVQuoxU/VsPU8mBGzy5GLNKTsOcK5Zy36K
	 /YSLfqW/9LzQYmA/VOCtvfnJZmUkCR/xpKwolTo4bDQl4nwOfmFzWWVXXNwWV2X+gf
	 iRYcYBG/ojU9SA7BZMDgKQZjF/JTQ6nQVjJsCKfDH1/7+oL8LPs4LKQwJVo4PRJQmO
	 HvK+fo2NBY1ixC/Pv23AYHQHBwal1zRQYjuUsHCppLprXpGDVeVa0NPZp2IpgCBv2v
	 hG3UNwWjDX4eQ==
Date: Tue, 28 Apr 2026 23:33:00 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, peng.fan@nxp.com, mathieu.poirier@linaro.org, 
 mingkai.hu@nxp.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Zhiqiang.Hou@nxp.com, festevam@gmail.com, kernel@pengutronix.de, 
 Frank.Li@nxp.com, linux-arm-kernel@lists.infradead.org, 
 andersson@kernel.org, s.hauer@pengutronix.de
To: Jiafei Pan <Jiafei.Pan@nxp.com>
In-Reply-To: <20260429031047.30893-2-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
 <20260429031047.30893-2-Jiafei.Pan@nxp.com>
Message-Id: <177743718015.3571544.12237368801599782841.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: add imx-rproc-psci
 binding
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


On Wed, 29 Apr 2026 11:10:43 +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml: properties:fsl,cpus-bits: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dts:8.9-16: Warning (ranges_format): /reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from / (1)
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dts:5.21-14.7: Warning (avoid_default_addr_size): /reserved-memory: Relying on default #address-cells value
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dts:5.21-14.7: Warning (avoid_default_addr_size): /reserved-memory: Relying on default #size-cells value
Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: /: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.dtb: remoteproc-ca55-1 (fsl,imx-rproc-psci): fsl,cpus-bits: 2 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260429031047.30893-2-Jiafei.Pan@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


