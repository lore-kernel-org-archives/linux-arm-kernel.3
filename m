Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7690606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZXNdbnw;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=p7irUjyG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wRGD6VE/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wuK7LmgcC7u8EwiAYxopNkKKaHx7rf/5CAdOouqZE3w=; b=gZXNdbnwub9StzFWDa9WoCPvPg
	5XwxYOHeUVbzt96Oz7+WnsAzoizOItSkIofiyEHLjBO9hAsAw44eqL6RkuR9/gA2cX8YywgaaaPAB
	rRqSli94727lY8jvfB4rx6F3CZb2mkEcV6Ipulkud3ylBK1eqsfyIIdu4YgGZMaoOPco/igr/BvcT
	2mLtOynduSqtraLABMYb2/r0YcRyVhxxVME8soBovoHF3JO/3aAH2ZX7W31o2i9lTLrr3Td0ovVEz
	Lm8ipLy1QgBmIb51jlpTs0YegxfxGeelf6BbX6epVm8yoAt+9FfhlnVJcwV70Bnvoa2VyeCqGO1xi
	N60XD39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGf0-000000030Rw-3tXT;
	Tue, 03 Nov 2026 15:42:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGey-000000030R4-1K39
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:42:53 +0000
Date: Tue, 3 Nov 2026 16:42:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793720568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuK7LmgcC7u8EwiAYxopNkKKaHx7rf/5CAdOouqZE3w=;
	b=p7irUjyGce931pmrKe0HlmEOEKWi5zSVj2OTXAl7IEl9b6Lhvbn1veh158nshUjDv1gebs
	Xw/JOZa75WvcZTNh2l0kyWY2+WJHKP0aT2BaQtiGif3tNLbHx2v4yumRxS+w6P9w8tOmHI
	I4LXXOc/sNDkFaI1eiIBL4olZsoSXByXN0SSuAbFoyl/zZPnp0X88a/D3kebd3bpFdLl9/
	s5t4boyT2LhTSC3uBAWRx+wHNQOeupos4SjN9lY4+5P38/mZBnN7Lg56tg1aBG8RkJw7L3
	knMc8muBRQ/o3WP9sQQmbeLQPUHiaKrn16fKZQDsXBWdGciveB+qgg11KRPRAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793720568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuK7LmgcC7u8EwiAYxopNkKKaHx7rf/5CAdOouqZE3w=;
	b=wRGD6VE/Vpp6881jDOQDLdqnMy28nj/j0tSyIPjeZ4nX/IoljV9pTJdDxE5UORi0aWARGP
	OT5QtvQLz33d2VCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Fix NXP STM clockevent bugs causing lockups
Message-ID: <20261103154246.S-8NqN99@linutronix.de>
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074252_528507_D7C3E12A 
X-CRM114-Status: GOOD (  14.85  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-02 22:16:19 [+0100], Enric Balletbo i Serra wrote:
> This series fixes three bugs in the NXP STM clocksource driver that can
> cause soft lockups and missed timer events, particularly visible on
> PREEMPT_RT kernels running on S32G platforms.
>=20
> The NXP STM generates an interrupt only on exact match between the
> counter and comparator registers. If the counter passes the programmed
> value, the match is missed and the hardware must count through all 2^32
> ticks (~32.2s at 133 MHz) before firing, causing soft lockups.
>=20
> Patch 1 fixes max_delta: on 64-bit platforms, ULONG_MAX exceeds the
> hardware's 32-bit compare register width, making it possible to program
> an unreachable compare value.

This looks fine

> Patch 2 fixes the overshoot detection in set_next_event: the existing
> check only detected counter wraps, not the normal case where the counter
> advances past the programmed value during the read-modify-write window.
> Replace it with a signed comparison following the pattern used by
> timer-imx-gpt.

okay=E2=80=A6

> Patch 3 increases min_delta from 2us to 20us: under bus contention on
> PREEMPT_RT, 2us is not enough margin and the counter frequently
> overshoots the programmed value, triggering repeated -ETIME retries.

This all sounds like the hpet trouble on x86. I'm not sure what heavy
busy contention means and why the device is enabled/ disable during
setting. I would assume that the programmed value hits the HW after the
wrap so you wait until the counter wraps again for the equal match.
Worst case would be you read back the expected value but the HW sees it
later (after the wrap).
hpet_clkevt_set_next_event() does in principle the same check as you in
#2 except it compares against the "min" value instead <=3D0.
Would this make sense?

Sebastian

