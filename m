Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129B1C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2rI3b8Hia0vW/fa4o3rfnpG+Pj+Dz6m9hUtKiuIVMA=; b=Z7Awl1DJHc1ztFobLIDpYd8EDn
	U52ELwax0PQFWlmB+Um0aaa3y6CHE0Pl8V+KUZMIxTz4zJx3xlwBgsC6c1hFZsUMoJA96mdloTAlQ
	KpLmPPpf/qP7IF6jIbCU3ptKTP2PeL3RUNjVnCoXWORbt7N1ehFwDAS3ilY/AQm8nezqAhS5taiI/
	rJH+WJo4tj3AHnsMg6dyv34ewBHLssaSwvChe+FPwUv9Z3TG0jrPi+m90NJrp6/2JBonl/CKVdedB
	I7idcv63/DJHrtBXk8e2jx7uxboiq833kuZT8mMM/JHpccsQB0yjzLLH9peVilhdl0glqV/BWxaSJ
	2VY0QCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwSvo-00000008kOO-0WOy;
	Tue, 18 Aug 2026 23:09:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwSvn-00000008kOF-14jb;
	Tue, 18 Aug 2026 23:09:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45754601DE;
	Tue, 18 Aug 2026 23:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08901F000E9;
	Tue, 18 Aug 2026 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787094558;
	bh=B2rI3b8Hia0vW/fa4o3rfnpG+Pj+Dz6m9hUtKiuIVMA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=j/Z+JW4eF5i8XfXi6M+/mKNpwaMAMODOHQT8SFusgY5fdkEatnADBM7Qas860H2yH
	 upzwxOdrb/zsix7A6tyuhp/j6nCW6wDoeUmHOP8oluGm4lOAlZzkcVMnp6Prk71NW8
	 GY+Bl1B52OJ5nqyhickvKFJ+U7nWCtAOxdfkNVq0XFg+w01h4ip5N9YO9PUgDRVDyY
	 JOBWRGyPSyju2XrHbP2YN7AltitifSQtE9s/aTr9mRkuUU64swBlmdOy8TdmootFl4
	 qMe/tgRLjkJOIca2Juc8bYDy66XYKvJojMopIc0skNKkA8iL7oL5/sO98GgWNAWl36
	 2Kko/la8nfTQQ==
Date: Tue, 18 Aug 2026 18:09:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, tomeu@tomeuvizoso.net, 
 p.zabel@pengutronix.de, ulfh@kernel.org, will@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 conor+dt@kernel.org, chaoyi.chen@rock-chips.com, 
 dri-devel@lists.freedesktop.org, zhangqing@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, joro@8bytes.org, 
 devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, krzk+dt@kernel.org, alchark@flipper.net, 
 ogabbay@kernel.org, royalnet026@gmail.com, diederik@cknow-tech.com, 
 robin.murphy@arm.com, heiko@sntech.de
To: Jiaxing Hu <gahing@gahingwoo.com>
In-Reply-To: <20260817113603.1436067-5-gahing@gahingwoo.com>
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
 <20260817113603.1436067-5-gahing@gahingwoo.com>
Message-Id: <178709455518.1014304.1443906758035976924.robh@kernel.org>
Subject: Re: [PATCH v8 04/12] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
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


On Mon, 17 Aug 2026 23:35:55 +1200, Jiaxing Hu wrote:
> The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
> already describes, but it wires them up differently: two extra CBUF
> clocks, two power domains per core, and a single reset instead of two.
> It also has no NPU SRAM supply.
> 
> Widen the property ranges to cover both, then pin each SoC back to its
> own shape in allOf so nothing loosens for RK3588, and keep sram-supply
> required for rockchip,rk3588-rknn-core only.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml: Unresolvable reference: /schemas/input/qcom,spmi-haptics.yaml#

doc reference errors (make refcheckdocs):
Documentation/translations/pt_BR/process/security-bugs.rst: :doc:`regular path submission </../../../process/submitting-patches>`
Documentation/translations/zh_CN/how-to.rst: Documentation/translations/zh_CN/xxx.rst
arch/arm/xen/enlighten.c: Documentation/devicetree/bindings/arm/xen.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260817113603.1436067-5-gahing@gahingwoo.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


