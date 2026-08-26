Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365B7C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQfa/MWMMPnKXZMvVCzMsjjXyAmVMVpawLNGnp2W0FY=; b=R21diNvO0RfAKRoMFfrhsDXFcD
	Ger4zIypfXSwXrRGbWtLQw/1Ov6QMcE1k3jVh+Cf7jy1Mz8BCsKPd5USunACC8Fbo6/tqFWp1KJc5
	7ta5ICf9ZLYnBVEuF10AnlABypiovc3RsE4VLkwgSmesot94YbKj2Mt8QZWTk9a3N7xhy6E+femEm
	Ee/aTAcGWRsC34rpYXYN6EH8GP8p4E5FfLJ4lk3NBIERNmWyhoWBpJT/EASSVYlnGcoiDGvb9RVqL
	jgG66pdCon55o82Pc6dMNKXQtdVgwpp6bxWB6a579+lq6EcoLKGz8G05ZPHBpEV4+lDiz19kMvFvT
	Xn5ptJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8x6-000000025Xl-02qS;
	Wed, 26 Aug 2026 08:25:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8x2-000000025WW-2sIa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:25:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CE8F176A;
	Wed, 26 Aug 2026 01:25:34 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F4943F7D8;
	Wed, 26 Aug 2026 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732737; bh=/qvgTJwV6a7RRKEJGCn6RmbAbGidDAJ61ncdiy0rFi4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HDkya+zAwu96qjyLCBT76C8TraqshnqO1tEjhNXtSxSVo5V5pnS25KF/gYiMQb4h+
	 OopT5ac07dH7QZkmqP1jKpEf21NULxDv8sZhyPX9ssLcDqHcgaBhi/5yUnjIYAz43K
	 fBmerG1MszKb/tvOhOGuxgqwVlAf0FPPkYtraF3E=
Message-ID: <fe6096b4-d906-4c1e-aeb3-7ca5cd164cab@arm.com>
Date: Wed, 26 Aug 2026 09:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] selftests/arm64: Print missing MTE TAP headers
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
 <20260825111929.2882324-2-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-2-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012540_849817_AD9A1F6A 
X-CRM114-Status: GOOD (  10.35  )
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
> Most MTE tests set a TAP plan and emit results without first printing
> the TAP version header. Direct execution therefore starts with a plan
> such as "1..20" instead of "TAP version 13".
> 
> The problem is particularly visible in the GCR_EL1 context-switch test.
> It prints its plan before forking 1,024 child processes. When stdout is
> fully buffered, the plan remains in the stdio buffer. Each child inherits
> the pending "1..1" line and flushes its copy from exit(), producing
> repeated plan lines.
> 
> ksft_print_header() prints the TAP header and enables line buffering.
> Call it in every MTE test that is missing it. In the GCR_EL1 test, call
> it before the plan so the plan is flushed before the children are
> forked. In the remaining tests, call it before setup and prerequisite
> checks so early failures and whole-test skips also retain the header.
> 
> Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...

