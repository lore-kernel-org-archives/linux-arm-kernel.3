Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF2FC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtA5gEjIdlbSvKgOUXHBQThchBGfso4/X0OKyeayV/w=; b=SDvsf8lGUnQpTNuJPAfbl+0UJr
	xxC/fh99KgsnPZWZgfzHMB6Upl3skzARfZQMcdHseauWoirtCwbtNqaH6XDWA34jAywn1iLLJeGcN
	Txh9F+AT/ONrUGoc5i9zJm8MdsgYigwzrm8icJb6LSdylk5PMxwOELGbMLqVUK7KcY0j2wKzbrkYm
	oub4JjrNoGl/Fi2vP8Yj9jT5hbnSc8ZsvQlocLI8+bzCZpXPSuhXOckOApjOOtCCTPdzErShAgLko
	Z4cY6WZ6Vxmk33wAkN9keO+BLfUdiUub393Uq02RvoRZ3jn0EVaQLbjo7KPLYfBSSCXw4/XP2Rgth
	MbGjcy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rrM-0000000AeFP-42mo;
	Thu, 10 Apr 2025 13:22:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rpZ-0000000AdpS-2ngM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 13:20:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ADKRQo1297586
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 08:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744291227;
	bh=UtA5gEjIdlbSvKgOUXHBQThchBGfso4/X0OKyeayV/w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OuKGFnMMx+MGvEHE8CmdC489iJJG7mN1JssoJ3A6Ftsa1C46guZVqrplScEry3sZ+
	 WV6gHSc4YDhfyhpYR4RMQv1vHqnLs4/PpxH2vWGi+iZ/P6opqIhfbJVofEKKnFdW91
	 67pce3rXPZgG3jXXfI+1U4MLYMck6OvLWw2VU/WY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ADKRAK029560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 08:20:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 08:20:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 08:20:26 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ADKMAE056004;
	Thu, 10 Apr 2025 08:20:23 -0500
Message-ID: <acd087a1-c10d-43dd-8900-d05591b0c4b0@ti.com>
Date: Thu, 10 Apr 2025 18:50:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
To: Michael Walle <mwalle@kernel.org>, Manorit Chawdhry <m-chawdhry@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
 <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
 <ea82dc29e93d53b659916f2fed10982b@kernel.org>
 <20250409103303.dkrrvp7mdctx32pd@uda0497581-HP>
 <D92X7T33NU3T.VSZM5K7U602S@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <D92X7T33NU3T.VSZM5K7U602S@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_062033_871960_A6FDC5C7 
X-CRM114-Status: GOOD (  18.44  )
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

Hi Michael,

On 4/10/2025 4:56 PM, Michael Walle wrote:
> Hi Manorit,
>
>>>>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>>>>>>>> [..]
>>>>>>>> For completeness , this is ok to add this node but
>>>>>>>> should be kept disabled
>>>>>>> Shouldn't it be "reserved" then, see [1].
>>>>>> yes, should be reserved.
>>>>>>
>>>>>> With marking status as reserved.
>>>>>>
>>>>>> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
>>>>> Thanks.
>>>>>
>>>>>>>> similar to
>>>>>>>>
>>>>>>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
>>>>>>> j784s4, j721e and j721s2 have them enabled. What is the rule here?
>>>>>> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>>>>>>
>>>>>> example for j721e, one is used by kernel [0] and another by
>>>>>> optee [1].
>>>>>>
>>>>>>
>>>>>>> You also disable the hwrng in optee in your evm according to [2]:
>>>>>>> CFG_WITH_SOFTWARE_PRNG=y
>>>>>> We are planning to use this hardware block by secure firmware.
>>>>>>
>>>>>> Therefore request not to use by optee as well
>>>>> How will you be able to access the RNG from linux and u-boot? I'm
>>>>> asking because I'll need it in u-boot for the lwip stack and the
>>>>> HTTPS protocol.
>>>> For now,  If you need TRNG then I can suggest to use optee TRNG (ie
>>>> build
>>>> optee with HW TRNG).
>>> I'll be using an uboot TRNG driver. But how will that work in
>>> the future if the RNG is used by the secure firmware?
>> Wondering if this would be of interest to you [0]. I think since this
>> device only has one TRNG, there has to be a master around and we can
>> mitigate that from OP-TEE as of now, incase anything changes in future
>> then the communication channel between OP-TEE and the secure firmware
>> can be established but currently it's still at work. I think the best
>> way to go forward is to get the numbers from OP-TEE atm IMHO.
> I saw the optee rng. But as of now, the instructions are to use a
> software PRNG for optee. Thus, if someone compiles optee by
> following the instructions, it's unlikely to work.
>
> Would TI willing to agree to change the building docs and enable the
> TRNG in optee and then work on moving the TRNG into the secure
> firmware and build a channel between optee and that firmware? Right
> now, the TRNG seems pretty useless as we cannot use it neither from
> u-boot or linux (and being future proof).

Thanks for note,

I agree to update doc two times

1) with current state ie use optee based trng

2) When fw based trng is available,


>
> -michael

