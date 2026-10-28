Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E898606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMie5vpl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOhS5nqd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=; b=dMie5vplP2+J+r
	s5/6kHsYdPNApAzXy10toNaDCgZjJ70y1OEUjDXl/rsJEDV9LI+iPU4kbmMCoiepzBoS+hl9Jx1O/
	/g80aloVjmCBm82cR1mGjbNHifgDHYy1H1Fa1D8pH0u7AFr/JT2JOQakUc5pcf4Ke3oKJEbiBbTLC
	XuPLo7aekI4veAkx5GGG7WovxhM5AFkG0Ksh02i+adafajiOFcrxpJH6Ur2pVJd8XWqh5/+K9WHtF
	HJln1MCQD5z1Nnm7PhOyXpv/rmd2vBNq8i18VVCr7kksi2RAscr8s8S7mWPyGX4X0M32G3ptagBdj
	DTBBMj2NkcSaddbc5BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOI-00000006CyU-1o2s;
	Wed, 28 Oct 2026 03:31:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOE-00000006CwT-19Gs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:31:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so402991f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158307; x=1793763107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=vOhS5nqd33rvspGa+SLBAA19vrOL6/ZP9KyK+Z+sIK+GK/Yj2yf8G0JIUYcqosJhBs
         UQZ5aY3CxajZvGLswRshC+pnQlxdJGayHTfcU2kr2zv3EAiGize8bImcRuFog6SllIvy
         j2IJEIPd1pfFSdvFrqwRbAbzG3/noXOUfJxI+lL0/QnCaSPnLidqRLRKbAStyn9ckCpg
         4TjkbfZDCdHKMq0endeTgpy9BgUR6CH6tyLskhwoqfZoZgLgo69CsaLpAjnLkeUHXc8j
         bayvVXSqxskc7nH93b9UzaK+yM1PPFWNQWdJpoAsmQYGttVv8KImxDNi4VfCABq8eIix
         qHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158307; x=1793763107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=QYEL0v/XbZfAeKPkOowJUd2Sf0IV1W7R+qTZcLFW5el2pDVYyZvfPU8UgSx0vxbHyC
         z9CQJfbpu2tXNB6brQEFAbpPXmPs0zYb2kIsWzsWjltWy7g5wl94/Tk3JO2bTpdVH8Yf
         3TVZvqef+QJbFSOMORT4bWnZVRcBkHgXgiw+nuoUfMs1/83tAd5kMvLQkbiqyBJ5habl
         XTJLUyA//Q9ENqLbwE0Ku4rMGCnOU7JBMGMmXbi1YzTgbm8/Ou5B1gQBvkQGH9c+Q+JD
         cxg7PwIMp8DYYrw5Blt8iPFPFABy+4bmwMAmzasY4V87YKC7ITcrcwbkaxeOGar5Ds1E
         wn7A==
X-Forwarded-Encrypted: i=1; AKwUvBx8NrG1B9QpJ28DNqCnEWLORiVbDpwZOtgKpDp3+YVUdsaRsPEDJ9z/7Hd+dXNfbR++b1Dq84nzZSIaqnHgJ1++@lists.infradead.org
X-Gm-Message-State: AFq9FYKUJNRV3htwPptjUsInK9L38hnmrLhfa6gx9ulCz/SfxHBRJo40
	U6WK+z+3zpg/N1tisjNLFRQkQb4SgLKaJ0Yms6KSFDM/rJYwE+wv7N+v
X-Gm-Gg: AYBFou3bmu1JjIcFD0zuSJVcN7LCneejxTm2ivVaK6FKUT2illE9kE/DGR3JMr3CLXo
	+uDJZGHzlpFmvhEVlLdClIHcksfhyLY7ANuh8A5G0v2E09Qa9LXPbM1B8SEr2NIEpKsK6BVwufq
	nEQrqKdCy86R8XOu3/CapuIZdDfHdKKe2eUg8712z6MBc9AgGwC2nSnO8OImQziFtD1ocwbKM81
	KaulSPGCQgy0ys6Cq3ue8lspWE8V/sOTo3hF0V3LgNx4PBtpTi09uvP7jQxSOt0ug7NJ7A9p2CL
	6gZXRnFgBD0zMwtHTdxZXQ0WTbX7sBA+K7bmq+7KbeSrBXh81o9TF5+5U3kVX1dHt9Yph/IrRtN
	m1S6Y25ikSwT+c2vSPsMOkgnOoScf2ALKjUqOsK6NWl+2TmXBftLKskGuLEEUqcg0KR2CbeCes3
	rAqnR7IiR2BSFQ8ccAxqeMbLIWwMocgTdjzdjchMJYcBb79uZoq5A4Dkd8fORVpM72/4SbVaXFP
	Fnl+k1LNZksEOJa7nK4QtvG9Ulu02gnVYChG4hl6D7OJU2+SDUwmvt3TX5D2Hn8YWKdj6ptDgU5
	DmspEBh+al/Xhe2Xu4SSGXhZpG/9nuWvm5TThUTyo1XbxPyDnZvD3DvRP7afh0mogahsszukzom
	/NAEeUZYW4ZTpPNHirfShRQIrw9BFrymgk2pVLxqN7do7+SgeuNkXDKe31rYrBNLysLNgvuugNy
	bqPOwoL+70/RumN5kMMp/zdy197ED7yR3ESSkTXDBuyTKDo2Fv0LPALg==
X-Received: by 2002:a5d:6f13:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e5d56d4fdmr2944765f8f.54.1793158307173;
        Tue, 27 Oct 2026 20:31:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 02/13] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Wed, 28 Oct 2026 04:31:16 +0100
Message-Id: <20261028033127.82193-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203150_511015_A648DE76 
X-CRM114-Status: GOOD (  14.17  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Will Deacon <will@kernel.org>

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d665..105f659bf8061 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -37,7 +37,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 		    "mrs " dst ", tpidr_el2",				\
 		       ARM64_HAS_VIRT_HOST_EXTN)
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.39.5 (Apple Git-154)

