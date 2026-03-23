Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A36EC01A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CBitt41aOPgXc609m1BX5pROPHBEKPBN470I8eWNog=; b=NpdCGPUjb2sDEZ+54S4ShxnTUI
	H8xkPAzuATbYIvydPeHVdtuXzeJXVFNiOCs27vSlqZYwFLrQEl314pDFs5p3OR/a9j27bVIJOscS5
	eaK+dLs8H624BVr2rB+YY7GAEVKg4kq6GM5ylltzySMIUJPRTNju43ZAs7267Rgw0SvttAmhSL46k
	xxXm0uV0MGmWHnD3PBlGoy66F8ZJ6a1mMP/A5heHGdjfP7X5+2mccezAMKbmdp3+j12ZrXscPrcGJ
	SehGYE8Tjc3Q2grdFgdJMlFLCOw7hPSLRm7gjFxpd571Hmja/mu+MWyOxOdcctU9QFoDET0ucVb1m
	t9yPSBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bRW-0000000GMTd-3v2U;
	Mon, 23 Mar 2026 09:19:26 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bRF-0000000GMPu-0yc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:19:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1CBitt41aOPgXc609m1BX5pROPHBEKPBN470I8eWNog=;
	b=gRfp1lFHfqlIXOiVL12M6sd6Otkn5CAtDcB1hCVnozxdfyhHTvEv7109iyR4PqquNMC8kSHiU
	eo2yluK6FSYiK/ZZ2+QHzEz5n02jYnGw7CSS8dNqoiPd7X1fepmGvLFRsSXdsAliSWppmfNDQ9B
	s8bp40eTCkXPktGmnpt669E=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4ffSBN6f9zz1K96D;
	Mon, 23 Mar 2026 17:13:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id EEB7040565;
	Mon, 23 Mar 2026 17:19:02 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 17:19:02 +0800
Message-ID: <76186614-aa16-4a73-8fa9-059bb0a70486@huawei.com>
Date: Mon, 23 Mar 2026 17:19:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon
 MBM/MBA test
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-9-wuyifan50@huawei.com>
 <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_021911_310346_380F0CF5 
X-CRM114-Status: UNSURE (   6.43  )
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

Hi Reinette,

On 3/13/2026 5:01 AM, Reinette Chatre wrote:
> Which baseline exposes MB_MON in resctrl?
>
> Reinette
In the MPAM architecture reference manual, the memory-system component
includes the cache and memory channel controller, among others. The memory
channel controller can implement a memory bandwidth usage monitor.
I noticed that arm_mpam maps other classes to l3 in the resctrl glue code,
so I will fix this in the next version.

Regards,
Yifan Wu


