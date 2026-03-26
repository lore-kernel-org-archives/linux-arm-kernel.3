Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB1106F311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpzHl03ciJK9M2uJGNWdjRnjvdDhFJXZM5rziKYcUZA=; b=ilSa3qEZqu8m54WrwVOJztC1b4
	X08w2zBvYkswwNCUCwnTFmUMSDDe8okxuaIzKzdek2c4FDxVsIqxVTjUUeMZrsGnl51afy3RBMmT2
	NGHgkpaP0szrld4un8ZXtvNW09+vF0iLgpyag6qkEeLyl8NEo3MeLXGD7a5ypN22e8BydVch2ejZU
	4X4iEOEoG38BE0Wa/jeTSSSOYzhqpMHS8IDiJZjhvBC2iQR8IwwGlvFlkczNrUcmbFmPCU/UXqIhg
	uIFNwVtDr/cGp1+5IyidaC68c23RtvrFwsJgQuY6HtA/ON4hQyHSKWlSbKbj7FdgD7NujZgSZqnPG
	8kC5uO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5guF-000000058Hc-28mD;
	Thu, 26 Mar 2026 09:21:35 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5guB-000000058G4-3RQe;
	Thu, 26 Mar 2026 09:21:33 +0000
Message-ID: <3e99df2d-b569-4542-bae7-6da69077c6f4@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774516881;
	bh=2YaYUbMMIxfIM/eW1LcT+WvPOTT5iE3ZIsUBYpytHd8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=DLHP6k5baF5AyGc4dYc8Fd+av78eTCJt05sovXqCIPmDP8TRST1BZFzhtR8b8QH1o
	 icdEuVQR/9j+v4+H9yNfIEHN1IAodzWshk6d+jPCCu437OaOwtVC6yxFqJpaNS4SwR
	 GFvN7gMBxi0oGa0Sf7JWcw6HfOy93flNX4bkIcaA=
Date: Thu, 26 Mar 2026 10:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and
 SDIO pinctrl nodes
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
 <20260325-add-emmc-t7-vim4-v4-1-44c7b4a5e459@aliel.fr>
 <5298e691-99ba-48fc-874b-c9af308664ee@linaro.org>
Content-Language: en-US
In-Reply-To: <5298e691-99ba-48fc-874b-c9af308664ee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022132_447707_F7C11008 
X-CRM114-Status: GOOD (  11.51  )
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
>> These pinctrl nodes are required by the eMMC, SD card and SDIO drivers
>> to configure pin muxing at runtime.
>>
>> - eMMC: control, 4-bit/8-bit data, data strobe and clock gate pins
>> - SD card: data, clock, command and clock gate pins
>> - SDIO: data, clock, command and clock gate pins
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 98 +++++++++++++++++++
>> ++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/
>> boot/dts/amlogic/amlogic-t7.dtsi
>> index 6510068bcff92..016b5429c8d1b 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -250,6 +250,104 @@ gpio: bank@4000 {
>>                       #gpio-cells = <2>;
>>                       gpio-ranges = <&periphs_pinctrl 0 0 157>;
>>                   };
>> +
>> +                emmc_ctrl_pins: emmc-ctrl {
>> +                    mux-0 {
>> +                        groups = "emmc_cmd";
>> +                        function = "emmc";
>> +                        bias-pull-up;
>> +                    };
>> +
>> +                    mux-1 {
>> +                        groups = "emmc_clk";
>> +                        function = "emmc";
>> +                        bias-disable;
>> +                    };
>> +                };
>> +
>> +                emmc_data_4b_pins: emmc-data-4b {
>> +                    mux-0 {
> 
> No need for "-0"
> 

Thanks I will change that for the three nodes.

>> +                        groups = "emmc_nand_d0",
>> +                             "emmc_nand_d1",
>> +                             "emmc_nand_d2",
>> +                             "emmc_nand_d3";
>> +                        function = "emmc";
>> +                        bias-pull-up;
>> +                    };
>> +                };
>> +
>> +                emmc_data_8b_pins: emmc-data-8b {
>> +                    mux-0 {
> 
> No need for "-0"
> 
>> +                        groups = "emmc_nand_d0",
>> +                             "emmc_nand_d1",
>> +                             "emmc_nand_d2",
>> +                             "emmc_nand_d3",
>> +                             "emmc_nand_d4",
>> +                             "emmc_nand_d5",
>> +                             "emmc_nand_d6",
>> +                             "emmc_nand_d7";
>> +                        function = "emmc";
>> +                        bias-pull-up;
>> +                    };
>> +                };
>> +
>> +                emmc_ds_pins: emmc-ds {
>> +                    mux {
>> +                        groups = "emmc_nand_ds";
>> +                        function = "emmc";
>> +                        bias-pull-down;
>> +                    };
>> +                };
>> +
>> +                emmc_clk_gate_pins: emmc-clk-gate {
>> +                    mux {
>> +                        groups = "GPIOB_8";
>> +                        function = "gpio_periphs";
>> +                        bias-pull-down;
>> +                    };
>> +                };
>> +
>> +                sdcard_pins: sdcard {
>> +                    mux {
>> +                        groups = "sdcard_d0",
>> +                             "sdcard_d1",
>> +                             "sdcard_d2",
>> +                             "sdcard_d3",
>> +                             "sdcard_clk",
>> +                             "sdcard_cmd";
>> +                        function = "sdcard";
>> +                        bias-pull-up;
>> +                    };
>> +                };
>> +
>> +                sdcard_clk_gate_pins: sdcard-clk-gate {
>> +                    mux {
>> +                        groups = "GPIOC_4";
>> +                        function = "gpio_periphs";
>> +                        bias-pull-down;
>> +                    };
>> +                };
>> +
>> +                sdio_pins: sdio {
>> +                    mux-0 {
> 
> No need for "-0"
> 
>> +                        groups = "sdio_d0",
>> +                             "sdio_d1",
>> +                             "sdio_d2",
>> +                             "sdio_d3",
>> +                             "sdio_clk",
>> +                             "sdio_cmd";
>> +                        function = "sdio";
>> +                        bias-pull-up;
>> +                    };
>> +                };
>> +
>> +                sdio_clk_gate_pins: sdio-clk-gate {
>> +                    mux {
>> +                        groups = "GPIOX_4";
>> +                        function = "gpio_periphs";
>> +                        bias-pull-up;
>> +                    };
>> +                };
>>               };
>>                 gpio_intc: interrupt-controller@4080 {
>>
> 


-- 
Best regards,
Ronald

