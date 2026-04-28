Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82459FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBGhq8AsscvIj+mH9lal8kMT11cGW5WaUiLHhyEg9Cg=; b=k3c862JfSO6lbd3hdd1xkKMdtD
	iCspHObWeZWd8NWyAow2+nK91G8JvDoEr2xNNbSUKbfhZSYlwheeRc/3TlIvOX4qPvr9MNkSTPewK
	TPOmC0hgDW9yUQb79MtzcpB161hS9UWY9qiDcCwfb6kCWdg3TZ3JSXG2/icwVHkqJo0Z3Cd+UqmHx
	Fn6BpoX4zcWPZ6zYNWmHLjEJ2D0k2eCuG+us/a0TziO8oNE/NrI1xTbE623WV9gDZHbDZiukUNl4/
	NWaImrHv79YGz/ZgYnIjP9NfQfQrOPWZgIktx1Rs/Ud2Of+y/usl5usgPSZhL/yJzYh2eZ4Par405
	iKUO3QsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgBc-00000001EXi-0YgJ;
	Tue, 28 Apr 2026 11:01:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgBW-00000001EWU-0jDy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:01:03 +0000
Date: Tue, 28 Apr 2026 13:00:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777374055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBGhq8AsscvIj+mH9lal8kMT11cGW5WaUiLHhyEg9Cg=;
	b=BnbLYkmMWIJt5VYkLwCdmQ60Q0X9uQlTWDCP7HP8/5OWBPyO5FaIv+KhxHC7SWW/fUPdqz
	+5GmE0FU/6RP0jFGAMKRpIKED1ulUDEQ1XZDeRcEnmfbHok4Wipd0or7EVnUP6vmQRn4nu
	dRRcQJE5gQwyYdrl9BDmpiW5WBl0h4KL1iZapdKnMQMG3uDKGV1f+5CmxsrfEBYUHeq4nm
	op2tVAUkJuFE1MyXvndOhSg5IOKNtZgLJh3+bl15iKUfNBdgkqZL4cn0eq72ogjoWmHsLu
	IDVMuW64PEGt1cd1h76IwXMnmiB+3dGtamdqFAPwpQQTSwvAnYjBDRxpAZAA1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777374055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBGhq8AsscvIj+mH9lal8kMT11cGW5WaUiLHhyEg9Cg=;
	b=7U9zG0CLn0w8edytSvhyGI+M4MTTmvpY2+kYhI/KmQsZDhYbNYFkRJC8CUSuEQOFCvFeoD
	Bcx9hNwDJNsf8/Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Carlos O'Donell <carlos@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Florian Weimer <fweimer@redhat.com>,
	Rich Felker <dalias@aerifal.cx>,
	Torvald Riegel <triegel@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH RFC v2 0/2] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <20260428110054.oQNT-kMn@linutronix.de>
References: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_040058_357054_8DC0F427 
X-CRM114-Status: GOOD (  16.90  )
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

On 2026-04-24 15:55:59 [-0300], Andr=C3=A9 Almeida wrote:
> Hi folks,
Hi,

> This is my take on implementing the new vDSO for unlocking a robust futex=
 in
> arm64. If you don't know what's that, Thomas wrote a good summary,
> including the motivation for this work and the x86 implementation:
>=20
>    https://lore.kernel.org/lkml/878qb89g7b.ffs@tglx/
>=20
> There are some loose ends in my patchset so I'm sending as a RFC to ask
> some questions:
>=20
>  - If the process is interrupted between the labels, we need to check the
>  conditional flags and clear the op_pending address from the register. Us=
ing
>  objdump I see that op_pending addr is being stored at x2, but I suspect =
that
>  this isn't stable, so I need to figure out how to make sure that the add=
ress
>  will always be stored in the same register.
>  - So far I have implemented only the LL/SC version to make review easier=
, but I
>  can do the LSE version as well.

I am a bit behind here. In the meantime, were you able to check it with
	https://lore.kernel.org/all/20260404093939.7XgeW_54@linutronix.de/
?

Sebastian

