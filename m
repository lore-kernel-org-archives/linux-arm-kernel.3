Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF27C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrWXHne5Rj+iz81loEoN0QV2AkdqZPV2Q62rTm5Hl+c=; b=iAvlY9M/Vv539z4poE876LBMPO
	35caVRASm1EJ2dbR0iPV972aEwJq7FSvyMlvB6g5m8Ev3c3QdIk4LRSvT5oKvp4TpwPQxKF4THQVD
	G9sAD0fwk9f63xWtVG+vTudJgnq+eP5cOTTqM4aECyaTiBRtk/YTLpLNf/5NOAT8hV3iIv6IERDwA
	0n3NEwG+4scKStI8b/DDZQqmx0Vgd5w+KP6jbcfILmuLpzVuCKi7jWKzTTOezB5NcX/ses0I9iFcz
	0p7H8KP81zx9BONQ6Mosm2FQUKqAoRJFTfnqVYLpPRYpy/uR55NRKkDWc7fU6iybriw3dEMILCmN3
	RHtSUcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyyQ-0000000FIsi-3BqB;
	Wed, 12 Aug 2026 02:45:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyyH-0000000FIrc-20QN;
	Wed, 12 Aug 2026 02:45:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99B14600AE;
	Wed, 12 Aug 2026 02:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390571F00A3A;
	Wed, 12 Aug 2026 02:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786502736;
	bh=QrWXHne5Rj+iz81loEoN0QV2AkdqZPV2Q62rTm5Hl+c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=d9i06sarZ94uIQdp7MKoSNrl4Zi1gfnsx/7SATNaKg8rLb2cGQQHF/DOOvO227WwI
	 KgCU5Vpf8o12idpU92K8HESmvxc0Tn63pcis9ysQkNGcXp4i8PBc0tUaxHehRA/bd9
	 zPLxnn/7BPuoPMTN1cWycrMK3S10qiNB4/+ZZcpqGLqy2N6mKSaUKUl4wtNhbMT56n
	 Lp4Qebrkx9d39paQL+ByQfMr7I8L4wVbMcN84PhqGwgZdgFoqbSUd8GmBf4RfiSwgP
	 uD5T3Fm1xoejTAqevj9KzgpzkiE3J/16QLmV56PNPeeBOlUdckccik8TwZhvC8KahK
	 /ZtRfbR0VTQWQ==
Date: Tue, 11 Aug 2026 21:45:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-usb@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Rahul Kumar <rahul.kumar05@st.com>, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, 
 Christian Bruel <christian.bruel@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260812010157.1772849-2-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
Message-Id: <178650273552.610181.6902482576352266703.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
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


On Wed, 12 Aug 2026 02:55:41 +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/st,stm32-usb2phy.example.dtb: /example-0/usb-phy: failed to match any schema with compatible: ['st,stm32mp25-usb2phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260812010157.1772849-2-marex@nabladev.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


