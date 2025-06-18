Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28C3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfCJdV9wxuKdL/QXqXJ2OI+GYSNaMtPWLXF5xou/Nrc=; b=Ap3XlBNi46FpuuPWdTiRBWEv5/
	KzJlsTYoL2gk8eUnRN7VLBOmUixkaW9HfjRdVCHF8aEbK0xU24QJ7/EQHzVcdfqQFloHuFcXuFkFF
	k4rGDZY8UvQNeo3np1Av1GPyj3kcRTV44jR9LxCdFcLWFie9Wg7wp2I7nC6IUl93/4VyHk3w7EROJ
	z9IfhdnJKXFI/Pia5qbFAtYAKx8IZOJqWriB/a0lYfUaLeuU03FGU/n8Uy8jUVWyQdoriNDTgj9Ia
	kN+y9D7Y2a7qQ8SmHnAFUje71bahM6TfMw27pEJxNjrbDnNoxKPDRgnbCvESLPF+yglruPsT34hIX
	IgFxg3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmez-00000009E2M-2DGu;
	Wed, 18 Jun 2025 06:52:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmaj-00000009Dd4-35UW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 06:48:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bMZ4n4C3Wz13MbW;
	Wed, 18 Jun 2025 14:45:45 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AF371401F1;
	Wed, 18 Jun 2025 14:47:57 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 14:47:56 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 14:47:55 +0800
CC: <yangyicong@hisilicon.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Ali Saidi <alisaidi@amazon.com>, "Leo
 Yan" <leo.yan@linaro.org>, Will Deacon <will@kernel.org>, James Morse
	<james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, yangjinqian
	<yangjinqian1@huawei.com>, Douglas Anderson <dianders@chromium.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Adrian Hunter
	<adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>, Jiri Olsa
	<jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Namhyung Kim
	<namhyung@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
To: Leo Yan <leo.yan@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com> <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8c5180e3-9040-a694-3160-023c05976157@huawei.com>
Date: Wed, 18 Jun 2025 14:47:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250617141810.GB794930@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_234814_106338_A9E85564 
X-CRM114-Status: GOOD (  28.95  )
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

On 2025/6/17 22:18, Leo Yan wrote:
> On Mon, Jun 16, 2025 at 06:47:25PM +0100, Mark Rutland wrote:
> 
> [...]
> 
>>>> ok this sounds just like as before except rename the midr check function and modify the
>>>> users in perf. will do in below steps:
>>>> - move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
>>>>   since they're only used in the kernel with errata information
>>>> - introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
>>>>   is within the ranges. (is_perf_midr_in_range_list() only make sense in
>>>>   userspace and is a bit strange to me in a kernel header). maybe reimplement
>>>>   is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
>>>>   no users in kernel
>>>> - copy cputype.h to userspace and make users use new is_target_midr_in_range_list()
>>>>
>>>> this will avoid touching the kernel too much and userspace don't need to implement
>>>> a separate function.
>>>
>>> My understanding is we don't need to touch anything in kernel side, we
>>> simply add a wrapper in perf tool to call midr_is_cpu_model_range().
>>>
>>> When introduce is_target_midr_in_range_list() in kernel's cputype.h,
>>> if no consumers in kernel use it and only useful for perf tool, then
>>> it is unlikely to be accepted.
>>
>> I think all of this is just working around the problem that
>> asm/cputype.h was never intended to be used in userspace. Likewise with
>> the other headers that we copy into tools/.
>>
>> If there are bits that we *want* to share with tools/, let's factor that
>> out. The actual MIDR values are a good candidate for that -- we can
>> follow the same approach as with sysreg-defs.h.
> 
> Thanks for suggestion, Mark.
> 
> It makes sense to me for extracting MIDR and sharing between kernel and
> tools/. I have created a task for following up the refactoring.
> 
>> Other than that, I think that userspace should just maintain its own
>> infrastructure, and only pull in things from kernel sources when there's
>> a specific reason to. Otherwise we're just creating busywork.
> 
> I agree with the methodology.
> 
> Since Arnaldo is facing build failure when sync headers between kernel
> and perf tool, to avoid long latency, let us split the refactoriing
> into separate steps.
> 
> As a first step, I think my previous suggestion is valid, we can create a
> header tools/perf/arch/arm64/include/cputype.h with below code:
> 
>   #include "../../../../arch/arm64/include/asm/cputype.h"
> 
>   static bool is_perf_midr_in_range_list(u32 midr,
>                                          struct midr_range const *ranges)
>   {
>           while (ranges->model) {
>                   if (midr_is_cpu_model_range(midr, ranges->model,
>                                   ranges->rv_min, ranges->rv_max))
>                           return true;
>                   ranges++;
>           }
> 
>           return false;
>   }
> 
> Then, once we can generate a dynamic MIDR header file, we can use that
> header and define the midr_range structure specifically in the perf.
> In the end, perf can avoid to include kernel's cputype.h.
> 
> If no objection, Yicong, do you mind preparing the patch mentioned
> above? Thanks!
> 

sure. will post today.

Thanks.


