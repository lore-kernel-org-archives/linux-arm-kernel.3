Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBC4CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QElgaNiZq1zvMjZCZZcc+Tq8PfTitADDIX5munfHjFY=; b=387jNtMQJBhxVzLnEkRrFBvwh5
	P8OZcSO5YsInqqUl4khZuCwD8MW3z/ZBDwyKocMr6HrAcqWVMowNv0NSAfv7RvbI1T8hPXNkPadsR
	gY1yliSwqL91hdOwXpIvmxZzRKXNelr/xiapqY/XcZBVMcrWXWKst8cWhhgbW6g8G1LuLENSLrKod
	u/HjQCHd7AO89pbHht2uCjjz1FmpGV7QtFeH3mIe/iZKgx1ACfR3rBRn5Gi35aFprRtaD2bS6cF9Z
	v7sLkGacaOtRRPcUqtL5wcVOZFppwbgh0q1K8GiEciC+wEM26rIxkMRv/O4yODFF3kJ576g0xrCVJ
	Gc85uNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiwF-00000005bzy-4Akr;
	Wed, 03 Sep 2025 08:33:55 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti9Q-00000005D3W-0hZv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:43:30 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1F39BA06F3;
	Wed,  3 Sep 2025 09:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=QElgaNiZq1zvMjZCZZcc
	+Tq8PfTitADDIX5munfHjFY=; b=nDC4+i3HL9AigOmaugF0rG+1yYi/J6AQS+G2
	ZK618COiL36xqptql1G4POu4Rdz4pjX3xrRs3MEQx7y42It1ylBAHQxaxNIKWZUx
	tTtWV/fEgtp2ofebJQuErJPly7LvUjlG22sU8kcr51s49ItVmooS1Ks2xWdkUDEB
	POrsYRb/dsh4SbrVrx1AHolBMsK0B1cu9oNI8+VyExlgYPhSnpUq4P81OsBNATeO
	JsQxweubc88BattPT7pSYiZtDbB9QnOZacmWMWa3aRQB5PfXgOpqDmGbDnp0LCWm
	4ub+QbERocY1mFM81RsqVkFP1aZiqA9uqzDfSrvnE+54HiZ6sqV5sBTmHlW3cjhV
	i2ajUKr5U0wv+UfETIBoc6YZOhn3DXl3eEU+miGaq8L+MnFwpyz7evysSGe8oBTc
	X4PS0Yr0td58pVKolpdyY3olarr6GenKXGQ6UePpIgiBf0A+be0Dar4WcEpUmMyK
	Lsm5Jvn5ammypt9kq60q4j1x2I6G1bX7HUlSWx+pO5Dd/2NLJhcKb/+BvPyAxLVI
	fN1Rzch82+Ze+pCQ1g3EbReeiUEDauKOF3lkpgaOLdkv5yhAbVkxrXSQ3g4uO1Sx
	pdUq7uq1EhvRzIq0eT0IicxJ8932eHmzW90RfJrndDiHhUAZWN/erXOBDs+5SBC9
	/0FfcqM=
Message-ID: <c85a94ee-59e1-47d6-8200-813bb434caf2@prolan.hu>
Date: Wed, 3 Sep 2025 09:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>, Csaba Buday
	<buday.csaba@prolan.hu>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
 <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.11]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E637062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_004328_674080_00E22BF4 
X-CRM114-Status: GOOD (  20.95  )
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

Hi,

On 2025. 09. 03. 9:28, Ahmad Fatoum wrote:
> Hello,
> 
> On 15.08.25 17:17, Bence Csókás wrote:
>> The Ethernet PHY's reset GPIO should be specified in the node of the PHY
>> itself, instead of the MAC (`fec`). The latter is deprecated, and was an
>> i.MX-specific extension, incompatible with the new reset controller
>> subsystem.
> 
> One reason to do it this way is that the PHY is in reset when the OS starts
> and the external phy-reset-gpios allows MAC probe to get the PHY out of
> reset, so it can be probed after reading its vendor/device IDs.
> 
> Does switching to this new binding address this scenario? If so, it should
> be noted in the commit message.

Yes, but after it has been reset, if the platform supports Power 
Management, the PHY's clock will be turned off, which some PHYs (in our 
case the LAN8710) don't tolerate. This has been reported many times, 
just search LKML for "lan8710 reset".

So we want a more general solution [1] where the PHY subsystem resets 
them before enumerating. However, if the MAC driver claims the GPIO, 
then it can't be used by the PHY.

I will clarify the commit msg with this in mind.

[1] 
https://lore.kernel.org/lkml/20250709133222.48802-4-buday.csaba@prolan.hu/

>>
>> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
>> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>lan8710 reset
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
>> ---
>>   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
>> index f053358bc9317f8447d65013a18670cb470106b2..0a5e90704ea481b0716d6ff6bc6d2110914d4f31 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
>> @@ -246,7 +246,6 @@ &fec1 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1_mdio &pinctrl_etnphy0_rst>;
>>   	phy-mode = "rmii";
>> -	phy-reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
>>   	phy-supply = <&reg_3v3_etn>;
>>   	phy-handle = <&etnphy0>;
>>   	status = "okay";
>> @@ -262,6 +261,13 @@ etnphy0: ethernet-phy@0 {
>>   			pinctrl-0 = <&pinctrl_etnphy0_int>;
>>   			interrupt-parent = <&gpio5>;
>>   			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
>> +			/* Reset SHOULD be a PHY property */
> 
> Comment belongs into commit message.

Agreed.

>> +			reset-names = "phy";
>> +			reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
>> +			reset-assert-us = <100>;
>> +			reset-deassert-us = <25000>;
>> +			/* Energy detect sometimes causes link failures */
>> +			smsc,disable-energy-detect;
> 
> Unrelated change not described in the commit message.

Oh, this has accidentally made it into here from our DT. Thanks for 
spotting it!

> Cheers,
> Ahmad
> 
>>   			status = "okay";
>>   		};
>>   
>>
>> ---
>> base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
>> change-id: 20250815-b4-tx6ul-dt-phy-rst-7afc190a6907
>>
>> Best regards,
> 
> 

Bence


