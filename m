Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CACD7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2S0pjRhXdjGRNqEpDOJ5uLzHOor7LhzgD87kOqy7gms=; b=a7odIjw1qYoVBw4RqBWLO5/Map
	12Ac6Bf/fFXjwle1rCdr9ILapwY1wiMjq/lG1h8shQ4TOq7bbQjIX4EFJp/w7UuBYRaNebbs0Vqmy
	z6TFZzlWpJKxcfYPPWg+ug/+S87I5kcOv0jVu6Bcy5hFHsq5LyTuNIuB5G8ecUBq5ncNTY+EAd9Zi
	1phziL5OYXq69c+o84Qc0EJTz87JDAEhb4IOqrI4YLwzHEigwFZZbRnjWY6zgUks+da/lyZ5H1TSH
	woy+Ti9pmqWR6gO8V+9xltRyh+esqzDZQt904CDEcN0bk0Yb0yuol+5OZ/z/GqVqZlSL1VTAGxoGM
	STjkxZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPRR-00000008whe-0zLm;
	Tue, 03 Dec 2024 09:43:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOV-00000008vvL-22Fi;
	Tue, 03 Dec 2024 09:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218834;
	bh=MzJvlx12NKKjiAgZHOfk0XXECEkWtTXteFRLJ6O9MBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=okF8SQ8EBXtW0i3uAWtClMnke9gWINz/POqh41lzX/5uj8RWgEij+J2gyler0bucl
	 NCoCTNvBqc0plk4L6Q7z7XZM9kTx9vNMzKd0G3lI6qDxOPcS/12KZSC2cpuV9VZDv0
	 hJQaHpr1yBhy5BIcTRctmF1aRV8G5Nt9e6LTWvsztD71OdrHQnrtLGeHCID9dZ3V5q
	 dBg7ZY6Uqdh2hx5kPIi0lz5YVw2BHUxonCm2I2YtgjZ0K8P/SFVCC+5Ot3ygq/XpYx
	 B/Q9yUemTAz3VZu9t32qC6x2gWxSTF7HsiLm0XsmE9MsKvJqT3YRo6PPgIDZtWzwET
	 pj365kgZUUwYw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9441217E35E0;
	Tue,  3 Dec 2024 10:40:33 +0100 (CET)
Message-ID: <a521663e-f2f3-4602-8d0e-2f3841eb080b@collabora.com>
Date: Tue, 3 Dec 2024 10:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/18] arm64: dts: mediatek: mt7988: add i2c-mux on
 bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-17-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-17-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014035_669742_F12F3691 
X-CRM114-Status: GOOD (  12.40  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 

arm64: dts: mediatek: mt7988-bpi-r4: Add PCA9545 I2C Mux

> Bananapi R4 uses an i2c multiplexer for SFP slots, rtc and eeprom.
> Add its node to the right i2c controller.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> ---
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> index 550c373b3d70..9ceefc990000 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> @@ -2,6 +2,7 @@
>   
>   /dts-v1/;
>   
> +#include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
>   
>   #include "mt7988a.dtsi"
> @@ -138,6 +139,45 @@ &i2c2 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c2_1_pins>;
>   	status = "okay";
> +
> +	pca9545: i2c-mux@70 {
> +		reg = <0x70>;
> +		compatible = "nxp,pca9545";

reg goes after compatible... :-)

After which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


