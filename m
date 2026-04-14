Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD25ED7B95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiErSfuvJerZIQ4L+JF5tzrkBbOhwbYuWVg9ZYwOn2Q=; b=tMM4MsvcViNIs8NWc5LHoIDviS
	CyWVUCczQe4ePfzkMQTwA5wGJoNc9cz4krcH70Z/4b9fOtgZ8SunkOZPIu5xbA911P3Lpr2WYLsjt
	ZC1M9JgQpP/uYe4bVZ/d40T4v2Xo3K12R2/tWyB4ih3tfV3VcHSQJY3S8vgtN10TFydPLGlJ/x8aB
	5d+qSlF0FtDbkEULIWlmaI0DsUAz87v5Hi7qSobL57vd2TXE1ERAlMugFxgicHNFjQ8bX6ssCdDtQ
	f0hczQr4gHRiyfKROsks1t2TYRjYG5rN46pbkZRqx3lYALdCLLbPIwYxBYQRwrI+LBURk6fmNGt98
	lxB4QYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCapG-0000000H7nK-41VI;
	Tue, 14 Apr 2026 10:16:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCapE-0000000H7mq-0SX9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:16:57 +0000
Date: Tue, 14 Apr 2026 12:16:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776161811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiErSfuvJerZIQ4L+JF5tzrkBbOhwbYuWVg9ZYwOn2Q=;
	b=OSiqxWwog8Eyo5f66GW9p/l3q7TUrwpoIhrfJTw1X9DwXVATfIR9taZHEoi2HlR1g93VOJ
	eWDOYZFl9F7WspBEmNsFtXcOp7KlR84eLbwD94B1YXA/2DperGZ+c2FryF4Vkagz0HohfD
	H4Iwp6tgQJHAeYDhYNpAFW8TOIJpoZDAl6g3jq+josSBCcV8cQmHyl2aYHQ3f+/agOFmuj
	8cRkDhm+/y6dcV4xI2TF9VXKk37gtYgHC/6VtixvpKy4MVxbp+otsY11rquc2cydJJTitW
	d5YHjEvCWtOUvedgzu4xwx1jPp2fPPB6TxTX1g80dUPcZ96+w3zRG2fwJZE+0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776161811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiErSfuvJerZIQ4L+JF5tzrkBbOhwbYuWVg9ZYwOn2Q=;
	b=M7Iqvv7amB/lm/Bd9iU0BxSxraoC4Y4+3sMwzQ/SGLGAc2KrGilQkv7tAoHXQw2xoJuVJv
	+oP09+VAFyvd00DQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260414121405-29c9514e-590c-404e-a31d-905b1848afb4@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
 <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
 <20260413180541-e13f374c-b990-4236-bc83-8fde948899df@linutronix.de>
 <e9487ebe-3730-438a-9c23-e45f75986ecc@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9487ebe-3730-438a-9c23-e45f75986ecc@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_031656_288703_CCF3599D 
X-CRM114-Status: GOOD (  12.55  )
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

On Mon, Apr 13, 2026 at 06:57:57PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 13, 2026, at 18:13, Thomas Weißschuh wrote:

(...)

> > if (tv && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME) && sizeof(tv->tv_sec) < 8) {
> > 	pr_warn_once(...);
> > 	return -EINVAL;
> > }
> >
> > Or maybe drop the EINVAL but still emit a warning. That warning would be
> > useful for gettimeofday(), too.
> 
> We discussed this during the original y2038 work and decided
> at the time to not have those warnings for syscalls. We could
> bring that back, but I think I would want one level of abstraction
> there and control this using a global Kconfig switch for all
> syscalls as well as ioctl commands that could use such a check.

I'd like to avoid another kconfig option. Linus doesn't sound too
excited about those [0].


Thomas

[0] https://lore.kernel.org/lkml/CAHk-=whigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk+XDssHU0A@mail.gmail.com/

