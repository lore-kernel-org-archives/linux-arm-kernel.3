Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A2BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBGY97HAd1q52SJ8bUP/fH1QADYZQUX/ixXaP9nn4RU=; b=KG3pgOr/p4SJzGDN0B4CZBHT/8
	mWb2KpuaSTmvLmJgbSUQOUWg9LBBmoOw6addAl0PDlETSmxAEJB4oa6IEvW9xo23WKun+QMahCr+x
	uFM9/ZUaXwJNgOeRmvpOryq1ToJHUN7+fqDpj7rYyzBOcecV0ze1ttkc5W7ypMHHAt6p6P5O3+uxS
	lzRgj02QXPPxvcaw8RAgZNa/YFZx4WgbK4cI0Jn8QP9SVNTRtxKeCi5j9UZXidlPAQIahxXVYLSSn
	tLTeKEOzy047YaVATOmL6SIh+S7IvQ8Gx/yd7sTA9Hhl9GeYSF4lFnA0J/jr3VdMmFQbNF6WMd8TM
	s1cgB8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hzf-0000000H04Y-39A0;
	Tue, 14 Oct 2025 16:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hzd-0000000H04G-3Pcj;
	Tue, 14 Oct 2025 16:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF91462363;
	Tue, 14 Oct 2025 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A6EC116D0;
	Tue, 14 Oct 2025 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760459719;
	bh=V3BQixyVjuCVkkOX9feEiagJYME1UtbGBfo11YpVI/0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ojsQW/wsHQ8jynUNzpnd2dKZgcAMGpab2GTVTWiEdNnE3tCNaOCznQ0ByVLG6yLDZ
	 ChBBU5oEzfvFBaocmngkn3Q1IOtgVjmt75SNrMpU2/dGbBKNKi9PILsj3gR02d+T2b
	 mgn22uychOKORC3/yDleOSCYKFj1qQ6P1QGjq9oj5gBe0X1V9+JycL8em+nkQhMf2b
	 K3ZdqIDAO6k9VxdecdTB8mC+7dkNlDd+1NXid2gS99Zvyj+qzdxZgp5gE65C6GVg9F
	 /2rmXbQ7+88nse4PHnSdBGnXyNA6mGVbmfWm4u02lm0BU6O8RUadZSqGQeEpZHxoPZ
	 YmMxhGczgsNkw==
Date: Tue, 14 Oct 2025 11:35:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Val Packett <val@packett.cool>, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bod@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com>
Message-Id: <176045970552.4162088.13140212466799720724.robh@kernel.org>
Subject: Re: [PATCH v12 05/18] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
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


On Tue, 14 Oct 2025 15:01:51 +0200, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 152 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.example.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupt-names:0: 'err1' was expected
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.example.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupt-names:1: 'err2' was expected
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


