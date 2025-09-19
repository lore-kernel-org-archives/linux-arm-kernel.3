Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8F8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1oNcD4+nzoLbd2M82chohHbVGr1Po00vTR5OkWCBJ4=; b=L3p4GofNoLPY5A9M4YHbzWT+fB
	3ML5vjcuzOT/ZvU31mxdWGzvbtQbTAOsp/T4akUmzjvSErgKESfzKrB4offACSThWufJmBmrItvS7
	HRt/+nhS0L2aU1rYs1CFlhcj4tIxZBLzSPL0GOIzjFMrS3hDtlwSXgJ7pZncoG21q2RFrEnD0xD2H
	SqqNp8jqZmuhNf02R/ys38IkLba0cL2+RCjNy8TPX/mufPx6ywBjT8BXIuMTgs1Ouan0P6nQcw98e
	DiftEXI8rtvANfTFlmDasZDh+DDFDpTw2lbz6YXPfgToGAzr+uKPDbyXvsCIbbKXBO3Ei1TLxMIRZ
	rGpllvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWtC-00000002IuL-36Tu;
	Fri, 19 Sep 2025 08:54:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWt9-00000002Itq-1PW2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:54:45 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cSmWY2dmpztTJ4;
	Fri, 19 Sep 2025 16:53:45 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 02DB7180464;
	Fri, 19 Sep 2025 16:54:39 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 16:54:38 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 16:54:38 +0800
CC: <yangyicong@hisilicon.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>, <hejunhao3@h-partners.com>
Subject: Re: [PATCH v6 3/3] MAINTAINERS: Remove myself from HiSilicon PMU
 maintainers
To: Will Deacon <will@kernel.org>
References: <20250814091622.23269-1-yangyicong@huawei.com>
 <20250814091622.23269-4-yangyicong@huawei.com>
 <aMwOjne-iiFCdo9n@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b476874a-8b09-5777-98c8-dc1efaa23a31@huawei.com>
Date: Fri, 19 Sep 2025 16:54:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aMwOjne-iiFCdo9n@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_015443_540157_A45C1AB7 
X-CRM114-Status: GOOD (  12.05  )
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

On 2025/9/18 21:52, Will Deacon wrote:
> On Thu, Aug 14, 2025 at 05:16:22PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Remove myself as I'm leaving HiSilicon and not suitable for maintaining
>> this. Thanks for the journey.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  MAINTAINERS | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Thanks, Yicong, for all your contributions to the perf drivers and help
> with reviewing over the years.
> 

my pleasure. learnt a lot and happy to help. lots of fun :)

> We will miss you :(
> 

thanks. hopefully will still work with you and the community :)

thanks.


