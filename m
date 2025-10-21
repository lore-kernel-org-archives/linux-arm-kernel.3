Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 04:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfitFkzk1I08ZajnZJfqnDjuQVfN4X2SlTjgTZuZi74=; b=jAypmBKLG5+WDKqVdwjQWZIhYs
	7/SUdgxbppw6f8l9+yiLzm66zme2/RM+SWLRpKMdSTuXKUNmc+saLeEVcfVkYjSzh7aReF1nB+ZsS
	f49raBopobhCXdyW1yAJzHJX0lfss25klct+9vafXGuhxU4gPm5jmR1Yrb6femDFTz6vzbUpiNQML
	h419dwTs3tafDUypd46nc85t+t794V7WT4taK5Q/k09K471vDqtAB1xBcTe2XoNSHpusX9QHwym5l
	IXSbv1aT2FoU0iZkB6SQ6Cdbq0d5OVSvzUVWvvA+QPRepRvgSK1nPX+AV23qbY/kaFsh0mY4U0SdJ
	3o+V/YhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4OB-0000000FoAk-42eg;
	Tue, 21 Oct 2025 04:54:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4O5-0000000Fo7o-2mQ5;
	Tue, 21 Oct 2025 04:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A666745189;
	Tue, 21 Oct 2025 04:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADE1C4CEF1;
	Tue, 21 Oct 2025 04:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761022457;
	bh=cp2MWKweKeqkkK10axCIthyBxdGN4x5OPDkgdyYEZkQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rSnNvN2slUpFH+oequP9kgu2WPs5mGq65AOmJHlVo3U18Q6cOi3maowa0XZ5I/pxU
	 ORdH/T9S3udm1pf9H0B8hEJemMOqWFjQr+QdFt9jzgAajfOLqnjdsUiXsaUV3Fr/np
	 dSd9p1MQsONbSZOLy+5PD5xguKEkgJnxMAIwTdy0rPvQV0SnH89MUu8d0ffTAi50Y3
	 vHWC3J3z/aDBHnxff1nHPg6XCre6DTopcBAJjMw2dYnhaL0b5sZE700cyokN7txUFI
	 zI8Tov648wXhkS52weipHrxpMFFaUtic9YG7LJFe33h7rlSfyxpDI06bcqy0jVoLnp
	 n8OkQr+FrM88Q==
Date: Mon, 20 Oct 2025 23:54:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sugar.zhang@rock-chips.com, sboyd@kernel.org, 
 linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, finley.xiao@rock-chips.com, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, heiko@sntech.de, 
 krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, 
 mturquette@baylibre.com
To: Elaine Zhang <zhangqing@rock-chips.com>
In-Reply-To: <20251021033834.1390006-7-zhangqing@rock-chips.com>
References: <20251021033834.1390006-1-zhangqing@rock-chips.com>
 <20251021033834.1390006-7-zhangqing@rock-chips.com>
Message-Id: <176102245398.2690195.14711542090978775144.robh@kernel.org>
Subject: Re: [PATCH v4 6/7] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_215421_745502_05047AFB 
X-CRM114-Status: GOOD (  11.34  )
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


On Tue, 21 Oct 2025 11:38:33 +0800, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  45 +++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 541 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251021033834.1390006-7-zhangqing@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


