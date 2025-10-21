Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EDCCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzVpn6mHd2hyJTkO6Qf88GditgsDHSX/icKpKu7Otnw=; b=q3azAOvrPSc+ciTFqL0vjCA9+0
	p6uJ7thKNjCxpUcC0CLKFBKUcLLq7ZYiko3EFAz9ouHPZhBL6WF5nXHGd+4jnDGtt33prdddNMdgw
	55qFHtWs7IZkOHXoJmX1zoX8cY3xadB2ct0O80NqNDJzvR2Xv9XySu+oyKMspgXpTeldGS5f1phe2
	4mDFviiTQBb1lOL/m0rcQTL/XDR2Rq+xMKawmNJq29VsVekRYOR+Gr+JYq8bfBrW7VmZO+KetK0yo
	ZMW6WTr5jtzzob1KfR4qfwrIzp8+NNzN4alaTX5NwQjUKryFgMLJUnGqYCHj2ejaLVkQ/xvPxIquy
	p8udYZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4O8-0000000Fo93-1iKf;
	Tue, 21 Oct 2025 04:54:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4O5-0000000Fo7n-2kY9;
	Tue, 21 Oct 2025 04:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B8A840AB5;
	Tue, 21 Oct 2025 04:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDDDC4CEF1;
	Tue, 21 Oct 2025 04:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761022455;
	bh=UJ8dZv5bHlZPJQMkZaF2uHRed3zaCZaqouJxTbRtbKk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=p1B7ATjXuQjDxi8Wih6SciXdIjQSn4W9b3flzgtdqYyDQRCUOJEk8ft+Yln1ba2b+
	 l7LYsMl1Cpij8Y/ay6wYKI4Fnvu9H9c9VkJd4m52DbYgSG/IzYoXfoGaid36/EmAqe
	 YjU9CcujNl8Uo9tfurbZ59fl/RO91gDBLXYGnfwt0R6jX9mTSpUTcjgGEw5CqGlXKm
	 njWia+00P2Wh7cDFM3H6SVGIZMfJ+WopUIFce43gz8H814w1pajC5SO6V0i1t/ORzE
	 mcMj2Nk+9952GdJZbIBeCQfyMvLjs7RwM+YCeBum8FsgvN2o/vmadZyotyBjzUsjpr
	 YUFeCprPUlYag==
Date: Mon, 20 Oct 2025 23:54:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com, 
 huangtao@rock-chips.com, linux-kernel@vger.kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, finley.xiao@rock-chips.com, heiko@sntech.de, 
 linux-arm-kernel@lists.infradead.org, sugar.zhang@rock-chips.com, 
 linux-rockchip@lists.infradead.org
To: Elaine Zhang <zhangqing@rock-chips.com>
In-Reply-To: <20251021033834.1390006-5-zhangqing@rock-chips.com>
References: <20251021033834.1390006-1-zhangqing@rock-chips.com>
 <20251021033834.1390006-5-zhangqing@rock-chips.com>
Message-Id: <176102245277.2690154.9518311303158362414.robh@kernel.org>
Subject: Re: [PATCH v4 4/7] dt-bindings: clock: Add support for rockchip
 pvtpll
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_215421_715025_7FBCDCE8 
X-CRM114-Status: GOOD (  10.56  )
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


On Tue, 21 Oct 2025 11:38:31 +0800, Elaine Zhang wrote:
> Add pvtpll documentation for rockchip.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,pvtpll.yaml       | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251021033834.1390006-5-zhangqing@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


