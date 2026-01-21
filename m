Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42865C44521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMOlL52f21hJOSmHH01IW3iMpJxxgMgPiIY9YYSIzY4=; b=ePHu4U5/M20ZkaXOgYkYaLV9Pd
	9NR/R/iuPIy26sD3ICsWLaIJjvURauCSiVxOaVPWR/jN/tNqUSu1xOqjyyMOxDwUnnmIklsYprQ1u
	NvFVU5jaMmPXoifQb01cfftSoV4S6VLr8cqdxcXcRC05TkYKFMPUzBCzLEPjHWmxk+DGq40h2+SaY
	ik7XYW0OFzoSYDgGgPSEAYCYezYpRMx2V/iDzG3d4H02VXXKw4w9kAIRQ1w+KnajoEFyILDir3px7
	/h5HQsFTsKNaUgDhR1mbBPuud3q3fj818A4r73wThkZf28vkIaNf/jbRbBEXbjtwgCNsRcuBRCgvT
	niQXYcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWz6-00000005O8q-3qkH;
	Wed, 21 Jan 2026 12:06:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWz5-00000005O7X-04Ko;
	Wed, 21 Jan 2026 12:06:52 +0000
Date: Wed, 21 Jan 2026 13:06:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768997206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMOlL52f21hJOSmHH01IW3iMpJxxgMgPiIY9YYSIzY4=;
	b=SJuvf7wm295ae9jOzKLhvw4zZDLCbTKcq0ETM2QAbcsFp70UrCNmVc6R/paTEMVDSLch8H
	uGlSo6B3quVieH6mcqrdysAzol5LxDZo3AlD3XOdkXW4yCDnMVjH5laVfDmdTDHW2A0dql
	q77n1xmPUYwXK7EktaF/FZtRvgWAHQDN/4J/b19i735JMWu53zwAM53U0hMotPNMapPDt+
	czQDNPVKTEcD1Zzq+oL2SM5q+jw+efmmC+UjrOYIFE3PZ83Kj7P7c8bU/y3T+rF41e6k1j
	nET0c/h/1W5d/lMTz5pQtk4Ldw78HyXFcdFOB2Ff1KQA//iGS5Q85Ko16KDPdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768997206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMOlL52f21hJOSmHH01IW3iMpJxxgMgPiIY9YYSIzY4=;
	b=QvgkzybOHbgxTa6qtKAU0fBJE2ys/QnlIJbcrH0sBQKoPk9vdCPb0pf4mMz8zUYgnwM6My
	G98jrEF/uw/vHaCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ARC: Always use SWAPE instructions and enable
 ARCH_USE_BUILTIN_BSWAP
Message-ID: <20260121130603-5f023f71-6f29-49ff-a32d-0f3baf30954f@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
 <20260112-headers_install-config-leak-v2-1-4d8084444603@linutronix.de>
 <aXC0Gl2GqF0LEQzZ@derry.ads.avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXC0Gl2GqF0LEQzZ@derry.ads.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_040651_192062_8D8A6AD5 
X-CRM114-Status: UNSURE (   8.84  )
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

On Wed, Jan 21, 2026 at 12:10:18PM +0100, Nicolas Schier wrote:
> [Cc+=linux-kbuild,nathan]
> 
> On Mon, Jan 12, 2026 at 08:58:29AM +0100, Thomas Weißschuh wrote:
> > Since commit 67a697e7576 ("ARC: retire ARC750 support") all supported
> > CPUs have the 'swape' instruction.
> 
> I can't find commit 67a697e7576.  Did you mead 
> commit 767a697e7576 instead?

Yes, indeed.

Thanks for the review!

