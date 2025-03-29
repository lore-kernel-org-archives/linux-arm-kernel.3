Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noChvPur7yLlpxVr63pQSgTrBj8ipPoeygGXSV7NvIk=; b=iO6n7qaNirHaW7RJZAQSvfHDzr
	rUgMvMzbH925Qb03ABRB1cWkMrNpZYfsYd9MgQqY77egiJqjEOlVYG+/9TmDZai8R4T57lghiRBXD
	pNFxJMVSV5S7x1p4P30Q0gblLcyoMK79WdVBEONbleqOPWx0HI2fQQyF+SHjX3AsAHXmR0VcSqMiC
	EdQGMPBGHERA2spfXsP2dy7Qgq1UxiztfP6vDBCwc/BbLVydlS5OHqFbETX80m0gSkUhatJHNZ1Ie
	DyIayVGNMarkvTLzJvevp4YaTymyQ/2471rbfg1WhkZAg7Gz6Av2IJLtu3sJIeedfiLoBDdecv3Io
	5j2cm4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQQO-0000000EqDd-3LkY;
	Sat, 29 Mar 2025 07:16:12 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQOe-0000000Eq87-1evo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 07:14:26 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZPpWQ2TNJztRbD;
	Sat, 29 Mar 2025 15:12:50 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C43E1800B4;
	Sat, 29 Mar 2025 15:14:16 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 15:14:15 +0800
CC: <yangyicong@hisilicon.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <james.morse@arm.com>,
	<conor@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 2/6] arm64: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
To: Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
 <20250320174118.39173-3-Jonathan.Cameron@huawei.com>
 <Z-bo7AQ1h6VQr65V@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <64ae0e68-b025-4a33-9389-5393ee887fb4@huawei.com>
Date: Sat, 29 Mar 2025 15:14:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <Z-bo7AQ1h6VQr65V@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_001424_605609_D49A0B3E 
X-CRM114-Status: GOOD (  12.58  )
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

On 2025/3/29 2:22, Catalin Marinas wrote:
> On Thu, Mar 20, 2025 at 05:41:14PM +0000, Jonathan Cameron wrote:
>> +struct system_cache_flush_method {
>> +	int (*invalidate_memregion)(int res_desc,
>> +				    phys_addr_t start, size_t len);
>> +};
> [...]
>> +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
>> +{
>> +	guard(spinlock_irqsave)(&scfm_lock);
>> +	if (!scfm_data)
>> +		return -EOPNOTSUPP;
>> +
>> +	return scfm_data->invalidate_memregion(res_desc, start, len);
>> +}
> 
> WBINVD on x86 deals with the CPU caches as well. Even the API naming in
> Linux implies CPU caches. IIUC, devices registering to the above on Arm
> SoCs can only deal with system caches. Is it sufficient?
> 

The device driver who register this method should handle this. If the
hardware support maintaining the coherency among the system, for example
on system cache invalidation the hardware is also able to invalidate the
involved cachelines on all the subordinate caches (L1/L2/etc, by back
invalidate snoop or other ways), then software don't need to invalidate
the non-system cache explicitly. Otherwise the driver need to explicitly
invalidate the non-system cache explicitly in their
scfm_data::invalidate_memregion() method. Here in the generally code we
simply don't know the capability of the hardware.

Thanks.


