Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDEFF588C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWK8tKh+E9hRu8YV2LCaSkCmHnX32EfWF2Jrj1vWeW0=; b=LHbkFQy3VfHkzgQwBGVqlAqOMM
	u0aA6seLPOhyZF8iIn2HxHlLGUOpGZ9VzzcHENs/xBxneSWbCTS+rWj3X8s0F6ykoM+FSp16lUWyS
	4wuW8YXeSG0gYkSDqiQOZ6vvfm5q1WpiCYF80HjA//SWYrbzWjzy/9Q42qSoUT3827cU5/G/s41Bp
	S+rLc4YOVlAoTjRMg/QBmsxK4UWD0sVC0hVEQg258dDqLt7Ih2uz7bSMZc758hMqZn1dufnc2pgRB
	IbfSTOuIESQK6qBOkyHvVSUdIFRFz1XbcCttTBBL7A/397fd14TRsDrTCxpUQjlqpkZcYExnoZjjC
	EnYVHjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp2C-000000075pQ-3khh;
	Mon, 20 Apr 2026 13:51:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp2A-000000075oz-06e2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:51:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 554E6C5C997;
	Mon, 20 Apr 2026 13:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6336D5FFA5;
	Mon, 20 Apr 2026 13:51:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F41031046096B;
	Mon, 20 Apr 2026 15:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776693085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DWK8tKh+E9hRu8YV2LCaSkCmHnX32EfWF2Jrj1vWeW0=;
	b=yT7PnZqqD2I3c/29y0FVPET4nR6b8Ll864ruqDHXfjB9LBrW6JrUreMMtHkdZZPAqE+vS6
	YTWCV/oX9D/jKfi8CpZS4OBmi3OhWTS11RG+c9Ko1uNH/S1onUtn66i+/qinYzUJQe8JZw
	K8GqFBqZ8+H2egPPrtXXvuxBRwl2syNkp1GO4n09nxwVj+Papo7+7yjey8C1eqEuyOYtGT
	kSVmJJCy1B4pwSbSgEd10Rli85dqCraOaqiiqa+n08+Q24qtdF4Pf6oWl4j/dw2hQSk0+J
	5+c/tb75ZM9sbXLutHFJ/4WQEZRCydv4KdO7wZK0RE2MOifZZ6yGxVjb7zEE4w==
Message-ID: <cd4c1a0f-0cdb-4de6-9006-f1d58c5e6812@bootlin.com>
Date: Mon, 20 Apr 2026 15:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s: use ti,j7200-padconf compatible
To: Thomas Richard <thomas.richard@bootlin.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Udit Kumar <u-kumar1@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420131735.3833993-1-richard.genoud@bootlin.com>
 <c36821db-2fcb-438c-b54c-a4f2d5b33fa5@bootlin.com>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <c36821db-2fcb-438c-b54c-a4f2d5b33fa5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_065130_241862_BC614B73 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Thomas,

Le 20/04/2026 à 15:38, Thomas Richard a écrit :
> Hello Richard,
> 
> On 4/20/26 3:17 PM, Richard Genoud (TI) wrote:
>> From: Abhash Kumar Jha <a-kumar2@ti.com>
>>
>> The pinctrl contexts for j722s should be saved and restored during
>> suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.
>>
>> Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
>> suspend-to-ram.
>>
>> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
>> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> index e66330c71593..757eb6abcd72 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> @@ -242,6 +242,7 @@ &phy_gmii_sel {
>>   };
>>   
>>   &main_pmx0 {
>> +	compatible = "ti,j7200-padconf", "pinctrl-single";
>>   
>>   	main_mcan0_pins_default: main-mcan0-default-pins {
>>   		pinctrl-single,pins = <
>> @@ -418,6 +419,7 @@ &main_uart5 {
>>   };
>>   
>>   &mcu_pmx0 {
>> +	compatible = "ti,j7200-padconf", "pinctrl-single";
>>   
>>   	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
>>   		pinctrl-single,pins = <
> 
> It should be done at SoC level, not just for the EVM board.
> You should modify k3-j722s-main.dtsi and create k3-j722s-mcu.dtsi.
Indeed.

Thanks!

> 
> Best Regards,
> Thomas



