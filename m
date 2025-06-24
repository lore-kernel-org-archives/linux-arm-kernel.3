Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB6AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjzFE4fmyDlXVsPYzogdifl8Zzt69qws0co4hN/MNgM=; b=Wf09V3yV2Y0RtoaPYyLNoPRYK2
	b98myEkKu6TgitqVt1qkyqONQ01djYJ/KFXA1nQ457yThaPS/p3MerqZYTFnyuw6sD2My2kU30xuY
	ZTHrLQ6SfzWAdRienarNj8apm+l2dELnHe+BjFVTuPsxw36+EzxaR2QtU/rCMcaVbXREAUVNGVd8V
	HFarOXPEehpfOcCLEwbuFo3DejVDKCyYBmIhPtcUuLbOS2C7slSI2P37VcEcyrifpP1YFBHGhsqL6
	VpUFv5beGQI6IKsYLJYGMfbeuNWlYR9D7gp5Y4nhMZiehBZk/0g8rsCpcOxK/FCqM/9+4d0poVTMu
	p9iwkRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzpC-00000005A5Q-2lPW;
	Tue, 24 Jun 2025 09:20:18 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzgo-000000058hW-1HK6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:11:39 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O9BY3S1512476;
	Tue, 24 Jun 2025 04:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750756294;
	bh=HjzFE4fmyDlXVsPYzogdifl8Zzt69qws0co4hN/MNgM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=igmHt30sOLkziNmUmT6sM0zt8tmlv6S351SuqYBNh6XZIs/5aewpKI0DjtOrTuoea
	 GjosJGDB3ggtYFUfdJCpNyc+BdHxYaqc3bh7e9jnY4q85njgocoX7kE44RDwcyepOq
	 17XGQ8I7aMAaTZxwVi5a5uNHY+bcQnCyFU6O3nBw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O9BY884077631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 04:11:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 04:11:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 04:11:34 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O9BTNd1246614;
	Tue, 24 Jun 2025 04:11:30 -0500
Message-ID: <15530643-04a1-4c3d-9879-56d668a59667@ti.com>
Date: Tue, 24 Jun 2025 14:41:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 6/6] arm64: dts: ti: Add eMMC support for AM62D
To: Bryan Brattlof <bb@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-7-p-bhagat@ti.com>
 <20250623142859.fankjmvhdo2bxjgd@bryanbrattlof.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250623142859.fankjmvhdo2bxjgd@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_021138_476557_E07E6AEE 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Bryan,


On 23/06/25 19:58, Bryan Brattlof wrote:
> On June 23, 2025 thus sayeth Paresh Bhagat:
>> Add the necessary device tree node for eMMC controller along with the
>> required pinmux configuration.
>>
> Could this be squashed in 4/6?


Yep will do


>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 27 ++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> index c98e4c98c956..5ceecdd68b3f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> @@ -20,6 +20,7 @@ aliases {
>>   		serial0 = &wkup_uart0;
>>   		serial1 = &mcu_uart0;
>>   		serial2 = &main_uart0;
>> +		mmc0 = &sdhci0;
>>   		mmc1 = &sdhci1;
>>   		rtc0 = &wkup_rtc0;
>>   		ethernet0 = &cpsw_port1;
>> @@ -226,6 +227,22 @@ AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
>>   		>;
>>   	};
>>   
>> +	main_mmc0_pins_default: main-mmc0-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62DX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
>> +			AM62DX_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB7) MMC0_CLK */
>> +			AM62DX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
>> +			AM62DX_IOPAD(0x0210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
>> +			AM62DX_IOPAD(0x020c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */
>> +			AM62DX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (AA7) MMC0_DAT3 */
>> +			AM62DX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (Y8) MMC0_DAT4 */
>> +			AM62DX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
>> +			AM62DX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
>> +			AM62DX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>>   	main_mmc1_pins_default: main-mmc1-default-pins {
>>   		pinctrl-single,pins = <
>>   			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
>> @@ -397,6 +414,16 @@ &main_i2c2 {
>>   	clock-frequency = <400000>;
>>   };
>>   
>> +&sdhci0 {
>> +	/* eMMC */
>> +	bootph-all;
>> +	status = "okay";
>> +	non-removable;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&main_mmc0_pins_default>;
>> +	disable-wp;
>> +};
> Make sure we follow the ordering of these properties:
>
>      https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node


Will fix this. Thanks


>
>> +
>>   &sdhci1 {
>>   	/* SD/MMC */
>>   	status = "okay";
>> -- 
>> 2.34.1
>>

