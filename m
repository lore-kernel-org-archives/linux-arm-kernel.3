Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50960A5BE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r1Mi4nZT;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hl4DpP3K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=; b=r1Mi4nZThEu9fU
	RUMrlyvdU6zg6cRwyHJ/gjQ/ZcXtsuW7QcOSusGqj5slC/399ZkEWbzcUcfG5qVYv04yV4eoRn4vV
	yUbkSkmSF229/wRsQIR8Mo5Zx5Pc+KeYtdfSP+ODZ9RxBpRr1NatPJJMmUpTrESqv5e6DTevTqIqM
	edEDQcNyDDeFeADgIXeW34mrDg6Ksk8tmDzsU6mG6AvY5oPtAp+mz57TZQg8i1cdFQNWoHaMAJg66
	WE/vmz4Ha2ig0uXwwOjjMAbv4SX3qv8tasPkwYYe4HQmft6YAse+apqGPmmXEZvGHWvNo4vwarh2g
	rmWmAKqpahXhJ+AyFQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx2-0000000GQQl-1dmb;
	Mon, 02 Nov 2026 12:15:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqwz-0000000GQOq-1M15
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a214af2076so22140405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621743; x=1794226543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
        b=Hl4DpP3K828DC+B0F0CpJdT8J1XdizEiGQAqxLFoXm8ieiq8AdE8xkgvqOCWHnMSq+
         5JsSLndzq8idvStyPtuuSddlMu9MmJoiNKa5V0LDrxmOLHG2keQIsp8PahvIQd844kVN
         kc2mrs01eRCwGH/m/wOdVKfV38oNiXvFnxQq3iH9FONYHKqbXb5fKRNsP5LfInm5WV+F
         fv8ht5SyYgIfY7F6JMe2YUxOJks4DVolp3L3UEL96XBeHhZsYFZe8H+yv+Ccr8MRyCqa
         QLkGSacqu+DJYfJ/Bi8a/8EpdMbomjeiaucBrLyUT8L8rjmQH0vKTgOYiDgVdCqiOjj1
         DmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621743; x=1794226543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
        b=2IW7oYj4YuxuEsIJETAZGpDexzqu6yepbqdAdVS4IuR/oMEyKrYnIe2CL32IsC84KD
         f3DG7wSJPP6YPvVFGRSgaPHmb8mHRzEikaVAzsg8GkXeeHdnXRu+E6GcbHuH23nawiRK
         w/as1zV5sWIki2qa4gayHrsvBnxPOewH9KnR/i/myAcjkB2BP6wHwkTje1fuKCoxsVcy
         ouUsWm5qmsGEWq7d9ge8SjARpfdt2sIExy3F2imhBtgYoudNqFrI0npjEI3eB3N/Us6G
         P1rbm3xzJntWfF1VChed0eW3UNsglFJgUHcuU2BWV0U0wYlsGF797I/wG/TT61iEJwvs
         3kpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHMg8bVCyMEqJjy9MX4zX5GAkfDaXNXJJUJwD3knBLYHk2pWw/TjmPykXPLdSj4lCecKKEo0YkxqlgpHGUFla3@lists.infradead.org
X-Gm-Message-State: AFq9FYI0vdvA1nO/ISW1XSZa1ROcoY+PsMAG4HRcXVoazei+FGimBG8O
	4iCZVjuO7+B2mVoPI6EQuR/MoZgVkwKF+qQ20dO+hYQ30ocXlNfK/8/HtPhuWuguly4=
X-Gm-Gg: AYBFou2iY7iu/PGTP6rrkUwBgSzdSpG1CkZcb8K5CXX9JOWKqJLMOO36846GUZtf2Mo
	LJTfOSejRsl7rn1w1If3+mSusCcvpPL9lq1HTGjMQ0lxs/t3q4+fnPxQUsko9m4S7t6COGXyhYk
	pbe3Puh7vUPLuFe4yRpqwExQ5i9z6b8qrRmvcFagtZIBXKgSWyKoHKJBdxNL4yOI3RciCRji0JA
	YwcZrY1TlYK1sqQX7wmWVBkhaT8eSfRCuLVfVh4zwbpNhjoqO7ng0ruisA6ct6OSauuThs4l9PX
	vEu0UEvxAvlY2t5wqTVrqmVJQr4YmY+J1GoDeCeuhteOhajmPQAuHiAFO4waZeVlzBpamsZ9l1s
	BGVyEpuVQUtXAKjHz9fu5BM6vnEejuu1+RVu8e1TGYfDfPWkBLCYGger+wcY1MEDZR72uLiVY2Z
	2vQHwAsASWDcRrhouSKmIuuK9rbOjc/RJqNQJt9E9rpLoDepB2Cp5p+w4jMRby0PKRKAM9UOB6V
	U2Zt0qtDnsHLTs9IXAlMHU+qLFyE0ZOCL9k/1O06YmDQY4GgX1De65F5jX9oK2NRSzTfC7CnzPO
	cyAoJrpBzUDuTnDQMYKjZh8GWQedMfIk
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr227973035e9.32.1793621743497;
        Mon, 02 Nov 2026 04:15:43 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:15 +0000
Subject: [PATCH v3 01/18] perf cs-etm: Fix nVHE per-thread decoding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-1-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041545_382585_A88887A2 
X-CRM114-Status: GOOD (  17.99  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf. The exception is when pid_fmt shows that the host is
running at EL2 (VHE). Then EL1 is always a guest, so keep using the guest
machine rather than decoding guest trace with the host kernel maps.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index c8a6a6e4c7d3..509ec014b276 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1102,6 +1102,20 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host, unless the host is known to be running at EL2 (VHE).
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode). With VHE, EL1 is
+	 * always a guest so keep using the guest machine to avoid decoding guest
+	 * trace with the host kernel maps.
+	 */
+	if (!perf_guest && pid_fmt != CS_ETM_PIDFMT_CTXTID2)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0


