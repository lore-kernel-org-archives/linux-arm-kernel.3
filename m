Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8303CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuxNq8DJMHO+QLD6t4u+LmLBBDApD5OvfSZbyD2hYTA=; b=fhGT4pxtokY7/kKk4PrwZZoPqX
	gshtxb56/d4qS/RuBw0BTZfsTRzA56qwfWRODvkJHfwAJH9NJ9+1iq20QWo8LMOBIuVOv8DHalNWu
	uRCoICFNPoToF1qjWsYV46DA6O/QDqc2xV4xmO2HHqZGp0B7CXIOX5VbNQslD+lVxu034HS4ojq21
	J7HG+CA9jIC3yjYbJeD5ViPdhzgxRAdBkqKeEGp9EVxkW/+ORnmqgA5KlB/SJlKeWrMJONpmjnlS2
	k/OM8qtQ9pFGxv1elOaJI6eHrvv2E5Cdgbv6QrspNcAeC+ahCHD3twkkdm7Bp7sF5JN69qQRIWfiH
	2y9tkxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIwb-0000000F55l-0Hv8;
	Tue, 16 Jun 2026 01:50:25 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIwY-0000000F55N-3l0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 01:50:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gfVKr43ypzYQtsq
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:49:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 9B1CA409A2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:50:20 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP2 (Coremail) with SMTP id Syh0CgDHioDcqzBqJ3rRBw--.50946S2;
	Tue, 16 Jun 2026 09:50:20 +0800 (CST)
Message-ID: <34fd685a-cc90-436c-906f-14238672b34f@huaweicloud.com>
Date: Tue, 16 Jun 2026 09:50:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] irqchip/gic-v3-its: some minor cleanups
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
 <20260615032910.54735-7-shikemeng@huaweicloud.com>
 <87eci888ss.wl-maz@kernel.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <87eci888ss.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgDHioDcqzBqJ3rRBw--.50946S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1UurWkJr17Zw17JFWDJwb_yoWxKrX_Kr
	10v3sY9w1Yg3y8GF9I9a17Jrn8XFn5J3yktFyUW393WryIyFW8GasYkr4fZF13Ga9rX3sx
	uayFk3y7tw429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbOkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUwmhFDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_185023_157270_29B6ABC5 
X-CRM114-Status: UNSURE (   9.14  )
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

在 2026/6/15 17:14:27, Marc Zyngier 写道:
> On Mon, 15 Jun 2026 04:29:10 +0100,
> Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> 1. Remove unneeded NULL check in itt_alloc_pool() as addr will always be
>> NULL when we reach here.
>> 2. Correct indentation in cpumask_pick_least_loaded()
>> 3. Remove unneeded updation of range node when it is to be deleted in
>> alloc_lpi_range().
>> 4. Remove unneeded assignment to baser->psz which is already used
>> as input inits_setup_baser()
> 
> Honestly, these changes, aside from (maybe) the last one, are pretty
> pointless. I'm sure there are better things to waste your time on.
> 
No insistant on this. I will drop this in next version.

Thanks,
Kemeng> 	M.
> 


