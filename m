Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A04B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R87sq1Yt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aGVxlEMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C2nkaK+IZo7uol3FOyATuuSoOwljEXWN6zBbxAECZI8=; b=R87sq1Ytkxi4M5
	j68NVxNl0GChw/rHKyeoWYDbsVUxRSchbQHVrTOMMc66T5w3dLMBgkcrwXHyTf+o8Z0ZURCx7+51M
	cZI2at+ZEBUiruZJxtlTEDwLv/6eMokVBoUGvbeItPq1tQfBBkcVXAkqBAgFDu+ShQty2jM7LFori
	/MZzRwFTfHLQjdjAiz7OrNOKmHl8wKnkNE/y1plnSmH9zu59O5XERYGLUzL6RdZeNwTqXSSdB1t4y
	7q8pvjrNNHF91tIRFKqJ15jt+UR6PF3SztWemRprVKZfuXGe7szKnm6QVzgAn/Wc2X2KVuuzA1/EH
	SRaa27O9zLZvUNSTAz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG3Q-00000001ws6-1JPJ;
	Mon, 26 Oct 2026 08:27:40 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG3O-00000001wrg-2i3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:27:39 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so843037a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003257; x=1793608057; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2nkaK+IZo7uol3FOyATuuSoOwljEXWN6zBbxAECZI8=;
        b=aGVxlEMPCshh8JswcQGXgB4ghDRczQVwgZ3SSUtF6Mkre9qr5PZVFnfU2Y9jT/60Vx
         +OsnLJeqgB88EFeUx7AADjsw1u4kiLKqEHSb3nhBh5FgFv6/ljPJgEF+QcuKa1wV+plz
         jRqx0QOJzYsoJmTVUZXBRynHFtODHBMgUZFjz8ibbnjXkD9+N/eV/xOfw2aFjgW0nJc6
         BoIypkG+8xPMfqaWRYvt8LZmmiH2egMQ6DTP6iXUby3Fkx9vR5jmy5RDIlnDe8bgpNMx
         R674F+Qevm/KgWVNvVXWQXh9dk8ybf0ns62d823U8tTzUWtU/ENptbTGcQMB9OlmoD8z
         e2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003257; x=1793608057;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C2nkaK+IZo7uol3FOyATuuSoOwljEXWN6zBbxAECZI8=;
        b=TDQOz1iSTwEHvG/f0AunIMfYxS4PBdTx7n9EoRlY0p/1PHt08qrWYss2+/tjxksKni
         GX6UHA8E1rT2bEau2BolaCD5hATrwo8Mi+c57Wdf5VD/3hny/BPPuuHci1f15IIYtLwu
         /HiWH+3m8xJUeqqA2OGZPFkbXc8DIJ2k+4odiN8iTvH9M6ew+SIbpQE/cFdMUNTgyngt
         27KF77jWowW+d3WxPvZDvIElOwXAjdKpx8k1GP+8MuvbQdRAHL086ygXWV9IaSgnfffl
         MHWLpRJNw61gVzs91lUN5TejNPkLwdfYFK0+ydE6RhwChsnYRTCr16b6vQn/NnKpuu48
         F5mg==
X-Forwarded-Encrypted: i=1; AKwUvByBDiUaokvGt+64tnQR+i+AM0uDTeQXSatM5hhSjxPFQ5uQtisbtPfbW77wlNXYzAHX0arSMKTXxvgY4fAyueP/@lists.infradead.org
X-Gm-Message-State: AFq9FYL4l/O/B1LfuwVu74Unkzgg8E/xfZrkJ+X0tytS+MZdnjKTeOKm
	npDuhS+zjm1IbBRXxHKRwMg0oOLQ2BB3WrJUVFITLXEppJYOn9S2S9Eb
X-Gm-Gg: AYBFou3XxCzCyjNC/pOvlrVyn+emTS5so3T+izaYR1H5l7F9PlFjHb/G2SNG7Yq/W3f
	ioq2PaPlcJ3HFKDU5+AazEYmjXt0zzOFiHu72m6wiJR4VQvOTYqkXOq0YTZM298WA9N8WcaT9FB
	nf85rz2bZ05oCBZjTddi1Oni0mNpTLeN1aTXpyRQO674qly9zKDqvg1rlQruJbb8dXF1jgLW98H
	r3EMBlqfsSyhLVoj7KaDgb6+5/BP9vHnKiEdetQaV4zbqZSrKd7AIr/bXRH7H343g5p+X07nEoH
	gI2opYVSt8PcWH14XG9Vp7qfGvcydMr/Xyl0q3LP/YszN8gjJbSEAP8sHokA59LjYeJdkA6Kwj5
	Muj025tXZgnwvrjKufpQhyxCTwqCIcChKWkKtvrPs2Srd6M7pKSyknh9mevc0h5+GjUuKEzastj
	nY77Vel7ASlSlbxHldu4iy7uSiiXMIzvxnLAnD2zFFiwNdVA5W7Dp7FzNEJCehj67p2QQRBIK7V
	j+4s9MVxj5OFbTzEJQQSTWitpEKvftj6OKbZS91vXKPrXTRhMo17jvQdlS1hfexbUTw7PN6
X-Received: by 2002:a17:90b:1b01:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3adead249fcmr5315716a91.29.1793003257392;
        Mon, 26 Oct 2026 01:27:37 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa3794sm7530156a91.14.2026.10.26.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:27:37 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: zhangqiao22@huawei.com
Cc: tglx@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	peterz@infradead.org,
	maz@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [QUESTION] sched/clock: Potential timestamp jump due to inter-CPU counter skew?
Date: Mon, 26 Oct 2026 16:27:30 +0800
Message-ID: <20261026082730.2117173-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
References: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_012738_689289_68AFD50F 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Qiao,

On Mon, Oct 26, 2026 at 02:53:25PM +0800, Zhang Qiao wrote:
> 1. Are there hardware or architecture specifications (e.g., ARM64 architected
> timers, RISC-V) requiring counters on all CPUs—including those on different
> dies/sockets—to be perfectly synchronized? If skew is permitted, is there a
> specified maximum allowed skew?

RISC-V's Zicntr extension requires the real-time clocks of all harts to
be synchronized to within one tick.

On arm64 the system counter is meant to give all PEs a common view of
time, and keeping the copies on separate dies in step is the
implementation's job.  The kernel has no tolerance for skew.  The counter
errata handled in arm_arch_timer.c (Freescale A-008585, HiSilicon
161010101, Cortex-A73 858921, Allwinner A64) are all reads on a single
CPU returning a wrong value, worked around by reading twice; none of them
is skew between CPUs.

> 2. If the sequence above is theoretically possible, does generic sched_clock()
> already have a mechanism to handle a counter read that lags behind the shared
> epoch_cyc?

No.  __sched_clock() masks the difference and converts it directly.
Timekeeping's clocksource_delta() returns 0 when the masked delta exceeds
max_delta, but sched_clock has no such check, so a read behind epoch_cyc
gives a delta of nearly a full period and cyc * mult overflows.

Thanks,
Zhan Xusheng

