Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4419C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaJGN9kJmEj0dAdiwhDy0guF5rBV8eaZ54VRSuCQHHo=; b=GlYlquo1KljXQs3v2MZGPmmA1C
	WTQr/0yG2k2N8kt/nWnIIO+FjGZExeniQOAWaKB6cYcZ4mo2+lUZQvYIS94htzmuwEFbbj7jDwnOo
	DgdX5XIwvY5xmRGonRy20cf3jQ5HFlwqEq4Wlvjo/byVktateUAP5lghRYwwo7GMKTqggjBd3xzTF
	dPtfGHtiErXUDGi0x8L8gS2cWqCGHelSL46FfDtst4MaXbnaJB9OI+THLzQNO6nJHG4ILwUNwQn9i
	5mBX68s+uFvMMRzdPCLj+w78kjMzcee6YJ9hCYEM4MJzVa6eOBGF6tlLGBCdFGTGufi115qhO5ZnY
	9D882OZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg8z-0000000FrQn-0MSD;
	Wed, 07 May 2025 14:53:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfas-0000000FjfL-11lO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95836629D4;
	Wed,  7 May 2025 14:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084DCC4CEE2;
	Wed,  7 May 2025 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746627473;
	bh=XCPO4OwtHdklV75ZQexHUDw+NLtN7k5eDz9cWsLCD7s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Qs2bW5MzeuhyoRfLeHZNePhETq1cuep9TM1AX0aZzNMUr9PnjrD+ikLE7R6NI5/kC
	 sT8P5/a7l15vu7DkzFtpOqPt9jV0uleb9TQDr4MFRa4vZOSIjdQZVfFuLEd1YMgwVg
	 Y7r3hvxC/mFmYpPVity5Vk356zOtJCIiaM2KgLg70cssO++MRkuF6rQH8CBusTBpHC
	 I3/s2GNEJzkOAQwdg93eoOB333RctMzWrBgOJPEsy4wkhgydykSIVK+bk9kSzveOEY
	 LBX2wjMtEUO1cBDwbR0lmtWkc7pHOISw//59HVydxnYJPpA/EM+y93uoCgr7+l5vuo
	 o9cjCGU9eSMlw==
Date: Wed, 07 May 2025 09:17:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Benjamin Hahn <b.hahn@phytec.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Yashwanth Varakala <y.varakala@phytec.de>, 
 Teresa Remmet <t.remmet@phytec.de>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, upstream@lists.phytec.de, 
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Jan Remmet <j.remmet@phytec.de>, 
 Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
 Catalin Marinas <catalin.marinas@arm.com>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
 <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
Message-Id: <174662747122.1094223.1125259086632722690.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc
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


On Wed, 07 May 2025 15:13:12 +0200, Yannic Moog wrote:
> imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
> Plus FPSC SoM. Add its description and binding.
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/fsl.yaml:1372:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


