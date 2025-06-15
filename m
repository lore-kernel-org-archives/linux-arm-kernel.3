Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F316C71151
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkFB9SXD4RMamermSJqHesSnPUpTK2AO31XVVQ6mob4=; b=Jdf3rNRe2f6JdSk9cEsIiXjgKT
	qwgZBeVJyrJFx1Xz2TWlIvE1z8YAwl6MI27ZXJ5Tz7Sg4SuvTNbEdzxIRgMQ+BqKSXS59q9FYn7BP
	93kp4C/rO2+54AHvdzWqfRPMrGcDoI5Oey+NCu0Wn6sm8JFtNjrx0sCIeZ/KDZCKDXAy1bvOKTdiK
	rn1sqU7C9jF+6ra73Maa0QC33tbCWoLaaN5psLHEy56NqEgppimp855ACSUylKRHRU8rRGhE+IqDb
	vBqucEywbDKmZx58sdREpt8tr/jAuZ9Fu5eDJKfm/bBi+/IvqHCJvoDBre7ef/8g80/uEJS8yGady
	0v/7pfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQhk6-00000002Jzk-0fLg;
	Sun, 15 Jun 2025 07:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQhhr-00000002JuA-37zl;
	Sun, 15 Jun 2025 07:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18AD44A391;
	Sun, 15 Jun 2025 07:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD72FC4CEEE;
	Sun, 15 Jun 2025 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749972184;
	bh=JWX10x0tUiGyirZtdUuM+U6VGu/piK3QA70v8Z35YDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pfSwWFd7QGhCYYSaHQcPdCfhyysto4iFPkwuCaPKEySFBEhoQUl88U2HQJiEao8Ob
	 1SK4fto8CPqC4bJGD/Rd4r9Yw5hCp/2PzBH2ipTe6ceqNL2Ou9r6DYh6IUqg6qmF0S
	 qYJ1t3krtwFd6JXM73SCx5AEQG0hP/qBQLjzqfn2GcLeiqbMaarr4r0ZDquwT6ZYjS
	 rUvdjmncPrkt6EqnBm3asHiV3mScvBfPf0mPiHHoXkTJtcjzXZ5ieJ7Sq/+Qi6jcLb
	 +m1yWQYNhaDKJuE4SqEU7HSxHLoPypb67qrCDT/uN2saglYzHSjnjeCiSEJOdJxdRL
	 yanxuMPA3kquQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551ed563740so3832585e87.2;
        Sun, 15 Jun 2025 00:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBprPIhi4BN6xP7R1ZwJ9wptNKTETCQcCIy6Wpjh0pCoOtXkKTSOZQtseyJi50V73kMphVg2LUowXrQn8frsjR@lists.infradead.org, AJvYcCXT5ok3obDyj+MyiMCqDnq6zw8klpQjfD/ZFrwrEPiqALv8DBLMMK7qtdHVGzi3Cd1GLIirck0XfgBjFd4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtJ8ORUKtBTLGTujd9cTMp2lNFdFERDOQqPc+8iZkFftpg7kay
	VoBus98oUyB9wwRNTp7bfpzQLqMjbtVZS0I7bUJ/LXmHFOkBZyfYCC9qcaHo3aww11r3jgzUP/r
	5htOfVGgKDQopm8sUugsB9oGxfL/AqiE=
X-Google-Smtp-Source: AGHT+IFn3BKZ/4LSxVR5KXcXwLoaa2Kdc1AeLDkxaymXoA6lOBMJ71ueZOjsj/pywa+41S2R3jXWsdX5Y53gLyxvvYg=
X-Received: by 2002:a05:6512:691:b0:553:2759:7db4 with SMTP id
 2adb3069b0e04-553b6f0b1aamr933983e87.26.1749972183272; Sun, 15 Jun 2025
 00:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au> <20250615031807.GA81869@sol>
In-Reply-To: <20250615031807.GA81869@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 15 Jun 2025 09:22:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
X-Gm-Features: AX0GCFvXujBEz2gg1idEYRihdjR7urozsbmjreTha85WA-Kix9z2xocGepFq-cI
Message-ID: <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_002307_826864_CA0342AE 
X-CRM114-Status: GOOD (  18.83  )
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

On Sun, 15 Jun 2025 at 05:18, Eric Biggers <ebiggers@kernel.org> wrote:
>
...
> After disabling the crypto self-tests, I was then able to run a benchmark of
> SHA-256 hashing 4096-byte messages, which fortunately didn't encounter the
> recursion bug.  I got the following results:
>
>     ARMv8 crypto extensions: 1864 MB/s
>     Generic C code: 358 MB/s
>     Qualcomm Crypto Engine: 55 MB/s
>
> So just to clarify, you believe that asynchronous hash drivers like the Qualcomm
> Crypto Engine one are useful, and the changes that you're requiring to the
> CPU-based code are to support these drivers?
>

And this offload engine only has one internal queue, right? Whereas
the CPU results may be multiplied by the number of cores on the soc.
It would still be interesting how much of this is due to latency
rather than limited throughput but it seems highly unlikely that there
are any message sizes large enough where QCE would catch up with the
CPUs. (AIUI, the only use case we have in the kernel today for message
sizes that are substantially larger than this is kTLS, but I'm not
sure how well it works with crypto_aead compared to offload at a more
suitable level in the networking stack, and this driver does not
implement GCM in the first place)

On ARM socs, these offload engines usually exist primarily for the
benefit of the verified boot implementation in mask ROM, which
obviously needs to be minimal but doesn't have to be very fast in
order to get past the first boot stages and hand over to software.
Then, since the IP block is there, it's listed as a feature in the
data sheet, even though it is not very useful when running under the
OS.

