Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B6AF34C64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTxZjlPwQbG3YSd8NjMQF965BtCe0lPqly+S72Myshs=; b=d4GfmeDzg5nhh+3Oy8l9cDdzBh
	WxTelu+7kRrQRnEmM8WHaTjtiW33RTd6P3EpSwQe08a70AmYXu2fRALKjViLIlIASSlSbidN/eSnG
	cP+XnKVP5Wz6ChhexPNVv7Y+nRQZ20rIsF3KIApj5adbMqmbwtw4CMuq4Hcp7HzBc9DCOVVAw7dpw
	6XeJ8/Ln6A/3Eq+FtzKW9pxquoRVTsapiGvIuQOmlQ2GD9lG/02IQZIG7XCc1pGnO8Dvk7JlgLdUH
	x1RDCbKOsrd8Up9bReT8zh0+h6OlcXPGKkAdLtjfE/A36yLCLGjsD9jjHX3lThLRTyVpnt2zLf4ul
	NcdR/O6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJvI-0000000G2RD-0ZqF;
	Mon, 13 Apr 2026 16:14:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJvG-0000000G2Qm-0LsT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:14:03 +0000
Date: Mon, 13 Apr 2026 18:13:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776096838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTxZjlPwQbG3YSd8NjMQF965BtCe0lPqly+S72Myshs=;
	b=tkXY4nmg+ufLH8pIEREGPRIN7lEqDgcVyS4rMzP1pwHp3yL9b7kXJNaCAOrhLb02cE7TGx
	ggSSsIsYsGtFlAqRc8UG2XgBwu4Qk7X16r+d5lL2igIBjpcbMUvCVDWy7ZLItlTIXxZD2z
	h84JvMJNCIi1kvdvkxIIavJgYl+u/z8BcToeOgc+aJOW6lKeBrGdb3kEMvdFXGg6XytgEk
	rPMpXXME1ph1vQl4s9O5z+BEsC7htoA6IsUN921QvLHj7U4PfLX+8Y45VLFAq5AKYwtmoY
	FG1tRrjVloQGmzZUNVRNkeyCEHHE5ks19vbY61zf1F/NW+xmp2dLuPlt0SZxoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776096838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTxZjlPwQbG3YSd8NjMQF965BtCe0lPqly+S72Myshs=;
	b=LoVkYl6MMLeNBjAM4BvQVhVn1NnaY+OSsVvNNOBvu1HsCV87BqTgHRgkWFHBm1kAvMqe5B
	HVlxTATbwykTSSCg==
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
Message-ID: <20260413180541-e13f374c-b990-4236-bc83-8fde948899df@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
 <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_091402_263756_D07CB018 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, Apr 13, 2026 at 05:59:52PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 10, 2026, at 09:24, Thomas Weißschuh wrote:

(...)

> > Recap/Proposal:

(...)

> > * Always provide settimeofday(). If CONFIG_COMPAT_32BIT_TIME is *not*
> >   set, reject passing any 'tv' argument where it may not be y2038 safe.
> 
> This sounds wrong to me now: the case I'm worried about is a 32-bit
> system calling settimeofday() based on the value of an RTC or NTP.
> The idea of CONFIG_COMPAT_32BIT_TIME=n is to catch this by causing
> an intentional ENOSYS error even for valid times, so it doesn't
> suddenly start breaking in 2038.

This is what I meant with "where it *may*" be not y2038 safe.
Even if the value fits, the call would be rejected.
My wording was crappy indeed, though.

In code:

if (tv && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME) && sizeof(tv->tv_sec) < 8) {
	pr_warn_once(...);
	return -EINVAL;
}

Or maybe drop the EINVAL but still emit a warning. That warning would be
useful for gettimeofday(), too.

Thomas

