Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB2DCFA76C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmfI//jDc+SutvcPkcAsQW6M+QXS7fQhKaN+xJdDWXk=; b=N0uiwSC1X7nYKeUXPKnLshcXwO
	dVB9RPeQt3Bor1dZW9rHkaeCwVzDZ/QXkiW91X2lWJqbIjLDNZAZnSHo88lzJqONNepDOd2DqBr4D
	T82ElRFu4eNjN7Izrd4Va/v8WqvuU7rREgFkj5tvRXkaBSrbWXAwnnqVqfqVomsg1XAmvzpq8MXPV
	/adMpOpAYe7jnF4pmaMm4NcmlUqjM7zwAY42vr1ycyvO8VNIeF5RLK6re6Br5VO7cqOnHXJAwH5Oc
	puvrFMl8yUHVhFFB0OuWaEVudVTc7udkp9ivToy63WQoJgbMEeuKuMFzJniafFB53BOOjp6YHrlGI
	SA5wX/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOGe-00000008E98-3VfN;
	Fri, 21 Nov 2025 10:21:28 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOGb-00000008E8H-4ADJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:21:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DmfI//jDc+SutvcPkcAsQW6M+QXS7fQhKaN+xJdDWXk=;
	b=0z8pR8WfT775x726EkNdOncOLgPPCb5HrQ0rtwDUHKC76QJ0JTEvF9cfpXwh8NE8NYNECs/yT
	nBCVTI+GJ1cTaSID3fbVSGbjA8tVOPpXV79m7RZbaLRpAzrwQTAzlPArIx22ZI3vu+k+p5dmX8q
	nKwQCXkMUYU0+vzIba4YMYE=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dCWRT05kXz1cyP6;
	Fri, 21 Nov 2025 18:19:33 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 5509A14010D;
	Fri, 21 Nov 2025 18:21:18 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 18:21:17 +0800
Message-ID: <90180222-5399-442c-b7a3-e65b7d0e1378@huawei.com>
Date: Fri, 21 Nov 2025 18:21:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Support the FEAT_HDBSS introduced in Armv9.5
To: Marc Zyngier <maz@kernel.org>, Tian Zheng <zhengtian10@huawei.com>
CC: <oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <corbet@lwn.net>,
	<pbonzini@redhat.com>, <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <86zf8fr9r2.wl-maz@kernel.org>
From: z00939249 <zhengtian10@huawei.com>
In-Reply-To: <86zf8fr9r2.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_022126_622312_B15AA585 
X-CRM114-Status: GOOD (  16.44  )
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

On 2025/11/21 17:54, Marc Zyngier wrote:
> On Fri, 21 Nov 2025 09:23:37 +0000,
> Tian Zheng <zhengtian10@huawei.com> wrote:
>>
>> This series of patches add support to the Hardware Dirty state tracking
>> Structure(HDBSS) feature, which is introduced by the ARM architecture
>> in the DDI0601(ID121123) version.
>>
>> The HDBSS feature is an extension to the architecture that enhances
>> tracking translation table descriptors' dirty state, identified as
>> FEAT_HDBSS. The goal of this feature is to reduce the cost of surveying
>> for dirtied granules, with minimal effect on recording when a granule
>> has been dirtied.
>>
>> The purpose of this feature is to make the execution overhead of live
>> migration lower to both the guest and the host, compared to existing
>> approaches (write-protect or search stage 2 tables).
>>
>> After these patches, users(such as qemu) can use the
>> KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
>> feature before and after the live migration.
>>
>> This feature is similar to Intel's Page Modification Logging (PML),
>> offering hardware-assisted dirty tracking to reduce live migration
>> overhead. With PML support expanding beyond Intel, HDBSS introduces a
>> comparable mechanism for ARM.
> 
> Where is the change log describing what was changed compared to the
> previous version?
> 
> We gave you extensive comments back in March. You never replied to the
> feedback. And you now dump a whole set of patches, 6 months later,
> without the slightest indication of what has changed?
> 
> Why should we make the effort to review this again?

Apologies for the lack of proper changelog and the delayed follow-up on 
the feedback provided in March. This was an oversight on our part during 
the transition of maintainership for the HDBSS patch series. We 
sincerely appreciate the thorough comments you shared earlier and regret 
not responding in a timely manner.

Below is a summary of the changes made from v1 to v2.

v1:
https://lore.kernel.org/kvm/20250311040321.1460-1-yezhenyu2@huawei.com/

v1->v2 changes:
- Removed redundant macro definitions and switched to tool-generated.
- Split HDBSS interface and implementation into separate patches.
- Integrate system_supports_hdbss() into ARM feature initialization.
- Refactored HDBSS data structure to store meaningful values instead
of raw register contents.
- Fixed permission checks when applying DBM bits in page tables to
prevent potential memory corruption.
- Removed unnecessary dsb instructions.
- Drop the debugging printks.
- Merged the two patches "using ioctl to enable/disable the HDBSS
feature" and "support to handle the HDBSSF event" into one.

We apologize again for the delay and the missing changelog, and we 
greatly appreciate your time in reviewing this updated version.


