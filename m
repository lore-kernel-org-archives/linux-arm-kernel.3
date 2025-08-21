Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFaFQzt84MTNGS6hqYtu7kDQ83oOBYMdxnUIRBRkpD8=; b=spVY5suPkKiVGv57PzdsBGclkD
	6ASGPMAhL3DjIm4Z9dTbLkpWdTsLguJu5CZnrOGP9SMZPr5Kv4I/SniByj9/LH+hcbj9b3um56zX2
	rdiuJ+Tx05ndVfmALSkPQIrY7vIsCzRexoBWJ3natyK+Q0f+3Y8olC0+qu+OLorVS8ofvFasEd0VF
	0wi5jldTmAVxSEirgqp7Q3HKMYZTcnCt1vZA8551hp0ZinmoK6zqfeEdMrxDUh7bmG3gEeCSiVCSt
	/yN2aUhJRAi+AIFCpxkg5ASmGnk9jmir7hFi0jUM0na1fZeKzQ/J3q/c0ap9Q5pxcB0S/F/0TvxtX
	epqMfzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDya-00000000qM5-2nQ3;
	Thu, 21 Aug 2025 22:41:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8x1-000000002z9-1snq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ADEC44070;
	Thu, 21 Aug 2025 17:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCE3C4CEF4;
	Thu, 21 Aug 2025 17:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755796786;
	bh=IkEM90j9AB9fEVUaubBHggr7J8lF+yeDnZnqMajK8Pc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XlLnFvpguszjxbVQMQmmvQr18rAXlaCwrmPQn1BBthnaf0Nii2oICZx8GgMZoyu7W
	 R0IPqBkYfHW5JpotaqQ7fLDwbei2ttpwVs0fYw2pVoKfCV+PtUeXTyKEk6W+w1ydcn
	 1MJXg7djUXA7jlGcIlRY0VNEoyP3bdPw+GLzaI7qGgqJKhtYdzU8N6JwFAJoLHKG9B
	 +xq0M2ZhC2DypCTCExctIizJyiol05dA+8wzxrd4ShgWCtYb5InkldWB40j/4gBCws
	 06G+PJcgTbD8TPYrBul2rWtYDNolXOQm8jAott4kr8FYeioXsNJqu3wI0TY6T10IGw
	 3xmysks9SZIGw==
Date: Thu, 21 Aug 2025 12:19:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>, 
 imx@lists.linux.dev, David Airlie <airlied@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Fabio Estevam <festevam@gmail.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
Message-Id: <175579643516.37357.10852050615304641702.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: imx8mp-skov: add new 10" variant
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_101947_524663_092A73D6 
X-CRM114-Status: GOOD (  15.54  )
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


On Thu, 21 Aug 2025 09:55:27 +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 10" panel than the existing ones.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Steffen Trumtrar (5):
>       dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
>       dt-bindings: display: simple: Add JuTouch JT101TM023 panel
>       drm/panel: simple: add JuTouch JT101TM023
>       dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant
>       arm64: dts: imx8mp-skov: support new 10" panel board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
>  .../bindings/display/panel/panel-simple.yaml       |  2 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>  arch/arm64/boot/dts/freescale/Makefile             |  1 +
>  .../imx8mp-skov-revc-jutouch-jt101tm023.dts        | 79 ++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++
>  6 files changed, 120 insertions(+)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514
> 
> Best regards,
> --
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> 
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
 Base: using specified base-commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de:

arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb: touchscreen@2a (eeti,exc81w32): compatible: 'oneOf' conditional failed, one must be fixed:
	['eeti,exc81w32'] is too short
	'eeti,exc3000' was expected
	'eeti,exc80h60' was expected
	'eeti,exc80h84' was expected
	from schema $id: http://devicetree.org/schemas/input/touchscreen/eeti,exc3000.yaml#






