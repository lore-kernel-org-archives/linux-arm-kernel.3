Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888EBC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMuxhfaknBq5QjhLYVGrFXr0U+Y0NiHMcVJiOgD3Vkw=; b=EplLoO3Ukh1G0H95DxxDAd0QzN
	Z9wKRehwAAYOdTiVMVZzneExTuPIqRh6rtEX0NaRi5zVpoM5VdQLJzymN1+ATvopY6HPtmdAMsTmK
	YTmALTVXn5YVbFFNlMM7ZpMBXxfSSJ/Veo1swlNlV88rQS7MVYDpEW7+ar+KeWa9Y3CmucM7NjZZS
	RRSzSV2Zkv0SSNhZnds+LgLigOV4lYdbF/gZT4RZdwZKjWUlMOwwO4KRgve83Kqv5HasmDDjHN2n3
	51LsfYMRbdbIFWil71lGVoRmhOiH1zYnbFBKyXrEcqUIUgVuiDQ4MGTSnfsBG2HbmHYOmT+Xg2ATC
	DIuEh7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj9a-0000000DAHq-16iz;
	Tue, 14 Jul 2026 19:50:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj9Y-0000000DAHa-2LaO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:50:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02B9860103;
	Tue, 14 Jul 2026 19:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11941F00A3A;
	Tue, 14 Jul 2026 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058651;
	bh=cMuxhfaknBq5QjhLYVGrFXr0U+Y0NiHMcVJiOgD3Vkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TOKbhNSmby1ttQf6TaPpN5uWolvANg04bDbsf/ppCud8DtfTX/2x+jayxhmL8GHOF
	 mEOueQIWBC8dkXo9sBmFZGphDd5Hzko6mOov+uPOUh4GCML09iX2QtubjbAjeQDrzE
	 +qKPOgBGibQuLc5MKjnpDYOAshWSqTtL7NpgX9nbT7YL77TLpb9lIwaq2Er66m5ti4
	 TsqPv9j/MFs3aylUX1baQ+wQCmsuhyT+e7vpL31zuenbqSlHqwEOLmPPHXs0Yc7vId
	 770PdPa/vdKgc3ewCTbTWtpkW6jrOgnmsQbWYO1WPBmB3G2K2s/59ilmFsNiNT+7SC
	 qXwc4A2YzJDpg==
Message-ID: <cd9da9aa-6e91-4534-a86c-a4421aafbd38@kernel.org>
Date: Tue, 14 Jul 2026 21:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dt-bindings: arm: apple: Add M4 based devices
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Thomas Gleixner <tglx@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-9-e5655ee56523@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-9-e5655ee56523@cyberchaos.dev>
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



On 7/5/26 15:17, Yureka Lilian wrote:
> The Apple devices with the t8132 SoC (M4) are very similar to their M3
> predecessors.
>
> In addition to the MacBook Pro and the various MacBook Air and iMac
> variants, a Mac mini is offered again with the M4.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>   Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> index e49403c73f9d..3262292252d2 100644
> --- a/Documentation/devicetree/bindings/arm/apple.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> @@ -315,6 +315,18 @@ properties:
>             - const: apple,t8122
>             - const: apple,arm-platform

Please also add M4 to the top of the binding in the description.
>   
> +      - description: Apple M4 SoC based platforms
> +        items:
> +          - enum:
> +              - apple,j604  # MacBook Pro (14-inch, M4, 2024)
> +              - apple,j623  # iMac (24-inch, 2x USB-C, M4, 2024)
> +              - apple,j624  # iMac (24-inch, 4x USB-C, M4, 2024)
> +              - apple,j713  # MacBook Air (13-inch, M3, 2025)
> +              - apple,j715  # MacBook Air (15-inch, M3, 2025)
Copy/paste errors: these two should be M4 as well and I think the ones 
at the top should be 2025 instead of 2024, shouldn't they?


Best,

Sven

