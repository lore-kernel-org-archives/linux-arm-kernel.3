Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E394C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCGPfsy1pxa191INMAVM66YRgrGVVyJxnFps2kupCoc=; b=x26Few6ECly/2EufVkGOG+V3rr
	fLbRWmkKXRvloPT9lU6VM/+ypoQjwNSK6k4ShxfFect6uhACSCvoQbkU0mWEL4l4nGbdrPhUesKxj
	HMvxaOszU/9w8RSou/p1iEa1DDzwynjZsNhnQIu7eykHZKzPmF4ICEqaAArU1XM7a81/AyWXb8/sJ
	pE96zLZFBG6cOjiHO4ooYzWWvrEo+RBVpnRL8rxZT27SwHS6wknaC5+wgLcQxIjKx80hFpekkDM7U
	wCGvKqbjXiDzm/4sxBMY0c3xToNHd1GreiW8/G4ntHJbwJQcGUUlx3hr0AeRt3DEk1jiNp1puu/gp
	9oxdRpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkXk-00000002N3I-05Ew;
	Mon, 07 Jul 2025 12:01:56 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYk7v-00000002I7u-2V54
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:35:17 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B20927A024A;
	Mon,  7 Jul 2025 07:35:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 07 Jul 2025 07:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751888111;
	 x=1751974511; bh=PCGPfsy1pxa191INMAVM66YRgrGVVyJxnFps2kupCoc=; b=
	DBhmpZn73HaS/+kZdc3rSSgFh+wA0Vfq/rg1YJNZjXKGgA68xeXfA2Fd6PAtG1Sq
	lj2A41evxwcSoO5TSzUZ7DZb0Pa/p4+xOZGJgVVEyfrSNdcBkb47PdrV4rGTKcWv
	CQrpZmTfhNL9Av6OTNGe4+h2WBzF5VRsVtTeaD3dPmVQXtbZqEFn5oRic1Vkwi++
	GAlLflf+jVFDzw9op+/Z0DJJgcqvBRkOo1KG5m15yPAv3W7qwqrTC+nTZAThRVoj
	Uy6WahQCnUkPWB3W+KQaIBtvI2bCF+eg4kKUGOaHbZ2bN4QAbUL82N3QgekVxJq5
	AYm2IDbHKW9GbJBq9Gk/ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751888111; x=
	1751974511; bh=PCGPfsy1pxa191INMAVM66YRgrGVVyJxnFps2kupCoc=; b=a
	poLr9eRr+YKPz6oEdEOyX5EEGjYyI78gb8EGsaBl+PqHfsxAF0Nbu4n+waXYEvrL
	6Mp2GgYx3cuDRUSnmj9QoTwQdlSwPhehknnzhfzRm7NlS8N3lvpSZP3sGWry8zVW
	XLbLXoMqY8Osqkpkq9xmVrKhQ9YuKWh4b8eMqmVGemmFxekr98e3ub098koiLKwX
	6KfH4tWosBxxjh1XHTnIzJW6OU1MIDYk99vk61cUZUzJ1t8bjopHfN8ves7eYZkD
	TTss9xLcjrURWG35OyxTqRcmQidHozYTuVwzU+wa2xGPPZt3zPsYdv6uo1rgo815
	ccpiBDiPJxArwdu4wMLOw==
