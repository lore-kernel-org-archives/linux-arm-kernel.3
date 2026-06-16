Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E531CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USRgNawOUomKcCSYJ+FnSdzubK9eX6UjxmHKvO2GeVI=; b=3a8UPKDSO3P5q4sAmRzhYzDqcx
	+sMmzIa46b1x94NAWeXWLgj5V5zUCmGjdqKNq/lwtSpSwF3hcACtC0bOO5Bd8GHlzSrA/Yd+2kg8W
	3CIjGDfSW9lLapRDxZB6h+zEbtvJ0x4JvEjQOJ1O/1x+ZLyM2nOn6/3KUte8rf/s/qJIQQs0c9na+
	xxyGdmxOauSE3C3+ZcbrsjI3NaEYQ48UFvuH4M0yVjNn6E/MqvqZrjcyaKtDorX/SKQLGORLqfGHR
	sPW6mAuLiIlDNkMZE5C562qjduIPU+265PGyoBKUnL1joz+Yq64vxcWRHasDCidOo0q3cKpzkUMZV
	TL/2kMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIva-0000000F4yx-3hVq;
	Tue, 16 Jun 2026 01:49:22 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIvY-0000000F4yP-1zxC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 01:49:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gfVJc2JySzYQtrW
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:48:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 60DEC4056B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:49:16 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with SMTP id _Ch0CgDHbQmbqzBqPmTABw--.36524S2;
	Tue, 16 Jun 2026 09:49:16 +0800 (CST)
Message-ID: <d505f1e3-e12f-4dc8-a796-ae8dc6795aa6@huaweicloud.com>
Date: Tue, 16 Jun 2026 09:49:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] irqchip/gic-v3-its: fix typo in comments
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
 <20260615032910.54735-6-shikemeng@huaweicloud.com>
 <87fr2o89ak.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87fr2o89ak.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgDHbQmbqzBqPmTABw--.36524S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury5try8ZFyfAw4Dtr1DWrg_yoW8WF4UpF
	WUGa42kr4fAFWj93W7Za10vFyYqws2kFWUGrWDGa4fX3s8Gr93XF4UtryagFn7Ar17Jr1Y
	va1S9ayUZ3yUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU1QVy3UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_184920_882731_3EC4F811 
X-CRM114-Status: GOOD (  18.67  )
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

在 2026/6/15 17:03:47, Marc Zyngier 写道:
> On Mon, 15 Jun 2026 04:29:09 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> 1. "If it some" -> "If some"
>> 2. "by table by reading" -> by reading"
>>
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index becd8dd51720..fc32a1709f76 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -163,7 +163,7 @@ struct event_lpi_map {
>>  
>>  /*
>>   * The ITS view of a device - belongs to an ITS, owns an interrupt
>> - * translation table, and a list of interrupts.  If it some of its
>> + * translation table, and a list of interrupts.  If some of its
>>   * LPIs are injected into a guest (GICv4), the event_map.vm field
>>   * indicates which one.
>>   */
>> @@ -2501,7 +2501,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
>>  	if ((esz << ids) > (psz * 2)) {
>>  		/*
>>  		 * Find out whether hw supports a single or two-level table by
>> -		 * table by reading bit at offset '62' after writing '1' to it.
>> +		 * reading bit at offset '62' after writing '1' to it.
>>  		 */
> 
> If you are going to fix that comment, fix it for good by replacing the
> reference to a bit number with its actual name, making it valuable for
> everyone.
Will improve with this in next version.

Thanks,
Kemeng> 
> 	M.
> 
>>  		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
>>  		indirect = !!(baser->val & GITS_BASER_INDIRECT);
>> -- 
>> 2.36.1
>>
>>
> 


