Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF26AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlPxD8B6RcoJORtYKUz5oe4Ys8TzD6N/C+ChKBexSxY=; b=LXD4/T1K0LbDFfHNPDhKLj7qTt
	LMfVmTLjiPYOGdqF2vQZ8+40PPp+mmq7X8IPwhmxt1KISZQbn49BbAzNDd/xrFu7WsSaITqMhWMpN
	eJwNuMQ9BDzXfeRzco6JCAZYvA5oekgC8m4b3egsCQDHdzejMEK4QPZg6P/vohAiCFsvpjwlaM+nH
	anbzGexWK3V8MjUAvQBpgNKh+eCFcJrH660EPjXx7q3lN81ROza871UeG545dvSCuawhJW831UPYV
	PPUgmxB4SIzjVdKd1i2W2zcVkEdW0SMkPqWpYbsuIhsu/wHGNAsOI1iRQqEB6Z6We1haNxr3v4wEj
	gpZ47+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdHV-0000000CBwF-1PV9;
	Tue, 14 Jul 2026 13:34:41 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdHS-0000000CBvH-22wi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:34:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YlPxD8B6RcoJORtYKUz5oe4Ys8TzD6N/C+ChKBexSxY=;
	b=xrX/jExi/qjNVH7HItZ6fEEIMILI0e60EBeCWj+t6sd94r9ND0nS3zsQ3JEFjA7/D2rd1N18u
	samw0OV3YFdczzAw4sLdGcuNFplHsl60JdTn3e6uQhJX8Zafi7kjIpfyDgnk0p42+RpV2AYXZKX
	4IMjLfNdy6Ax4f6JE1b4L7E=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h00RH5mYyz1cyQ8;
	Tue, 14 Jul 2026 21:25:15 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 36DA54057A;
	Tue, 14 Jul 2026 21:34:32 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 14 Jul 2026 21:34:31 +0800
Message-ID: <5910a3ef-cac0-4a19-99f6-cf7e695c017a@huawei.com>
Date: Tue, 14 Jul 2026 21:34:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Support the FEAT_HDBSS introduced in Armv9.5
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
 <alS-kcwvlASwPIzL@LeoBrasDK>
 <8757dfcf-aae4-4716-9ff1-c3140d4cc63e@huawei.com>
 <alYNOg7lREtdVE29@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <alYNOg7lREtdVE29@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063438_883890_2AB09223 
X-CRM114-Status: GOOD (  21.71  )
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


On 7/14/2026 6:19 PM, Leonardo Bras wrote:
> On Tue, Jul 14, 2026 at 05:37:58PM +0800, Tian Zheng wrote:
>> On 7/13/2026 6:31 PM, Leonardo Bras wrote:
>>> On Thu, Jul 09, 2026 at 06:40:20PM +0800, Tian Zheng wrote:
>>>> This series of patches add support to the Hardware Dirty state tracking
>>>> Structure (HDBSS) feature, which is introduced by the ARM architecture
>>>> in the DDI0601 (ID121123) version.
>>>>
>>>> The HDBSS feature is an extension to the architecture that enhances
>>>> tracking translation table descriptors' dirty state, identified as
>>>> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
>>>> page tracking, aiming to significantly reduce the overhead of scanning
>>>> for dirty pages.
>>>>
>>>> The purpose of this feature is to make the execution overhead of live
>>>> migration lower to both the guest and the host, compared to existing
>>>> approaches (write-protect or search stage-2 tables).
>>>>
>>>> The required sysreg definitions for FEAT_HDBSS have been merged into
>>>> arm64 /sysregs:
>>>>     [1/5] arm64/sysreg: Add HDBSS related register information
>>>>           https://git.kernel.org/arm64/c/72f7be0c2e30
>>>>
>>>>
>>>> After these patches, the kernel automatically enables HDBSS when dirty
>>>> logging is enabled on any memslot, and disables HDBSS when dirty logging
>>>> is disabled on all memslots. This series does not support dirty ring
>>>> mode.
>>>>
>>>> Depends-on: "KVM: arm64: Enable eager hugepage splitting if HDBSS is available"
>>>> 	https://lore.kernel.org/linux-arm-kernel/20260629111820.1873540-3-leo.bras@arm.com/
>>> On this, FYI, there have been some discussion on this:
>>> https://lore.kernel.org/all/alETGFD2Ogx6N0HB@LeoBrasDK/
>>>
>>> Oliver's suggestion is that we don't automatically enable eager splitting,
>>> but instead we have different behaviours if the user enables it.
>>>
>>> This is still under discussion there, but I think it can be useful reading.
>>
>> Thanks for the pointer — I've read through the discussion between you and
>> Oliver, and it's very helpful.
>>
>>
>> If I understand correctly, the proposed approach is to support both modes,
>> with DBM behavior depending
>>
>> on the user's eager split setting:
> I am still waiting for his feedback on that, but I suppose that's what he
> meant.
>
>
>> - If users enable eager splitting (chunk_size != 0): use the v4 approach —
>> DBM is set globally.
>>
>> - If users do NOT enable eager splitting (chunk_size == 0, i.e., lazy split
>> mode): use the v3 approach — DBM
>>
>> is set lazily in user_mem_abort on the first write fault.
>>
>>
>> This makes sense to me. It gives users the flexibility to choose.
>>
> Yes, agree
>
>> As I mentioned in my patch 6/6 reply (https://lore.kernel.org/all/6e8b23bc-d420-4f5a-a921-5a5d64d84200@huawei.com/),
>>
>> I do think the lazy DBM approach is safer overall if the first-fault
>> overhead is acceptable — it avoids accidentally marking
>>
>> special mappings and naturally handles lazy split.
>>
> I remember a previous discussion in which was concluded that lazy marking
> DBM carried some issues. I have to go back on that and check if we can take
> care of that now.
>
>> I'll keep an eye on the discussion and follow up once a conclusion is
>> reached.
>>
> Thanks!
> Leo
All right, I'll support both split modes with different DBM methods in 
the next version.

Please let me know once you've had a chance to revisit the previous lazy 
DBM issues — happy to adjust if needed.

Thanks!

Tian


