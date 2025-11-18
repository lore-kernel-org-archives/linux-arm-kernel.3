Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E593CEBF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+8+9nqu+hg7Kkbtnyjd9qMfaR8eLLxm10R5u3lohjA=; b=IvCvH9FDIBcrLan6KqR+8dgU2L
	zMqGN4RRkxVCy3MTD6dkBgfYs6ikvSaSi3i7yiS5p/0Fud8XglMTWdkB7mIBpYL3gEsST5WHbRlVR
	LSwU2xfma1lafKSXU1LVInvN0RsZe0ZdFVQeKTdJMQWJS0PInZDNgG7z8EEcAemhmIxxDeK1L5A1m
	NfhaRWnfojjDT2+1vsu8H2AA5DmUbBWoqo+V/FX0kRxu30Sn1b/FcHOwli/FmMt2HqPtIbsF4APNG
	QKRHWRmGOxVjTXhyybyOJNWc0lpgjSqhAv2dvookz4gwOrk8XC3xMgocQu2VMCEOfNk4v77H3sC2u
	kNZjs+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBVb-0000000HEVp-2nja;
	Tue, 18 Nov 2025 02:31:55 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBVY-0000000HEUY-1Xyc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:31:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4d9T9K3hxvznTxM;
	Tue, 18 Nov 2025 10:30:13 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id B95EF140158;
	Tue, 18 Nov 2025 10:31:41 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Nov 2025 10:31:41 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Nov 2025 10:31:40 +0800
Message-ID: <6d6fad8d-e4e4-b973-6431-34a37003d363@hisilicon.com>
Date: Tue, 18 Nov 2025 10:31:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>, Yicong Yang
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
 <861pm4vn02.wl-maz@kernel.org>
 <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
 <c72411f9-a77e-4a72-a401-5110b919a2df@app.fastmail.com>
 <1ed610f5-3f0b-614d-5e7f-2c643238bec3@hisilicon.com>
 <113db0fb-d879-49d7-a5f2-7755558f29dd@app.fastmail.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <113db0fb-d879-49d7-a5f2-7755558f29dd@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_183152_583938_D6C46781 
X-CRM114-Status: GOOD (  16.75  )
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

On 2025/11/14 17:37, Arnd Bergmann wrote:
> On Fri, Nov 14, 2025, at 10:25, Zhou Wang wrote:
>> On 2025/11/14 0:26, Arnd Bergmann wrote:
>>>
>>> Are you using a particular device, or are you trying to enable
>>> the support in general? If you have a specific device you are
>>> working on, does it use the PASID data or not?
>>
>> Many thanks for your careful explanation! I got the pointer here.
>>
>> We have a real device in our SoC, which supports LS64B/ST64B/ST64BV.
>> For ST64BV, Our device just receives 64B data atomically, not interpret
>> it with PASID data.
> 
> Ok, I see. So I assume this is either a kind of dedicated work queue
> where the IOMMU PASID is set up in advance for the user MMIO area,

Yeah, it is something like you mentioned above. MMIO area is binded with
a work queue, a PASID is set up in advance for this work queue.

> or it is a device that does not do any DMA at all, correct?
> 
> In this case, would the device also work correctly with ST64BV0 if
> the ACCDATA register is fixed to a value of zero and you can only
> use the upper 480 bits? Would it also work if there is an
> unpredictable value in ACCDATA that may match the PASID of another
> device used by the same process?

We do not support ST64BV0, so above case will not happen. I think ST64BV0
will trigger a illegal instruction exception in our system.

Best,
Zhou

> 
>          Arnd
> .

