Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0326FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 03:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsWwoCs93Um3JYNFCpNaC4HXVU7DPMMaCX8gxx6WqPY=; b=dtJnIWXMpidS0kJtIRBkUAvnlG
	/n/+mKWz8c7yF6yIcVhzNaPYRVRDZcTb527ZSzbFRaAgQygMfnmKL5RPzQZHWaFKir/Jsn5vX7V8X
	r4YKU2KDuBW3nrBvhv/Zl9o+WkiOU3lYf+rSN0grCHUJ0WAe/rnz0p0+Gpn7kaD9ZfdlpwRJTqYZ1
	gQVA8HjUy4/97RP4aLg1AfCmAWwoyu+CtD1eu75PdKdNBqSnZEpkf/gHW38GLNAkRpKwBebOR8N0o
	23CyclQYTN6IYrdudv/QUdSyRAq0yfXvwEK6H2vnj984qmoxkVzDwmBkF8wxMN2dSB6Oq0rMHZxQQ
	jEcmaing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui2cG-0000000777S-2dje;
	Sat, 02 Aug 2025 03:09:00 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui2Zg-000000076zn-395a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 03:06:22 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bv71b2ntLz2TSv1;
	Sat,  2 Aug 2025 11:03:31 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 31C0814027A;
	Sat,  2 Aug 2025 11:05:57 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 2 Aug 2025 11:05:56 +0800
Message-ID: <835eae02-3f7b-42b8-b237-437699c8103f@huawei.com>
Date: Sat, 2 Aug 2025 11:05:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regarding the Issue of vNMI Not Supporting Live Migration
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Zhou Wang <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
	Luchunhua <luchunhua@huawei.com>, liuyonglong <liuyonglong@huawei.com>,
	"xuwei (O)" <xuwei5@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
References: <c7bc0979-3721-49ba-89bd-ebcaa5ce70d9@huawei.com>
 <86wm7n6ya2.wl-maz@kernel.org>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <86wm7n6ya2.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_200620_947468_56B2E6B2 
X-CRM114-Status: GOOD (  12.26  )
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



On 2025/8/1 20:07, Marc Zyngier wrote:
> On Fri, 01 Aug 2025 09:00:07 +0100,
> Jinqian Yang <yangjinqian1@huawei.com> wrote:
>>
>> Hi，marc
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=arm64/nmi
>>
>> During the testing of this set of vNMI patches, it was discovered that
>> vNMI do not support live
>> migration. The reason is that GICD_INMIR/GICR_INMIR0 have not been
>> migrated, causing
>> irq->nmi to reset to 0 after migration. Therefore, to resolve this
>> issue, we need to complete the
>> migration of GICD_INMIR/GICR_INMIR0. This set of patches does not seem
>> to have been uploaded
>> to the mainline. I was wondering if these are scheduled for upload to
>> the mainline?
> 
> There patches are *dead*, and will *not* be upstreamed as such. You
> can tell from the date and the base commit that they are old and
> unmaintained.
> 
> Please do not pick random branches from my tree.
> 
> Thanks,
> 
> 	M.
> 
Noted with thanks — will avoid referencing outdated branches in the future.

Thanks,
Jinqian


