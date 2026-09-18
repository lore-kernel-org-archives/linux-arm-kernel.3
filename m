Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E93C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbkQpYzW8fMnBq57NK7jpTmVbQoZoa+LajFAmJqaKwg=; b=CmbyJLPl0r0R9MeSq55DmWvBwl
	SeqdAyC2CEGDbm8wqMNoFrvjSjHVX/9hMzAO96gmnRBmxjFSIn7kflNPPjEUv/9Yb7ouxrKMlGoPJ
	DJD2s56wZDFSTSToBeq4RguJAQKMKHPiX6p5lnrZCb0hJFbXqkoXhRqkO+KFfs+ItN+B52V+mxX4u
	IGtcGyaAVra1cZCt8CiUCLxfUOryMJk3HUnHqLJtXh10JUSPB7g3bWPx0VH5aOpe0JYJ+Xq1fYIwt
	GwlLtsiyDsDK1UWLsFsrdepVCVE2fXPUAg55FDVMUYJ1L8lUAtJoRkS+jQnF6pyXRw7IibEuwctGh
	lGfgh8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7beU-0000000F3oB-1bh4;
	Fri, 18 Sep 2026 16:41:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7beL-0000000F3l6-3pLT;
	Fri, 18 Sep 2026 16:41:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50E9E4377F;
	Fri, 18 Sep 2026 16:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057BC1F00899;
	Fri, 18 Sep 2026 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749681;
	bh=WbkQpYzW8fMnBq57NK7jpTmVbQoZoa+LajFAmJqaKwg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ICXEfZWGgydsyAdHsmcIuO4df3Y4EmINakIsTIkpaCi6VmkVnmH7MXbZGhReGj2Ow
	 ZXF/3hck8Ye7aD4t69fCe7WHqgn9VD3D3XWtRv8FrP3OM42vigP7m8SJJbwOSf82wK
	 +GkZH2rTy7zUpje/4SmZg6BCJmATbTrN3RcIyaCYxa5RAlT0aqjFteGuDJVV3qyN2h
	 D5qJn0E5oegFAxnC7eIwVZB+XTJWijZsTQuJ3o08jgBb+aOql6zky8m1PSF+0mRWkx
	 vWpzhYyJ7S8vphq4LER8kYXpb7Tyx42RQN6x9nC3byDve67DG9lTwceG9x7XqXa+p1
	 qmKaxYqoSi75g==
Date: Fri, 18 Sep 2026 11:41:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-rockchip@lists.infradead.org, Chanwoo Choi <cw00.choi@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20260917-b4-rockchip-dfi-rk3576-support-v1-3-a5752a29f7bd@collabora.com>
References: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
 <20260917-b4-rockchip-dfi-rk3576-support-v1-3-a5752a29f7bd@collabora.com>
Message-Id: <178974864695.290479.16274908479214373555.robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
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


On Thu, 17 Sep 2026 16:04:09 +0200, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml: properties:clock-names: {'minItems': 1, 'maxItems': 4, 'items': [{'enum': ['pclk_ddr_mon', 'pclk_ddr_mon_ch0']}, {'const': 'pclk_ddr_mon_ch1'}, {'const': 'pclk_ddr_mon_ch2'}, {'const': 'pclk_ddr_mon_ch3'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260917-b4-rockchip-dfi-rk3576-support-v1-3-a5752a29f7bd@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


