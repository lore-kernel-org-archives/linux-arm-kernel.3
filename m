Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD6AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdSSRS0zzr9cmqiYQNz4jFGUuLv5U2TbTEH1JId0mac=; b=qpoOBM5Tq1+CTXT/d1H3UFoJfq
	zLyPcuMkHvkJowOKq8M+qx5RaCcRfVrzJ7BNNUBGXFhsD/l9U5yY2JLrvBjFtEuFurgMdOyy+5/Xi
	oVjUmyesS3RDTZISWy2WHMxteFKI9YIfYuGOv0bokVC1vYwvn4l37pqqQnagweD25XLpz/iz5Qig/
	70yrOYxBbbYoqmCLrmELmqcSvOulh/4/4hnvt7s6EB5lDjij15g1ndq5Ct0IVK0HWf7Q/gWiN7DwV
	yyRglifYnhj1ALl82HyoIeOb2D2xvjNWs2eYpt7YsdZq8qn88SjcslYpo/LGkvMscjeZFsPAUFUNN
	SL55RGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPsJ-00000009zUK-0QLJ;
	Fri, 07 Feb 2025 15:02:35 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPqu-00000009z90-23AZ;
	Fri, 07 Feb 2025 15:01:09 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738940465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdSSRS0zzr9cmqiYQNz4jFGUuLv5U2TbTEH1JId0mac=;
	b=ppTUSEKX3LFAhWXfNk5cTq9naAAmq9H2bVF8nkbmNHXync3pnwkkaahMU2MdwxSBVoWVx7
	x+xtYB6tlHlhrsl0Xx1AxkpI69AN554BVqZ74zzB9x9Vq90G/hfYDI9uUDhuFaSuzZ0MAc
	5QFeVCzpDuudDqP5kPv2+xQL8hY+f0cjYZRnNvThfYLstaGKLWMO2OT49tgV040RwkrAFT
	zj0E9wxOM+kXqEaMznZgJPj+BIXezfy7lpRjyF6m4/Fj8djCGBDGR7ayj0FIkipg8kDm+r
	3ycofI0/ZtA4oWwRYwIkkoHlEff5CqhLIgc7erzVsbE8go9n7PrzmAUSP2gm2w==
Date: Fri, 07 Feb 2025 16:01:04 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maximilian Weigand <mweigand@mweigand.net>, Marek Kraus <gamiee@pine64.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
In-Reply-To: <20250207111157.297276-1-didi.debian@cknow.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
Message-ID: <502523554b482a2e10d85d37761932a0@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_070108_706948_C5350A1D 
X-CRM114-Status: GOOD (  14.55  )
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

Hello Diederik,

On 2025-02-07 12:11, Diederik de Haas wrote:
> Add the recommended chassis-type root node property so userspace can
> request the form factor and adjust their behavior accordingly.
> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> Link: 
> https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node

Maybe the Link tag should be converted into a "[1]" reference?
To me, this is more like a reference for this DT addition.

In general, references can also be placed closer to the contents
they back up, which isn't possible with Link tags, but of course
that doesn't matter much in this case.

> ---
>  arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> index 2d3ae1544822..3613661417b2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> @@ -9,6 +9,8 @@
>  #include "rk3566.dtsi"
> 
>  / {
> +	chassis-type = "tablet";
> +
>  	aliases {
>  		mmc0 = &sdhci;
>  	};

The patch is obviously fine.  Thanks for the patch, and please feel
free to include, regardless of the note above, my:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

