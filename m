Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11014606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w8VfsaYm;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Snx6N9ZQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=; b=w8VfsaYmpQhWATchhmoNh5mh9u
	Xen34JBG6BEBso1tpXSBGeTq70Y3Dza5/21ylX1bxO8kNTu+PQFofcnblYl9jvOM0bsSLoZChbZTG
	Twg9H4u9+4isXpbMPRobj7dkh3iP/3zhFYrxxEWpqM2AuZnr/LyL8wfkYtJ98VmNktn7fAQFTM8ux
	as+xNI+zRZdGRKoGEOlivE8van3fchuvh2FpwSNyLxJ5Q8Jwu+EmjH4GxYRO5C1huoSjk4lfPuFrb
	INgbLspOAHvy3cohYQjSXiE3AJk/Ez2rlY63QAiM8gssDh4cKErSizgP91dyAgV9HBDar4m+YLhGI
	GiOGZEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanU-00000003qVV-03zm;
	Tue, 27 Oct 2026 06:36:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanS-00000003qTQ-0alO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2722940a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082993; x=1793687793; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=Snx6N9ZQGxKyEHSSMZidInOfCCOMXC9++AAQLVaGiKsdqMDSchtYDwLY9oFnpbtKqO
         nu8C7gEqQ991flGNolG3v1c8YbX0lLJHGFExjWMCftCTE192+XSqQpYvczItUpZILODy
         XoC4uQ49M1KDVzXY8hSfVoUMXX2RcXe1Qm/3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082993; x=1793687793;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=uDly8kY5sVrTGlYEwkflBXqJG5XI7Somd7CeoGnododAql+F4sbOtwi9mCzOwH5H5j
         sl37waEPiw48p9tv1PFXs0JKf0owuBWlS12x0z//RL0dJH53RksD3uAho5AZVgQSX7pE
         Y33EfemoF3ysJJMsL/7ym8zDRRmq5e6X+MrmNq3Sg+E0Op27vI8GVmoIukI5SFjCoLam
         9fqdEmknOkUkgxUR+zojORlbPEK7d6VGoZHfJJIixAHLjHOmwhc6ErQxB+OUBm73ao7c
         t6H7U9EGTm91LOnXP+6fCozmnOfWjzybsURcSPzMMiu5ku3YNLU/rKpJDXzlvdiM6QVu
         GWCw==
X-Forwarded-Encrypted: i=1; AKwUvBw5mL/IPvvjsCT2J3BJOa+kJFBMh9Ah6SlZcCva5oYfm5bj7J6SIKHWrByNUEsnfAuBwtLDUjn6aZjIhCyozzpU@lists.infradead.org
X-Gm-Message-State: AFq9FYLK+S8CGFQIE9AaRhMBKDfZYFT0rmRD8Vi2jFZfMKwni6BKXYBy
	8pH/Cs1lSC5BTrN94Eb0se5rz+Xfv/BhQirOcVcudy0jz2k5+bAC52sU8uasRUacDxA=
X-Gm-Gg: AYBFou2GRP5cJLl2iLoxwen+V3evGczWWI9Zgfjk9FgiwGVcyDkVEX2TPReir9xOGOc
	pS7DdiD3cRo+Huoq7dLLpB71UmU/Wa+pPSqa+bPqqmVFFt0eu7FxqbMoQ2pdy2c2khbfHuBvWYq
	HD5putwK5Dlp70MO+xrq+4z4EehMbjyHkmrLbR6quCR7785Gxr7A21YhHfm3hWwLoGHUJD34fEP
	Dsa8Ko+XEztRT6M8aQaDsdoUGMnk8Jw9xATBay63iKw2WXCWXw/FMj/bx02Xb1uN7Py9Smk4H8s
	C4qfJ2kTMoSTP5i1ZM6OqoW7vB7RkcKZGRBfy9ZSFC0JDiS0YxTEHqJd5UXAXyxOTMN9FcvHOeG
	nFeY1PD2SwMuxbFvAZMjOq6ZXpTwKS92rNQWf2kcZgaQ+vayqpdkYLmVxLkTOeZmjEUsTmR+0KD
	I71AZ+WyBIMf1nvteP8vXPTWI8/69dhOyVJZ/+pVdzG4/xMvsggLv8jmtkyv9jU2rHCnZn50xJ5
	Wyke9sqZ8TmVk2cPR9jcBRaZ5pTB7Is/Fio0tpMTvt3fNBHBGUVuysOVKGjrokBgRSNHmct4Qd8
	e2qMEKKka1WqK36I2l07AhJAx+H+trPu+l1avsibhLfqTUTSIKbt/JzqLoDJD29APLeC1gr9fX/
	qIkp2Okixu7ASYSaYocORf0o=
X-Received: by 2002:a17:90b:3ec2:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3adeae6d30bmr6210081a91.18.1793082993200;
        Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40456f65sm2331529a91.13.2026.10.26.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:28 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler
 stack end check
Message-ID: <7c4627a57202b505bc03837680f6b43c2683bc07.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233634_196402_253AE099 
X-CRM114-Status: GOOD (  15.68  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no existing test for this, so let's add one.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..929a60db00d6 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -854,6 +874,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.54.0


