Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258F3C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6XeT/xOzOd9IAeHHI1445uGYnooQF+Qv7RoyGIhLDc=; b=WRqRWXA3TFdckcRi3iQdKs7kfu
	AqwarOMeopbUOH4nQ090kdE5+vHYVcF7X1RlLJyKvscBcv62jMXBNYDMJYqCUbzP0ueEm2SeXHmB6
	7yLp1vYsvasacoj6yJnxlSmgY6UKNtQVzJr9A4hgyfU2seqcDVhNng/VLmyoocFaH2JUZ1q2jdVr6
	vAxEqqKm/dSdsLDByJ2cd23idoOFS7yguvKki8LDEN/XrTi7/JcLp4Jb8RPHMD+2oa1ht0yumMffS
	ecd5KtcdihgWvd/3Dv2TxALbn6Gb3nC9a+0Jyaz7UG9d1bhmASwbVhqV1Gk243xr+ojHjMSE1YVhQ
	WuI55fbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8yb-000000025qQ-2iGT;
	Wed, 26 Aug 2026 08:27:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8yY-000000025pg-3p4i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:27:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F8EE176A;
	Wed, 26 Aug 2026 01:27:10 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86AA33F7D8;
	Wed, 26 Aug 2026 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732834; bh=mGEZODoxHlgWN2rMotI3PBzoesFZ1tMUxHjv/4k7jaY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LTEo18E75tVAlgJz3I9v5wbLc7rkBEv61lVX0BdAIVZI7GP8dDdrKGysp9CPMS9GQ
	 WIr3Dwhz+zB+KXCFNQXwEAiN9A16Cle/ec7PIvGUBYvGh8Y0HUju7S2qGrvkVQKKjl
	 caf7/82bBD18u+XV2QP6WEsc7mCUkHA2qWNy1qCM=
Message-ID: <21300ec8-272a-4a16-abe8-2ec1f54abe8b@arm.com>
Date: Wed, 26 Aug 2026 09:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] selftests/arm64: Fix MTE prctl TAP plan
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-4-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-4-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012715_021799_25C39E3F 
X-CRM114-Status: UNSURE (   8.32  )
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



On 25/08/2026 12:18, Muhammad Usama Anjum wrote:
> The MTE prctl test emits one result from check_basic_read() followed by
> one result for each of the seven entries in mte_modes[]. However, the TAP
> plan only accounts for the array entries, producing:
> 
>   # Planned tests != run tests (7 != 8)
> 
> Include the basic read check in the plan so that all eight emitted results
> are declared.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Fixes: 1f488fb91378 ("kselftest/arm64/mte: Add MTE_STORE_ONLY testcases")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...

