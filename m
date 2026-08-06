Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A47FC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2SvrgBAvQzWpCgMCUgmcZUm9KIImY+r3a3l7Zd8wi8=; b=UVpdXQbX0JvpCHBHBTyzKlj4gC
	/b58auEbPNH4uLdR9HdaFGfZdxtnZPQ3UoFL92IO6FpL1/tpGQw06CqEjSzbN7+MESTzQxjiwn+Ce
	XfMEgkQVblBC4Tid60Nr7uoAcj/NuUMF6aLKZnuKXzDDVVmRMCJeb+jPa1mdyaCt9QfSZHW+zomgO
	YXssGaY2ciqJ20MsuK5MhdlgRffUx+XFFUWT3SE7ZSC0GTjQ/Ia0jJa5ClPHuZSMTAQbIEEoo1llf
	+VGwOJELXS21v/JU3482xTw7sL/j0lzpfLJ0txH8D8/w50hZB/OyRfAgr/fXocupYH08KjU4r+xpc
	rTQN+yAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvm5-00000005apT-3yv3;
	Thu, 06 Aug 2026 10:56:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvm4-00000005apB-46cs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:56:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D4AF419EA;
	Thu,  6 Aug 2026 10:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A82B1F000E9;
	Thu,  6 Aug 2026 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013792;
	bh=Q2SvrgBAvQzWpCgMCUgmcZUm9KIImY+r3a3l7Zd8wi8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=F7dcb2/yd2Yy3f2kyTTPO1spfJw3CONmketrIR7kFW/uv8tdayy5Kp0RAIdhzjCcS
	 UO8eEl+c+Sz/raZTKj1eUdW1imC3ygy9gxvGs9GOe1iFGkrtxDcR1Iw2RnJ48iD8Wr
	 bHXhudad88iuhGqybIQTzHALl1BB4hPIuDGji2MH2n1++fvnnzg/73hgwNRovBBWUp
	 NrkEdqLIdd0XlyV01PrbaVD3b6L2yf1gfsxMFC4prwo1NikYv3TchGr2jb/wBDSJLf
	 PiPwTNsk0iCZscT6j8Yl3hpEKFh3oDenDpRmJGPUhgNBgtqmpErEnrZSbBQi+rMe5k
	 5mtHxrBoi04eQ==
Date: Thu, 06 Aug 2026 05:56:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-serial@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-clk@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-3-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-3-6b09707c5fe9@ambarella.com>
Message-Id: <178601379135.876323.14270090902806254891.robh@kernel.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: add Ambarella CV75 RCT
 clock controller
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


On Thu, 06 Aug 2026 17:34:11 +0800, Long Zhao wrote:
> Add the CV75 RCT clock controller binding and clock ID header.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../bindings/clock/ambarella,cv75-rct.yaml         | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/ambarella,cv75-clock.h   | 17 ++++++
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.example.dtb: tdshp@321e0000 (mediatek,mt8196-disp-tdshp): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdshp.yaml
Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: fsl,pcr: b'\xf0\xc8\x80\x80' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260806-longzhao-upstream-cv75-v2-v2-3-6b09707c5fe9@ambarella.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


