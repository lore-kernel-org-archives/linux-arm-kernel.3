Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61791C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEraTyZu/cB91N9OhUSTcFV7TlgH8A/Vl0OqqTepf84=; b=I4dwdDjHfh+qwAf4vzbC8W0zhH
	kHAG0f8KoMAvOJK4Lo3xLoNMSitJCHM9Zxext13MysrVDsCx+kRZJ6eZF7HZ/JFC6aVZebNd2p+6V
	bI0Q2xea5siU+qIFVUgO1p08CbDL7UJ09qx2pFgWyu0bPfS/7nxX9M8jkl9tggg7bizNSqNxg5FGf
	KTvFUq/I82kmFSqpZwjQTS0HTaglxKsCL8MRbd9AQByXQjC0FY8kjo2TF/UCcf0IzIrvf9lIKquWq
	S9aGiFpeyIer+4S9xQA3OUoV8/th/nM0xdQrlRdo7mf2z3Pc/LsIEjGJNJCtSGIA1fA9/WqB8L8cO
	qq+gR10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlsP-0000000B2XO-1RSR;
	Thu, 10 Jul 2025 07:39:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZl2J-0000000Au2g-1Ufs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:45:40 +0000
Date: Thu, 10 Jul 2025 08:45:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752129937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vEraTyZu/cB91N9OhUSTcFV7TlgH8A/Vl0OqqTepf84=;
	b=utTOpPZ3Rr5l8NMuhIPetHGpxhd0tKFMuY8koLXmylBNlhA7a0i1FT/HadVhURS0cRk2oO
	REfhl6TCj7DSAOutwu6sLPVx7DShHlD4wH+eoX9P6ohPAzByRVW6jIa+HgrRGfTxudwRdD
	ErfXmeGddfJmXFgb6tWG5Jnkwe6nyT0ivfJcZZlz9YeDXomdyY66TzNwD8yIPK/GzwAS9A
	7JSonn3edG/vCd7yaW/2uQf05TmoO3bMnaHTZtQ80Iy7d3DDt9RcLdHBGTQpP7O4WqMqrU
	0F0YrQPqWwRQAzA9arYgNKBdgQD3Hxb5El6MV4XYme1+m3UzfZWNlV5cMawuug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752129937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vEraTyZu/cB91N9OhUSTcFV7TlgH8A/Vl0OqqTepf84=;
	b=EqPrZSVDHE9txmU3vmPhXr4VBExvS+/rQq0MWOrBauSTx+GCSEz837og4V9ziUynF1Txij
	qLWXkPt+pBMbTlDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH] vdso/gettimeofday: Fix code refactoring
Message-ID: <20250710084337-0c82b93c-85f2-4305-95ba-8cb14042aed2@linutronix.de>
References: <CGME20250710062301eucas1p1b61431dc31a5933087b45c246866fb17@eucas1p1.samsung.com>
 <20250710062249.3533485-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710062249.3533485-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_234539_534894_2F21BAEF 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Marek,

On Thu, Jul 10, 2025 at 08:22:49AM +0200, Marek Szyprowski wrote:
> Commit fcc8e46f768f ("vdso/gettimeofday: Return bool from clock_gettime()
> helpers") changed the return value from clock_gettime() helpers, but it
> missed updating the one call to the do_hres() function, what breaks VDSO
> operation on some of my ARM 32bit based test boards. Fix this.

Thanks again for the report and fix.
This change has already been folded into the original commit by tglx.
It should show up in todays -next tree.

> Fixes: fcc8e46f768f ("vdso/gettimeofday: Return bool from clock_gettime() helpers")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Thomas

