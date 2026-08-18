Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865C7C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvY06h/f20UHmwIUPyuim4oElH4INOaUk7YC62Vj4wE=; b=AbfsWqibE/+VfLmdWHIueZ1s/A
	+35/9fE5NJ4s7OT1UT2Y35f07EHbAs6VP1X8oVC045lPzZH/5SSS0Iz6cy6/WLTeo6gTE91gL5hov
	MeterI1G+FlaEkayYfpuDsyknnNXTHkscJ7k7EcoGtlF93jXSGX0r0F48QMwuQfqT+gQADAcroceO
	HjczTmuQp4Wx0Ls24Jaj33Jol/xhsOz7E+EUQGc5uDAn9q2fdeZ5cWU1G1csA43iURakR+EPNAEcK
	C6cpchc6oUjcS6y9E9go7F3MQOZwbhrxyPunmFyD/08Yntsg0eAgdE3QF3fw6tHYUDRe2wDjrhxmV
	aZNm2ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwANo-00000007Ace-2fB7;
	Tue, 18 Aug 2026 03:21:00 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwANk-00000007Ac0-1I2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:20:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bvY06h/f20UHmwIUPyuim4oElH4INOaUk7YC62Vj4wE=;
	b=YF/yve9onfoPduI80zvAV5yG7o3yCYyDaXeyAXIBT7GmhjVej7nK7YiHkjDVf4+zIH+EFmCP7
	xVqxKq5Zdi2uf/Cvilex0Vw6JUkv3Q9IIKQPDTpBjV1NyPiF7r/Iu2zNgphgyHzso37Ztj3tN7v
	T+pjBkgnv5Qe0Xpi/0yw95U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hPF7g5jb0zcbPG;
	Tue, 18 Aug 2026 11:10:23 +0800 (CST)
Received: from kwepemo100005.china.huawei.com (unknown [7.202.195.212])
	by mail.maildlp.com (Postfix) with ESMTPS id 72C0B4057F;
	Tue, 18 Aug 2026 11:20:41 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemo100005.china.huawei.com
 (7.202.195.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 18 Aug
 2026 11:20:40 +0800
Message-ID: <c5023e58-951e-4f95-8bc4-e23f17ec1c02@huawei.com>
Date: Tue, 18 Aug 2026 11:20:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of kunpeng_hccs
To: Pengjie Zhang <zhangpengjie2@huawei.com>, <xuwei5@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
References: <20260818025341.1408345-1-zhangpengjie2@huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260818025341.1408345-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo100005.china.huawei.com (7.202.195.212)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202056_832208_958768E4 
X-CRM114-Status: UNSURE (   5.19  )
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


On 8/18/2026 10:53 AM, Pengjie Zhang wrote:
> Add myself as maintainer of HISILICON KUNPENG SOC HCCS DRIVER
> as I will be responsible for this driver.
>
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
Thanks,
Acked-by: Huisong Li <lihuisong@huawei.com>

