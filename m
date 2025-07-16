Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A0C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fEnjbbKyTxyrZsE1OYbDMRhkU2rjxm5lmX9q9XVcTQ=; b=vGzxNoYCmFOw9OzwczvKvUOhcV
	Ba9Vn2pN1zifEJUzmiZd+02llhvtS+bnG+ieqs9BvxyKFrsHWNHS+7jx8D/gEDBRlHCq3qzaq/1zE
	BazgpYxqNR+tVuqWQhO1H9bMO7l+8EOreKLbVGE/7DnqsjEBPceDjV3foVNPdJIIqbrFqCQq4WUQJ
	u9ZObDpY7IjTRrQIxNkkTVJzEcUhZChff7TjeH+EyLHe/QKo11k633ecgrmKE849/nmNimFt/z9Oq
	Rr1Ae9AVPBYKfn1u/7fPgAhOVX5y3urNXQ3+3i86dmtJTJW21QnXfNfEAUBCPX8bKr7m6rW5wTkQv
	for9v4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1O9-00000007fu2-41yp;
	Wed, 16 Jul 2025 12:37:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Le-00000007fW3-0DXa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:34:59 +0000
Date: Wed, 16 Jul 2025 14:34:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752669294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fEnjbbKyTxyrZsE1OYbDMRhkU2rjxm5lmX9q9XVcTQ=;
	b=jr7yW1StQGvdmfSH/ntkCN484pPYyrdQ8ebehJqFX5XvF8hFghBWTm+XawIPGkVqU6odhF
	2EMKo5rmskotYgZlv8Tlbpr2uCok6p4PAwVqFAFCC5IPDeFCXZmqGau3JaH08Jrzk2QC+o
	kBPXyzNA0pM02cpthWmofqQAzdr1X/1naxZoxtUinlKT2FMuI+lgSAkacj7IzWtadVxTXu
	gXJSWBEkVzyVoDrkxiJWHEOPOXpqjtqqrcc1L7m/A7vDbS4qS5rfTbbqoUYB0e9r6oCyIQ
	1gSR5QbSEGGLOaaStaahTqf3h4YcdoW7M4UBilgSKHDF3hi0EDCbGGB442KUDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752669295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fEnjbbKyTxyrZsE1OYbDMRhkU2rjxm5lmX9q9XVcTQ=;
	b=lhtKs3oCgqYEqqeqZs0f/3dzh4LmhYhJC7i0EzznnY3yCMvYZRqS7ygS8danxe5AXG2dWA
	s/2x9DTvzFI6hUBg==
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
Message-ID: <20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
 <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
 <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
 <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_053458_231294_14FDB9B4 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Jul 16, 2025 at 01:25:06PM +0100, Mark Brown wrote:
> On Wed, Jul 09, 2025 at 10:04:21AM +0200, Marek Szyprowski wrote:
> > On 09.07.2025 09:34, Thomas Weißschuh wrote:
> > > On Tue, Jul 08, 2025 at 05:49:18PM +0200, Marek Szyprowski wrote:
> 
> > > This fix looks correct to me.
> 
> > > tglx:
> 
> > > Are you going to fold the fix into the commit or do you want a proper patch?
> 
> > > Marek:
> 
> > > If a new patch is required, do you want to send it? You found and fixed the
> > > issue after all. If not, I'll take care of it.
> 
> > If it is possible to fold it into original patch then go ahead, it would 
> > make less noise imho. If you need a formal patch, I can send it in a few 
> > minutes.
> 
> This issue has been present in -next for a week and is causing a bunch
> of disruption to tests that end up relying on the vDSO - do we have any
> news on getting a fix merged?  Perhaps it makes sense for Marek to just
> send his patch so that it's there if needed?

That fix has been in -next since next-20250710.
If you still have issues, I'll take a look.


Thomas

