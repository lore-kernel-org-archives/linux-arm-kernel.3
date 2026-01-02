Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E658DFA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEZRL/72x5uFyjIJVIw+uw6Ic/BD3arFK5h9GJFapx4=; b=jmXcwHgfRgM1jghvNOCzDrYZLQ
	HWmhYGbSDXUpV+cOG4Vy06ac6Pg1rIQBY3S84eeouZ3YEbLd6cPwl44jY6FNZQemdW7ELyAL8yIMW
	YRixKWpHOiWLAe5fnir3YVloZlHJhkI2pcE9qEcioyL8brmgf2IvcfWf7gRCY7WLo+8oGD8ny9ngu
	seFXpQYyOqgJh+5iAmbYXc+rf9F5ndRNZuD2YuNL4/SaWflGO0umAq8ppfwBfnyxR3EJH9X8LOnkO
	iymcX//gOebfK1YaP0GRD+wVuB53Mykzty7jPjuOp0mtlkuoeIWcLbD7+bf5IWEsTMxJu4qIhS4l8
	r7k6R25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vba0D-00000007y7I-124e;
	Fri, 02 Jan 2026 07:55:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vba09-00000007y6q-2fBG;
	Fri, 02 Jan 2026 07:55:14 +0000
Date: Fri, 2 Jan 2026 08:55:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767340510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEZRL/72x5uFyjIJVIw+uw6Ic/BD3arFK5h9GJFapx4=;
	b=FbBDW9KDIQzeOrVzeoQ4K6lap3zg4cmemkwffBJy1o2zrTarr2E79EGKrFHpqtGCLbDJYP
	vHduNGawdIa3o5TEw8CtVuFhQeeYrjr+uqdZyYU2CGvTvlfAJts0fkGRTf3lUKYlGZagqt
	zRpONLZvbVorFvKXRw2Fh/uzjFqaVnfoZrmyITwKnPiDJeUgx4WIOI2jwTfuR1bQWtXxaq
	dAmb8+CHW+C0skTjcnBQZYIQu8y8kW3sWVKZXY2VxmxaWnRUx8U2iXaq+Nv/cUcaXx4UyD
	noNF9QZWMBUWKEjAPklo6w7905bSwcX+nC9GDo3AHbZUsZxygdSeqSPe+8KbOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767340510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEZRL/72x5uFyjIJVIw+uw6Ic/BD3arFK5h9GJFapx4=;
	b=0df7NIPEA5n2XAx8YEdHNEvWDeSV2SoYm01Rx/pt9jFHP1jtUN3oFm/GXEAOu8h54kPMu2
	AbQnOngN9AC14YAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE
 reference to userspace
Message-ID: <20260102085226-c6463fff-042d-4654-8721-27e995f06c7c@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
 <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_235513_915937_88AE77AC 
X-CRM114-Status: GOOD (  18.55  )
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

On Tue, Dec 30, 2025 at 10:23:08PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 30, 2025, at 08:10, Thomas Weiﬂschuh wrote:
> > UAPI headers are not supposed to leak references to kconfig symbols.
> > These won't be set when building userspace. Hide the kconfig reference
> > behind 'if defined(__KERNEL__)', so it will be stripped by
> > headers_install.sh. The result for userspace will be the same, but the
> > exception in headers_install.sh can also be removed.
> >
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Same as for the nios2 version, I think the nicer solution would
> be to use the asm-generic header for uapi and move this one
> to arch/arc/include/asm/swab.h for kernel-internal use.

Ack. Also to your other feedback on the series.

> In theory, using 'select ARCH_USE_BUILTIN_BSWAP' in Kconfig should
> let the compiler pick the best swap instruction, which would
> be even less code, but I'm not sure if there was a reason that
> nios2 and arc don't already do this.

I'd like to keep the current logic to avoid potential issues.
But maybe the arch maintainers will chime in.


Thomas

