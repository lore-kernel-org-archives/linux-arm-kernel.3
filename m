Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D74BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ERcOxWqZK2s9Zl5gF+2Fed3FonQ1z+McCLFpzNtfeQ=; b=yINGPj9H/ZJfOZb8wkFn0B24nt
	9TLoVUTfvyXUUXdqb951Gz4eDnP35O8OIyth6c2eSGt9gSK3rtYriiQEyRRMoI46sjWjn639Ih9YS
	AmEguCOnDnN5vRZO8i6bLpT2EqUIvQnY8RD4OzYQeWtO0eKIlOU8OhAdQmMjjjCmxhhHggVWzfOS6
	t+p+0xwkbytG/LtU6wVrkXenv3DgSCsymRwzvcub+nc5GDKRGEw2SrZzDKGpX+GFjrUzuhmAbRD2A
	Aj/o9wJeD0hbZui6KiNiQgOZbs7HUm5DM4UkJ/xURidGqvm4CVFdpPYwgQbwvT9zIeUKAgOl/OagO
	uZfadNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D4x-0000000CVJZ-1rxs;
	Mon, 13 Oct 2025 07:34:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D4u-0000000CVGw-11SY;
	Mon, 13 Oct 2025 07:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760340879;
	bh=jELERBOJppm25MX9y7DHHg/4rSErHwNgm6Itxp2BQsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HBoiU0ZybLiP+XO19r6eDNk2iMlwQruWbY1at5TfKuTa0fj6ztBSG2C0+l2CH3woE
	 GW2KIL/hXMcDUAfecrht99owWFT2o7aDnZpYf8SAywaRD7W1Cvn08sdMcXiWOHUJJf
	 raURBuovOs89E/5azvgJbL73/IONu/cKE1CPuwffbZ+hjAvS9RqIX65DZIMBQttWaq
	 b0Qp+Ko6awAJcyWQXuFD6/7Cd8NXQmuPumCNjON8M9d4UUsnZukIGhEZsZbB0L9HeK
	 Ib3Ry1+cQqbQMmEUHe4+ZKM4ZAqIHkVZjR7VPb7K/BepAlnhvU4s5/XwfFB4ptRKuC
	 tOpZhyn6GGEjg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EA7317E1292;
	Mon, 13 Oct 2025 09:34:38 +0200 (CEST)
Message-ID: <11e3c3f0-005e-4ef6-9edd-136c1b956638@collabora.com>
Date: Mon, 13 Oct 2025 09:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/16] arm: dts: airoha: en7523: add SNAND node
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
 <20251012121707.2296160-17-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251012121707.2296160-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_003444_479983_5C4D1E60 
X-CRM114-Status: GOOD (  11.89  )
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

Il 12/10/25 14:17, Mikhail Kshevetskiy ha scritto:
> Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>   arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
> index b523a868c4ad..31191b8d1430 100644
> --- a/arch/arm/boot/dts/airoha/en7523.dtsi
> +++ b/arch/arm/boot/dts/airoha/en7523.dtsi
> @@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
>   			#interrupt-cells = <1>;
>   		};
>   	};
> +
> +	spi_ctrl: spi@1fa10000 {
> +		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
> +		reg = <0x1fa10000 0x140>,
> +		      <0x1fa11000 0x160>;

reg fits in one line, but in any case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +		clocks = <&scu EN7523_CLK_SPI>;
> +		clock-names = "spi";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		nand: nand@0 {
> +			compatible = "spi-nand";
> +			reg = <0>;
> +			spi-max-frequency = <50000000>;
> +			spi-tx-bus-width = <1>;
> +			spi-rx-bus-width = <2>;
> +		};
> +	};
>   };



