Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D096C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51sG0mM50xYwgjEa6nMUZidcjbTcH3SQKu7Uyb4c39A=; b=YYI2S5EbNOresZFaBeOMRK1i2y
	PmLjaKZrHAUnjkD9wN6pPoSSMlS9N3eqWegN/LMFs5OEbzuEbIABDgO3fWATU4nAtmdDdkWKVF0fj
	D8wu7bjFuo1PzGC5qan9OYbO/go/yUkQdsbI4XHp6/v39uc8MQRO0o8+smKze4cM6oTxiy59pi5ur
	/gK7FV/Be0A1R5863Yg7guO1yWiMVzZ/z1BdOdLGFW9xRG6BALB3jUWkNVYFz5zjpLex6Hpwlan+K
	Xmet5Zrv46iIFZuzaBNy9BVVxb/YonvB+OV2dZovDQ0Lp6eVq3pLuerd/EKYmFQ65DAkBU/4cscdm
	kDCrHj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFS3-000000097fc-3o0f;
	Mon, 13 Jul 2026 12:07:59 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFS0-000000097cv-1GZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:07:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gzLlf4R3TzKHMVW
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 20:07:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 9E33A4058C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 20:07:39 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgB3P6AK1VRq2C9OBA--.11075S2;
	Mon, 13 Jul 2026 20:07:39 +0800 (CST)
Message-ID: <af7796a0-bca3-428a-9061-2b41347181a6@huaweicloud.com>
Date: Mon, 13 Jul 2026 20:07:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] irqchip/gic-v3-its: Fix grammar and replace a bit
 number with its symbol
To: Radu Rendec <radu@rendec.net>, maz@kernel.org, tglx@kernel.org,
 jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
 <20260702033050.1583-6-shikemeng@huaweicloud.com>
 <d3dcbd615f2432cd8cdec46db9e5856d59300d18.camel@rendec.net>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <d3dcbd615f2432cd8cdec46db9e5856d59300d18.camel@rendec.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgB3P6AK1VRq2C9OBA--.11075S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1UKFWxGr1xJF1DZw1UKFg_yoW8ZF4fpF
	WrGFy2krsa9FWDKrnrW3Wv9F98Gws7tFW7Gr95GayFg3s8GrykWFWUtryagFn7JrnrGr4Y
	vaySqFZxuay5AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050756_705369_822AB310 
X-CRM114-Status: GOOD (  22.67  )
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

在 2026/7/4 23:37:29, Radu Rendec 写道:
> On Thu, 2026-07-02 at 11:30 +0800, Kemeng Shi wrote:
>> Fix grammatical errors in comments and replace the bit offset '62'
>> with GITS_BASER_INDIRECT for better readability.
>>
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 244509701070..120f6f29e978 100644
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
>> @@ -2504,7 +2504,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
>>  	if ((esz << ids) > (psz * 2)) {
>>  		/*
>>  		 * Find out whether hw supports a single or two-level table by
>> -		 * table by reading bit at offset '62' after writing '1' to it.
>> +		 * reading GITS_BASER_INDIRECT after writing '1' to it.
> 
> I think the second line is redundant anyway. Anyone who can read C can
> immediately see the code is checking the bit after setting it to 1. The
> not so obvious part is that the read back happens in its_write_baser().
> But the way the code is written implies that baser->val is somehow
> updated in its_write_baser(), and if one looks at it, then it's clear.
> 
> In the original comment, "table by" appeared twice. I would just get
> rid of the second line altogether and stop at "table".
> 
Thanks for feedback. I will simplify the comment in this way.>>  		 */
>>  		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
>>  		indirect = !!(baser->val & GITS_BASER_INDIRECT);


