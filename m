Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733C1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo8cDLQM3XMzIjXRy1b2U7Wev2UzC+Jh4i47p9UAFJw=; b=Wy/AXsjRBv777gcFCiuHSumLlz
	9TH3opOC2CQssqyohAPidoWNRcw0MbJhmxCa2NRpetQOuQvoY+TSDn8spQgt+aWxg6T0PGazRy3el
	m6sFnNcVAUpHKhmCnepR+YEFieScUWUSCNXxgNLmP2yuDnRnwo+WQrocJOchZUSCfRLR6FzdciCH7
	zDsLcs2YlSKkW6Kik9fj0HsPG6BWUaCb8jdqQEMfCP/Obv7tXJTNtY+JQL1voWgSPlJqRdLjU4SLV
	q/MI6PRzu+lbP19944A3kBwfuFBMs6c2YyKDfp03o+VqkzegP3b/3dYjt0qFHw5TnqBTB0Nwb8fHv
	uorZz8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHe0i-0000000F4xQ-1efB;
	Wed, 21 May 2025 07:37:08 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdu6-0000000F3v2-0LYK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 07:30:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B3811483EA6;
	Wed, 21 May 2025 09:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1747812612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Jo8cDLQM3XMzIjXRy1b2U7Wev2UzC+Jh4i47p9UAFJw=;
	b=e2Rt85BnKH4vIZC4SMCYgE+VHtVydmzHlADpiI55GysxSWakB+8jM9dwIAslliK4XJ2RCP
	fB1jWqW4sY/NoyY5SmWT/4hwIbCID0H5tDIEJTMoK4wHUyGvU95O82mC7V5LpHVFAqk76D
	j4+jrkZyjhfv7czCa4y+aSIpg4ctlk+ynpoDyqZ9cZe9MbsGFnswGGPO2KU58G7HX9Yqfl
	K1WptAZQMQ4WzWg1ocaRb9OibQ/rHfg3AvBwsOp32hU1Fl4dpMjmCAcv2m8VCNQ3v3fV7k
	dEMdFusTjfZAzfjv1i34ZESVjgRc+Mi8WwpAYMhGPTx5oxrSdduCKUd3A9ov3Q==
Date: Wed, 21 May 2025 09:30:04 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: microchip: sam9x60ek: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
Message-ID: <20250521-sandstorm-uncross-b3917c33371d@thorsis.com>
Mail-Followup-To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_003018_585553_22CA65D2 
X-CRM114-Status: GOOD (  15.23  )
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

Am Wed, May 21, 2025 at 11:13:06AM +0530 schrieb Manikandan Muralidharan:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 2c0a1faa4da5 ("ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> index cdc56b53299d..c1ff3248bd8f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> @@ -609,7 +609,7 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-tx-bus-width = <4>;
>  		spi-rx-bus-width = <4>;
>  		m25p,fast-read;

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex


