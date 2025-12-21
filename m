Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DD6E67495
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 01:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3fK9PcG+cgEjukRqBJXMkL2CRTOlA5j9EObKIvbhrc=; b=AWl7f9MWvCC3iWCtV506VfhGH2
	SPkD83HQF/Hs3OtqyHr0CbgDTL3MySj9VWQ3VaJm99ODaAwbd6cTnBxu8q0Vj8x5ihLg+EoQnpNhR
	CbINUxV0O1VhWckpCQ0rGDkJCZ9yC3EOeGaphfWbnpyyoOJn2JCYHAAeGv0ClpiUNxCOpqs0lPnbv
	mUk9MYpz9FWfiMMIEp+Z9HjN+Wn7SXco8yL6l2a3rrYNghJ5X7moUw5c3tD7jjCibFiciAuaV44dX
	3YCTLFbnnhSoZAR5+u533sW+vwDlNvY8z8N6D5CFoCjcRA7GeHSKfaVFMAONtiNAZOwrgN5lz1Kg7
	L6Ve7cpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX8N6-0000000C2rA-2u6H;
	Sun, 21 Dec 2025 01:36:32 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX8Mz-0000000C2q2-0WZr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 01:36:31 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 707F540E015A;
	Sun, 21 Dec 2025 01:36:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id s9plmLMQekvx; Sun, 21 Dec 2025 01:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1766280960; bh=u3fK9PcG+cgEjukRqBJXMkL2CRTOlA5j9EObKIvbhrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDMU0oYJVL787+ElQKmC+FBYUENoOXT7WeKGnB5oHGThYKBdTQ3AWqFIpVeSlGb78
	 xABcw2DZyhYbf0DNMDX8LBOBBf0kUobVThFiz0BU7eY5ymF5hdIUGUhKprVH/GhZaI
	 fBn5sdN/L5HMHYyfMb8ZjxuR403+kdLyLyEeJlHR7aRkxLncNS8o+fbtSAizQ4jnvp
	 2NGF9Ri/iJi6JSN5v0yz4jQyOCg2F715zXcB/cGnMONRs1dfS5805agDsVOETNbl6M
	 tEDH45KyuHHjp5xy9YeQIZVcxpOldEWRBh6IheN9QXpKdVrelSM3k+AkEN3+UkzrJp
	 RFTpwhqlYYsVM6nAfsBgUGEdeX9ozBkIk+S3Tf15S/s787d8mkP7JyQNCgiQVYjIfG
	 PN5yurEZQKN87fmViypq1c4kXEfE/wp9wddBIElgG5C+jMGvQNqIx2xllazc4Aa8LR
	 rrgyvbZAfyekehmwY0pFUeLNREbwWPq+ZxqocshUnODjC1PXOzcI9Ias7cnImY994j
	 f86pHV80AOSexaDPR82Fe2NYzMAZMDCXtfHh45c/Vv0hRfm+HebHSjmN9yh77Bko9x
	 mVnvX2XW+6JQd1F7RetdYPxXXf6Cx97NYU22+l2rUV3lwWj1rcofWBuT4BhShnu1RP
	 c8N+BImz9MTUY6Pj1h72mk5Q=
Received: from rn.tnic (unknown [160.86.253.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4886740E0163;
	Sun, 21 Dec 2025 01:35:44 +0000 (UTC)
Date: Sun, 21 Dec 2025 02:35:34 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	tony.luck@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com
Subject: Re: [PATCH 00/12] ras: share firmware-first estatus handling
Message-ID: <20251221013534.GAaUdO5vWqMWAdbWbd@renoirsky.local>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_173625_777195_A2CE98D5 
X-CRM114-Status: UNSURE (   9.20  )
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

On Wed, Dec 17, 2025 at 11:28:33AM +0000, Ahmed Tiba wrote:
> Platforms that rely on firmware-first RAS today only get the full Linux
> handling pipeline when the records arrive through ACPI/APEI GHES. This
> series lifts the generic parts of GHES into a reusable estatus core, wires

Why is this thing called "error status"?

Why is error status so significant so that you need to call it a thing,
much less a "core"?

It looks like you basically want to dump error records from a system
which doesn't support GHES into the common path so they get decoded?

I mean, I'm only guessing because I don't get any wiser from this text.

So how about you give the high-level, practical use spiel first? What's
the use case?

Then we can talk implementation details.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

