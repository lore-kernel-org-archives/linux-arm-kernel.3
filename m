Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8275CC36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9wRt7wss9ZrIeV++Wc1A527R0EIL7GzO7MaVVI+mas=; b=0mNr0nIip7Y9IPHRXsWg6Uv+YG
	Mv9EHfxWWlLvGOq8XSn46GnVLX9SseQiZVHa1pQiUeWeRkp8XiK34W37jn/RtTPXY8vQ5vj6Mexd6
	v44d+W+ePCKRluH+IEjXJDswI1MqMvEqhBaJrB/Hz25TB2XmeTKV83yUL7VRgBXIHGvoEg3IfywUd
	6jKjDYQza8yd3LE3+LZE3FWZcaONs4YMd8u3xiD/3eFcrrc0dcjuGhnM5E83gvaz2T3iUzVJVdTMg
	KhpOqny11XUW/mIIchdpGvacTDzAJQZ/58tIzbTGB72LDwaXzI9Akx4cB3rflrjW3IoPZs2HyXex7
	UqcqTF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYqv-00000002cz2-2sna;
	Tue, 01 Apr 2025 10:28:17 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYSF-00000002Yc1-2bOC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:02:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531A2aVu3072633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 05:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743501756;
	bh=X9wRt7wss9ZrIeV++Wc1A527R0EIL7GzO7MaVVI+mas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UetnMjUUWQlCq4LcsKytSq2lLWX3IoLwG4tblaahnNh2LP+X7YZhMLe2yBnKGA4Ge
	 pfR3ZIk4ebPEQ2WyHm7ELCbJ58TxG2pKC/k6RL1cczYVpm4RSHPF+HqLJ4K/NEjuMx
	 yqhGCaN7okaMjI4Wg3DLIXXP4y4Zt9a0YihVVfRQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531A2Z4b116224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 05:02:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 05:02:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 05:02:35 -0500
Received: from [172.24.18.65] (lt5cd2489kgj.dhcp.ti.com [172.24.18.65])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531A2VZq127627;
	Tue, 1 Apr 2025 05:02:32 -0500
Message-ID: <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
Date: Tue, 1 Apr 2025 15:32:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <D8V323NBB32P.3P8H103L83HZK@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_030247_905877_26AA6817 
X-CRM114-Status: GOOD (  12.94  )
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

Hi Michael

On 4/1/2025 11:50 AM, Michael Walle wrote:
> Hi Udit,
>
>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>>>> [..]
>>>> For completeness , this is ok to add this node but should be kept disabled
>>> Shouldn't it be "reserved" then, see [1].
>> yes, should be reserved.
>>
>> With marking status as reserved.
>>
>> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
> Thanks.
>
>>>> similar to
>>>>
>>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
>>> j784s4, j721e and j721s2 have them enabled. What is the rule here?
>> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>>
>> example for j721e, one is used by kernel [0] and another by optee [1].
>>
>>
>>> You also disable the hwrng in optee in your evm according to [2]:
>>> CFG_WITH_SOFTWARE_PRNG=y
>> We are planning to use this hardware block by secure firmware.
>>
>> Therefore request not to use by optee as well
> How will you be able to access the RNG from linux and u-boot? I'm
> asking because I'll need it in u-boot for the lwip stack and the
> HTTPS protocol.

For now,  If you need TRNG then I can suggest to use optee TRNG (ie 
build optee with HW TRNG).


>
> -michael

