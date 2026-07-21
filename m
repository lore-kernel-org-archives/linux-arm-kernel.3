Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2952C44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYhxbfEVYKR23+K6GbOzLWG1exr+sGcZbQyg+iAOVFQ=; b=cH1JutpGHCCsuvtASpgmOARJVT
	yg09P9f8oBXbxaOkUxoBuPJjlVGMzsyj8QcHY3eJe19Ts2hKU2ZpfdNaLXoj5XtYfZcGzYwrVvVBd
	iA3+gj3d1Cqx+6CLWEl0aqUMT+1epdjcjRvshEH49+wmqQUusQqFCegiQHPW5nS6l4yi/RrN46d5J
	EhPuAD7QP148C85y7uQ7+yAS5Lmpw70ID+QYMyyFNyQCQLu/RrwXOR9ZpPclxQhzd2nd1D3vD6CEd
	ynvdZBoNuO1qRQUlQf+TJg/x7h2OQcdCaLe9a1xmrEN4+5vluqRmtkycoCzDVk7VcjZLog1gbN3BM
	ec1CxUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Bp-00000008FaR-220M;
	Tue, 21 Jul 2026 02:26:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Bh-00000008FVv-2VhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:26:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h41T103DvzKHN3x
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 10:25:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 5D76C4058C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 10:26:22 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCXX6DO2F5qq4rfBw--.28973S2;
	Tue, 21 Jul 2026 10:26:22 +0800 (CST)
Message-ID: <9a7a7cd9-f9f8-443b-896c-bf1414236f75@huaweicloud.com>
Date: Tue, 21 Jul 2026 10:26:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] irqchip/gic-v3-its: Fix grammar and replace a bit
 number with its symbol
To: linux-arm-kernel@lists.infradead.org
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
 <20260720071215.50705-5-shikemeng@huaweicloud.com>
 <46025d0b3255bd62412598eedae4eda03a61cd39.camel@rendec.net>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <46025d0b3255bd62412598eedae4eda03a61cd39.camel@rendec.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgCXX6DO2F5qq4rfBw--.28973S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4DtF43tr4rArWUtr1fJFb_yoW8Cr4xpF
	WUGa4Ikr4SkFWY9wnrWF4j9Fy5Gws7tFyUG3y8Cw4fW3s8Wryvqr1Utr9IgrnrJrnrJF4Y
	va1SgF15WayUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1QVy3UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_192630_019231_B7D4A1F4 
X-CRM114-Status: GOOD (  18.43  )
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

在 2026/7/21 8:58:52, Radu Rendec 写道:
> On Mon, 2026-07-20 at 15:12 +0800, Kemeng Shi wrote:
>> Fix grammatical errors in comments and simplify the comment about reading
>> GITS_BASER_INDIRECT to check two-level support.
>>
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 5dc91862fc15..8935a6e7a20f 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -163,7 +163,7 @@ struct event_lpi_map {
>>  
>>  /*
>>   * The ITS view of a device - belongs to an ITS, owns an interrupt
>> - * translation table, and a list of interrupts.  If it some of its
>> + * translation table, and a list of interrupts.  If some of its
>>   * LPIs are injected into a guest (GICv4), the event_map.vm field
>>   * indicates which one.
>>   */
>> @@ -2502,8 +2502,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
>>  	/* No need to enable Indirection if memory requirement < (psz*2)bytes */
>>  	if ((esz << ids) > (psz * 2)) {
>>  		/*
>> -		 * Find out whether hw supports a single or two-level table by
>> -		 * table by reading bit at offset '62' after writing '1' to it.
>> +		 * Find out whether hw supports a single or two-level table
>>  		 */
> 
> nit: since it's just one line of text now, you can put the /* */
> comment markers on the same line, which is the preferred style for
> single-line comments.
Thanks for letting me know. I will improve this in the next version.> 
>>  		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
>>  		indirect = !!(baser->val & GITS_BASER_INDIRECT);
> 
> With that,
> 
> Reviewed-by: Radu Rendec <radu@rendec.net>


