Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B1FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 22:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5FdDKxl0YKeB7HteFlvgLhQ09iS0vqq32PZTKFOdu8=; b=rq0Y1+CvP8T3s/b+QSJ13pt6Hx
	t3XZEnoM9QNhoFTD1svOvTTSCZ30iHwyDZvtCwDHZckq9o18x4wvmvUYCUhhUF64b20akTGvGcPNY
	3Zlwv8LLcWPFPbs8A+XSBBxI+aptO80Qya3m+XvPTEtpkUL3GoK2kABT2CM9/e/LUnH1PoXNblrLt
	WF/OSxqLT29Isl3lrrtEqNKG9OwG2hXIBXpRYHyQCW7MA9GzuTCyaG1ijFPZomEctV7QrwM0XJTKw
	DrtMZXgsDqLJa3E445PRfxz1ZxhxCUW42R4J8LHHmhilqRbIoaSIq5jOS2h3v781nuwgfYPLkYM9C
	YFcKN0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddEK-00000009jVx-1dC5;
	Thu, 30 Jan 2025 22:41:48 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddD0-00000009jRc-3ist
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 22:40:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50UMeLj61558537
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jan 2025 16:40:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738276821;
	bh=w5FdDKxl0YKeB7HteFlvgLhQ09iS0vqq32PZTKFOdu8=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=sW1vz/kJh7HQ0uD6vYYFnFmIrH+zNxGIJV1skoQ9S9cj4y0xJ0h/H0ZL9dvd9UJlZ
	 EzM0TdRSjMEZlY7v1+g4YUT4WW/hWIB/l+nHVAk5igrm7WR+IAX8yqlIah6qlqt1BI
	 tL8ieukbsEWRMvyvBOsokxDaDmLqYoA554Qfr0c8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UMeLJG117060;
	Thu, 30 Jan 2025 16:40:21 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 16:40:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 16:40:20 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UMeKrR055087;
	Thu, 30 Jan 2025 16:40:20 -0600
Message-ID: <6ab56868-b2d2-4b8a-ac06-d0d35a5e8998@ti.com>
Date: Thu, 30 Jan 2025 16:40:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc
 node
From: Judith Mendez <jm@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Devarsh Thakkar <devarsht@ti.com>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-3-jm@ti.com>
 <8b152f81-0848-4f34-adcb-fee9b4f2fd7f@ti.com>
 <76f9e9e8-dd7c-e783-fccc-0b6f913ce753@ti.com>
 <390aa52e-e9f2-4ce3-ad1b-eac71f4a211c@ti.com>
Content-Language: en-US
In-Reply-To: <390aa52e-e9f2-4ce3-ad1b-eac71f4a211c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_144027_016275_B7FB2D94 
X-CRM114-Status: GOOD (  13.61  )
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

On 1/28/25 11:48 AM, Judith Mendez wrote:
> Hi Andrew,
> 
> On 1/28/25 10:52 AM, Hari Nagalla wrote:
>> On 1/28/25 10:27, Andrew Davis wrote:
>>>> +    mcu_r5fss0: r5fss@79000000 {
>>>> +        compatible = "ti,am62-r5fss";
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>>
>>> Newline here.
>>>
>>> Also this should be default "disabled". It can be set to "okay"
>>> in the board DTS file when the needed mboxes and memory-region
>>> are set. Speaking of that, where are those patches? This is
>>> incomplete without them and these nodes will not function.
>>> Same for the DSP patch.
>>>
>>> Andrew
>> Yes, by default needs to set the node state to "disabled". This is HW 
>> description of the wake-up domain components. Memory carve outs and 
>> mailbox assignments for IPC are a separate patch as it is configurable 
>> and distro dependent.
> 
> Yes I plan to disable the nodes in each domain .dtsi file.
> 
> Also yes, my understanding is that the memory carveouts could
> be a separate series if at all. Not sure if those patches can be
> sent upstream since they are distro dependent. Can anyone clarify
> if this is the case?
> 

As per offline discussion, I will include the memory carveouts in this
same series.
~ Judith

> ~ Judith
> 


