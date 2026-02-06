Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E543AEE20A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqiIBoo498t5RpLQQkOro1YxZEP9Otjpjg4hKK2HJro=; b=1V0VrwFjtHcOTZQwclCp+QvpHp
	bOuqbPxJh1EnHdDpLSKhLf6A7fHCsiRntVjNlx1eJv0IeUb2L67zi7YuXMGMIHiQ0I5zsXG7aex5I
	Iy8HnYDr9ZjXr/SgGEaormiVxqJWbQdwpF5+bPpnta8z9ij0KbZPHVl00mb6CKkbsrTrmQEvcs5Vz
	ggYJ6z7SbBFYvyvCBvECjUEDAXYD+L4FZtKVG3crmAS6LJAMZ4RTAyGnRLWIcdpNlcFVauAaviUSz
	kk51VuIv3CFAMy8GtsbgKzW6U+U23pjD/0q9znjdFM9wsuApGlR/EHTbmT/qSjUJgnzJvC9UG5lKQ
	9PxKqvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLx6-0000000BMuP-0YjS;
	Fri, 06 Feb 2026 13:32:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLx3-0000000BMu6-3gAm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:32:51 +0000
Date: Fri, 6 Feb 2026 14:32:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770384768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqiIBoo498t5RpLQQkOro1YxZEP9Otjpjg4hKK2HJro=;
	b=O0OK/Qeh+F+aLm3V6Qor9GJMj4bqx6Zm7H3+kRMGIifxPieAFmgP1fklxp3WMjmQw68XY+
	bwHR+kl0DT4YZjPDlv5CoHTWvxWSPyDUtqaKw1bxiNrwHAvAHzRjhggNFFNh8RhqE5QYD/
	uLhc2+CC0KJKbjuNaWPerYhhcLcTIXRX3vj0XlwXuhTCq43e6mQC5wQTpK4GbqAIQg7UvI
	67TE7B5i4own8uVVer24Khtv2U1YU2FflflEKj4TE8G5FA7BMVr9n/6t6uEASERT9egVNF
	S5/yhzHqTEwZ3IqR7vQPLrLtnrvPUrrl+P2XCTgm1h6lt7Y2oyVoBgJR00N/xA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770384768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqiIBoo498t5RpLQQkOro1YxZEP9Otjpjg4hKK2HJro=;
	b=KFi94TMbjo7Yq33xe/OjwTir7gEM095DoQJad5S8QP97l+Ln/vQJERdhfmkbIFYAlGVTvl
	TGwXUb0SXOzUKRAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <20260206143150-e32f59b4-eaf7-4c2c-ba14-5cd03906bb18@linutronix.de>
References: <20260206-cc-can-link-arm-v2-1-290cbf369fb6@linutronix.de>
 <aYXsu7pSZaSum1vh@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYXsu7pSZaSum1vh@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_053250_077177_5552031F 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Feb 06, 2026 at 01:29:31PM +0000, Russell King (Oracle) wrote:
> On Fri, Feb 06, 2026 at 02:02:38PM +0100, Thomas Weiﬂschuh wrote:
> > The generic CC_CAN_LINK detection does not handle different byte orders.
> > This may lead to userprogs which are not actually runnable on the target
> > kernel.
> > 
> > Use architecture-specific logic supporting byte orders instead.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Damn, I've recently merged your v1 patch. Can you send a follow-up
> patch to my patch system please?

Oh, sorry. That was a fast application.

Do you want an incremental patch on top or the full v2?


Thomas

