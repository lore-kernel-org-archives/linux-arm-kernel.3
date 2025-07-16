Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDDBC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3X1gOZP+goNDIuh3AgJjOXNlqikB6fvLUSRY30PSEnM=; b=rwfp3fQm+MKc9lsSXZrNrruEZ+
	ZG5a9S7n92hIdjCFTQRbrLzitzFwn0neXax4aU1Yce+f/stZcLtaAuT7EoE1BghifBcsjKFFE0gHq
	x77N68ysH7k4A7u12SdT2MEsDDZIvDq689PkTqGgP1qvzpFNGfJwNr3FNaUq46jil5CohygUkWusk
	DNXM9irnBk3irgdLzV8TVK/DvbrVboETQxVfq0BjAtkxWnuFaEo6FT1un9XbO1w+5wVZZLMTDrbo/
	jJDBLu8CTidy4DSX3my5YQdXEcC0D6JwFG1Re0v0c0C98JIN7XQ+Cw2sDo9lEBGHaH3AbFr4G+v0F
	mS4VmHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc293-00000007mxK-1qeR;
	Wed, 16 Jul 2025 13:26:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc26Y-00000007miL-0gcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:23:29 +0000
Date: Wed, 16 Jul 2025 15:23:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752672204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3X1gOZP+goNDIuh3AgJjOXNlqikB6fvLUSRY30PSEnM=;
	b=uDYmdz3xJBu77jfXv2NJHZokL7soAtCFcstMwIVdJwh/xQGph1nuhSs9J1nU2fiOMN8zMf
	esXWDddlzCNlG7bkDdzVNT+IGO7xEDiQcgnwJqBIvUKr0izZslxzFhxv3Sv/JCjVLB9gG9
	vzcPEfXqWmh9Ra6fGMdAKjpxjZ6AZ1S4yeJUnAJCWGzvZu8qrHCp4CIWI+hyGHsinFmqms
	CUBFukY0V6dKPaP3oRN/G1cZDzlfJUhHw7mVkd0FWXrCKQXFHCxBcegpaCpDi67DsQdeMK
	lxq1G5AOKdpa6HUtMhdpWSxIndSLR2RGTYM2fqWRWf2y8TjPFw9yzWSzMqT0OA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752672204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3X1gOZP+goNDIuh3AgJjOXNlqikB6fvLUSRY30PSEnM=;
	b=JbbGSXV0n1YRvysHljC1CPzDU5AjFc60+H3pSSxq0PzWMJughRLCOcj+nWQAFJyAHP/ymb
	ByWtOGBZkMUCEMDA==
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
Message-ID: <20250716152041-189100b1-7f5e-4388-8ada-b79ec09d18f5@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
 <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
 <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
 <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
 <20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
 <3a9504d1-2c6a-459a-a98e-3010d34b546c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a9504d1-2c6a-459a-a98e-3010d34b546c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_062326_336002_E82EFCB7 
X-CRM114-Status: GOOD (  22.05  )
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

On Wed, Jul 16, 2025 at 01:50:22PM +0100, Mark Brown wrote:
> On Wed, Jul 16, 2025 at 02:34:52PM +0200, Thomas Weißschuh wrote:
> > On Wed, Jul 16, 2025 at 01:25:06PM +0100, Mark Brown wrote:
> 
> > > This issue has been present in -next for a week and is causing a bunch
> > > of disruption to tests that end up relying on the vDSO - do we have any
> > > news on getting a fix merged?  Perhaps it makes sense for Marek to just
> > > send his patch so that it's there if needed?
> 
> > That fix has been in -next since next-20250710.
> > If you still have issues, I'll take a look.
> 
> Ah, sorry - I'd not seen followup mails in the thread and was still
> seeing issues that appeared at the same time that had previously
> bisected here.  One is:
> 
> | INFO: Generating a skipfile based on /lava-4170058/1/tests/6_kselftest-dev-errlogs/automated/linux/kselftest/skipfile-lkft.yaml
> | fatal error: nanotime returning zero
> | goroutine 1 [running, locked to thread]:
> | runtime.throw(0x132d83, 0x17)
> | 	/usr/lib/golang/src/runtime/panic.go:774 +0x5c fp=0x42c7a4 sp=0x42c790 pc=0x3b740
> | runtime.main()
> | 	/usr/lib/golang/src/runtime/proc.go:152 +0x350 fp=0x42c7e4 sp=0x42c7a4 pc=0x3d308
> |A runtime.goexit()
> | 	/usr/lib/golang/src/runtime/asm_arm.s:868 +0x4 fp=0x42c7e4 sp=0x42c7e4 pc=0x645dc
> | ERROR: skipgen failed to generate a skipfile: 2
> 
> I'll just kick of a clean bisect for that and see what it comes up with.

Can you try the following?
I missed this despite the double-checking after the last reported issue.

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 97aa9059a5c9..5e0106130e07 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -365,14 +365,14 @@ __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
                             struct old_timespec32 *res)
 {
        struct __kernel_timespec ts;
-       int ret;
+       bool ok;
 
-       ret = __cvdso_clock_gettime_common(vd, clock, &ts);
+       ok = __cvdso_clock_gettime_common(vd, clock, &ts);
 
-       if (unlikely(ret))
+       if (unlikely(!ok))
                return clock_gettime32_fallback(clock, res);
 
-       /* For ret == 0 */
+       /* For ok == true */
        res->tv_sec = ts.tv_sec;
        res->tv_nsec = ts.tv_nsec;


Sorry for all the breakage.


Thomas

