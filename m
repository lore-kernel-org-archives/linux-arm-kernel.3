Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE1C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlN5GCN5E1iuCLEt8UpPF8+J0VWR8UTlqIIRg0xWQ5o=; b=jvu/d3Rvf7j98s8vxMm1FAEhWM
	Pphb8K7sybaTmjf4x+LUJZPztzQXX9Pua72/XifHWPxNg7J474OWf16ELz68DzEx36Ast+9IeDWzC
	4YgjUWi8AKp510Zm3LgtHpvrBRp7vXVPeW9Sj59H7hfMXMWRZyrsbPZffJkS6PaDiJR/xVuib6HJd
	adrsOzQ87fvC/W1H2bCHmsuA9SWr4VJXTyC8rhNXN0zlXEmNNoL4xah94VIkxIbloYOguyqMgXNDt
	EZc/SlGuyirV8aFVDXIXyYfefILc2T6dHJuay5SFyRU1eqXj8/CPjxqmHaLCDNJWwEXxJihDhlYE4
	pi7Ci1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavKN-0000000CJoM-0sYx;
	Thu, 23 Jan 2025 11:24:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavIJ-0000000CJSp-3bVW;
	Thu, 23 Jan 2025 11:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A9AF5C5770;
	Thu, 23 Jan 2025 11:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD1DC4CED3;
	Thu, 23 Jan 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737631363;
	bh=dOPumK8qpk9/lF2H2ETAfWwPgfWjceIap9jfDJzhbCQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=U6jJOoa9E7/CT2C3/91caq1JtSj0tQh/jMzWt6DTk8r8w8PtvqJ+Gd+pl5fQPOpHo
	 rBU7c3ISLWVl+8dy74YjwInGSqHG9l0D3pLGU44zcgPyDPyZVa8nuZE/VgYcJs+Ucz
	 hnTpXJwl+ahiaWzHd6O+xt7yeG/oaobCNUZ1W9RKH3iM+Gtsn6nMIV5bzXZlgoo3Ga
	 QsDHUHTm34pMdIhQKCrbrv5wsEc1oN+o1bYKYVZmjYgaLouHo+DY1PHMepe9BDvVVF
	 ai40tdrnqUb61zhmmFw4CgVNn++RSKtRsr7j8e+hKxCoWw7DyBJY2IboaODdIqlHfo
	 YHxBbgw1FhlBw==
Date: Thu, 23 Jan 2025 05:22:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kever.yang@rock-chips.com, 
 l.stach@pengutronix.de, linux-phy@lists.infradead.org, vkoul@kernel.org, 
 linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com, 
 hjc@rock-chips.com, sebastian.reichel@collabora.com, 
 dmitry.baryshkov@linaro.org, rfoss@kernel.org, krzk+dt@kernel.org, 
 heiko@sntech.de, andy.yan@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 algea.cao@rock-chips.com, linux-rockchip@lists.infradead.org, 
 conor+dt@kernel.org
To: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250123100747.1841357-10-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-10-damon.ding@rock-chips.com>
Message-Id: <173763136187.3345079.11905359473404124812.robh@kernel.org>
Subject: Re: [PATCH v6 09/14] dt-bindings: display: rockchip: analogix-dp:
 Add support for RK3588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_032243_979678_76B79E64 
X-CRM114-Status: GOOD (  15.96  )
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


On Thu, 23 Jan 2025 18:07:42 +0800, Damon Ding wrote:
> Compared with RK3288/RK3399, the HBR2 link rate support is the main
> improvement of RK3588 eDP TX controller, and there are also two
> independent eDP display interfaces on RK3588 Soc.
> 
> The newly added 'apb' reset is to ensure the APB bus of eDP controller
> works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the main defferences of the RK3588 eDP and the previous versions
>   in commit message
> 
> Changes in v3:
> - Expand the property clock-names, resets and reset-names
> 
> Changes in v4:
> - Remove 'spdif' clock which added in v3
> - Add the comment of newly added 'apb' reset in commit message
> 
> Changes in v5:
> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
> 
> Changes in v6:
> - Keep the widest constraints and add only RK3588 related constraints
>   into 'allOf'
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250123100747.1841357-10-damon.ding@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


