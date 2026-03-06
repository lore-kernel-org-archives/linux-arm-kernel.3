Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087BAF01818
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=; b=gHj5UNtULI2H9Hai6SVnX+AIj4
	T5rwOqmqC3sYNQ42TJtnlZG2IfhZ30z+NfKw6VOlGZbPo42QmFr9AYmM0EaznuY8tkW2hYq4wKw1u
	iLY6DBIgv2NtrhIOzgDQO9rq4qTNG9Fxj0e8z7Wm3+xcF15fCMTFwJnut/Bqt6Mq8B/9YF6t47zCY
	VHJ1LibO6mwIUW/i2WkdaMHW1h36YsTylkeAALkbyYSuuYS/X9qLKMEXdhh0ymkFJu2fdubRJLjCL
	I/IgzGmZvbAmDIrgP/8I9PGPKvisefsNaOdQe2/cDZZBqjyaEQc5bcTHncsYNHYU4RgIIGaT3KU2b
	+2VtaJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRhZ-00000003Mug-0O9J;
	Fri, 06 Mar 2026 09:42:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRhW-00000003MuM-37Bi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:42:32 +0000
Date: Fri, 6 Mar 2026 10:42:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772790145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	b=TM4Rdzu39Bd9EAADRCXrB648dHPFDbYqmHJbCPos+LO9cH+N8pmFEyN+hOFtV9Kt8vFREp
	Vz2d+r04CS5ZPWOfQLcxGiyBvVHBxYRUtF0f1J9roudzSb1xR2chbQbxJSmHaEE+zr5Dkh
	L980N3PTaFG/bNJvDDtnHT5s+qCpSi2kJ0polx7Ls3enbAQiD1TTXRK44vYDO2YjkASHPU
	NcseRSNfevWaqtFyIOePiKkptS7YvDO+KHjX9sQrWXgbEsq3RysABGWDsVTq2zH0syqzaW
	c2ZSYUco1APMwU44ZlLCRzJW8URBj5+vvYNvPlfpPRcw72zg8BDv8lqMl8a+Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772790145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	b=oyC+xISo6E2zXVjIcJcEaqD5pbEEgZsXJW0zYYh1sU9SGKFdilGyiunD6wDIAtY/VR2cdj
	CPkN1r8IejPumgBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
 <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
 <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_014230_948219_37D3CDD7 
X-CRM114-Status: GOOD (  17.38  )
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

On Thu, Mar 05, 2026 at 03:57:59PM -0800, H. Peter Anvin wrote:
> On 2026-03-05 01:24, Thomas Weißschuh wrote:
> > 
> >> Weak references would be a way to work around the link failures. 
> > 
> > I am still not sure where "the link failures" should be coming from.
> > The only sense I can make out of it, is if somebody manually and directly links
> > to vdso.so. Like in the following example:

(...)

> > This actually works on glibc (not on musl). But it is highly non-standard and
> > relies on multiple implementation details. Furthermore it can fail to run on
> > systems without a vDSO, as mentioned before.
> > 
> > Is this the usage pattern you have in mind?
> > Do you know of anybody doing things this way?
> > 
> 
> Yes, and yes, I do.

Thanks.

Do you know why it is done this way? Are these applications public and
if so, could you point me to them?
In case we stub out the vDSO functions with ENOSYS, would these
applications be able to handle that error gracefully?

Personally I am still in favor of removing these functions completely
when !COMPAT_32BIT_TIME.


Thomas