X-ME-Sender: <xms:7rBraKUhB51fkfyZCEJ3Ze7F0jpWpd2EI8pDLE8Y4J9btd52DcAy3w>
    <xme:7rBraGmtVabI68dRoZEJBvKDpoeIiLSyCndHAOEZ8XTEvefWRsbBzyJeew6ixi2PT
    K56vB0t2HoM3o_FLlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehvihhntggvnhiiohdrfhhrrghstghinhhosegrrhhmrdgtohhmpdhrtghpthht
    oheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjh
    hsthhulhhtiiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepugifmhifvdesihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvghrrdhsrdhhrghllh
    esihhnthgvlhdrtghomhdprhgtphhtthhopegrthgvnhgrrhhtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhuthhosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7rBraKau-agsLHnE-ISJfm9OKPvCc2yOQSSoXw-1p2J6vq9fUmpiRA>
    <xmx:7rBraIKRbJIuvwXrMoKkYRH2aQyXtO1Q8vbKoQuWxtrBlyjpisv75w>
    <xmx:7rBraD2Qb89NZ1yPl_xTDhDDK_Dy0pt_IpCVfJGZxjTATEIj6AYykg>
    <xmx:7rBraDaRmwjUh7CYm2YLtLcwwHBrFyg3Sp7gqwFTxkNWL7qhqiCz_g>
    <xmx:77BraIT7QpWds9bsUn4Mt-kQAHxyZ-gfaH1BcIC2-YDZH9V662UWZJvI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7C283700065; Mon,  7 Jul 2025 07:35:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T22a9fd8a498db8e8
Date: Mon, 07 Jul 2025 13:34:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Gleixner" <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Richard Cochran" <richardcochran@gmail.com>,
 "Christopher Hall" <christopher.s.hall@intel.com>,
 "Miroslav Lichvar" <mlichvar@redhat.com>,
 "Werner Abt" <werner.abt@meinberg-usa.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Kurt Kanzenbach" <kurt@linutronix.de>, "Nam Cao" <namcao@linutronix.de>,
 "Antoine Tenart" <atenart@kernel.org>
Message-Id: <2078551b-c0b0-4201-b8d7-1faafa3647e6@app.fastmail.com>
In-Reply-To: <877c0ksd1p.ffs@tglx>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-11-df7d9f87b9b8@linutronix.de>
 <877c0ksd1p.ffs@tglx>
Subject: Re: [PATCH 11/14] vdso/vsyscall: Update auxiliary clock data in the datapage
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_043516_118855_F5F9F25D 
X-CRM114-Status: GOOD (  12.34  )
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

On Mon, Jul 7, 2025, at 08:57, Thomas Gleixner wrote:
> On Tue, Jul 01 2025 at 10:58, Thomas Wei=C3=9Fschuh wrote:
>> =20
>> +#if defined(CONFIG_GENERIC_TIME_VSYSCALL) && defined(CONFIG_GENERIC_=
GETTIMEOFDAY) && \
>> +	defined(CONFIG_POSIX_AUX_CLOCKS)
>
> CONFIG_GENERIC_GETTIMEOFDAY requires CONFIG_GENERIC_TIME_VSYSCALL, but
> that's not expressed anywhere. This stuff has grown too many config
> options over time:
>
> GENERIC_TIME_VSYSCALL, HAVE_GENERIC_VDSO, GENERIC_VDSO_DATA_STORE
>
> All architectures except SPARC64 use the generic code and the generic
> VDSO data store implementation. That config maze wants to be
> consolidated.

Would it help to replace the custom sparc64 vdso with the
thing that parisc does and call the fallback directly?

I doubt anyone still cares about the clock_gettime() performance
on sparc64, and removing it would remove all those special cases:

 arch/sparc/Kconfig                  |   1 -
 arch/sparc/include/asm/vvar.h       |  75 --------
 arch/sparc/kernel/Makefile          |   1 -
 arch/sparc/kernel/vdso.c            |  69 --------
 arch/sparc/vdso/Makefile            |   2 +-
 arch/sparc/vdso/vclock_gettime.c    | 340 +++--------------------------=
-------
 arch/sparc/vdso/vdso.lds.S          |   2 -
 arch/sparc/vdso/vdso32/vdso32.lds.S |   3 +-
 arch/sparc/vdso/vma.c               | 265 +---------------------------
 9 files changed, 28 insertions(+), 730 deletions(-)

(the added lines here also fix the missing clock_gettime64,
which was equally blocked on the sparc64 oddities)

      Arnd

