Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C270CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/WStYiskJlC9vtFGHNC+sPWwitqyX7fxMoCs588isM=; b=1nFumMdeZGoWrCXgb0cqK9Xja9
	UnDpNc6ds6cwio6qgTic9wsXsVg8pyV47B2HIKrQAH4b6ZaUTLkNi5wojkNZytkbIT5jmvY/Vo8tL
	iiGdJr2uXU+Y8J4B9KyBM8XFl9iaYukhqtQrxMjmuAuvLwE1bh6lntnPOwc8YFfycxYrdoUpKgKhp
	Eh2Gq0tZK176D/yd5wmb1PWLEpLKbapeLEEBf0DraOnUdXf+n6ZKyFAvHmU6L9JJO5uaqx4hzIC/+
	etDBD2Wlcj2zxfVBjCnFEqO6ywmOy3CZC+4vKWdmcHUd6UZIqXZImZq+0AlWqawTDXoC0ntEwd4xa
	L6GJn8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgA8-00000001fa1-08ho;
	Mon, 07 Jul 2025 07:21:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYg6e-00000001f18-2nF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:17:41 +0000
Date: Mon, 7 Jul 2025 09:17:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751872659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/WStYiskJlC9vtFGHNC+sPWwitqyX7fxMoCs588isM=;
	b=QhtGtvh32awCFpfqpR2dJaiwNHLWjOmVyhvSndn0b63g94XfjTMJ1RRyyqpEIr7JdIqmwl
	13P36MLNuKlX/+PFh039jimOSaVZsDjZ7HbTvJxsYxgexNw01Vm1aTgoIJ47lH+TD2w+P5
	sienvSrWBk5V6dN6gE9zMg2FreZsH/3Pp0Q3r7D6xXIK6as7C3n1GXSIzWs/qrf5Ny3z88
	mfAY+pTt1xe4PlyDoUHZUi8EjvbMw/Z1Oirtj7qBCb7XenxsaKLSSHYez2sdkJgrlTTpq2
	s7o9ppUkpQrtH/81GmuE65u33drwRNh9ncLj5C06xYCGP8c6SUszQO7bMlqW5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751872659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/WStYiskJlC9vtFGHNC+sPWwitqyX7fxMoCs588isM=;
	b=MnfD40doN7968bBafMzUUuxvXIN7riBiqfvyeTNHu/Denfp9g8nSDItEZuPDjAJ8ePxb0E
	dY6jK4C8Lu6VUkBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, 
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
Subject: Re: [PATCH 14/14] selftests/timers/auxclock: Test vDSO functionality
Message-ID: <20250707082144-159cd778-47f3-428f-878c-8c22d4f297fc@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-14-df7d9f87b9b8@linutronix.de>
 <87cyadrrpk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyadrrpk.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_001740_843092_AC845E0E 
X-CRM114-Status: GOOD (  13.54  )
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

On Sun, Jul 06, 2025 at 10:26:31PM +0200, Thomas Gleixner wrote:
> On Tue, Jul 01 2025 at 10:58, Thomas Weißschuh wrote:
> 
> > Extend the auxclock test to also cover the vDSO.
> 
> I'm not really convinved, that this is the right thing to do. Why can't
> this just extend selftests/vDSO instead of creating these
> 
> > +#include "../vDSO/parse_vdso.c"
> > +#include "../vDSO/vdso_config.h"
> > +#include "../vDSO/vdso_call.h"
> 
> cross directory oddities? Confused.

Then we'd have to duplicate the auxclock management into the vDSO selftests.
And the knowledge about the expected clock_getres() return values.

In general I think we need to introduce some reuse of the vDSO parsing code
from other selftests in any case. For example the timens selftests call the
vDSO by just invoking the libc wrappers. But the libc may not support a vDSO,
have it disabled for some reason or the vDSO itself falls back to a syscall.
I intend to introduce some vDSO accessors which force the usage of the vDSO
fastpath by using parse_vdso.c to directly call into the vDSO and seccomp to
inhibit the fallback syscalls.

Or, to avoid a dependency we could move the vDSO parsing one step up to
tools/testing/selftests/vdso_support.h, and clean up the interfaces.


Thomas

