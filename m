Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F367BC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuoGqdHAfp3g+tYJ8z5He0L7yOQ9x5H2FSG7RNhl9pY=; b=CDZ2zfkaXn+JuUxiw9VIiI4Icq
	AJjBi5IlzIhtI22gYjkIHNus7+A+tS9a9yaKUnhgHE4jYmT38CDfXJ5nN3JvowFuL5X47dnbSZKWh
	yZCvh0XWZNRCzY166Ag1evNsXIcKnHd/xEgCaAzCjc2S0QEWDh3DFv5CitaXynv60RcQzPMZbsAlN
	1YqA+TK3kVBowxYMEot1bzlO5zmnnCHUQ2nCdLVgAwD2MXLiMBPQd1B4XseBgF+R5r1QWTM04dYtG
	vIGfzzaRN3eGCiEzFwXhDFq2TPxnKmNRDOiB7xoZJvbKHmh3yvCC4CI/mdBnNa8rv7V9JCzLgizQh
	W6uz5c5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraQF-00000001H3p-1oRG;
	Thu, 28 Aug 2025 11:04:03 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZQ5-000000013jH-0tE2;
	Thu, 28 Aug 2025 09:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1756375184; bh=9xSK5wQebA1aqy7LgKNxVsJm9NVimwKAsxwFdofUyZo=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=Jpl9V0EnXS0hooV4AW2thMQ/BJNtdjxOk3uvnXwwmT4pP1pGH6nas3SOnUVQhucE1
	 tjLA7D1ah1ADClJAPAK5fJfTPdDSf69icB7ShRkI1tJ5/VSREk24HjyIW961hLQhCD
	 6n3CXMohR8IjNRfBFw0bii9/JAIwOvm9CVIDMsYs=
Date: Thu, 28 Aug 2025 11:59:44 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Diederik de Haas <didi.debian@cknow.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on
 Pinephone Pro
Message-ID: <s4pqhvg542k4d3m4sosnugy5sdnqpw3dabv7cw4o33imvfyxje@yao7oufrhxn6>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Diederik de Haas <didi.debian@cknow.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250827143501.1646163-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827143501.1646163-1-pbrobinson@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_025949_694490_E938E3CA 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Aug 27, 2025 at 03:34:58PM +0100, Peter Robinson wrote:
> As documented in the PinephonePro-Schematic-V1.0-20211127.pdf,
> page 11, the SPI Flash's VCC pin is connected to VCC_1V8 power
> source. This fixes the following warning:
> 
>   spi-nor spi1.0: supply vcc not found, using dummy regulator
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Reviewed-by: Ondřej Jirman <megi@xff.cz>

Thank you,
	o.

> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index be90e049a302c..24e4365a2e588 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -772,6 +772,7 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <10000000>;
> +		vcc-supply = <&vcc_1v8>;
>  	};
>  };
>  
> -- 
> 2.51.0
> 

