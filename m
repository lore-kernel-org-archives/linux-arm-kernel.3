Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D783CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkn43UvNGw6BE5zjZWg8ESNySvNLqNay7t6miFcYPts=; b=hE5KveVVAD3qy/XwRnO0TWwnw4
	i1ooSKC5ZZlBsHk6clMr7MTrku6o2Ky8CtDCft4cficBuHdyRRlyaqMfca/bwKZNlxyA0y5iEM9iR
	0tzSXpDJ9vJvk3og2igaWCKUpjhD6LKoyBZ6/gg2A+yYjDGjeEKyVs+y3giYnse5HkN3Q9yjTE447
	9EaPpHc67tjuTDV6rTk1pBNTPREhasq5MpVWbzRyoNhUNHW3rHh2Pedf1JLuX8Of7mWTMl6Kk2hqE
	FtJltwDDaGVvQSC8vqsRHB10XLO8IfZI8AdUh7fmzth18pBZV1ynha0jiiwnLa9BbL5wtDyn6gcMc
	GBmo582w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJRv-00000001SQg-4BFT;
	Tue, 19 May 2026 12:21:28 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJRr-00000001SOe-1xLj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Pkn43UvNGw6BE5zjZWg8ESNySvNLqNay7t6miFcYPts=;
	b=VZJ846qKlOsYHg/yLUb/3dNMvHg/l6AMwX3W5afN0zcb6T+X8AzIT8Uzux4xuA
	t4M/R5ZfEDpEhmaaYS/QmOz4GZGMbGcQFcD96QI1EEQRRlOWQKJ4uru0xHpoYEde
	MUxt/Cx8o9V9zZvTeqhqTQievT6yp52uUdEcnmbtVo/t4=
Received: from [192.168.50.71] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHJy+cVQxqHS7ODw--.243S2;
	Tue, 19 May 2026 20:20:47 +0800 (CST)
Message-ID: <941b93d9-2251-4222-8914-73bb7d4e6ac7@163.com>
Date: Tue, 19 May 2026 20:20:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Use FIELD_MODIFY() for bitfield
 operations
To: Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260430164545.49637-1-18255117159@163.com>
 <agxAvl02rcPoEHaq@willie-the-truck>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <agxAvl02rcPoEHaq@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PigvCgDHJy+cVQxqHS7ODw--.243S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4UKF1xZr15GF43ZFykAFb_yoWkKFg_Xr
	18Ja1kXr15JFyakr4fCF1fZrnxt39rJFy2v390qay7JasxZFW5JFZ3CF95C3W7Wws2kFy7
	KFZ8ZwsYqFy29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRUGYtUUUUU==
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wAbvmoMVaBgwwAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_052125_474575_46966CEF 
X-CRM114-Status: GOOD (  11.98  )
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



On 5/19/26 18:51, Will Deacon wrote:
> On Fri, May 01, 2026 at 12:45:43AM +0800, Hans Zhang wrote:
>> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
>> macro. This improves code readability and adds type/range checking without
>> functional changes.
> 
> Does it _really_ improve the readability? '&=' and '|=' patterns are
> pretty idiomatic C code, if you ask me.
> 
>> FIELD_MODIFY() internally performs the same mask-clear + set operation but
>> eliminates repetitive boilerplate.
>>
>> ---
>> Hi, If the Maintainers think it's not necessary, please ignore it.
> 
> I don't really mind the code either way, so I think I'd prefer to leave
> it as-is unless somebody wants to convince me otherwise...
> 
> Will

Hi Will,

It's not like that. Please take a look at the accepted patch below.



https://lore.kernel.org/linux-pci/20260505165436.GA737933@bhelgaas/

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=42ec65b46a4fc7565d48daa42bf025fdc67800eb

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5fd6f2154734f447e83b6de9a08d16848605191e


Best regards,
Hans



