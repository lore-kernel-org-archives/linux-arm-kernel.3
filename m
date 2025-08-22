Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D31ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZw3xCmdaTgqysDoX1I4kHuuzOlYOaqK/aqxfrjdNaA=; b=ojaSJ+fVsLzd7wW9f0Ch6e/uqw
	qOojlsGvPmfSI1wiTLmF6gvbG7gavwgOtgtD5wmvVAqT9/qGLv1hzxLuW4ecFtoiZVPXmcEcLs3yJ
	ffIDQm/f7cVrQBOKPzxTGeATr1NP+MZCE3ZUVuYTidwTgmwtxEB4szEpFeJpQpzmdlRd4W7CmTQ22
	ZFx2eLpGXbf6EaH9ozJJ9RsA2FD2R3A6F6bQDj3o6TNT0GQIYbIidUDYvL75Viv4pVWsM8m690ZSQ
	4rQfDPr2wZYVC/WJ95EQgJM6KZcrnrZ8ocEBCo0PF4yxX9hyPQ8CHMbzCxgycER9+HpxpsLSmQYPt
	FXQOyz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuu-00000004BKp-17BH;
	Sat, 23 Aug 2025 06:39:56 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUuP-00000003BuQ-47FA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:46:35 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MGkSQ0767275;
	Fri, 22 Aug 2025 11:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755881188;
	bh=xZw3xCmdaTgqysDoX1I4kHuuzOlYOaqK/aqxfrjdNaA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c87zeZyaCR8hFditjjF7r2RqT/oHTT9shI6qp/bFHOAsZPlR7/oGlEH8bzdThZRvH
	 CJJwP5uGO/hOjlZ0bU44neg9GvNsTx9BgIEfitf7Y3odkZAX2+WTARWt/Pti/faD8N
	 SDub5M6rdOQ3BTBWOFW6YdRdtch22OLldoQKMihU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MGkSVc3042487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 11:46:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 11:46:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 11:46:27 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MGkKN83835587;
	Fri, 22 Aug 2025 11:46:21 -0500
Message-ID: <0f2060e4-269d-4865-806e-7ace5c3cdabd@ti.com>
Date: Fri, 22 Aug 2025 22:16:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/33] arm64: dts: ti: k3-am62-verdin: Add missing cfg for
 TI IPC Firmware
To: Francesco Dolcini <francesco@dolcini.it>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Hiago De Franco
	<hiago.franco@toradex.com>,
        Jo_o Paulo Gon_alves
	<joao.goncalves@toradex.com>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>,
        Max Krummenacher
	<max.krummenacher@toradex.com>,
        Andrejs Cainikovs
	<andrejs.cainikovs@toradex.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-19-b-padhi@ti.com>
 <20250821061214.GC7503@francesco-nb>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250821061214.GC7503@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_094634_106018_925F1873 
X-CRM114-Status: GOOD (  11.32  )
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


On 8/21/2025 11:42 AM, Francesco Dolcini wrote:
> On Fri, Aug 15, 2025 at 04:08:24AM +0530, Beleswar Padhi wrote:
>> The wkup_r5fss0_core0_memory_region is used to store the text/data
>> sections of the Device Manager (DM) firmware itself and is necessary for
>> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
>> for allocating the Virtio buffers needed for IPC with the DM core which
>> could be optional. The labels were incorrectly used in the
>> k3-am62-verdin.dtsi file. Correct the firmware memory region label.
>>
>> Currently, only mailbox node is enabled with FIFO assignment for a
>> single M4F remote core. However, there are no users of the enabled
>> mailboxes. Add the missing carveouts for WKUP R5F and MCU M4F remote
>> processors, and enable those by associating to the above carveout and
>> mailboxes. This config aligns with other AM62 boards and can be
>> refactored out later.
> Are these memory ranges fine with 512MB DDR memory?


Yes, they are.

DDR memory range: 0x80000000 - 0xA0000000
Carveout range:        0x9CB00000 - 0x9E700000

Thanks,
Beleswar


