Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCD3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpB4+B0STpdWq5p7qAYd4O9b5LCMwgEs5C5jifN5O88=; b=jHfgJgWbrkHPq9nd/8gpW9vccp
	lLQ8MmaQkM/02UF34Koye2mI9XH2nhVL6wcbnfB5fiva8lVfLxGACkG2YlSfe5xPiYLpz42nPONTU
	8FRNZ9WWC+QNSSoUhw30KdtUAqdhGXtccWlAmaLPD/UTQ54r0L2YB6w1cOdueonlVi7IPuqVPQVLd
	O43tijgXBsNMSsVaUQv+VzyegVeXrqhs2eZ9wnO4ZbxsGCPp2KYj6XAdouPsdDItIifckSGd28C63
	P01++MQCZlSc3rnqAz3IixxICGRy/Ansh1sln9i4pchIKiE9G+D6OOO4F5VjH/u76YCNFUQHgK0iU
	Ue3DXjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6a-0000000Dt8L-1lMO;
	Thu, 10 Sep 2026 09:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6Z-0000000Dt7T-3n33;
	Thu, 10 Sep 2026 09:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xpB4+B0STpdWq5p7qAYd4O9b5LCMwgEs5C5jifN5O88=; b=FV7R5r5Mo4TsbWJ+9DO0p2/St3
	lttUirBQaaTh++Nazgjmdi+OK2vwtvv7mTdXnDhcB55aL9uKBG83jmeF0cDK6MvIQ+iRDsNex654E
	/JnXCCWCXohTN+UXkOr81i/DzyrYnWThb9vKAGFZ41AkbX+S1lMUoC52xw3SA0WoVsX+eGDkvkRFK
	LpQg2lEh1c/YjuLaMwpOQ0LjLR/0mfeI2QWuxirVTE08OYqPd/F6VMrWipqxWMbn58H0aK8se9vGq
	tTBZJqNf4NRoTy5F5+hVRsSTfshI1BYLdNtfEuV1P9qXkVp1Mia+LhyYj9xAxVapJxCvego6uGjOo
	pyYJ0iXA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4b6W-00000002GR8-3lOm;
	Thu, 10 Sep 2026 09:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032599;
	bh=IYAf/0uTqDEHjYUNJHPrzwYkqDC7PC1hMbv3pif6maY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V3qdTsOz1DbFEG4Q56tPCGZK2r12HcgpwcsQqMmzqiqiFMg3ZwlQJfxpvLyVo1CWA
	 OU1uJ6t5sAYdcYTQDFdWF2L5hctJ3IOwqVz4U6Uzw/ISmvO5/DfETz8I53ka5WQTpa
	 rccPnXVy8L6esVPEmpwQCBtxoEIEq+9FVKjjUzmGiRQg4EprW5gtVgrLfcVbetUUHl
	 VxroTCPPXzP/0g2/f51kXqDTi4ijRNdS8SPFFzKdOhPw15jzNOluR8/iHuzhgQ8cl0
	 Y6ag4DvBb7V76zs+hNJ1fG3j7HshCJfLgTFzEPYJGV1sE6kzaOmSfQBjMsBVxEgNxe
	 r3LfszAsOwODw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB25517E0C7E;
	Thu, 10 Sep 2026 11:29:58 +0200 (CEST)
Message-ID: <71d15182-c90c-4c50-902c-1d14af9ed54e@collabora.com>
Date: Thu, 10 Sep 2026 11:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] ARM: dts: mediatek: mt8127: Add watchdog support
To: zkh@mailbox.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, zkh1@proton.me
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-3-e9af5c420ab1@mailbox.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-3-e9af5c420ab1@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_103001_290508_D5DB64D5 
X-CRM114-Status: GOOD (  14.00  )
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

On 9/9/26 21:38, Zakariya Hadrami via B4 Relay wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add watchdog node and disable it by default as it was not present
> initially.
> 
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
> ---
>   arch/arm/boot/dts/mediatek/mt8127.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
> index bd61ec7e70c0..3e23673e7a9e 100644
> --- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
> @@ -99,6 +99,13 @@ soc {
>   		compatible = "simple-bus";
>   		ranges;
>   
> +		watchdog: watchdog@10007000 {
> +			compatible = "mediatek,mt8127-wdt","mediatek,mt6589-wdt";

Missing space:

compatible = "mediatek,mt8127-wdt", "mediatek,mt6589-wdt";

After fixing,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: If you send a v5 between now and now (or next week too :-P) I can pick it
in this cycle.

Cheers,
Angelo

> +			reg = <0 0x10007000 0 0x100>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
> +			status = "disabled";
> +		};
> +
>   		timer: timer@10008000 {
>   			compatible = "mediatek,mt8127-timer",
>   					"mediatek,mt6577-timer";
> 

