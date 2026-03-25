Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABECAFEA833
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIKM0Pqt6JXTRGgK3+CrAwsUMh5vc57ulD5sp4R2vyw=; b=pPT1XSqJvVGlUPMzBey8N/yDWB
	YhLaSdURhCDwxbkXzuj0VEO927f3sdpQoazbJ1HWwTk6d3ZWzz8besQiPQxswAoG1Tm5hXR6gRXL2
	QbVDc6+eSoIpgyYGcWszIxr0Swi8zvGaTIKYpulf5D4mlRLhILgUyqceFo7BBnIIWiYUd5FrEGg1f
	Bh4aG2kaCJ8LCZS4gGv93Ppi1Q7bCSKxxVxKEu0Vk/syIJiYWsvVkOaco7h8duT0CXh56/pbwJU5q
	UNHpXeGwvGYS2kogxrCprswRPsXBsb70a47WZjChLIWAYoVcle1cUgPmRmDgS60wbvmhuVmI91EYv
	y1Wfnt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JoN-00000002yFW-22xh;
	Wed, 25 Mar 2026 08:41:59 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JoJ-00000002yCv-2OoV;
	Wed, 25 Mar 2026 08:41:57 +0000
Message-ID: <1be18bd2-f1a3-4d27-b64a-49a8f66ab95a@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774428108;
	bh=lbXbfx2LEXlqwLddF+1Yul7XCpRx3LTNVV2LAxE+NF8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RP6wkINc7X/bMDlfIHaSZLY0h+yk4VJ04Nn1xy7QeG7oD3/eglJDe3cg+DWVwU/dd
	 PJUqhKdd8XYuJZbhCwgR823gDg1BN5+OSr5XBUxQZZ61uiOl6lgQFVwBgTeupYuviA
	 kehDe7HG1zOTIYmiYN+KqJ44lqp3U7FOi6Y+bI2o=
Date: Wed, 25 Mar 2026 09:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and
 SDIO pinctrl nodes
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-1-5159d90a984c@aliel.fr>
 <316efeff-477d-4d8d-9c60-ac7c4e5b9b33@amlogic.com>
Content-Language: en-US
In-Reply-To: <316efeff-477d-4d8d-9c60-ac7c4e5b9b33@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_014156_207332_3513C4A0 
X-CRM114-Status: GOOD (  12.02  )
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

On 3/25/26 3:48 AM, Xianwei Zhao wrote:
> Hi Ronald,
> 
> On 2026/3/23 17:55, Ronald Claveau wrote:
>> These pinctrl nodes are required by the eMMC, SD card and SDIO drivers
>> to configure pin muxing at runtime.
>>
>> - eMMC: control, 4-bit/8-bit data, data strobe and clock gate pins
>> - SD card: data, clock, command and clock gate pins
>> - SDIO: data, clock, command and clock gate pins
>>
>> Signed-off-by: Ronald Claveau<linux-kernel-dev@aliel.fr>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 98 +++++++++++++++++++
>> ++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/
>> boot/dts/amlogic/amlogic-t7.dtsi
>> index 6510068bcff92..ac8de8e9b8010 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -250,6 +250,104 @@ gpio: bank@4000 {
>>                                          #gpio-cells = <2>;
>>                                          gpio-ranges =
>> <&periphs_pinctrl 0 0 157>;
>>                                  };
>> +
>> +                               emmc_ctrl_pins: emmc-ctrl {
>> +                                       mux-0 {
>> +                                               groups = "emmc_cmd";
>> +                                               function = "emmc";
>> +                                               bias-pull-up;
>> +                                       };
>> +
>> +                                       mux-1 {
>> +                                               groups = "emmc_clk";
>> +                                               function = "emmc";
>> +                                               bias-disable;
>> +                                       };
>> +                               };
>> +
>> +                               emmc_data_4b_pins: emmc-data-4b {
>> +                                       mux-0 {
>> +                                               groups = "emmc_nand_d0",
>> +                                                        "emmc_nand_d1",
>> +                                                        "emmc_nand_d2",
>> +                                                        "emmc_nand_d3";
>> +                                               function = "emmc";
>> +                                               bias-pull-up;
>> +                                       };
>> +                               };
>> +
>> +                               emmc_data_8b_pins: emmc-data-8b {
>> +                                       mux-0 {
>> +                                               groups = "emmc_nand_d0",
>> +                                                        "emmc_nand_d1",
>> +                                                        "emmc_nand_d2",
>> +                                                        "emmc_nand_d3",
>> +                                                        "emmc_nand_d4",
>> +                                                        "emmc_nand_d5",
>> +                                                        "emmc_nand_d6",
>> +                                                        "emmc_nand_d7";
>> +                                               function = "emmc";
>> +                                               bias-pull-up;
>> +                                       };
>> +                               };
>> +
>> +                               emmc_ds_pins: emmc-ds {
>> +                                       mux {
>> +                                               groups = "emmc_nand_ds";
>> +                                               function = "emmc";
>> +                                               bias-pull-down;
>> +                                       };
>> +                               };
>> +
>> +                               emmc_clk_gate_pins: emmc_clk_gate {
> 
> Node names should use hyphens ('-') instead of underscores ('_'),
> consistent with the following nodes.
> 

Thanks for your feedback Xianwei.
I will change that.

>> +                                       mux {
>> +                                               groups = "GPIOB_8";
>> +                                               function =
>> "gpio_periphs";
>> +                                               bias-pull-down;
>> +                                       };
>> +                               };
>> +
>> +                               sdcard_pins: sdcard {
>> +                                       mux {
>> +                                               groups = "sdcard_d0",
>> +                                                        "sdcard_d1",
>> +                                                        "sdcard_d2",
>> +                                                        "sdcard_d3",
>> +                                                        "sdcard_clk",
>> +                                                        "sdcard_cmd";
>> +                                               function = "sdcard";
>> +                                               bias-pull-up;
>> +                                       };
>> +                               };
>> +
>> +                               sdcard_clk_gate_pins: sdcard_clk_gate {
>> +                                       mux {
>> +                                               groups = "GPIOC_4";
>> +                                               function =
>> "gpio_periphs";
>> +                                               bias-pull-down;
>> +                                       };
>> +                               };
>> +
>> +                               sdio_pins: sdio {
>> +                                       mux-0 {
>> +                                               groups = "sdio_d0",
>> +                                                        "sdio_d1",
>> +                                                        "sdio_d2",
>> +                                                        "sdio_d3",
>> +                                                        "sdio_clk",
>> +                                                        "sdio_cmd";
>> +                                               function = "sdio";
>> +                                               bias-pull-up;
>> +                                       };
>> +                               };
>> +
>> +                               sdio_clk_gate_pins: sdio_clk_gate {
>> +                                       mux {
>> +                                               groups = "GPIOX_4";
>> +                                               function =
>> "gpio_periphs";
>> +                                               bias-pull-up;
>> +                                       };
>> +                               };
>>                          };
>>
>>                          gpio_intc: interrupt-controller@4080 {


-- 
Best regards,
Ronald

