Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592A8C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzGL80O59SzpAfGJ1UI8UMqMacU1t2W23xKS4+mv0cU=; b=P7MCs/RjX9AfGwT1DplyXPS7gd
	IVhuiBundel2+J4gB1szoZh02LJBojPpt2L11RqX32IDZh/Tr0jBvFVMymaz828LxNkwut9JKPxF6
	bMhleojLhguVPqnYYkGR4o4l6H76sF0LgkwtwV8cyYz4uW1g5/tLFDczEw9c+c92CafeFrVU9VlPg
	jwEoxtm2euLf0A6eeiLTfERTke/P7iOPAX3ewl6kzctSLVmTBjqXsgQuZTzC6cAbyCZpuj0Reognm
	+LTQS+6vV7NXmQyW1ulvi/8Bsu1UVi69+0EUMHwA3PeqCJ0cTHG7wJgWfc+vWyPp84NrYmDBvOzTw
	20AHOoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8z8-000000025z1-3GXe;
	Wed, 26 Aug 2026 08:27:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8z6-000000025ya-1D2b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA9C176A;
	Wed, 26 Aug 2026 01:27:43 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5009C3F7D8;
	Wed, 26 Aug 2026 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732866; bh=sm4GmlZJbEITbLdvJPR+mx1iHf4DvQ7pT/81r+XFUxc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Jh7ZOcqs24gvP4MKupaY7GIUsq4ynRKIDg82XnW4zfy7FCjpa+F5FUvf0FyEmWWmH
	 56YP+/MEoM6abq1/yeS97hZ/iGX5jwlvpETtMupif5EnLriOf2VDo/y1UvsEAijG+2
	 kIwknCXgPoHqAoZriDe174lSN6eZ/8fwr3ns6XbE=
Message-ID: <817b9dc4-9f60-4ba1-b2ec-9dacaf3cb4c3@arm.com>
Date: Wed, 26 Aug 2026 09:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] selftests/arm64: Add MTE test config fragment
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
 <20260825111929.2882324-5-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-5-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012748_367547_FC330754 
X-CRM114-Status: UNSURE (   7.75  )
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
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by these tests.
> 
> Add a fragment covering all tests in arm64.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...

