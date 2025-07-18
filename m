Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE2AC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR8GFtFedVx/r5PUglTQ7W4jl5yYcSzjkrHKB16Mp2o=; b=ugaTzn21we8JNi0gsET1tK85UM
	UE8EE9UG8Ktgaqk58TfqR9q8NmuvxS1XpfjEV5r7o0gWF/jLXM1YKE65NtZBQJPiv7VMZvZ+7cABf
	ZZE2rff0guMo0nuGu7YcEYyijbNWCNI/xVTg8B0MwXkXf6SrtViEtLt81gAefwoQGHWSrp5yHUUu4
	MniHdtDUpRzg4fJ7ZUKcFofXiK3KGX/nbZEZPx0z3fae3VLyq93vXDiWxhLKFT4CzU1KgfYMGyWTc
	p7+6BoNYYqk3wN2nkwZyDDO41wFsaxFi7EHc/vRk2NALEdyOX7Vhh5tWY7PpGr2IkIrZgt4NJLgV9
	7hR1VBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckVd-0000000Cbxn-1w9q;
	Fri, 18 Jul 2025 12:48:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjnS-0000000CXVI-0Xoq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 12:02:39 +0000
Date: Fri, 18 Jul 2025 14:02:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752840154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR8GFtFedVx/r5PUglTQ7W4jl5yYcSzjkrHKB16Mp2o=;
	b=MXwlOf3B0OYwe8S9UVY01/IN3oyDX9gPT0AwAe3Yf87RnwgKO1/C/L8y63hnn2U+ZnPvYS
	f572/Ti+oZ4l3BuQ0A6x52Zfx78w6gYtAzTFLmfeQbYqGXAR7mA3XkB8yXPP7uy9tJckGm
	uv2d8wT2yMurqp8OWg2lZJFQxxuzSkI4R8d9cPs3KNKvy1oYC3s6GiqaZX38a3xLkKfi7F
	cFbx9nkB+UpMgGmEtZnrynNh5xbynqxQArWv1HonUDki8cq7H38QccKCUOehV36fAXgGXf
	Bhmvg6O+9KATg/umwPd4uPhSGVXK4UbAm3NB1Unv5RxRDKeOk9Zb+t68Qb0oNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752840154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR8GFtFedVx/r5PUglTQ7W4jl5yYcSzjkrHKB16Mp2o=;
	b=l/3AuDaZRE9QGNhT2YED4BqPE5yu63+ZT/B4KRo05B2TlyLCe4aF4QMElu/QQhnU4pygV2
	key+l2XsKkGLdvDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
Message-ID: <20250718140115-1f81a425-6215-413e-828d-4fa69f96c938@linutronix.de>
References: <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
 <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
 <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
 <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
 <20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
 <3a9504d1-2c6a-459a-a98e-3010d34b546c@sirena.org.uk>
 <20250716152041-189100b1-7f5e-4388-8ada-b79ec09d18f5@linutronix.de>
 <69499cb9-b13b-4eec-a7c4-c219a77c6260@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69499cb9-b13b-4eec-a7c4-c219a77c6260@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_050238_311375_85929146 
X-CRM114-Status: GOOD (  14.16  )
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

Hi Mark,

On Wed, Jul 16, 2025 at 03:35:09PM +0100, Mark Brown wrote:
> On Wed, Jul 16, 2025 at 03:23:24PM +0200, Thomas Weißschuh wrote:
> 
> > Can you try the following?
> > I missed this despite the double-checking after the last reported issue.
> 
> I needed to fix that up a bit, it was missing an update of the final ret
> in the function and didn't apply directly to -next for some reason so I
> had to manually apply but it seems to do the trick, thanks!
> 
> Tested-by: Mark Brown <broonie@kernel.org>

The fix for this is now in tip/timers/ptp and should be in -next tomorrow.
Thanks again for the report and sorry for the breakage.

(...)

Thomas

