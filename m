Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F51C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4rIj+lEGrxmq90HEJV5hfV3RbqS6xnOp3Ughx0TBsI=; b=O5mq6mDtqTS8dJx1RFKZ+DSkMd
	6G1DDPasQnutsaMPhZ+kfOYvyH8SDZRY1OgfdsmfLqMc5cd6qQuD27EIFBMcO40h5ZF+9a8KUW/f1
	7fq4vDdo2c56IrMFUNpvCQFTz4AXdyZx65+FqSi9KCuvRvH6xqorXG5k5oA9011uXXx13NYO4EJUk
	6haJTCBWE5LD1JXXF7mJMOIdBa2xPp7FnCa6xHAeRCEEZq2a6iDyXqUnWQk12QQ0ebOjNWUuh6AB2
	wf6ZVZwxKUVnXg+mYSXCOIBHWcLg00gOMk+QemGjGYEMt6MBOVOuc4J7Q7Dii46godWnJGNpDP7o0
	4E9FBN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMksF-0000000D5Gs-36nd;
	Wed, 04 Jun 2025 09:57:31 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkq9-0000000D57T-353d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:55:23 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5549tH283779467;
	Wed, 4 Jun 2025 04:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749030917;
	bh=n4rIj+lEGrxmq90HEJV5hfV3RbqS6xnOp3Ughx0TBsI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JxuIgA5y2U1me452IOx3/IPU1xliz94izbrHCoy1PpZ/QAE2ckWjqLJ38mbxlxk2d
	 mOBmoP1DuRDRJ4m4c6xw6NBGKBIOrKmL9GUSzgoqVNPHU/xKStusBcNbRRD4tFzNZp
	 7QX4DzCq/faqNNGmYA6bRAv+c4NTBWfxxEDp1S6o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5549tHFX066079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 04:55:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 04:55:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 04:55:16 -0500
Received: from [172.24.17.132] (lt5cd2489kgj.dhcp.ti.com [172.24.17.132])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5549tDEN1774749;
	Wed, 4 Jun 2025 04:55:14 -0500
Message-ID: <02f80914-80c7-4b8b-87e1-b48b8a8e7072@ti.com>
Date: Wed, 4 Jun 2025 15:25:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
References: <20250603042448.783956-1-u-kumar1@ti.com>
 <20250603160147.47orn74obh2lz3qm@rethink>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250603160147.47orn74obh2lz3qm@rethink>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_025521_874934_59AFC8AF 
X-CRM114-Status: GOOD (  15.29  )
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


On 6/3/2025 9:31 PM, Nishanth Menon wrote:
> On 09:54-20250603, Udit Kumar wrote:
>> From: Bhavya Kapoor <b-kapoor@ti.com>
>>
>> This commit adds the assigned-clocks and assigned-clock-parents
>> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
>> property is set to reference the clock identified by
>> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
>> correct clock source.
>>
>> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
>> as the parent clock. This configuration is critical for establishing
>> the proper clocking hierarchy, enabling the UART device to function
>> reliably across different baud rates.
> Please fix the commit message - not clear what specifically in the clock
> hierarchy does permit the multiple baud rates.

Thanks for review.

will address in v2, commit message and other comments as well


>
>> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> You need to add your SoB.
>> ---
>> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
> Also as Baleswar stated, the $subject needs to be fixed.
>>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
>> index 52e2965a3bf5..1146bc5990ea 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
>> @@ -310,6 +310,8 @@ wkup_uart0: serial@42300000 {
>>   		interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
>>   		clocks = <&k3_clks 397 0>;
>>   		clock-names = "fclk";
>> +		assigned-clocks = <&k3_clks 397 0>;
>> +		assigned-clock-parents = <&k3_clks 397 1>;
>>   		power-domains = <&k3_pds 397 TI_SCI_PD_EXCLUSIVE>;
>>   		status = "disabled";
>>   	};
>> -- 
>> 2.34.1
>>

