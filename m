Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E71CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0bzbVNhFWf1YSi1Z0fIfU/CFQrMLDywOMvxVXpZ0+Y=; b=Bm0HoJnbmB+CRXGkWnEN0f3kCF
	w5+KAFvYcxs5fe12s6d55XBpW/dqnom8X55EgsDg5w9VhX8wDknJFW+q2dqsLupjvgWPWWdUTL3/c
	bgdzVT9GXK7jCMk8HNT7XoCWpUa/Yd6Uuam+9i/T8mtM8gCPqY48gzb8IEMpsGRfHDz3UAPr3sZOF
	ie9Ur3XE/OTDQ0GmFbbygl/aA0oofnrXHKSwBnDS5K4ciiuh95OsRrMpvvr6oZexYr9DuiUYfMgHW
	G5Vjiz76G2L1eGD1+Cjq9FK6B0+nO+o4qqCcXBJI04jSvQqgLuEmtAzTzcDZGXrE8M6Oj2XasBNA1
	3LEmbwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIuz-0000000F4uh-3DEd;
	Tue, 16 Jun 2026 01:48:45 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIux-0000000F4ta-1L5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 01:48:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gfVHQ54plzKHMXS
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:47:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id C00A74056F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:48:32 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgBnaj9vqzBqQoHOBw--.35789S2;
	Tue, 16 Jun 2026 09:48:32 +0800 (CST)
Message-ID: <035b1642-e358-4074-8e2c-29b0ada34912@huaweicloud.com>
Date: Tue, 16 Jun 2026 09:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] irqchip/gic-v3-its: Add ITS address info in more
 error logs
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
 <20260615032910.54735-5-shikemeng@huaweicloud.com>
 <87h5n489dr.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87h5n489dr.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBnaj9vqzBqQoHOBw--.35789S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5Q7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWHqcUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_184843_563115_17EE28FD 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

在 2026/6/15 17:01:52, Marc Zyngier 写道:
> On Mon, 15 Jun 2026 04:29:08 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> We have a lot of logs containing ITS address info which is helpful to
>> distiguish which ITS occurs error. Just add ITS address info into more
>> exsiting error logs.
> 
> That's only useful on buggy HW, for people debugging it. I don't think
> that's useful outside of these scenarios, and this hack can live out
> of tree.
> 
I agree this is only useful in rare cases, but I believe there
is no lose...
But no insistant on this anyway...

Thanks,
Kemeng
> 	M.
> 


