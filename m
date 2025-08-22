Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5255CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loBEMD9a9DHR9fjC5udJ3RD/pZ2cFnbZvvVrDjat8sY=; b=1BO/5mqVW5UfkIoKqQ1dNfEB0N
	0kvHGsYuo9xt8TXVgpIKcdV2JwbJcshvswVDzX1EiauJuWmQSCR3LpDtHOV66ZQL0ry6mFVUXPlid
	LNCrK6Tog51xartyUlJu7Djq+r9oIAnWXQU3bmh6SCqHgYOAirEkPPGcXNOApOPGIU99dAZjypbis
	/LQt22vkhamEvKPZWFxVzrXU5+2UvVCl5Jp8ACm/7MLlxYDIffhb8eV4Iui7BWbWyw915WTIz0z6w
	wffJpVTbL9mvFEdZNiyIqcMlo5SwWs8bp144FVwDMX17saMbYJdgeFJ5S1jtErA5jzpXnaN/zoTLa
	LCkkehoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphua-00000004AxL-1OBl;
	Sat, 23 Aug 2025 06:39:36 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUbe-00000003AZi-2rwT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:27:12 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MGR5l7764581;
	Fri, 22 Aug 2025 11:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755880025;
	bh=loBEMD9a9DHR9fjC5udJ3RD/pZ2cFnbZvvVrDjat8sY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qnISp+mN+K4EtoDlAHRVcOI56nVevnTjrGhfdh6hbvkje3kY73fPy3EJklAw1AHj5
	 W//YA2/TNWBwQybx6fQuT4JZ5/aFEV5EpIWE8xgUdEBARxhovNfBiQw+OMMYTNSWOT
	 Jw1FkluP3AJYjFrrqs0ZcT8XcY4XlcwdUTB7FUno=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MGR5QZ3728849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 11:27:05 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 11:27:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 11:27:04 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MGQssi3814649;
	Fri, 22 Aug 2025 11:26:57 -0500
Message-ID: <30fa0812-c197-408d-8e45-58cc75fba880@ti.com>
Date: Fri, 22 Aug 2025 21:56:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] Revert "arm64: dts: ti: k3-j721e-sk: Fix reversed
 C6x carveout locations"
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-4-b-padhi@ti.com>
 <92e57929-a978-4d5f-97d4-b7779736d0db@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <92e57929-a978-4d5f-97d4-b7779736d0db@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_092710_895681_35A15774 
X-CRM114-Status: GOOD (  16.39  )
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

On 8/15/2025 8:05 AM, Kumar, Udit wrote:
>
> On 8/15/2025 4:08 AM, Beleswar Padhi wrote:
>> This reverts commit 9f3814a7c06b7c7296cf8c1622078ad71820454b.
>>
>> The C6x carveouts are reversed intentionally. This is due to the
>> requirement to keep the DMA memory region as non-cached, however the
>> minimum granular cache region for C6x is 16MB. So, C66x_0 marks the
>> entire C66x_1 16MB memory carveouts as non-cached, and uses the DMA
>> memory region of C66x_1 as its own, and vice-versa.
>
> Sorry , but i failed to understand how this swap helps in making 
> region non-cached.


This swap does not make region non-cached. This ensures the correct
carveouts are registered for each remote processor (rproc), which is
necessary to ensure VRING buffers are allocated from correct address
space for IPC.

Without this patch, the VRINGs would be allocated from rproc's own
DMA carveout, which would be *cached* from rproc's view.

Refer to the line in the commit message:
"and uses the DMA memory region of C66x_1 as its own, and vice-versa."

Marking a region as non-cached from a rproc's view is done by its
firmware itself via a linker script.

Thanks,
Beleswar

>
> 16MB logic is understood.
>
>>
>> This was also called out in the original commit which introduced these
>> reversed carveouts:
>>     "The minimum granularity on the Cache settings on C66x DSP cores
>>     is 16MB, so the DMA memory regions are chosen such that they are
>>     in separate 16MB regions for each DSP, while reserving a total
>>     of 16 MB for each DSP and not changing the overall DSP
>>     remoteproc carveouts."
>>
>> Fixes: 9f3814a7c06b ("arm64: dts: ti: k3-j721e-sk: Fix reversed C6x 
>> carveout locations")
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts 
>> b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
>> index ffef3d1cfd55..9882bb1e8097 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
>> @@ -120,7 +120,8 @@ main_r5fss1_core1_memory_region: 
>> r5f-memory@a5100000 {
>>               no-map;
>>           };
>>   -        c66_0_dma_memory_region: c66-dma-memory@a6000000 {
>> +        /* Carveout locations are flipped due to caching */
>> +        c66_1_dma_memory_region: c66-dma-memory@a6000000 {
>>               compatible = "shared-dma-pool";
>>               reg = <0x00 0xa6000000 0x00 0x100000>;
>>               no-map;
>> @@ -132,7 +133,8 @@ c66_0_memory_region: c66-memory@a6100000 {
>>               no-map;
>>           };
>>   -        c66_1_dma_memory_region: c66-dma-memory@a7000000 {
>> +        /* Carveout locations are flipped due to caching */
>> +        c66_0_dma_memory_region: c66-dma-memory@a7000000 {
>>               compatible = "shared-dma-pool";
>>               reg = <0x00 0xa7000000 0x00 0x100000>;
>>               no-map;

