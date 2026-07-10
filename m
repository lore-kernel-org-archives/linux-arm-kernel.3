Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9229DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW1CYh0lnYgu78kElwiu6T5jQUe/eq52tcGx9p2ls+s=; b=3oc8MGsEB+gUZ2sGxA/Tr7aASh
	IHMU5eAB9ALwFkcQxov798I1wgRPN2XnsCkXcRLdyKQDCBirpWnNSmBYwUj3DJstXzLNmVujsHr+m
	upUvIDcfW9diaElWKxrgX80gcE/1c03af+reX+Arnp/zTu87BTHf2xklPGnm/mEIzXO9SLFE6Ci+U
	VFjP6sw1lsdgW8Tomcbx/ZbQohNFG7E4Df87wmcn+QJeCR4hIgN3O6i2B/VXMRuaV30NSYaP47IN8
	3FPQwCIqKJFmXhEEcFnQcllNSST8saHpy4EnA8enIaOtvki9YXdji4483W6QAM6OPeAa9OFvEH5u9
	eTZ9wbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi70P-00000004VLs-27Vg;
	Fri, 10 Jul 2026 08:54:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi70O-00000004VLO-1iud;
	Fri, 10 Jul 2026 08:54:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D14044095;
	Fri, 10 Jul 2026 08:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849021F000E9;
	Fri, 10 Jul 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783673683;
	bh=ZW1CYh0lnYgu78kElwiu6T5jQUe/eq52tcGx9p2ls+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fncSFDPMrkIpa1dOMUIDNNQJsB5ee03VVWKjAQpnv8ua2SwJGlRrYB46FupscbR70
	 bOcNpFSiTvHR/0iH9B8gDGexxh3s1JN0i6IASrTt4AOIcjH9FB0tCbxp2Xpa/wtkcj
	 5Fn7iYRTyb9lSYS6KsKLYva+Pjvh5L3IkPphSiZR6ub31c9dczdxNBdNdR2IvV3b9T
	 FPnvdQrfMJfWC+7oXnSDYNuWiscpJ7lceCVjMroMmLZmkuzLb5etWbIh6WrD7FIKwM
	 cla2mY46eAY6PDJRhE6L8/KcGPY933m/feq2ZKgWNnyHqFHOSmvOvfMMRKgtUUXbrH
	 QAZZDZxIJrcLg==
Date: Fri, 10 Jul 2026 10:54:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port and OTG
Message-ID: <20260710-strange-prompt-python-c2e1d4@quoll>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
 <20260708103606.1462960-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708103606.1462960-2-a0987203069@gmail.com>
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

On Wed, Jul 08, 2026 at 06:36:04PM +0800, Joey Lu wrote:
> +  nuvoton,oc-active-high:
> +    type: boolean
> +    description:
> +      When present, the over-current detect input from the VBUS power switch
> +      is treated as active-high. The default (property absent) is active-low.
> +      This setting is shared by both USB host ports.
>  
>  required:
>    - compatible
> @@ -39,7 +78,7 @@ examples:
>  
>      usb_phy: usb-phy {
>          compatible = "nuvoton,ma35d1-usb2-phy";
> -        clocks = <&clk USBD_GATE>;
> +        clocks = <&clk HUSBH0_GATE>;

This change is really redundant. Instead, add optional properties like
nuvoton,rcalcode and nuvoton,oc-active-high.

The rest looks good, so with above change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


