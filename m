Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33236C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vau+zNCewZiHW38t3Nl8HxSJyuVHZ3A5oWGeCWcGqfM=; b=SaDnwx60FRgjkI67CE073BvC4p
	Q4t4ac/liJ2XMs91fwbeuyNnB0XKWSE8tdKwV15ZpIcntL784yrrWp3ezzF2yg9eFij++vieTVqLv
	PAgX/pVV1SPTCiggRhX7k12Zu3uO6bx3bTpHZ2y4Z7HPK2Fd3Z+3l3Iy+Jq+GE+L2QxzABOS6ivTA
	wdZWB51t0epBDS+7LWiTlv0xCGoYsJwRW09cPfFtijbkt9ohic5bC/m4kugTkeuEMC5P/CfiZ6C4c
	thJ1vEC2G1bId7So33kBhG5+KF6kaD6Vb77a5cYD8/SsCZ2S1VrYvCueY/kKPPEYYxjFvRCdpZy2Q
	FDcjQLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzn0-000000065Lz-0Nf8;
	Thu, 06 Feb 2025 11:11:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX6-000000061ah-1ZBK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vau+zNCewZiHW38t3Nl8HxSJyuVHZ3A5oWGeCWcGqfM=; b=G2bZCNAQfL9/2xG9MwiM0Bnoox
	K+Fs50y3MDTyn5JTE+mBObrev4MDDl8Dop2v5NM7t84hk2vwE4VnKohGN6agVfVUpZve2uDSLPWbW
	k4RP9jFvtv8XdwB5NKGoHFAPfSVRGRle9kUkshAoGgwRlHZHnfKwx72OMSecAY1Alc5dUxwFB77Uh
	3L3XFgxXTq8tXn9exmB0G8CYVWEGFbjqY54DxuirhxieT4wzvPf6TZPckL1kiSHku4ugu27kMKr1/
	kPG90WmQ4tzdA48j62KcPzWpUr8x4qnW4SWwXVnVvsyPydwXJIkOWgXZu3e1KC4RfBzraAxGdDnnq
	8FwWabrg==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX2-0000000GutL-01pl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-438a39e659cso4518875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839291; x=1739444091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vau+zNCewZiHW38t3Nl8HxSJyuVHZ3A5oWGeCWcGqfM=;
        b=L5kDoazXHwHj8yGdbSHegPIHAOK9H3FTGdD695mVMQqZUhV2mFXakhV5A4+oFFu3Jj
         cfgGomgg8oCsuuFdvPynieAQfJfVuxa+WGFVGKzJdpl/WEklyqDcPHOR6QIvJ/Rov8pJ
         eRXfF/Dz1iHjy+8D7Mn6R1MM4VWiLdKMkdJ7av9UOAVUWLN1SC6qUb/7idtyqQBho+BD
         k7a0Np87n77lz3OtGu/hM2KZFU8UuDgHNy8R8tdZV7BCLQ8440AroUuG6DrNxd/S54L3
         7L8WX/BMWgaeLVs3KxXrvmnN/vne6HSsFvaGGB15blJotW3gdU38ZXFJ+qyuEtZwYCov
         epEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839291; x=1739444091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vau+zNCewZiHW38t3Nl8HxSJyuVHZ3A5oWGeCWcGqfM=;
        b=GwSKu/2Kj0xB18KAqIL5gq/y5GjA5/62c1pgPPySUt2KHndvHl3utzjLJ5IpioZw2C
         HHjMbNzJkEzt7yH6K0oBedn2Jjzs51GX2QtwmG8DNfFgSk0Fn6pJlil1ozNzgosOGkC0
         t65DhNj3qkIHe6tAokkdtCbt3yYTjPpBmXDkG8Pf8qO1+NKKd5MbrKTpMUjaK6Iwlzhq
         53aIFJPAmWwCXM+cEcdqKrOgzf/zN9U39WkiCxRgvSjmFncSue4Z0+8sCwGuHKq+eqbY
         0m/0PXHh1LkgWh3UhPqbbPT7wp4W1Pbja/D5pEgNMzKBIsEpTuMdyiJbMc+g6tPUZ5zo
         PyHg==
X-Forwarded-Encrypted: i=1; AJvYcCUGIXShlxOL6q+cS1BXrLPu8ZYwDLcI87h50QrK5FLH3dHEHlRHZnyPlcbGSz/RUhUFTG0NYXchI5AJ3aWpkWkc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7QhxLRk3xAO8xR/b7+fB7i+9SKXoXQFnFefRZplo9gDZcJKbe
	+ltPW/Eekdg9adgw15ODxF4rPAPK2bs0AZZIA/aqfcBk4m3w0aTk
