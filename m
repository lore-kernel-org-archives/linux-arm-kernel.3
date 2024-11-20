Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D2D6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjpPK68PQOm4DC5SyCfXBWyJnqzrtZAFcDvcGSdAruA=; b=SXi1i4DAsvYZEfBhDhD9ByL7UN
	oxbpZjJHJreO9FItavp2CeC0Gk+M2jv9YBpPzcrTKbPrksUfGnDVP7dvWVK+ic1LBR7OApQ70ySWI
	DR5qWto2raroEMKhRHiD1tSpbtk1uP8USpD9dD/XIURNIqTHx+qEgS7qsdy5U8u01fd4eWDTk+u9i
	AYnvGnU4TJCK1Fav/ZUarjdvWsK2VGymWMYFczOCCqBLOi28pJRHy/0n3O9Ax1Jsod2YxnZYD5Spl
	rj0gaEYEaEU3k1xLMNl8AGPE0dseQ1c6ETgOtp3DQgwQU9HgbCEKQVehQ3+uq23aBQ8rKKYZug6Ez
	fTEv4FPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgkK-0000000Ernp-0j4q;
	Wed, 20 Nov 2024 09:11:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgjN-0000000Ereg-27f3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E1C4A42DA9;
	Wed, 20 Nov 2024 09:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7D8C4CECD;
	Wed, 20 Nov 2024 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093836;
	bh=1jaJsKKteL7Dxc/ZzChtUpKlevAAkZGk4u0JO8qXnyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJNPQP8UGS9y+f6JhF/4MX8qu2oPIklJkzHRwsKj/Oy3v+YBstHyeVr4rXP/7r0Cs
	 eKVJiPu+ipywRwip5oqqzwdRM7xlbvEoNsc2oLyCM5yj4hMqUxOkw2kn3etYApzuHt
	 gAkqtK5xqaUDJAqOBKwD1f+zJfqTfyvenJjCShF+ULsPjxWTsiiir1EajZS2ESTTSt
	 x5gsxsw6vGc1OhdNqmC/pQsuPL2sn9zV6cEDBp9zRq7gK7kNDKkBPUZWzQS5RbPXC1
	 /tfYCLoxKAkUzb5/ejG30rrJguZbAGkya44zn8NaoQsFI7CJPWLLyPPVPTbzMTrOel
	 +8DmOulLDgW4g==
Date: Wed, 20 Nov 2024 10:10:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 11/15] ARM: dts: microchip: add sama7d65 SoC DT
Message-ID: <ishcitppbc7asngzpp5dl3htkitxpeu3dgtmz44swcg2h7dmup@zc2etw2hrsbg>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <1006a1e4464ef7c46b33ad44bf71b3143283ee6e.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1006a1e4464ef7c46b33ad44bf71b3143283ee6e.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_011037_608240_615316D9 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 09:40:17AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add Device Tree for sama7d65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Totally confusing SoB chain. Please read carefully submitting patches.

...

> +	clocks {
> +		slow_xtal: clock-slowxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		main_xtal: clock-mainxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	vddout25: fixed-regulator-vddout25 {

s/fixed-//

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VDDOUT25";
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		regulator-boot-on;
> +		status = "disabled";
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		pioA: pinctrl@e0014000 {

labels are lowercase.

Best regards,
Krzysztof


