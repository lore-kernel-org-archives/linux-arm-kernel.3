Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41826106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTh+JEAzxz4K9Pvi9Mhz71IvQiBPh/GvWQG8E53F+wg=; b=KN7XQlIKN9pmYjE5wTxPVnOdJF
	RJpgGXifiAnNcnyD6hl9n0dLm9hEbnxADPcE0kNg5cyVB2rEvznhZe8getAt5gEOnn2kyVxdmGpYM
	zXTGnAXlLdloaLfdLocSmRt2Ez6n0uMfytLKzrch3CLRo0Qebj7yIQXWrWa+gtbYv0+Ar6PiyDKys
	S1WUXZcxfWk81IM4gwMaRHFhAizNOZGNgqlmxJzykYlFs9NrgX/3VpG2GkeZoxoG7UlnbGES8PCxG
	1zVcz/qMx3Jv9ZQBWvnS8LW2sPOIqBsDooGEfCgjGh7JlvRclPG/9bNAfGmaAoMs/vG5hN9WjV4Kx
	OGtfZksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h0X-000000059VV-0JpB;
	Thu, 26 Mar 2026 09:28:05 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h0S-000000059TM-3U2T;
	Thu, 26 Mar 2026 09:28:03 +0000
Message-ID: <802bc778-9e18-4273-9757-c0d663e8b14a@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774517276;
	bh=hCffSrytymkZsTF+g18yVFG0ugDdfGbOo15ZfjxCRlA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=eQ3/7Ykj9LCvsbKYSiqPnT9GfUx9Eyibc77/pFGLIy68mfwchsIIBIA4mt1YpPzMX
	 qzJhnNCu+i0VUh5RXafyaHWePHRsm3BCaZsY6YTN8ZRBwHqCqzovwcig9uJMe0TfqI
	 xvgmxbihm57B90MJpQ3wb+JUn+BMn80mc8QgNLa4=
Date: Thu, 26 Mar 2026 10:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 9/9] arm64: dts: amlogic: t7: khadas-vim4: Add MMC
 nodes
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
 <20260325-add-emmc-t7-vim4-v4-9-44c7b4a5e459@aliel.fr>
 <512d95b5-5348-4c7c-961c-b6ca1431cee4@linaro.org>
Content-Language: en-US
In-Reply-To: <512d95b5-5348-4c7c-961c-b6ca1431cee4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022801_189686_4ABAF57E 
X-CRM114-Status: GOOD (  12.35  )
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

On 3/26/26 9:54 AM, Neil Armstrong wrote:
> On 3/25/26 10:15, Ronald Claveau wrote:
>> Enable and configure the three MMC controllers for the Khadas VIM4 board:
>> - sd_emmc_a: SDIO interface for the BCM43752 Wi-Fi module
>> - sd_emmc_b: SD card slot
>> - sd_emmc_c: eMMC storage
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++
>> +++++++++-
>>   1 file changed, 89 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-
>> vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index 770f06b0b16c7..5a73ae081036c 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -14,7 +14,10 @@ / {
>>       compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>>         aliases {
>> -        serial0 = &uart_a;
>> +        serial0    = &uart_a;
> 
> Spurious change
> 

Thanks I will keep space instead of tab here.

>> +        mmc0    = &sd_emmc_c;
>> +        mmc1    = &sd_emmc_b;
>> +        mmc2    = &sd_emmc_a;
>>       };
>>         memory@0 {
>> @@ -159,6 +162,91 @@ &pwm_ab {
>>       pinctrl-names = "default";
>>   };
>>   +/* SDIO */
>> +&sd_emmc_a {
>> +    status = "okay";
>> +    pinctrl-0 = <&sdio_pins>;
>> +    pinctrl-1 = <&sdio_clk_gate_pins>;
>> +    pinctrl-names = "default", "clk-gate";
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    sd-uhs-sdr12;
>> +    sd-uhs-sdr25;
>> +    sd-uhs-sdr50;
>> +    sd-uhs-sdr104;
>> +    cap-sdio-irq;
>> +    max-frequency = <200000000>;
>> +    non-removable;
>> +    disable-wp;
>> +    no-mmc;
>> +    no-sd;
>> +
>> +    power-domains = <&pwrc PWRC_T7_SDIO_A_ID>;
>> +
>> +    keep-power-in-suspend;
>> +
>> +    mmc-pwrseq = <&sdio_pwrseq>;
>> +
>> +    vmmc-supply = <&vddao_3v3>;
>> +    vqmmc-supply = <&vddao_1v8>;
>> +
>> +    brcmf: wifi@1 {
>> +        reg = <1>;
>> +        compatible = "brcm,bcm43752-fmac", "brcm,bcm4329-fmac";
>> +    };
>> +};
>> +
>> +/* SD card */
>> +&sd_emmc_b {
>> +    status = "okay";
>> +    pinctrl-0 = <&sdcard_pins>;
>> +    pinctrl-1 = <&sdcard_clk_gate_pins>;
>> +    pinctrl-names = "default", "clk-gate";
>> +
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    sd-uhs-sdr12;
>> +    sd-uhs-sdr25;
>> +    sd-uhs-sdr50;
>> +    sd-uhs-sdr104;
>> +    max-frequency = <200000000>;
>> +    disable-wp;
>> +    no-sdio;
>> +    no-mmc;
>> +
>> +    power-domains = <&pwrc PWRC_T7_SDIO_B_ID>;
>> +
>> +    cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
>> +    vmmc-supply = <&sd_3v3>;
>> +    vqmmc-supply = <&vddio_c>;
>> +};
>> +
>> +/* eMMC */
>> +&sd_emmc_c {
>> +    status = "okay";
>> +    pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>,
>> <&emmc_ds_pins>;
>> +    pinctrl-1 = <&emmc_clk_gate_pins>;
>> +    pinctrl-names = "default", "clk-gate";
>> +
>> +    bus-width = <8>;
>> +    cap-mmc-highspeed;
>> +    mmc-ddr-1_8v;
>> +    mmc-hs200-1_8v;
>> +    max-frequency = <200000000>;
>> +    disable-wp;
>> +    non-removable;
>> +    no-sdio;
>> +    no-sd;
>> +
>> +    power-domains = <&pwrc PWRC_T7_EMMC_ID>;
>> +
>> +    vmmc-supply = <&vddio_3v3>;
>> +    vqmmc-supply = <&vddio_1v8>;
>> +};
>> +
>>   &uart_a {
>>       status = "okay";
>>       clocks = <&xtal>, <&xtal>, <&xtal>;
>>
> 
> With that:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks,
> Neil


-- 
Best regards,
Ronald

