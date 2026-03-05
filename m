Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37313F513E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJtO9dV/a12LOlMN5IETBh0hhQHpj32DpsR053nFryw=; b=je+uLnzMC8XDNCeruW2xWyDMhV
	DxtFoN3vYw+q3xBu9/VXEhp0Haad/+MMGT3O2ui/PwioTmJoUT0ybaUwOCUAin0TDMhgZ+n+8UEz2
	Vu12pTXX04HytfwCAeikeCA/t7HmArX6jHLjnS83JW99zTxOS88NClfLwkLOjJUmEZozs3a5Y6c+q
	WzmHsV3VQKULl3WKeUV9aBAazdDjrzxIFrIjNuNQ3nGbS7dB+JI/XCMDlPLLjsFNKVLoMnYb2B/L/
	77BvRHihblXLGZzn25FoenBbC4YN3wAqdnveRaTlVQm+i8zb/PNGvLuBP9lCv0x+/KBpdc/7ftdil
	vBu9x76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIad-00000002l2N-2A8k;
	Thu, 05 Mar 2026 23:58:47 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIaa-00000002l21-46fY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:58:46 +0000
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625Nw4w04152111
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 15:58:06 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625Nw4w04152111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772755088;
	bh=qJtO9dV/a12LOlMN5IETBh0hhQHpj32DpsR053nFryw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tvl2j1qUAzEOzpzYcXQS0HDWX3adrrEh8wGU4v6g3BKySEWm3C2C7N7KAEslkCD/E
	 j0mWPPahQcrnUpYonuB/XqRZBRARS5nEmqhvWuzwTipZgTaSbKeFgyWaowiUd42153
	 W7MStsBNkxFELd7Ua0ug4CAdu1aF7aWnHPLKAnKGLgvygP3YPLayYTvsiXAb3FaFZT
	 JKrUtuYJyk4iWE4XrNI9xqZLO4q9kEtp3+p0jqjDQ721IZmuf1wgsaxQhQozEAFd76
	 RGAdRJL6GAk2KUvF8L9JrLDfa7jSFNoyWL3JroGMHmBAm94WVUO71tOQTKh8CZxiYj
	 iqR+oML2O5VlA==
Message-ID: <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
Date: Thu, 5 Mar 2026 15:57:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
 <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_155845_046987_0CB1AE80 
X-CRM114-Status: GOOD (  14.34  )
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

On 2026-03-05 01:24, Thomas Weißschuh wrote:
> 
>> Weak references would be a way to work around the link failures. 
> 
> I am still not sure where "the link failures" should be coming from.
> The only sense I can make out of it, is if somebody manually and directly links
> to vdso.so. Like in the following example:
> 
> $ cat test.c 
> #include <stdio.h>
> 
> #include <linux/time.h>
> 
> int __vdso_clock_gettime(__kernel_clockid_t clock, struct __kernel_timespec *ts);
> 
> int main(void)
> {
> 	struct __kernel_timespec ts;
> 	int ret;
> 
> 	printf("__vdso_clock_gettime=%p\n", __vdso_clock_gettime);
> 
> 	ret = __vdso_clock_gettime(CLOCK_REALTIME, &ts);
> 	printf("ret=%d\n", ret);
> }
> $ gcc test.c /lib/modules/$(uname -r)/vdso/vdso64.so
> $ ./a.out 
> __vdso_clock_gettime=0x7ff6ba2eeb80
> ret=0
> 
> This actually works on glibc (not on musl). But it is highly non-standard and
> relies on multiple implementation details. Furthermore it can fail to run on
> systems without a vDSO, as mentioned before.
> 
> Is this the usage pattern you have in mind?
> Do you know of anybody doing things this way?
> 

Yes, and yes, I do.

	-hpa


