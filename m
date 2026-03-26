Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D3106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LR2+1/WsOHJjnUzxosgKxnqh2mlLlOM/VmojtjAXa0=; b=2v4grhEWDhGJiFQSCY3S0zjs/+
	2yEObUIJ9QdhbHWfG3otlnwwSxvusDDCHyHZZP1EXfklh6ODUyOCpXDV+mcivuDi6JmtvdjgPpOts
	QGs/10Sp1wQHRjxc3t3hZFQyd5PWbmuNzLUp+CyuaYKAQ+krcUDCKTtD8YxHnqqv29arZUGPivHAl
	/DaQlkrxBIapBG4AS9CSda37ir6j6uaWBqj/LeRHkoy63xxk2kQVjwrlz6ddkBfYzBtb0IeIRINyZ
	WLn5GsTEELIMHNUFnsc5b3gZUiB6U/1+2PPH0dqwzJLhBgXTqiD++zSHvaiQT0ShY9hYMoXK9W2tF
	g33PZJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gvF-000000058bH-0XSU;
	Thu, 26 Mar 2026 09:22:37 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gvC-000000058Zi-1LHZ;
	Thu, 26 Mar 2026 09:22:35 +0000
Message-ID: <8e722981-db67-4529-abdc-ea7dec02e5ba@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774516950;
	bh=T5Gnu4yLDY6S9iBMZo1e1nUZtHu8V8m/kPrwHC6rWMQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=pGEt6BspYwu2UBwjNusLubOi0aBAOaebCYF1iZEVI2/fKnASLYTxiNuRzwLV56N+P
	 CIH3Iw2pgoIiGo/WnTcUavi4C1vJ6ip4/FlOHTQmawnRM1d2z/uzY9JYURnjCzmhlj
	 2hLxwsSOpfSQ2PQZ8xlR2w+XICSS2T/jT+wqc714=
Date: Thu, 26 Mar 2026 10:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-3-44c7b4a5e459@aliel.fr>
 <4b2ba22d-7d0b-4c71-ad83-46d198718fec@linaro.org>
Content-Language: en-US
In-Reply-To: <4b2ba22d-7d0b-4c71-ad83-46d198718fec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022234_651270_0CC1AB98 
X-CRM114-Status: GOOD (  12.00  )
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

On 3/26/26 9:52 AM, Neil Armstrong wrote:
> On 3/25/26 10:15, Ronald Claveau wrote:
>> Add device tree nodes for the three MMC controllers available
>> on the Amlogic T7 SoC, using amlogic,meson-axg-mmc as fallback
>> compatible.
>> All nodes are disabled by default and should be
>> enabled in the board-specific DTS file.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 39 +++++++++++++++++++
>> ++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/
>> boot/dts/amlogic/amlogic-t7.dtsi
>> index 016b5429c8d1b..62c87d0ef7065 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -374,6 +374,45 @@ sec_ao: ao-secure@10220 {
>>                   reg = <0x0 0x10220 0x0 0x140>;
>>                   amlogic,has-chip-id;
>>               };
>> +
>> +            sd_emmc_a: mmc@88000 {
>> +                compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>> +                reg = <0x0 0x88000 0x0 0x800>;
>> +                interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>> +                status = "disabled";
> 
> move disabled at the end of the properties
> 

Thanks I will do.

>> +                clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
>> +                     <&clkc_periphs CLKID_SD_EMMC_A>,
>> +                     <&scmi_clk CLKID_FCLK_DIV2>;
>> +                clock-names = "core", "clkin0", "clkin1";
>> +                assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
>> +                assigned-clock-parents = <&xtal>;
>> +            };
>> +
>> +            sd_emmc_b: mmc@8a000 {
>> +                compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>> +                reg = <0x0 0x8a000 0x0 0x800>;
>> +                interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>> +                status = "disabled";
> Ditto
> 
>> +                clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
>> +                     <&clkc_periphs CLKID_SD_EMMC_B>,
>> +                     <&scmi_clk CLKID_FCLK_DIV2>;
>> +                clock-names = "core", "clkin0", "clkin1";
>> +                assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
>> +                assigned-clock-parents = <&xtal>;
>> +            };
>> +
>> +            sd_emmc_c: mmc@8c000 {
>> +                compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>> +                reg = <0x0 0x8c000 0x0 0x800>;
>> +                interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
>> +                status = "disabled";
> Ditto
>> +                clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
>> +                     <&clkc_periphs CLKID_SD_EMMC_C>,
>> +                     <&scmi_clk CLKID_FCLK_DIV2>;
>> +                clock-names = "core", "clkin0", "clkin1";
>> +                assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
>> +                assigned-clock-parents = <&xtal>;
>> +            };
>>           };
>>         };
>>
> 


-- 
Best regards,
Ronald

