Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8D6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgP42JYcLJct4c+N0hOB2jGbwHn1xmpBOQj3t0j6WnI=; b=GlgXWR7JA8epkAw5IWDeIdz5Ah
	Mg6SMJlqjnxSBxH8q8ThnOzT6mxFr87gsDYQ6cbv2u6w6wFK7J0zJIUcCg+bMT/tZlmEvZp5e39DN
	QovViGpqVrPDgZNso60htt8vXgT//ZrIejMJ8RoPYQ3pKHBaaatUVapXe77kmblkaMzfI/O66VJ42
	Zl4DRNOCnVXpG+3T7n05Q4t7/gLURSdcIfl7TiVoKiiSxlOAyd/MzRcBV6bdEkvVZZXixO/m1T7sy
	mV4rKwBFm15KGpzEEC9X+wJ72cM6VrRQYbeOTXP5Szxwo10tbrzMGa+gfL+W+pQPvjnWeE3QF4Qrb
	BLd/flGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpiw-00000005T4O-3nWS;
	Tue, 28 Jan 2025 17:50:06 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcphb-00000005Sxc-2WpL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 17:48:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SHmaJc2002364
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 28 Jan 2025 11:48:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738086516;
	bh=MgP42JYcLJct4c+N0hOB2jGbwHn1xmpBOQj3t0j6WnI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UahvFPmWaVQJuRscn3mSJiDlvwbWoT81ixe6S7zpfwdOulAgNLrqeIMN2PgM/9czy
	 87cJUIifIgJ0XHrn73HuSL7IaB2iuDfXYqMYO9en+4VGO+xqkmHL3WwiQaHuTwCtXP
	 8OFFN8dOIR4S9qBRFDNEcQSX1CIVWgSttseAcPfE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SHmadG050604;
	Tue, 28 Jan 2025 11:48:36 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 11:48:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 11:48:36 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SHmaiA049718;
	Tue, 28 Jan 2025 11:48:36 -0600
Message-ID: <390aa52e-e9f2-4ce3-ad1b-eac71f4a211c@ti.com>
Date: Tue, 28 Jan 2025 11:48:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc
 node
To: Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-3-jm@ti.com>
 <8b152f81-0848-4f34-adcb-fee9b4f2fd7f@ti.com>
 <76f9e9e8-dd7c-e783-fccc-0b6f913ce753@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <76f9e9e8-dd7c-e783-fccc-0b6f913ce753@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_094843_773027_EEB87D5B 
X-CRM114-Status: GOOD (  13.33  )
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

Hi Andrew,

On 1/28/25 10:52 AM, Hari Nagalla wrote:
> On 1/28/25 10:27, Andrew Davis wrote:
>>> +    mcu_r5fss0: r5fss@79000000 {
>>> +        compatible = "ti,am62-r5fss";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>
>> Newline here.
>>
>> Also this should be default "disabled". It can be set to "okay"
>> in the board DTS file when the needed mboxes and memory-region
>> are set. Speaking of that, where are those patches? This is
>> incomplete without them and these nodes will not function.
>> Same for the DSP patch.
>>
>> Andrew
> Yes, by default needs to set the node state to "disabled". This is HW 
> description of the wake-up domain components. Memory carve outs and 
> mailbox assignments for IPC are a separate patch as it is configurable 
> and distro dependent.

Yes I plan to disable the nodes in each domain .dtsi file.

Also yes, my understanding is that the memory carveouts could
be a separate series if at all. Not sure if those patches can be
sent upstream since they are distro dependent. Can anyone clarify
if this is the case?

~ Judith

