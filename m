Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC02C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSsEJ/sE1Eczg1jKOdFsL+iRe6l4DBX81fNWGZNDqJw=; b=cNkXt+/JnWFSLgkiP26CL7A1zw
	hdpnY7h//zpR239B/g56M5SzHS1ur0Ny/qjG13pdWsgO7051pK/lI9W3hkNMPNqJfC4X41eneSqLx
	qVrPNJ4rTVh9e6zLhOwk/HQuJS8UE9bgtzVhZ0dZBSNOaLQz3uT98siYZiTBCdWlj4kIoeyDyCqNC
	jlZaFdzPrDuBuBEKXmxG7Yycu2jQMO1RTz4z5uaPnMIISkLynLZNTxehhceR5yka0UkR+CulFtcdB
	G9hSkPRe6hPtx1GjYztbCk+7VGzyqA8WaIJmvlFWXIjg3QfguDPXDFd1L4cq7XmOq/gCGr+/14g/m
	qCp4vVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaw-00000003T32-18Ft;
	Wed, 05 Aug 2026 08:03:22 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWao-00000003SsS-2pkW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:19 +0000
Message-ID: <83784ad9-a51d-4c68-af78-f4f3010ba8a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785916991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kSsEJ/sE1Eczg1jKOdFsL+iRe6l4DBX81fNWGZNDqJw=;
	b=nDWtB1o83TQelmp7M8sA6wsvFikCj5DjJ26GgkJMraqmpL1TeA5hZC+Agy6SthA7GB1ouG
	9iR9t/GKx3AFNc4xORkrk2aIDnpzXH8NehczDiRacma1KG6EuQO5fE9v+mpQZ6fZcbxz93
	Qb4aZ5w3aPlvMw2L9+NvjMoO2ew5r8A=
Date: Wed, 5 Aug 2026 01:03:03 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/22] Add Counter delegation ISA extension support
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <09a2dde3-788b-555e-22ba-2f2582a89524@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <09a2dde3-788b-555e-22ba-2f2582a89524@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010314_904139_4A29DD19 
X-CRM114-Status: GOOD (  17.23  )
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

On 8/4/26 7:14 PM, Paul Walmsley wrote:
> Hi Atish,
> 
> On Wed, 1 Jul 2026, Atish Patra wrote:
> 
>> This series adds the counter delegation extension support. It is based on
>> very early PoC work done by Kevin Xue and mostly rewritten after that.
>> The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
>> on multiple ISA extensions.
> 
> So as you've probably seen, I've started adding some of the prerequisite
> ISA support patches from your series to the RISC-V for-next branch.
> Looks like you're planning to repost the series at least one more time;

Yes. There are couple of comments that I need to address and one bug 
that sashiko found. I will send it tomorrow.

> you can either include those patches again, or base it on RISC-V for-next
> as you wish, but if you include those patches again, please note in your
> cover letter if you've changed anything.

Thanks for queuing the base patches for-next. I will rebase on top of it 
(except the macro vs inline function patches) and send the whole series 
again so that it  easier to apply the remaining patches.

> 
> 
> thanks,
> 
> - Paul
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


