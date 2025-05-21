Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FC6C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQJzbvORYC3qBJW5bkNYYbLB/XMom/qkj5UONQP+FfI=; b=I6Th4JWvpqy3n783Iao8TWht6s
	JcIFJSqfuJrNqQE+Ebc84bKaGaIjkOY99tw2PCC4qkiHgAPV58OXM7LhY0cYrQofMK/EfUi+wGf39
	vcQ7Jmi4VBYfNV0g9aNkwVh5HNqpNOu8xCEYNjEUUkxXYA2flJ7X0ZzenssV1uJq+YaHDEMdQZFNR
	EHHcro2bHtUCc4R+iQHGR0UV2wtEOXj5FB9i/veAjfU8Yu+H6GsxkZTfMfJTQVdolTM7pKn9DGmF6
	CWvPYgtCXmklvWzRKfYt2JMkZvqhpXiEY1PsKxiVERxsUZThEwHknCkBIPpn0eufrBqBOPrOE/xNl
	gqShKqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHe2k-0000000F588-0DjR;
	Wed, 21 May 2025 07:39:14 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdvR-0000000F4Dg-43xF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 07:31:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9ED0E1483EA6;
	Wed, 21 May 2025 09:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1747812700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vQJzbvORYC3qBJW5bkNYYbLB/XMom/qkj5UONQP+FfI=;
	b=g0XjGnbsgpvNRMG+QRiSHGkKupascOtHMHBsxB1DJMyIKHlEX0gMY3tzgzOt+F6GW6MBj4
	TrAIRx3z7QjRY0LF2B5sNJPrSVmZjkNDCwb+doQyB2ROUoHxAQbAVxdOQBa0X/uG4weZCT
	WMExvCvZW9gFzxy5+H3SdL1GBcJL/ucyTWSeHTPbgeb0AWOSsAEYjJjt/V2qRaExN/wCqg
	xjW+QXt0pdNzXFSndEFTqhvgl5GY7S8vOyP5Rc+b0fEbR2lC6vdHa/riz1gsB8VVQTVWQI
	Td2+bRb2z39L9tN0EYFJ04egtO7BLrBWgFiUqbvyVCMQyr8mcD3Xfw9kXqKbUg==
Date: Wed, 21 May 2025 09:31:38 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
Message-ID: <20250521-outsource-unholy-8c063337eb6f@thorsis.com>
Mail-Followup-To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521054309.361894-2-manikandan.m@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_003142_170863_B8A06B8A 
X-CRM114-Status: GOOD (  14.97  )
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

Hello,

Am Wed, May 21, 2025 at 11:13:07AM +0530 schrieb Manikandan Muralidharan:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> index 8ac85dac5a96..13c28e92b17e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> @@ -44,7 +44,7 @@ flash@0 {
>  					compatible = "jedec,spi-nor";
>  					reg = <0>;
>  					spi-max-frequency = <104000000>;
> -					spi-cs-setup-ns = <7>;
> +					spi-cs-setup-delay-ns = <7>;
>  					spi-tx-bus-width = <4>;
>  					spi-rx-bus-width = <4>;
>  					m25p,fast-read;

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex


