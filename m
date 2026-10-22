Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DDC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vd3rCn6j;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fmSqPnQ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=; b=Vd3rCn6j3uVxuYsnZ+IKXWulCU
	huzh6o0r7+8IecdjIgA/SSsmUAaM73IgPoaM3pVjsC6prI8vAIC5Q93lfLoG3q6kFs+xaSfU5r8ic
	VqxH+2Q8UX61KIiZtok07TizBYQ6lTwKXwHAmkDqyTADHwhwd2gx4MCUQHEO5788btgXZ6MzYgrHq
	EcF/9VnPgtiKZGdNiWK0+X3bflmnhXsdX1NlKr3rfRyZV+tDvWtW5aT0Xs8QuB0r3SwvX9+6odcHF
	ABk0I9Ad1/2FZrfB5vpg3rp3r1qwib91tYpqKfSCz1rgxJwJvqkjNkNAnO6j92M3qQBmuC4nHbpqL
	bk/q8aPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiOB-0000000DBjH-0PCh;
	Thu, 22 Oct 2026 02:18:43 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiO8-0000000DBiC-0PdP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:18:41 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3514b90bb89so3733933eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635519; x=1793240319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=fmSqPnQ0QLWSr2PmmyNZBAleGSwDFReILHNzoizJOr3AzR/SQRKaktnvN/zjD7aUvr
         ilC6ZeZ4sIfic/nJITvl4HkbiHFsSGI4wdGkp9Ifa68+xwFlFck3U2PVcmksLbIIF9G9
         3PeIcLyFWxSRKVFoQC0RBcU5OmbOUEwuz3s3/n9PkaJtABsyNwbFnqU2LjhWmXMlyeVK
         Liw363MqMn4R8c8mxbA/6BF4O3Mn6ABpqZPd4vHsho19B5JrJ5cdtLdAsimWG4TFJV9Y
         bIY/zVxnf2j43FDpePmNBZByKrVIXFYtDQWOCQxFWn5Yw0bOxNcKxz11smuD2exo6Z33
         Mopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635519; x=1793240319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=jlQtcb+gEsen0gkn0Ucuj1k6qXAXOXwBwWzTyoW+mhD1+25ur5NXy7EuFCXfLs9cNv
         NUXlrlncals1utRQSDIhHHYAS0b3OIXrRVzq+FWHfA3aw+fYqOghaZi/jE9+AO+QHCWu
         mkFQRKEFnjHnLJPsnQoF3185i6/9OjCx0sEyr6MIODFrlxBGVlRGvHR/IGcX4eRnVXJI
         vhn3JB9XfWl0HhpyvrajgQuuuQ8l2KUIcfKdJfeskIOYG4z5A/nnzbcQcmWsktHeLLRn
         3znRGBlzTz754Ipt1kRBLY6U3A7RsJkIeYcFYCCNH3L9yT5ioM9yvriMyUytFhn+DHNb
         yajQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0o/NL+lPzdPqag8+1oeengWsMV7NrDGpROI5v2BMCVjOSmZSrX6ELEw/FRYnKBfmaLfqkfg2VPvXjs0SPV13n@lists.infradead.org
X-Gm-Message-State: AFq9FYJD6cHecaEvEdT68wMnKldNTsYKCeQRCxYjyUcRwYf38Y7gaSjw
	4jsaAIE7fsbi7l5w+oPrzufI4C31+t6xDS6WDXJyG/qRp2PhpUAQY3lX
X-Gm-Gg: AYBFou2qGQiTJbRjfe2JJOBsmyur4N7tRaCzqxlK1Jp+moXfRlVBhmFdP8vPvLx6je5
	IJomsTHRsChTb5PusQcsu5e9hfOcbb2LX5OHxL02dkHLLZ+IUGYhsjp56Ifhm4/jkmprTEp1LmA
	K17w0VUNHmFNlp8pn/KBmd/X6t9TRzg4uptq+3eUvaiwi2FxBBd16403R7X5wA3yj0LpgWWot1M
	mCwew0E8azXWRJssZLfFZY/mlJa5EgDA4USIvupaJpf5xNBtqC32v6ASH8CawvzNXtt4HBQ7uB8
	udIix0mI+Yo0+OyUWOtHiu0MsnJt15gi4kF50CvMqTWDpY10xQQyD1+x39w4yUePeRO2GGtXn1a
	A/nVGAGoFCAPFLcO3ih/eRYY2Hqw5G0wK1t3WfEau13fu/Pp7BVzR7nwRR1NTdBlK6dyNjPrPtn
	lkBbpe8WlxCBFKWefEYj/cIZH7CHy4gAdJDeSpKq71VvQhKT7AzOR3D9E+ERQJ0KdB4v9a9SpN4
	5MjUZu/vnHXEFOkoC8PG+G+E4v/HCbtPONx50iQ2OYs5Kw=
X-Received: by 2002:a05:7301:618e:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3674c63d579mr5523810eec.10.1792635518735;
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368b4b8e9c6sm3556805eec.1.2026.10.21.19.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
Date: Thu, 22 Oct 2026 10:18:20 +0800
Message-ID: <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com> <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com> <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_191840_134806_BCC7DBBE 
X-CRM114-Status: GOOD (  10.18  )
X-Spam-Score: -2.1 (--)
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

On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>
> Why it's open-coded ?

For the same reason as read_word_at_a_time(): commit ece69af2ede1
("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
it "to avoid having to pull the entire instrumented.h header into
rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
instrumented.h with linux/bug.h and kmsan-checks.h.

Thanks,
Qiliang

