Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3EBCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2mVL4Zohd9jvNMCabsblId5KIIbV38FpX6720+EWlM=; b=2atYqI5GZvAPNZb4bOGEsYjAtg
	4b9bAKgCbY8+SIuh6AEwvKdyQwNsv6Sk0yj2GIXnJufXN3wxHssgwtfrUa9ae6OaUrFwGrJktRlYA
	DWPrVlh21aDu/clSpOa7fLYCDeBMYANpyPyMbkMLLPrEzzzAUE6+2SZAc47ed/HK7OeJxvXOZErGv
	WzNrhawlKckEqNl1QcrKnjDqMYJTZqVYzCpvLIauU6LJDTyikFoFmD6O0mqVaa8tBNwo6kxTg8Ipd
	XYPPk1SnZu68e8GkPT/81u85DCV1NAnlLwvLfjfU3IupbYDAwBDVQIzQx17jC/OE3w/hfi/yHr68i
	VGuU9XlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwC-0000000291I-3kwC;
	Mon, 29 Sep 2025 10:16:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwA-0000000290h-31Nn;
	Mon, 29 Sep 2025 10:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141012;
	bh=8UnAtFRpIMeOSkooXOzCCtQQlybpUNssjgKdWfSNXG0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MrJa+wmBqqiEmFpvmFRf3TUd4pqRwLynG2sCN9aFhlVWroTDdTmDDEGQDfPqO8cin
	 Oz8UDsHkMe5mBHYysK9vNwgV+pejSUSscONTPvRuKgbBpiL75sOp+pyhp8YO3KkmwV
	 p18r9EH0Cegq0E7D+RYCWGrvs0Lney/jbez53jZUh2WUnxGaHZRmCeoxPQx61UcU+I
	 ERx+s1gYBE38bXTrM3jsef5RdGWJt1oKm5ZClPRDjP6dFtg7t8NYctYuDY38KFqqf6
	 iTF7+Eov7CC99ZcpTzK9ZqryS6eeOZNPiDknjhxbqdDLHJ8BDh+9WU7dY6qBNmteeO
	 Jz1O8jxSYLHGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3AE17E0125;
	Mon, 29 Sep 2025 12:16:51 +0200 (CEST)
Message-ID: <de6d7300-acd4-4201-baf5-e7bb89eb5b1e@collabora.com>
Date: Mon, 29 Sep 2025 12:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: Add Airoha AN7583 SoC and AN7583
 Evaluation Board
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-5-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031654_931911_D6271627 
X-CRM114-Status: GOOD (  15.09  )
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

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Introduce Airoha AN7583 SoC initial DTSI and AN7583 Evaluation Board
> DTS and add the required entry in the Makefile.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   arch/arm64/boot/dts/airoha/Makefile       |   1 +
>   arch/arm64/boot/dts/airoha/an7583-evb.dts |  22 ++
>   arch/arm64/boot/dts/airoha/an7583.dtsi    | 283 ++++++++++++++++++++++
>   3 files changed, 306 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
>   create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi
> 
> diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
> index ebea112ce1d7..7a604ae249b5 100644
> --- a/arch/arm64/boot/dts/airoha/Makefile
> +++ b/arch/arm64/boot/dts/airoha/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
> +dtb-$(CONFIG_ARCH_AIROHA) += an7583-evb.dtb

an comes before en.... please keep entries ordered alphabetically.

> diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/dts/airoha/an7583-evb.dts
> new file mode 100644
> index 000000000000..910ceaa6af42
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/dts-v1/;
> +
> +#include "an7583.dtsi"
> +
> +/ {
> +	model = "Airoha AN7583 Evaluation Board";
> +	compatible = "airoha,an7583-evb", "airoha,an7583";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x2 0x00000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts/airoha/an7583.dtsi
> new file mode 100644
> index 000000000000..77b8590e242b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	cpus {

..snip..

Sorry for not catching that in v2 - please move the PSCI node here, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



