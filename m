Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453ECCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au4/08tQL6RF2CX3nU8hMTwmLNuebtRoHZXkZcTNKvQ=; b=AmEBGBMs4T4k0NhvVPebc9RbXF
	dpUGx0e2Mupxmp++FzKTNjV2t0mOuU98lgdxQUH0PSw5W7EjlbOilJaUVFlqWLRrjcw6F1IJl4zic
	5hpXq47lLXLtF1a7l319gstnJbRtN4TM4XpJfCIWzytlXXT993LgLqM3d8qtOBr1eAL+3CxBo5EWk
	gJOF5cYsy9ChmbQfn1oyYK74cVS0Q9erDaWcagpk/dMJVjnm2xERUk6NFreb0D3LISlzKISjpNx6E
	bjiknA8GMDtyds0T/TavyXU8B8M7NNnFceiGQf9PcURo29SjaDRqNH8XPUlBvrxmOSxDAgvZ2FWQj
	4FuwQRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNl-000000090Hj-1g2X;
	Fri, 10 Oct 2025 16:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNj-000000090Fn-0uSQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Au4/08tQL6RF2CX3nU8hMTwmLNuebtRoHZXkZcTNKvQ=; b=qSQkSq4bIjiy9NxRkrFoR83hX0
	Vtvd3q1bwXw8//d1bQf8sliQuyXlAX2Rj9SXRGnMOl40VlZKHouchLU+QaD7wlywQsSI/WnCvN7mf
	vt/mcSIp03AhnOL4tdN60ctD/wN3B9a30jaxXbDJlLYWDmIKhh3TEbAj1AMgDOLG3WzlTRhM5qDKu
	fmv0+ja5/vPHnutKtRnsLk4RxDJA98CQ/dGo2LUBVYX8xNuvMLvzDhVN8l6M7U37s4TJRBX3KpEny
	CNfZ6jdJUz1iWqK4FH5pXk4k0yGTqC4RyCfb7W/2u/X5peXwq7HTCb0bYLCQ4GYcnQmqs6cRoApLH
	Nra8KQlQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNg-00000002J6d-0AlN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:54:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 578AF1713;
	Fri, 10 Oct 2025 09:54:03 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC2583F66E;
	Fri, 10 Oct 2025 09:54:04 -0700 (PDT)
Message-ID: <2d9a9291-610b-4af0-b61e-bdc03a3b39c4@arm.com>
Date: Fri, 10 Oct 2025 17:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/29] arm_mpam: Add kunit tests for props_mismatch()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-30-james.morse@arm.com>
 <20250912144148.00003204@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912144148.00003204@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175412_478326_A157F661 
X-CRM114-Status: GOOD (  18.06  )
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

Hi Jonathan,

On 12/09/2025 14:41, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:09 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> When features are mismatched between MSC the way features are combined
>> to the class determines whether resctrl can support this SoC.
>>
>> Add some tests to illustrate the sort of thing that is expected to
>> work, and those that must be removed.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>

> Nice in general though I didn't go through the test expected results etc.

> A few comments inline.
> 
> Thanks and looking forward to seeing this go in.


>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 7cbcafe8294a..6119e4573187 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -189,7 +195,7 @@ struct mpam_props {
>>  	u16			dspri_wd;
>>  	u16			num_csu_mon;
>>  	u16			num_mbwu_mon;
>> -};
>> +} PACKED_FOR_KUNIT;
> 
> Add a comment on 'why'.

| * Kunit tests use memset() to set up feature combinations that should be
| * removed, and will false-positive if the compiler introduces padding that
| * isn't cleared during sanitisation.


>> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
>> index 3e7058f7601c..4eca8590c691 100644
>> --- a/drivers/resctrl/test_mpam_devices.c
>> +++ b/drivers/resctrl/test_mpam_devices.c
>> @@ -4,6 +4,325 @@
>>  
>>  #include <kunit/test.h>
>>  
>> +/*
>> + * This test catches fields that aren't being sanitised - but can't tell you
>> + * which one...
>> + */
>> +static void test__props_mismatch(struct kunit *test)
>> +{
>> +	struct mpam_props parent = { 0 };
>> +	struct mpam_props child;
>> +
>> +	memset(&child, 0xff, sizeof(child));
>> +	__props_mismatch(&parent, &child, false);
>> +
>> +	memset(&child, 0, sizeof(child));
>> +	KUNIT_EXPECT_EQ(test, memcmp(&parent, &child, sizeof(child)), 0);
>> +
>> +	memset(&child, 0xff, sizeof(child));
>> +	__props_mismatch(&parent, &child, true);
>> +
>> +	KUNIT_EXPECT_EQ(test, memcmp(&parent, &child, sizeof(child)), 0);
>> +}
>> +
>> +static struct list_head fake_classes_list;
>> +static struct mpam_class fake_class = { 0 };
>> +static struct mpam_component fake_comp1 = { 0 };
>> +static struct mpam_component fake_comp2 = { 0 };
>> +static struct mpam_vmsc fake_vmsc1 = { 0 };
>> +static struct mpam_vmsc fake_vmsc2 = { 0 };
>> +static struct mpam_msc fake_msc1 = { 0 };
>> +static struct mpam_msc fake_msc2 = { 0 };
>> +static struct mpam_msc_ris fake_ris1 = { 0 };
>> +static struct mpam_msc_ris fake_ris2 = { 0 };
>> +static struct platform_device fake_pdev = { 0 };
>> +
>> +static void test_mpam_enable_merge_features(struct kunit *test)
>> +{
>> +#define RESET_FAKE_HIEARCHY()	do {				\
>> +	INIT_LIST_HEAD(&fake_classes_list);			\
>> +								\
>> +	memset(&fake_class, 0, sizeof(fake_class));		\

> Maybe just use a function?  Seems to be changing stuff that is
> global mostly anyway so seems like it won't need large numbers
> of parameters or anything like that.

Sure - it only became global in v3.


Thanks,

James

