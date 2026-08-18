Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE9C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwcEXokmP2J4hk8EXX8kY+yWMRUt8Yu5aM5VV4vrcI4=; b=0whna4doG3TVV8+QlZNrmwezGa
	qh1auLIlJIquKjpx/b6rdEd/QGP5O6OyL4iPoebAzMwRYRYyc9OLoMd+ZXzDxJa336oMY/i5CTbfe
	6Jump8UkNzDuc7aR0jk1x9AihlZpeT+hlPDsmI6ItNT2SWiRSrN+qx774XDJW5poUXnh7xKQqEeGL
	0o0HiRT8S5zdny6vB2uF9wiu/p/3rPsmGIIHYjlGlVbANdaRKn2CA54bm/yhjcNbg68ivHD0ENQl+
	+jKYn188zrCr3RW8fPVxe73AJIkmhEu1x2cDDETBd7prvvlpVvYtG7P7FIJFM+850AvxPYne73hHz
	hHiRpp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAOi-00000007Arv-3spq;
	Tue, 18 Aug 2026 03:21:56 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAOh-00000007ArA-1dRZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:21:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nwcEXokmP2J4hk8EXX8kY+yWMRUt8Yu5aM5VV4vrcI4=;
	b=SVkIa0LoMHjOO3cjThRyo/Ir77BA1Zwy6uBCLZCjoYCfLD4WjoYkN1jNotoz5miZEppC2DiUA
	D7VraZxzE2p9mMUlqc7V2p4Prle7JpWV/qcf0pt2Rbg4sEgcU8cNrF6ndVjADq2rj9K1dCRsIz7
	U1zY76qkpy4vMWbcwy5QI7c=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hPF8Y0m56z1prLc;
	Tue, 18 Aug 2026 11:11:09 +0800 (CST)
Received: from kwepemo100005.china.huawei.com (unknown [7.202.195.212])
	by mail.maildlp.com (Postfix) with ESMTPS id 9600540537;
	Tue, 18 Aug 2026 11:21:51 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemo100005.china.huawei.com
 (7.202.195.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 18 Aug
 2026 11:21:51 +0800
Message-ID: <466ac487-d5fd-4b99-9e83-375babbaccca@huawei.com>
Date: Tue, 18 Aug 2026 11:21:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: ABI: kunpeng_hccs: update the Contact
To: Pengjie Zhang <zhangpengjie2@huawei.com>, <xuwei5@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
References: <20260818025358.1408963-1-zhangpengjie2@huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260818025358.1408963-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo100005.china.huawei.com (7.202.195.212)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202155_595873_59A71FB9 
X-CRM114-Status: UNSURE (   4.76  )
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
> Update the Contact for the kunpeng_hccs sysfs interfaces.
>
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
Acked-by: Huisong Li <lihuisong@huawei.com>

