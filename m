Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A66C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG9IH65XypfCAd/Nj6Z7NZAQdDapw3NbVOoaxeRscxg=; b=Fbe/9lXC7GAMBGmTqr2sjHCldm
	svB/r1Lqlg5pf7G3GMh7TVDY1rHbzYjfxnU95GEl7uXW8CPBDpvbgB2sQ9I4WOjXKaYpu+gTqlJ/r
	vmPta0hvcJ52LqN4PokzPbFuwNQYE/UlMknPOgGUxWOxrgnR3Ob4utW2E50QeMi3PqXlF3Ur89Z/j
	JQzWYC/erZvejEDRBaRbLaHGHP4SpGicQVbQBmihPPCDBP+Wf/hOwnR50mXLREz6BSrxHIwV3maTE
	scQbRvwDac+JeHFxQBOHxJt007t8D+Knbjfw+30O1G3ZIwnyIQwGTbNA29KyzzNHpaZuSP2Wio2j1
	tQDjy8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGxk-0000000F5w5-2VQy;
	Sat, 01 Aug 2026 21:09:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGxj-0000000F5vm-0yuM;
	Sat, 01 Aug 2026 21:09:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E43774341E;
	Sat,  1 Aug 2026 21:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83271F00AC4;
	Sat,  1 Aug 2026 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785618579;
	bh=HG9IH65XypfCAd/Nj6Z7NZAQdDapw3NbVOoaxeRscxg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Cjc3+Gfy0Y/N4Bfrfpsi84q8fG+NeA0OGt0vQnwJQqSvnSrOEMnKW7/YsWrRESrtb
	 rPftNeXy3tLj0X5BP4jmuI2QkrdZRPWN6fcbiKNLu42E012z5MGs/siPFUeZUXKwX9
	 fhGVNxecXNOmU97gd+2icWTGHk1wPPYtUd4/ZwhRWsnHiy6zGucuUAKHRKG9p1c7kb
	 AzjjFvJhE7tcqpTssp9MCiaZr7mpe/6JoWLSCYzYMh66x+mRDfo6xooQ+ujwV7jKgJ
	 or9DPGGoj7FT4QIzlIz+wvrQftMLcCAlcXFBXxRml6233VeHfDmXbrmvYqX4PS/aTv
	 amE/VtrmnTryQ==
Message-ID: <d00e0a4f-2065-4f37-b499-c27b6698c897@kernel.org>
Date: Sat, 1 Aug 2026 23:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 01.08.26 23:02, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Acked-by: Sven Peter <sven@kernel.org> # for apple dts


Thanks,


Sven