X-Gm-Gg: ASbGncsKyZosJa4rpw4/vaY3XIBrexPd/SPHrKlri7hbUnteVvtPlp6lnAH6D1M7kGH
	VBcTCVeb3Z3svPBp7ifJA6nhkRhXy4yUrJljAUM0qWc9lnX5dw/Vs5X2L5C32dM7bdJDQIqfE41
	feIouulX5BVycTHCe4cQEsNOCEa8khhoB289efEwR9DTvkWbL0racJiPUF/LZjYsnmejLMMaQxg
	yiewUuNfrZEaORSWMyhhEXaeeRsBQVmd1IU19vIlTi58Nil/pOG+Egn2zpXxrrrjA/ctiel6mmi
	n6xoxw==
X-Google-Smtp-Source: AGHT+IH09CkYJ0UtkBe+a5qInFgvMXJIECzPffzqtSRnQ4/rOtucmd7AR3vCh/FlzDD0l/wp6T1GPQ==
X-Received: by 2002:a05:600c:3b11:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-4390d43f76emr48688805e9.17.1738839290760;
        Thu, 06 Feb 2025 02:54:50 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:14::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96640sm15993445e9.8.2025.02.06.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:49 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 10/26] rqspinlock: Protect waiters in trylock fallback from stalls
Date: Thu,  6 Feb 2025 02:54:18 -0800
Message-ID: <20250206105435.2159977-11-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; h=from:subject; bh=jiFbzaZcn62jcwbclsn6fFlBfAVbcfgq/5K/rfr88pM=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRlAFWO9LNwjO/6CG81gcHcw9dLmIxeb4fj+/Fr WCxwUJyJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZQAKCRBM4MiGSL8RylLCEA DDo4P5cRJ8lPeqvkLpxQQ1B7QXy+KIgoUK7g8esRrYEGzu3/eXsNpmYAoOvt3pEFrK41Z912PBSwiZ i494ekqsWp8O2NUu2LAySNMiQoLle49dVCJVCS6XExiZjShBBUkEtEuCd6nUmFQI75F1VAg1iHmFJB Cfib9a+3IucRelAmkgBnQ/O2d/fQo0v+SD0awcgBflP6r/Lt63AmQA4aZ4sFZ6racNxenALC+V6MfK eW1pM/lb2MDwv9GUrhhA/tvKIXCGXkR+t6Ujo9S300ORDUjNyeubMZtLOCzHkmeb6HyI/laIez2iWD Ek0KD+qMhLwDY6ZzHwu0bVuubuavObYEZQjiTGON1QtULb4JSDF56lM2C2rOn45iYri4ihN0gLv3Zs 2ViXlGn24tXGV6kxa8MyOwWHOShlj4BRY0MGSol1jU2UZbp2ztn5iujPHmtcZDFMbAAe8HF8eaAnJp EhjV0kpIyUMml54A8fDiGMgjt5jI0ciIUDnEYtzcDCC56XaCPRwRRYluCIYOk1O6sczyszhNNwEWsM +oYoNqL47WMzOJThezb9dy0n2ARWnKz5fdrzN1fZIqArDB6QziEdYH90bwROd3jhypRSPWfKyYUWg7 y0WljjCeSXbVoHZmX0zVKWnH/l+jCp7pdBirkN9WK6Cr5eBJYTtvKNDwUP/A==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105452_183306_7F77578C 
X-CRM114-Status: GOOD (  13.82  )
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

When we run out of maximum rqnodes, the original queued spin lock slow
path falls back to a try lock. In such a case, we are again susceptible
to stalls in case the lock owner fails to make progress. We use the
timeout as a fallback to break out of this loop and return to the
caller. This is a fallback for an extreme edge case, when on the same
CPU we run out of all 4 qnodes. When could this happen? We are in slow
path in task context, we get interrupted by an IRQ, which while in the
slow path gets interrupted by an NMI, whcih in the slow path gets
another nested NMI, which enters the slow path. All of the interruptions
happen after node->count++.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index fdc20157d0c9..df7adec59cec 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -255,8 +255,14 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 */
 	if (unlikely(idx >= _Q_MAX_NODES)) {
 		lockevent_inc(lock_no_node);
-		while (!queued_spin_trylock(lock))
+		RES_RESET_TIMEOUT(ts);
+		while (!queued_spin_trylock(lock)) {
+			if (RES_CHECK_TIMEOUT(ts, ret)) {
+				lockevent_inc(rqspinlock_lock_timeout);
+				break;
+			}
 			cpu_relax();
+		}
 		goto release;
 	}
 
-- 
2.43.5


