Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B8CD6E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVQeqiDWeDk3DqEyUTXPNFt7KmI/BYZJ5MzfjbLOxrM=; b=kdKHQbWI3gv45KtJVstm3GXHqq
	lXZqhdut78BWUYHxRY5UcIag7e9L60mUuKBtqUByyosRzm4Bl2RDvIQlIfT+VFPHi85qBWnFG9+i4
	/mICJOyImcBeqZ2F3ErMVokyf4koDn+v/auK8rWhtnNFLne+W2ZzurnFP5B7ITZg1rbKJcaXNRVne
	xSHmfc/jgOo+l+8/LJyjvBXzUOQ3rvpIk9rxjvm2HPrkr67vawGCu6Ig+G3f+Vp/LB0IvAU7DQkc0
	LL0kaAzvT83A3cx5tSNnI0BjVhVsSz5PAULHg8lzo8uUwvjPL3+9UpBO2u3EzJEdL8x5AnSDF8IyP
	Vuk6vRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYVc-0000000Ad57-0Tf9;
	Thu, 13 Nov 2025 14:41:12 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYVY-0000000Ad3W-3vlO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:41:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4d6jZj5MJjzmV6h;
	Thu, 13 Nov 2025 22:39:09 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 222741400CB;
	Thu, 13 Nov 2025 22:40:50 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Nov 2025 22:40:49 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Nov 2025 22:40:49 +0800
Message-ID: <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
Date: Thu, 13 Nov 2025 22:40:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
 <861pm4vn02.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <861pm4vn02.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_064109_147541_C38441B1 
X-CRM114-Status: GOOD (  13.64  )
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

On 2025/11/11 19:15, Marc Zyngier wrote:
> On Fri, 07 Nov 2025 07:21:25 +0000,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Armv8.7 introduces single-copy atomic 64-byte loads and stores
>> instructions and its variants named under FEAT_{LS64, LS64_V}.
>> These features are identified by ID_AA64ISAR1_EL1.LS64 and the
>> use of such instructions in userspace (EL0) can be trapped. In
>> order to support the use of corresponding instructions in userspace:
>> - Make ID_AA64ISAR1_EL1.LS64 visbile to userspace
>> - Add identifying and enabling in the cpufeature list
>> - Expose these support of these features to userspace through HWCAP3
>>   and cpuinfo
>>
>> ld64b/st64b (FEAT_LS64) and st64bv (FEAT_LS64_V) is intended for
>> special memory (device memory) so requires support by the CPU, system
>> and target memory location (device that support these instructions).
>> The HWCAP3_{LS64, LS64_V} implies the support of CPU and system (since
>> no identification method from system, so SoC vendors should advertise
>> support in the CPU if system also support them).
> 
> But this doesn't mean that the system actually supports this. It is
> also trivial for EL0 to spoof a PASID using ST64BV, by populating the
> bottom 32bit with whatever it wants (hiding ST64BV0 doesn't prevent
> this).

I am confused here, we enable FEAT_LS64 and FEAT_LS64V in this patch,
so only LD64B/ST64B/ST64BV are involved.

Sending the value of ACCDATA(maybe a PASID) is defined in ST64BV0, which
is not enabled currently.

If a bad system implements ST64BV wrongly, isn't the fault of this bad
system?

Best,
Zhou

> 
> In all honestly, I'm starting to think that we cannot safely expose
> this to userspace, at least not without strong guarantees coming from
> the system itself.
> 
> Thanks,
> 
> 	M.
> 

