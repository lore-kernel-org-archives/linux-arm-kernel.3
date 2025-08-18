Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B0CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxiNEnTOiIMgcErCvz6/vPTFNfqv77e2dsq9j1+gqLk=; b=LDsaX/6VKJ0jShv5R6fNd4bxEk
	IUPkKtF1UeKszqIz4F/SNIEIHAN8BTGeCHrMmefQljrgrWBHRrYbht9V5+IzoePY7MVCOWY/ek9DV
	A+DXmDLpCqYMqsfI98DfakbqlrupoyJW43edJG1mRjDNOyaXGyHs+lB+xI40yBXRQPcN6D0SwxZ2M
	+ls37zJL4GVJKRgSsaQ1a5MaI7UoOdqXVEUsKI/fxZXN2Dx6xDnIBsxyd6AtMNqmI8swUgpxJl99B
	7aYZapmhT4CBQz2yfhJWEPLEcED+DGfjrPjTaWNAkOhB8zNY5ji3J3r3QPbAaYxnKQfbl2wpUrcEm
	oWbhN1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jI-00000008Bmw-2FDN;
	Mon, 18 Aug 2025 17:33:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2DT-00000007yCR-3KwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:56:13 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IFu7li3198155;
	Mon, 18 Aug 2025 10:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755532567;
	bh=SxiNEnTOiIMgcErCvz6/vPTFNfqv77e2dsq9j1+gqLk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ftLynG5mp+hJLRR0WimFRxLw2JCDTNq32taIkyAemhEhTHy+91IcNOwogrU84x4qY
	 PGY3Rm1fy+a6sjmBMqU1+/YbqHwhRJRDKQyEz3GjQDZcRt6gCfe6D2OdCKrYR2t1aX
	 PFZhzafVSE2FobIGI9BQw9BScMzCUOuEsbHpsZB4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IFu7oL622936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 10:56:07 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 10:56:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 10:56:06 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IFu2Qm1274444;
	Mon, 18 Aug 2025 10:56:02 -0500
Message-ID: <146ffb9c-e0f8-479b-b6fe-322786be0e20@ti.com>
Date: Mon, 18 Aug 2025 21:26:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU
 R5F cluster to Split-mode
To: Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Udit
 Kumar" <kumar1@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-34-b-padhi@ti.com>
 <9a3f4271-ada2-48aa-b99d-023619ec5e12@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <9a3f4271-ada2-48aa-b99d-023619ec5e12@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_085611_936039_C21CD76C 
X-CRM114-Status: GOOD (  15.48  )
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

Hello Andrew,

On 8/15/2025 9:18 PM, Andrew Davis wrote:
> On 8/14/25 5:38 PM, Beleswar Padhi wrote:
>> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
>> R5F cluster in the MCU domain which is configured for LockStep mode at
>> the moment. The necessary support to use MCU R5F cluster in split mode
>> was added in the bootloader. And the TI IPC firmware for the split
>> processors is already available public.
>>
>> Therefore, Switch this R5F cluster to Split mode by default in all the
>> boards using TI IPC Firmware config (k3-j7*-ti-ipc-firmware). This
>> gives out an extra general purpose R5F core free to run any applications
>> as required. Lockstep mode remains default in the SoC level dtsi, so
>> downstream board dts which do not use TI IPC Firmware config should not
>> be impacted by this switch.
>>
>> Users who prefer to use the fault-tolerant lockstep mode with TI IPC
>> firmware config, can do that by setting `ti,cluster-mode` property to 1.
>
> What a user prefers and other configuration like that does not belong
> in devicetree, which should only describe the hardware.
>
> Configuration should be done using the normal methods, like kernel
> cmdline, module params, ioctls, etc.. Maybe we can even set the mode
> based on some signal in the firmware itself, like in the resource table.
>
Agreed configuration part ,

but as default, what this CPU should be lock-step or cluster-mode


> Andrew
>
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> [..]

