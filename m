Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B75C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD7xSvDOtjjn0N4MV1/8yTlPk2LHTF7F477X62OPbhQ=; b=W3+K2XgUtGj0ku1Fpyj4KELrlu
	tEHF5iSJq5h2Zzn3CaSk+QhRQL0gMJ/LmtMLkALOU4z6f5/ltd4Z+ySgguox3T3Bpn5LmaH9HEnun
	bhVtT7HnXJTvwrBg9QoEmn64ZpxABzsiU/4eJZBKMLxqaJwmfWzFdoXPI8IVDgvBegY0OBwHdFAfv
	9xfC/KCUUyYAv35Ga02mndWhooyz8NViJewS5Osr6qi18p5fDH0ld4dNywlowOELPjksWEkKLw465
	HtJYhZtwNNNkIX5JCdzkkq6CyKaPPHhXvFqm3XbE7lUTz/4Ah3y6QIY+Rh4FStFx9LTFCYWXR6E9i
	LJ18TopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6psl-00000004Epo-0BAY;
	Mon, 21 Apr 2025 12:04:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pqt-00000004Ehv-0zfh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 12:02:20 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LC2FoM1616124
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745236935;
	bh=BD7xSvDOtjjn0N4MV1/8yTlPk2LHTF7F477X62OPbhQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xssQn3jCFG+ePxngYzVYU/SBHq6vynTNR0kPMnSYV96Ru9/uTz2E7Tm1lN2p7wRAK
	 2rL7LTeH2MEz5dJfemqGJMmlKhNmMoo+i0GSMgF7DQVcu2pMOcbimjoVkdDLY4TdWu
	 DjLgxJE1XvTcJi4w/5s4p/TCdIB3vNNhQP3cq/qo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LC2FqL021846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:02:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:02:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:02:14 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LC2B4g006706;
	Mon, 21 Apr 2025 07:02:11 -0500
Message-ID: <18ff4046-34fa-48bf-a1e8-3472de46ac01@ti.com>
Date: Mon, 21 Apr 2025 17:32:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 DisplayPort-1
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-7-j-choudhary@ti.com>
 <945e0247-a971-48de-adb1-60a1e7fe5f24@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <945e0247-a971-48de-adb1-60a1e7fe5f24@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_050219_369303_FA31002A 
X-CRM114-Status: GOOD (  14.62  )
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

Hello Udit,

On 19/04/25 14:59, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Enable DSI display for J721S2 EVM.
>>
>> Add the endpoint nodes to describe connection from:
>> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>>
>> Set status for all required nodes for DisplayPort-1 as 'okay'.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts 
>> b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> index f691ae4c19e6..15a7d9b813d3 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>>                <3300000 0x1>;
>>       };
>> [..]
>> +
>> +&dss {
>> +    /*
>> +     * These clock assignments are chosen to enable the following 
>> outputs:
>> +     *
>> +     * VP0 - DisplayPort SST
>> +     * VP1 - DPI0
>> +     * VP2 - DSI
>> +     * VP3 - DPI1
>> +     */
> 
> Sorry for basic question,  In this series , you are enabling only DSI 
> interface.
> 
> why you need clocking for other interfaces ?
> 

We do not need them.

We only need clockID 14 with its parent clock as 16 (which is not the
selected parent by default)

The other display on the EVM (MHDP on DP-0) will consume clockID 2
whose default parent selection is okay.

I will change this.

Thanks,
Jayesh

> 
>> +    status = "okay";
>> [..]

