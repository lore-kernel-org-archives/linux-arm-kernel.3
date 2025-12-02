Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C6CCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cATUQiJc9npGbI4jT9r+I8H4PuqTS2f1GZLrT/FePi4=; b=SeFw+SXstBTZcOxBJC4LeQYDv1
	CT8+VT8214ryabpS6fXOS376ohzTw3Ksgrhd3uprgPpK2YpgNyCpTMRF510j8yfOJ8pSki8OEIkX5
	RJv8QHITfIQp8RRpSHgEiim2GO7Y5VNHse24j2E6rESQth7QiI650CYsZAzBP4dVNd/54nfzTqAXq
	mBezjwwHsBU9RoOnVgF8VXJNqXQiIKpU7O3H97bPRQeEDt2ULyLvqCeCvkBLCTvGFqXb0+nrb14yb
	/T3nsJqBnd29VXItjT0wOg8ukbB9UAsbzy8tdiMxcrVDUuzzbgOA6PcVvDS4hmMr2v8opGyMgGhuw
	0evCz92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKF1-00000004vTc-35DC;
	Tue, 02 Dec 2025 06:52:03 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKEw-00000004vSr-42vz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 06:52:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cATUQiJc9npGbI4jT9r+I8H4PuqTS2f1GZLrT/FePi4=;
	b=ZwWuYbG5Q4xPmpss4QVApiJLmjWp+n8LiM6hKr9n7ChT+CJ5bPOvx3acW7pqU4MdJPlyNGvOE
	RAaXTbV5rP9YfYneFFiGuebJEYbII+gELeXeBLd/+g18aQDBLsWWn1iQq1/0slm4c3ka2XzXU+g
	BKMoenxgpkm/nrnPz5JyzAM=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dLBGS2cKRzRhVh;
	Tue,  2 Dec 2025 14:49:52 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 080F3180BCE;
	Tue,  2 Dec 2025 14:51:44 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 2 Dec 2025 14:51:43 +0800
Message-ID: <3b41d540-37d1-4b92-91a3-f4094f7ad792@huawei.com>
Date: Tue, 2 Dec 2025 14:51:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64/sysreg: Add HDBSS related register
 information
To: Marc Zyngier <maz@kernel.org>, Tian Zheng <zhengtian10@huawei.com>
CC: <oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <corbet@lwn.net>,
	<pbonzini@redhat.com>, <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <20251121092342.3393318-2-zhengtian10@huawei.com>
 <86wm3iqlz8.wl-maz@kernel.org>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <86wm3iqlz8.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_225159_668245_F4BF4176 
X-CRM114-Status: GOOD (  11.47  )
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



在 2025/11/22 20:40, Marc Zyngier 写道:
> On Fri, 21 Nov 2025 09:23:38 +0000,
> Tian Zheng <zhengtian10@huawei.com> wrote:
>>
>> From: eillon <yezhenyu2@huawei.com>
>>
>> The ARM architecture added the HDBSS feature and descriptions of
>> related registers (HDBSSBR/HDBSSPROD) in the DDI0601(ID121123) version,
>> add them to Linux.
>>
>> Signed-off-by: eillon <yezhenyu2@huawei.com>
>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>> ---
>>   arch/arm64/include/asm/esr.h     |  2 ++
>>   arch/arm64/include/asm/kvm_arm.h |  1 +
>>   arch/arm64/tools/sysreg          | 28 ++++++++++++++++++++++++++++
>>   3 files changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
>> index e1deed824464..a6f3cf0b9b86 100644
>> --- a/arch/arm64/include/asm/esr.h
>> +++ b/arch/arm64/include/asm/esr.h
>> @@ -159,6 +159,8 @@
>>   #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)
>>
>>   /* ISS2 field definitions for Data Aborts */
>> +#define ESR_ELx_HDBSSF_SHIFT	(11)
>> +#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
>>   #define ESR_ELx_TnD_SHIFT	(10)
>>   #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
>>   #define ESR_ELx_TagAccess_SHIFT	(9)
>> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
>> index 1da290aeedce..b71122680a03 100644
>> --- a/arch/arm64/include/asm/kvm_arm.h
>> +++ b/arch/arm64/include/asm/kvm_arm.h
>> @@ -124,6 +124,7 @@
>>   			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
>>
>>   /* VTCR_EL2 Registers bits */
>> +#define VTCR_EL2_HDBSS		(1UL << 45)
> 
> I think it is time to convert VTCR_EL2 to the sysreg infrastructure
> instead of adding extra bits here.
> 

Hello Marc, I noticed you added VTCR_EL2 to the sysreg infrastructure in 
this patch:

https://lore.kernel.org/linux-arm-kernel/20251129144525.2609207-3-maz@kernel.org/

Once this patch is merged upstream, I will remove my local definition.

> 	M.
> 


