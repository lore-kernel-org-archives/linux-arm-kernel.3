Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B09AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4AYvDANgDE1JAdg5wQMc/oUv0DLkwPesM8rM5IH3G0=; b=jN57/mxsKriZcbfWzmqQ/R1KFR
	MwT7NvXEECrbfZjbl83PDTVXzoHUpZB4hgLLeX4skuALAEeejOJypJUe2rdET4tCCbEq4LZ1bVfTY
	5dop7ijqENLb0OPaeZixPE1snOAW6cNXA+8/SZZq7Jftd5tpgBiSqGBGQOaY20CjZqEPo+f0OR6No
	ZH9+Ooh7zX6f0IQGqNXDFuEMozuDDaMJVAMmDcoG11b96hjcCR/Wobxxdm4oK9PC9hgc0MQqSi+cY
	8PlOP2hv91YWHkstp1WxEXShKtCh41HH7tdqC+rYIo4P6m+dCO4Nf4aoqxSmP2e7epo5y8bZRXTmH
	QSceAYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IrA-00000001vv5-07n6;
	Mon, 14 Apr 2025 12:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4If7-00000001twa-0Ygy;
	Mon, 14 Apr 2025 12:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0E696114C;
	Mon, 14 Apr 2025 12:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAB0C4CEE2;
	Mon, 14 Apr 2025 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744632700;
	bh=0M3qRoyPJwBJF72GEzdV/WEuh/2ElnDu876t8GQlNEM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cgNn8jNtfy2oO8wAUQLMgWIpNQLRz1lZOb382FKfW3unhP3t8UUssZqahm/xiXKwf
	 jvyQf+qft3aRwiGecrB/XqIfK0O+SX/mAb2RmLslRAOXgFB/6nqsW6+I+FjIM03Gwo
	 /EFjaFhaZ32i62Fb4I8xdkb4+WN0Ifx2KFb7g+PXGqXc6huLQYxmxvU2OHcQFVqmuT
	 62u5U6JnCQlCCrDSJGWczsNcPf2HgdRgFVd+aKt1hzI8Dr37fap4hTJdAbVdUn9X60
	 S8CHLCpQ7lRxl+D9uudlcFW/YRXFu3QtbtHGqECqssGHGGzqjFqtd/fQnoJK7Ig8MZ
	 i9XZOUlB/TygQ==
Date: Mon, 14 Apr 2025 07:11:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
Message-Id: <174463269823.14040.7362554560667126238.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: amlogic: C3 supports
 clk-measure
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


On Mon, 14 Apr 2025 18:12:29 +0800, Chuan Liu wrote:
> C3 adds support for clk-measure.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250414-clk-measure-v2-2-65077690053a@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


