Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D254C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 01:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghBQFqVFdqek+F6F/OnWZ1gheQOcqRBMudqJ237OBpI=; b=cPqTh5tPALQ24swEWp8W240kR/
	LaYIKdWZSK/dj46rtVfmz9mNwU1EwBC8vdr9buf4xAn3JyX3VnMCFxt2IC0BfouGq/YJhYfS69opE
	GJaLbPRcnx234Pm+dtJ6HjFEpqPFp9CRTP1ShuBGn+rOjvJd1SspJ2Q2ww8VtgI/GWSUpIu36NF5Q
	WU8J0h3NAFlNHXw5P1zwug1nBWUvYkswE4ps3mM6DruLHSJlBe8Yq6M+zYVl5rTD5N6Ej43m7L9L+
	u8z5keQSqEnjVQ4MBhQs/eiqqtoniB3mhV0P7fF+98jvwWRlbcsP528bN2Hd0w6bBqtZsQqnSaTHp
	WjQSQT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfSy7-00000005pzR-04y5;
	Fri, 03 Jul 2026 01:45:27 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfSy4-00000005pyj-0KHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 01:45:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4grxQX18fgzKHMLC
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 09:45:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4DCD340848
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 09:45:20 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgB3S4gvFEdqY0alAg--.55757S2;
	Fri, 03 Jul 2026 09:45:20 +0800 (CST)
Message-ID: <5140126d-ea86-4532-9ee3-33b98a064d1e@huaweicloud.com>
Date: Fri, 3 Jul 2026 09:45:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] irqchip/gic-v3-its: Add ITS address info in more
 error logs
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
 <20260702033050.1583-5-shikemeng@huaweicloud.com>
 <87h5mh6o1q.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87h5mh6o1q.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgB3S4gvFEdqY0alAg--.55757S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr4rGFW3Xr1kKrW5uFW8tFb_yoWfZrXEy3
	W0q3Z5Cwnrtw4xJF4Y9asFvF1DKay29r1DXFWjqF9rJryYyFn8G34qgrn5ZF48GF4qvrnx
	JasYqryY934I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbz8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwzuWDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_184524_308507_C71001DA 
X-CRM114-Status: GOOD (  10.93  )
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

在 2026/7/3 6:10:09, Marc Zyngier 写道:
> On Thu, 02 Jul 2026 04:30:48 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> Multiple ITS units may exist in a system. When an error occurs, it is
>> difficult to identify which ITS triggered it because most error logs
>> lack the ITS address. Some logs already include this information and
>> is useful for debugging. Add the ITS address to the remaining error
>> logs so that all ITS-related errors can be consistently attributed to
>> a specific ITS instance.
> 
> I already said *no* to this.
> 
> If you want to log errors, implement a PMU or RAS driver that reports
> errors on a per ITS basis, in a way that is collectable by existing
> tooling.
> 
> The kernel log is not the place for your sorry debug hacks, which is
> in general not readable by normal users. And I'd rather remove the
> other instances as a matter of consistency.
> 
Will drop this in next version...> 	M.
> 


