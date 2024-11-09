Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0FED5E123
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:CC:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcFPxDGwYT7zJbzAfcDsjbpwehU4i4Cy33ZRWujGzYk=; b=nUSjphYTmyLjvO+8j/6AIqkJDc
	233akiIbBfhMnAo7kvAUEBRRSxJl2k12jpQWDMS7YxQh4gu+hdEKM45kfVI7R4y4DbEVKhxpdxwYT
	kfB54wTKzC5Yq17Gm2iOPdAPhKk0Thx23nvautK+9aX9WGr9fByANZK7WhG/LgUs0UExU4fOpyXqe
	Ml9ndLjmc1iM59mxin9nqxoyKW6hV+E4BQy9RxMq4LxA5xWznoUlSs/R0yxUv/5uenGj3ePuJ9n9P
	OVnNjerJJwQBDzDFhe1L6YO30P/QBaDPx+QCawsIEP8e032t8iq5xvBjUOrjZxD8poEvwX7/Z5HhG
	ekdH8ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9gzi-0000000CvUb-23VG;
	Sat, 09 Nov 2024 08:38:58 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9gxx-0000000CvNq-1XTK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 08:37:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xlq132SPbz1ypMb;
	Sat,  9 Nov 2024 16:36:55 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F52314010C;
	Sat,  9 Nov 2024 16:36:44 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 9 Nov 2024 16:36:44 +0800
Subject: Re: [PATCH] acpi/arm64: remove unnecessary cast
From: Hanjun Guo <guohanjun@huawei.com>
To: Min-Hua Chen <minhuadotchen@gmail.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
References: <20240917233827.73167-1-minhuadotchen@gmail.com>
 <e7632dd4-6009-53f3-e61a-ccb15d9f88f3@huawei.com>
Message-ID: <713ce05d-2d14-fe6b-c3f8-791fff4e50f2@huawei.com>
Date: Sat, 9 Nov 2024 16:36:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e7632dd4-6009-53f3-e61a-ccb15d9f88f3@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_003709_573240_2056E751 
X-CRM114-Status: GOOD (  14.79  )
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

On 2024/10/19 14:47, Hanjun Guo wrote:
> On 2024/9/18 7:38, Min-Hua Chen wrote:
>> DEFINE_RES_IRQ returns struct resource type, so it is
>> unnecessary to cast it to struct resource.
>>
>> Remove the unnecessary cast to fix the following sparse warnings:
>>
>> drivers/acpi/arm64/gtdt.c:355:19: sparse: warning: cast to non-scalar
>> drivers/acpi/arm64/gtdt.c:355:19: sparse: warning: cast from non-scalar
>>
>> No functional changes intended.
>>
>> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
>> ---
>>   drivers/acpi/arm64/gtdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
>> index c0e77c1c8e09..24bd479de91f 100644
>> --- a/drivers/acpi/arm64/gtdt.c
>> +++ b/drivers/acpi/arm64/gtdt.c
>> @@ -352,7 +352,7 @@ static int __init gtdt_import_sbsa_gwdt(struct 
>> acpi_gtdt_watchdog *wd,
>>       }
>>       irq = map_gt_gsi(wd->timer_interrupt, wd->timer_flags);
>> -    res[2] = (struct resource)DEFINE_RES_IRQ(irq);
>> +    res[2] = DEFINE_RES_IRQ(irq);
>>       if (irq <= 0) {
>>           pr_warn("failed to map the Watchdog interrupt.\n");
>>           nr_res--;
>>
> 
> It's a minor issue, but I think it deserves a patch to make
> the code cleaner,
> 
> Acked-by: Hanjun Guo <guohanjun@huawei.com>

Lorenzo, Sudeep, please take a look at this patch.

Thanks
Hanjun

