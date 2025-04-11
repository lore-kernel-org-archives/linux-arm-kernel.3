Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76094C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI8FHf14Y+sqMibjaHgB7Q6ItmSZABiqXD9Yshs+5ik=; b=rTqSkbjS3Z/N2f7MbAdgN0hJri
	t33Wl1lYjeBdOAP0zPbYO2BwSz2Ax5elxfoH6unkozK99qj6j9dLhEUusMq1EQjvmj+kI5jIUeZKl
	DBtP3Q/VSlkHl3wtzMqGk8PLbws9t42FoZfqxAHz1xOsjqwzbzckM1Bfu1uPyJx9nRlqdxoODzkWx
	T2V4A3njs0MJnrx8BZVtNLJAxFz1cy0ITUAONSYF1s5a3IGlpL6oNs8OxHtPqEg3m5RQ8PD/1wwZK
	LT+JTMYmoYX9N6/6a73KBL2Rsdx4Xa18/+VNeXvLTVL1im3P1cCbawGJ7I7PTvHOxz0axZrjgL8qM
	C9KF/h9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39TI-0000000Cyor-3RbU;
	Fri, 11 Apr 2025 08:10:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39RV-0000000CydT-2Itj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 08:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WI8FHf14Y+sqMibjaHgB7Q6ItmSZABiqXD9Yshs+5ik=; b=TFJUkzk0tJPFi/TMO+QrDNP/Lk
	wzRDHJQjgCXYc4GIsiZnfMstkHXGN8DBI+XTHtgh/7oKZ4buVdBMClpYKDhQ8t3jVIJgKElAqjrIB
	FLdkgD7ZzQ62dtm1s4vsNeijgv1GAK3amUXufGL44FEfiIbkxU/g9YgyHJ+LRr87JsVhxRbzrLSmL
	zMGgTkJw0d7/q7bnkiBPw8MrGYWofTYQc/P/Xm/VkVOCCDZMtE+Jb7hqv9eEEBsoyyuRDHT4SU/sk
	8f0Uybq+G5vqOJ4L70X029BgblI8IvoOSQEcDIbHcnSHC0208Xh9abiUz8naTNzjFdX+1nL2Y3SGz
	u9G2bczA==;
Received: from cpanel.siel.si ([46.19.9.99])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39RR-00000003yaH-2HTR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:08:52 +0000
Received: from [89.212.21.243] (port=57494 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u39R0-003nq0-1x;
	Fri, 11 Apr 2025 10:08:22 +0200
Message-ID: <ef74e49d-c413-4719-a174-42df91384469@norik.com>
Date: Fri, 11 Apr 2025 10:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_090850_300880_CAEC741F 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Hi Frank,

On 10. 04. 25 17:23, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
>> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
>> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
>> chip.
> 
> Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy instead
> of use hacked regulator-flexcan1-en.

Sorry can't do.

This doesn't align with other i.MX PHYTEC products using flexcan such as
imx8mp-phyboard-pollux-rdk.dts.

Even the i.MX93 EVK uses the same mechanism.

BR,
Primoz


> 
> Frank
> 
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../dts/freescale/imx93-phyboard-segin.dts    | 32 +++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 38b89398e646..027a34dbaf04 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -26,6 +26,17 @@ chosen {
>>  		stdout-path = &lpuart1;
>>  	};
>>
>> +	reg_flexcan1_en: regulator-flexcan1-en {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_reg_flexcan1_en>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-name = "CAN1_EN";
>> +	};
>> +
>>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>>  		compatible = "regulator-fixed";
>>  		enable-active-high;
>> @@ -38,6 +49,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>>  	};
>>  };
>>
>> +/* CAN */
>> +&flexcan1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_flexcan1>;
>> +	xceiver-supply = <&reg_flexcan1_en>;
>> +	status = "okay";
>> +};
>> +
>>  /* I2C2 */
>>  &lpi2c2 {
>>  	clock-frequency = <400000>;
>> @@ -79,6 +98,19 @@ &usdhc2 {
>>  };
>>
>>  &iomuxc {
>> +	pinctrl_flexcan1: flexcan1grp {
>> +		fsl,pins = <
>> +			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
>> +			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
>> +		>;
>> +	};
>> +
>> +	pinctrl_reg_flexcan1_en: regflexcan1engrp {
>> +		fsl,pins = <
>> +			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
>> +		>;
>> +	};
>> +
>>  	pinctrl_lpi2c2: lpi2c2grp {
>>  		fsl,pins = <
>>  			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
>> --
>> 2.34.1
>>

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

