Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF532C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgJc19BHIb1laW7RRmQKMgjNWHVEciBYtzbK/hOpNzM=; b=xqG/lNmYhnrM5EUhwpakq1lj5u
	MWia4TI3NlFUKb+8oxnMrRL2MGbHf4VT5LKAQ0PtJO+cMqIYjTJgo2Jug4C7vQ4SPTs8WK0Y1zIpF
	tayDZlAgtnLOiZaPIj1QcsFeO800JdBdDseAC1E2TmfGIjYJQ/p3MMMEWwMK8WYG7qMBPRTq9/k+B
	mitvhrFMXdaz3DJZILarq0ssbk1mVjyxpz7TnRu4aeV6RUPcPTbYAFvjmTPZohSb8b+rKVxQ/99U/
	fcqq28Y4gAuR5W8WsXMpZ/Y3Pjw+0yiDt9Y8zHhj9PvqdRvA0B0lUzaSnKIdvYP3ZfTwXTjCmP8uA
	GXYk0JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrji-0000000Gj0s-3Tp6;
	Tue, 25 Feb 2025 10:00:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqv8-0000000GWDY-1Zyb;
	Tue, 25 Feb 2025 09:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474484;
	bh=G/+50M2fvc66Y6BosMkvmFsG4ouSWiq1zH7ZcGOkJb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BfWMXTa9I0TI8XsW6I94eEtr8qilAfLD++57kbY1w9ZKR4LDa4bmOsgr4vUnQFVpe
	 a2SSZiEPVnTLtmq9aV5b2RgfArs87tvJG2Qf8x89aPecaaHY5rEA575jJVsBGQBbDU
	 SQKIQo2dkuojNJdI2i+WWj5WcMbWEHQSzT8vExkFIcvlt1FJbxJqE8sM0pllZNXZNX
	 R05meTHsy7Rr1Z8Pypj9vNKNHANyZGXZ9JwP5/SHG9lY/QsZGw+MpZQ9ZU1TtiRxy4
	 Rczhhb59qMOaVKj9O/o8h9wvB9BSEmaF3QCfKRt7N4Go1KpfRBWJJ2Ky3GD/kW7u3w
	 FeOKvyaCZFXDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B97317E0866;
	Tue, 25 Feb 2025 10:08:04 +0100 (CET)
Message-ID: <e278b16f-565c-43e5-ae15-863c9ef3f8fb@collabora.com>
Date: Tue, 25 Feb 2025 10:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: airoha: en7581: Fix clock-controller
 address
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
 <20250221-en7581-dts-spi-pinctrl-v3-2-4719e2d01555@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250221-en7581-dts-spi-pinctrl-v3-2-4719e2d01555@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010806_562725_918163BE 
X-CRM114-Status: GOOD (  12.31  )
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

Il 21/02/25 09:01, Lorenzo Bianconi ha scritto:
> Fix the following warning for clock-controller node:
> 
> DTC [C] arch/arm64/boot/dts/airoha/en7581-evb.dtb
> arch/arm64/boot/dts/airoha/en7581.dtsi:176.37-181.5: Warning (simple_bus_reg): /soc/clock-controller@1fa20000: simple-bus unit address format error, expected "1fb00000"
> 
> Fixes: 7693017580e9 ("arm64: dts: airoha: en7581: Add Clock Controller node")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/airoha/en7581.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index 9a419796594d3a99e1187dcca622469bf5a888c3..26b13694091735da7af977e42f8f546d7d5cb078 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -173,7 +173,7 @@ spi_nand: nand@0 {
>   			};
>   		};
>   
> -		scuclk: clock-controller@1fa20000 {
> +		scuclk: clock-controller@1fb00000 {
>   			compatible = "airoha,en7581-scu";
>   			reg = <0x0 0x1fb00000 0x0 0x970>;
>   			#clock-cells = <1>;
> 


