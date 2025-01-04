Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8D8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pafziGh/Unrt4lz6VQy7X9Z7gUtdo8GvLI2FHW/xR+U=; b=Vsg+4hkriCZXlJAbODdbDEOlsY
	Kk/9fcH4eNy5nhcyrzBa73815zwqTZVwTffjK86dhOX/c6521/p9D4fXYQ3vmnLaPONba0X28boCp
	OhtdHXFkWXkYYVPVIvRjh7E+kbmW7p1SzSe3XhDOdgmyfueU0KD9lWEn4EQRWIh3exqSlmZzroNCp
	fVynO5TgttMekVyfC8KrJIlxjFxwrEWO8VbwO3A8pfGVkKcbydqR08dmJvF1IVjBaIF9OHPVzSuGi
	hl0mvv59MC9HRKf5RDhixoPKG2Usm/ZAp/TU2L05EATZat3a6KZKsE+Tmwl39JAal+0NX1aEKaovf
	w9+U1jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1Po-0000000Erv5-0qfd;
	Sat, 04 Jan 2025 10:29:56 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU1Ob-0000000Erm1-3wfY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 10:28:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YQGmg14MVz2DjkX;
	Sat,  4 Jan 2025 18:25:39 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 704A81402C7;
	Sat,  4 Jan 2025 18:28:35 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 4 Jan 2025 18:28:34 +0800
Message-ID: <6f68ad68-c233-46b4-fb83-b09e21c8936f@huawei.com>
Date: Sat, 4 Jan 2025 18:28:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH mpam/v6.10-rc1 RFC 0/4] arm_mpam: Fix several minor issues
Content-Language: en-US
To: James Morse <james.morse@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <20240722040140.515173-1-zengheng4@huawei.com>
 <ee78c9e9-ff47-416c-8bb2-55b0a903e13a@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <ee78c9e9-ff47-416c-8bb2-55b0a903e13a@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_022842_141565_02D9D8A9 
X-CRM114-Status: GOOD (  10.91  )
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



On 2024/12/21 1:51, James Morse wrote:
> Hello!
> 
> On 22/07/2024 05:01, Zeng Heng wrote:
>> After completing the necessary software adaptation for the local chipset,
>> the MPAM function is successfully enabled. After related tests are
>> completed, some issues were discovered and here attempt to fix them.
>>
>> Hope to get some suggestions for modifications, if I miss any rules should
>> be followed, please let me know.
> 
> Sorry for the delay following these up - they should all be fixed in the newer
> versions of the tree. I've added 'CC' tags to the patches you fixed here.
> 
> 
> Thanks,
> 
> James
> 


Thanks for your reply!

I have found they are all fixed in the latest branch already.

For the MPAM driver, I have updated the Narrow-PARTID feature patchset.
Please feel free to provide any comments or suggestions, if you were
available.

Here is the link to the v4 of the Narrow-PARTID feature:
https://lore.kernel.org/all/20250104101224.873926-1-zengheng4@huawei.com/

Thank you in advance.


Greetings for new year,
Zeng Heng

