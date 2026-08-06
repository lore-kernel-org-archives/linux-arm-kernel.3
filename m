Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5200AC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur5pxDsq9n9H/HFDYgERPK1NsWX8WsP9dfNsb8PiZ7A=; b=454e6yJRqKNmpvku0+w/Yeg6qd
	0SXzeHBMPhfLOp5cSaFvvHYrDN7p1LaYkK4vFWWpW7VUAl8DyrM5HGxXtCiEzHkCtPfOh+Wv/Awm/
	NVrf2r8U0F4RPy+FXEV+f6B5H1aDJ32KgslLzi4NBrRBjfm6yRlDKUcsXDQE2P4EWgxLQJsSFQlP9
	Z/OyX6qApmO5yn11iuhK4JuzDIwAFTf5jNuQrFPXkEr6Ncf+xBtx5EcrmB1zWctvihZ4GKMSoxRaj
	QQPqxwAYkTMIiBPIB5QxY9zR5c3ezLiy6RVlv+kp9muX18YE6FQWOUx+l1p23GBU4YStwUK6FngYZ
	V6kHamBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwAh-00000005dOl-0j6W;
	Thu, 06 Aug 2026 11:21:59 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwAe-00000005dO9-28qg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:21:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ur5pxDsq9n9H/HFDYgERPK1NsWX8WsP9dfNsb8PiZ7A=;
	b=dxJwxN9GkTzSlBqcHKbke5gNfI/dXT/Nebusaq+T3UE9TgYETuOheUsC4xHpIJo3PcDWJq7Jz
	LcNzL0Bv2BOjitF9hMOAAyCjnfXmNSSc/jD54tjXkANh/EtFGGebRfjNmEIvb5flnLcLkCx719C
	dR9ge5CQMupSII5Ejq53SLQ=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hG4PC6kfjz1K96b;
	Thu,  6 Aug 2026 19:12:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BB17F4055B;
	Thu,  6 Aug 2026 19:21:46 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Aug 2026 19:21:46 +0800
Message-ID: <d57e11b0-c943-4441-b210-4b0549d03b54@huawei.com>
Date: Thu, 6 Aug 2026 19:21:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Ensure tools copy of linux/filter.h exports the
 UAPI
To: Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
CC: He Kuang <hekuang@huawei.com>, Wang Nan <wangnan0@huawei.com>, Arnaldo
 Carvalho de Melo <acme@redhat.com>, "Peter Zijlstra (Intel)"
	<peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, Aishwarya TCV
	<Aishwarya.TCV@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
 <anRpO_kxC9-uKnMh@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <anRpO_kxC9-uKnMh@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_042156_703134_4BA39D5B 
X-CRM114-Status: GOOD (  14.76  )
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



在 2026/8/6 19:00, Will Deacon 写道:
> On Wed, Aug 05, 2026 at 10:32:23PM +0100, Mark Brown wrote:
>> Normally when there is an include/foo.h and an include/uapi/foo.h the
>> non-UAPI copy includes the UAPI copy.  This is the case for the in
>> kernel copy of linux/filter.h but not for the copy in tools/ which
>> results in build breaks for the newly added arm64
>> seccomp_ptrace_x0_bypass selftest.  Add an explicit include of the uapi
>> to fix the test and avoid future surprises.
>>
>> Fixes: 2fcbc4adf997 ("kselftest/arm64: Add seccomp ptrace x0 bypass test")
>> Fixes: f143c11bb7b9 ("tools: bpf: Use local copy of headers including uapi/linux/filter.h")
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>  tools/include/linux/filter.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/include/linux/filter.h b/tools/include/linux/filter.h
>> index bcc6df79301a..4ead4e72097c 100644
>> --- a/tools/include/linux/filter.h
>> +++ b/tools/include/linux/filter.h
>> @@ -6,6 +6,7 @@
>>  #define __TOOLS_LINUX_FILTER_H
>>  
>>  #include <linux/bpf.h>
>> +#include <uapi/linux/filter.h>
>>  
>>  /* ArgX, context and stack frame pointer register positions. Note,
>>   * Arg1, Arg2, Arg3, etc are used as argument mappings of function
> 
> Is this still needed if we take the test changes from Jinjie?
> 
> https://lore.kernel.org/r/20260806090935.39311-1-ruanjinjie@huawei.com

I think both of these are needed for the fix.

https://lore.kernel.org/all/20260806111546.42042-1-ruanjinjie@huawei.com/

> 
> Will
> 


