Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B7EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 02:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4h5nvDH5y6ZPeYDeRN225ZtH3YeEfTgUYEMWS9qK3Bk=; b=r7/9lVbE/3cJLnmucZ/L+D8yG0
	TBeuxf7HKKfjs4aBFmIj6fdiaIGOlUZDSHqYQjYm7gS2PmP5N6wFhBolfuUU4V4udQPHlmpeygcdT
	bGzVUNhl02rEMtf/1otu5g+qDtPhcJWSND7dptO3ovMcrnoHTBdhYJZCTXLZgZ8A0AMRaGd8Ln0kU
	TaPGe/3eRcRgTgicgWgXfqG8XAD8VIWvMQ7d5yaSY0OXlSYzkfjhrBD/NxshL1Xcg8aWb7JqHEF7x
	5C4gBGlDyvcw6OgSX2SpxIgVMohyAmgc5lkdWy64o4p2DcdrAdr0yAE8uthxclKEBgSJIgMXuloJl
	B84s4wtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Rb-00000003Rf3-2W72;
	Thu, 02 Jul 2026 02:46:27 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7RZ-00000003Re0-09h7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 02:46:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4grLpP6pFVzYQtmf
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 10:45:17 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 7254B406B4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 10:46:13 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgBHt_Tz0EVqajg0Ag--.16452S2;
	Thu, 02 Jul 2026 10:46:13 +0800 (CST)
Message-ID: <d4ad4375-6c30-49e9-b609-9e4c38f696e7@huaweicloud.com>
Date: Thu, 2 Jul 2026 10:46:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] irqchip/gic-v3-its: some minor improvement in
 comments
To: Thomas Gleixner <tglx@kernel.org>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
 <20260623020135.3584-6-shikemeng@huaweicloud.com> <87wlvgou1b.ffs@fw13>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87wlvgou1b.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgBHt_Tz0EVqajg0Ag--.16452S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5m7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_194625_254429_2B300B39 
X-CRM114-Status: GOOD (  11.06  )
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

在 2026/7/1 0:46:40, Thomas Gleixner 写道:
> On Tue, Jun 23 2026 at 10:01, Kemeng Shi wrote:
> 
>> 1. "If it some" -> "If some"
>> 2. "by table by reading" -> by reading"
>> 3. "reading bit at offset '62'" -> "reading GITS_BASER_INDIRECT"
> 
> Please don't enumerate WHAT the patch is doing. We all can see that from
> the patch itself.
> 
> Something like that is sufficient and clear enough:
> 
>   'Fix grammar and replace a bit number with the symbol for better
>    readability'
Thanks for all the review and corrections to this patchset. I'm sorry
for these sloppy mistakes and will fix them in the next version.


