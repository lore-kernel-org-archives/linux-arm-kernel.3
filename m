Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49658C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvsriI3t3iSP3DY58EeBnMIAqO6ZShyEyigTn5qUvnQ=; b=TuaFl8r1ERVNLUc/zdEUq9aa5M
	GP4mXr6wZOgyvZkrE9MT/oqP+06ag9eUcrszcpgunL+1mrRnWDA1qAI2gYYOravEJJdCz+aPbLBeR
	FMvtH5kpaE4nrPT8H1XBkZZGRCv9Got9BmDFWyfvcGAt9M0CmoRJWSHrpGDrA6esAe5MToeq4w/5l
	zYw3gxKzL/7zBvNNWfx6m4/6svAhvCnRYxtTtObniLzTq0w30Azkm3xE+dmIkhASoVzCj6YFoAabr
	3n+HMXjtHxhf+XHB4JexOVPnM3w5n/GmLm0CVckWCth0o+2fJAhi2Cz24uBx+6+Y9AV7xUbLuXxQv
	LjcSgmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Aq-0000000Drkm-3R1e;
	Mon, 29 Jun 2026 07:12:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Ap-0000000DrkX-0v9D;
	Mon, 29 Jun 2026 07:12:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F5B460052;
	Mon, 29 Jun 2026 07:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB31F000E9;
	Mon, 29 Jun 2026 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782717174;
	bh=lvsriI3t3iSP3DY58EeBnMIAqO6ZShyEyigTn5qUvnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbbcYqVv8rd4QbMquaoo9oWErUDsuulIUi23oHVAfT1RUkK0/5lCRJ1q6o4f0Hm8B
	 GSwcDm13faPCYwoRKkQIobCAhfO9ShMIJNyvVgHZIx9II2AZXFyRXJgBTx+FtYyg8A
	 Asb/a4DzTSIFGreSGP+bmy5z46DLVm8welhk4snwR5tWDzSy6+Gy/yLcK1/O2AbNp7
	 7lr+VP90sZcmLZeR9lpH+NKzQTnScMGhorZOAbmn8NEVlm6jYvPYGOhfFGHLUDA93l
	 D7wgRWKm2+1ceM4awGWJF8mk3ES43yxF8tPvwwZ0dzw9OPqHbEnm6Tdxv0+JMBsuQx
	 3rcR/CpyLuA0w==
Date: Mon, 29 Jun 2026 09:12:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Graperain G3568
 series
Message-ID: <20260629-fabulous-muskrat-of-romance-cd1bef@quoll>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
 <20260627225755.1710837-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627225755.1710837-4-coiaprant@gmail.com>
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

On Sun, Jun 28, 2026 at 06:57:56AM +0800, Coia Prant wrote:
> This documents Graperain G3568 v2 which is a development board based on RK3568 SoC.

"Document"

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> This series also have an SBC series with the suffix "box".
> 
> This board is development board series, not SBC series.

Remember to also address Sashiko review.

> 
> Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
> Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
> Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde186..873d41bff 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -683,6 +683,12 @@ properties:
>            - const: google,veyron-tiger
>            - const: google,veyron
>            - const: rockchip,rk3288
> +      

Looks like you just added bunch of format-patch and check-patch
warnings...

Best regards,
Krzysztof


