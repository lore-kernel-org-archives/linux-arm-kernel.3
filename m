Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0748EC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pzQwDz32x/ztmSsVH8gGlaEXRCpDY7Ftrx1yLpAcpM=; b=tr9ptRGw5dYzqjKiMHO3NQwLmF
	JpkUi+T/y/+vKLPyEkGqEn7GyQ2IFhDr5sGgNi0btptrmTPFsRmo2lMUHsDHEUU/E+Bk5tvqKQ7l6
	FbArjgtrQOMeSuxd0qGZj8AE367WjHCybjYn/qf/j5HyWj0uvaETbXWVhL4k1ZS2Vwo4U88v6WeZa
	F8ligxPYtfdhEuZfskkoRG+/rIcXgbORLNJFtrw9izBD+/GXM8wpidlwZEUocoZG9gXneWfOmktSQ
	DiS30PD7IC6vvdsQtCQQ4Ot7mtxgtj3zMiX8oxFI1cj1j/+rK0HRB95Z2E9D1V0LytW71g2U3cP7c
	NxjReWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Ag-00000008FJg-3Dg8;
	Tue, 21 Jul 2026 02:25:26 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Ad-00000008FJ5-2igK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:25:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h41Rf593czKHMww
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 10:24:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 10E834058D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 10:25:12 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDH+luH2F5qh2X1Bw--.36220S2;
	Tue, 21 Jul 2026 10:25:11 +0800 (CST)
Message-ID: <b6bc000b-07c9-42bf-81b2-b3b4c8ed18c3@huaweicloud.com>
Date: Tue, 21 Jul 2026 10:25:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Some Minor fixes and cleanups to
 irqchip/gic-v3-its
To: Thomas Gleixner <tglx@kernel.org>, maz@kernel.org, jason@lakedaemon.net,
 lpieralisi@kernel.org, radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
 <8733xdmrcp.ffs@fw13>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <8733xdmrcp.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDH+luH2F5qh2X1Bw--.36220S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYb7kC6x804xWl14x267AKxVW8JVW5JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF
	54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UGYL
	9UUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_192523_891547_BB0BAD92 
X-CRM114-Status: UNSURE (   9.87  )
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

在 2026/7/21 2:46:30, Thomas Gleixner 写道:
> On Mon, Jul 20 2026 at 15:12, Kemeng Shi wrote:
>>
>> Kemeng Shi (4):
>>   irqchip/gic-v3-its: Fix memleak in its_probe_one()
>>   irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
> 
> Why are you resending already merged patches? You got an email
> notification about it, no?
Sorry for this.
I didn't see the notification before and still can't find the notification
by searching my mailbox.
I will drop these patches in next version and will check the tree before
sending a new patchset.


