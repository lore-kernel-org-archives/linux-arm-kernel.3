Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 07:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4qHxF4gyCtPcoRPT+fHFC938Rc5DybOoRZ1bh0zYyM=; b=jFI95fMeJJ+VpOQeQS9K4WT7JK
	rZyteQuJ0K+9N7vDvKA1K/hQmn1FkNb0YLHiMhvnYR6mrL1ebT9iz+lX8jCvM+x6emWvcJYcUySE8
	mut6lmFzX2bQYCg5vjelsvJRmruLI7trP3QZEu1fZmXBZ2PdS+Hi+1WaJ48D8eKQCNpS0Gzd3joFv
	3BUIpE84bv45uUCPgeQW6jUiAQT74y9RCqLGt9gCQCN6xg0ohKzXGcPAl4dgYdwWax/ucUwfbAqS5
	6j8LWq3fzWp38yDTRkZ6aI+qQPKmZp4ygVWpLgNjqdlilan2Cwy2XvzKoRDO98Y1PFRh4iJYsDACZ
	ZrHy0c3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSW8-00000008JQo-43xs;
	Mon, 26 May 2025 07:45:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSSS-00000008Iyn-0nqa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 07:41:17 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54Q7fBJ51487069;
	Mon, 26 May 2025 02:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748245271;
	bh=Z4qHxF4gyCtPcoRPT+fHFC938Rc5DybOoRZ1bh0zYyM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PvmG6it4+lo3umLNRCsaT5qs/+XjbsG8V2wtq4rcr0rVwG9b9BYFYpqw2tSplvZbo
	 qss2E8lmX8fVviSUbIjh9IlfRulQwIVWy0DSj/hg4ucyVYhd9oa5cfsFRz9KbpnIqv
	 PlFuIksRwnfNvaNZMU9tOdbTZ0xPwjWtk+2nrH1s=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54Q7fBlx1993891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 26 May 2025 02:41:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 May 2025 02:41:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 May 2025 02:41:10 -0500
Received: from [10.24.68.154] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.68.154])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54Q7f6ko2664772;
	Mon, 26 May 2025 02:41:07 -0500
Message-ID: <ee73d587-59fd-4109-ae29-2237f1d3c954@ti.com>
Date: Mon, 26 May 2025 13:11:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Modify J784S4 SoC SERDES lane controller
 register length
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC: <n-francis@ti.com>, Gokul Praveen <g-praveen@ti.com>
References: <20250523134946.144461-1-g-praveen@ti.com>
 <80d7fc2f-1e96-45b6-a897-f5f4c9bb8288@ti.com>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <80d7fc2f-1e96-45b6-a897-f5f4c9bb8288@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_004116_429452_0E597227 
X-CRM114-Status: GOOD (  14.78  )
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


Hi Udit,

On 23/05/25 22:55, Kumar, Udit wrote:
> Hello Gokul
> 
> On 5/23/2025 7:19 PM, Gokul Praveen wrote:
>> Modify the J784S4 SoC SERDES lane controller register length from 0x30 
>> to 0x50
>> to enable SERDES4 registers.
>>
>> 'Fixes:9cc161a4509c2("arm64: dts: ti: Refactor J784s4 SoC files to a 
>> common
>> file")'
>> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> index 1944616ab357..1fc0a11c5ab4 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> @@ -77,7 +77,7 @@ pcie1_ctrl: pcie1-ctrl@4074 {
>>           serdes_ln_ctrl: mux-controller@4080 {
>>               compatible = "reg-mux";
>> -            reg = <0x00004080 0x30>;
>> +            reg = <0x00004080 0x50>;
> 
> I assume above is already fixed with below patch >
> https://lore.kernel.org/all/20250423151612.48848-1-s-vadapalli@ti.com
> 
> or I am missing something

Yes,its the same fix Udit.Thanks for informing that.
> 
> 
> 
>>               #mux-control-cells = <1>;
>>               mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 
>> select */
>>                       <0x8 0x3>, <0xc 0x3>, /* SERDES0 lane2/3 select */

Regards
Gokul

