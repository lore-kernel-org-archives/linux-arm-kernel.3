Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7lAaFoR8S1Xo2a+vv7FBz5rqN+4dDLgLgpGynUh/w4=; b=EitNhhty2fZVxqkgV5hS1VpY/H
	QNlRIhoBpfA0lgKes7WrMo6Cr447cZsTIRyO3GGwyftoRCnLvPyQEBWXb+W5/jTCNaxEjrIzlNeN+
	iUi9BssPZtZGETqfPHFPX5pT6ikqq3r6dSSvtd+HRZfYPYh1VQDcqdpn3ExxjThup0+sULxEkeL32
	n0Pe5F5huYY3+bZeIAqv/QAJS3CDddOzaogeqcAfax8sZ88T9Nw149GTR/Y6G4RHYVvdYQtIOMCuZ
	CWHvzl7zIboA15Wrm2IS6OJfyaCqQ2ndCF4uMXq5yDhntp3IbI5vgQNT/bspp0wfrbrYn6DEDE7+L
	BppFmOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGByU-0000000BNDC-0G9x;
	Tue, 04 Nov 2025 08:01:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGByS-0000000BNCk-3YuU;
	Tue, 04 Nov 2025 08:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F408F601F0;
	Tue,  4 Nov 2025 08:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496D4C4CEF7;
	Tue,  4 Nov 2025 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762243263;
	bh=vGoIbPpz5aXIFdt5t3D5TrfQi3IlTuwBW7gh5GXbdIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARho0ulfHfD0LwtnCerN/OpEB3PVm1rYxkXWFTUkQhZWvhyVzYc3kP9WyP1ETPi0R
	 InOd6nMfWxQ7YXQvvh6El2e3L5teEdnsUNZ3HGdhGMiRnqarqCJwCNs7UM8E2afdie
	 btRAIVXD0WretN6HLWRNFYT/r44Z7jyrs72Uw7N5KDniTx4gnFijmV3XMdxfxsIsb/
	 aQckCgwcevwcT9lcNazWocGkaYVjr6QrEujGifhHK7Rhu0hQtbtXWSjCKk0nLBco8Q
	 FxEZfuViU6MD1p38Vg5dti86FWEhUcCLmXha46F3CCK3AQYVNmLpNxj3E8ISriqrQD
	 CYROX95lHCfdA==
Date: Tue, 4 Nov 2025 09:01:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add 9Tripod X3568
 series
Message-ID: <20251104-puma-of-undeniable-conversion-de00fb@kuoka>
References: <20251103171702.1518730-1-coiaprant@gmail.com>
 <20251103171702.1518730-3-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103171702.1518730-3-coiaprant@gmail.com>
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

On Tue, Nov 04, 2025 at 01:17:01AM +0800, Coia Prant wrote:
> This documents 9Tripod X3568 v4 which is a SBC based on RK3568 SoC.
> 
> Link: http://www.9tripod.com/showpro.php?id=117
> Link: https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


