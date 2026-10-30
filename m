Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC768606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PVC4rfGq;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Unh/wbOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R32rGPcJuG+1kCDhnHECP/PCqav9h3by8BHulE0myn4=; b=PVC4rfGqhtJBFl
	bI6U20ps7QUUGTDFKUpx8UQgGT36qMyu88be8PPA3fUNY6FZdteYOT9V/WcLfJoELjmLvwHqF8jXs
	NqkiIpF4zqvQ2WrcijcyjfLeZArdPO1IH1e8/WmB6srvI/mf8tD3qXw43KdWNfgmTZ7NAAc6lP9Rv
	b23BSWZV5Zc4h14tsCmgyhzyBx+uuxjl9rjxgX7/966eDSVcXiiYLEQFKYlDx8yc1xSXinOVQkgtw
	2xMbAu55ySPIxZtDrqTjelYr26r0BdfJIv3hT5okMOJSxR50go66QpHCBcMHlfHJRkL/cgQ4ra/ST
	MHEnvmLk2Q4DCafyr6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcks-0000000Ah6X-0lM8;
	Fri, 30 Oct 2026 02:54:10 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcko-0000000Ah60-1qLz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 02:54:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R32rGPcJuG+1kCDhnHECP/PCqav9h3by8BHulE0myn4=;
	b=Unh/wbOFJAII1gDiU/F8veoDlAxf3h+Pjvdy/1dOAIZPRYuocBY31he/5knqTdGoGovtmcwML
	XvQdJ+ueqPeQKCYaPPM0bZ1ZSGqYTs/EZxNqO4WTd4Q0zQ6D1+1LbnP+1BqJJmbgBiSkzqj+XeS
	EvdUwJ1ckbq1VmqrXfnldKM=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jG5K16Mmmz1K9D6;
	Fri, 30 Oct 2026 10:53:57 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CE2B40565;
	Fri, 30 Oct 2026 10:53:59 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 30 Oct 2026 10:53:58 +0800
Message-ID: <a301e884-f6d1-4082-8551-8d8a17276dc3@huawei.com>
Date: Fri, 30 Oct 2026 10:53:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/15] KVM: arm64: Add support for FEAT_HDBSS
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>,
	<tangchengchang@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>, <mark.rutland@arm.com>,
	<seanjc@google.com>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-7-zhengtian10@huawei.com> <at-X_hFbsBU_Dsgr@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <at-X_hFbsBU_Dsgr@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_195407_154125_2B6AF48D 
X-CRM114-Status: GOOD (  17.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/2026 2:12 AM, Leonardo Bras wrote:
> On Tue, Sep 29, 2026 at 06:36:46PM +0800, Tian Zheng wrote:
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 32102c3912fa..12fa37328dd2 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2158,6 +2158,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>   }
>>
>> +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int scope)
>> +{
>> +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, scope);
>> +}
>> +
> 

Hi leo,

> IIUC you run this on every cpu in the system, to make sure it's matching
> the feature. Is there any chance the kernel is in EL2 only on some of the
> cpus here?
> 

It's impossible for the system to have only some CPUs in EL2 and others
  not.

> If not, maybe we can run it on system_supports_hdbss() instead, which would
> be easier for the user to understand it only runs in EL2, on top of not
> needing the above.
> 

However, The question is whether a cap should mean "this system can use
the feature" or "this hardware supports the feature". If the cap only
tracks hardware support, users may be confused when the hardware
supports HDBSS but the system runs in nVHE mode — they would mistakenly
believe they can use the feature.

So I think we should keep is_kernel_in_hyp_mode() in has_vhe_hdbss(),
and add a comment in system_supports_hdbss() explaining this.

Does that work for you? Looking forward to your reply.

Thanks,
Tian



