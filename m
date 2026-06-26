Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57321CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v19RZ2lqJbWLkDDjnfTteiXlamzU232XokFC8+lyjHg=; b=nnuEcMdKgldCggGLDusSnnqhXZ
	Vm8ur0qUlmm3YFPTKOTjYmuzTuv/BX21LgGqeWM2Ldn5nq/mJjG2t8CjDWjNbJulQ1aI52BJsrMwz
	EYxzpI8FxkgfgdS9BMiVfmWnefzWNdEPYW65Mgm6rPrNV9cbluSZFSITLdRzOXcOuUUUk71LazHAg
	cH2xqWK3rEH/3PaRQAXoB3vnNg8tVwLMMPWNfJTTjIcJKdMBL24Rl+YphVEf4oxDouoIxf6XOFm9z
	2YAcDSCcXFkDkqv+WDIigCzv+NENn9k//E+bEcLlDfPEf/Hk4qH5lwqeBy7drByXFtcb0UMyvB3Rr
	CHRgc60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd36L-0000000B0vR-3a8a;
	Fri, 26 Jun 2026 09:43:57 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd36I-0000000B0uK-3m6F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:43:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v19RZ2lqJbWLkDDjnfTteiXlamzU232XokFC8+lyjHg=;
	b=UEHM1jVNf7BP9u0yXkvP3oGBWyKHcXY8YT8KQke/s2C7r1sps6XGkJrccc/RsRKYFQhcjvEwV
	krutcXuKigZEEOo8RNUVI7pLINxnLvYxUV4tMm+YB9rkIdoEwzq+JTGIfUEIntEKfcHFEHC4+NP
	a7pF/zXkvCNTyxTKZF6DhuQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gmr9y3GGrz1T4Gb;
	Fri, 26 Jun 2026 17:35:02 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id 224EB40571;
	Fri, 26 Jun 2026 17:43:46 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 26 Jun 2026 17:43:45 +0800
Message-ID: <e7c848ec-fd87-4b51-ac88-72e911023818@huawei.com>
Date: Fri, 26 Jun 2026 17:43:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests/resctrl: Enable dynamic management of
 IMC counters via linked list
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
 <20260522090540.444554-4-wuyifan50@huawei.com>
 <8b51dca5-d1fe-492d-8d54-7709aee4a6c5@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <8b51dca5-d1fe-492d-8d54-7709aee4a6c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100012.china.huawei.com (7.202.195.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_024355_100118_68A087BF 
X-CRM114-Status: UNSURE (   3.80  )
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

On 6/26/2026 6:14 AM, Reinette Chatre wrote:
> With fixup applied and nit addressed:
> | Reviewed-by: Reinette Chatre<reinette.chatre@intel.com>
>
> Reinette
Thanks for the review. I will fix that.

Thanks,
Yifan

