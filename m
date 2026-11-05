Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E2606A92A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5Sgnyat;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ctCla3zp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=; b=Z5SgnyatjToSMB
	lZpIG5rQykajWQSpL49yJUhS/RvgOrEL3UQ+dLXBzRVwHV2CWptf6NNHJUy+0dfMUxH8cMMAMYCLl
	iwr5hdvQESj0PitNm70pKP+EJrv0IkW8zJybc4B3CTZFLYoDK2MlUXNOPnS5RPpRZgyApsk/VARJc
	bGzslXpo9EUCFwhJ0pwthMQ98UOf+U9/3fPqbpLbQN6r0znOyhZUzx0bRoidLjHsKhwwj2F7hgXFt
	yRzUEV3OzHt+A5JQBKzxTAa6/NrVYxOLKNuX7tVK+S0e1VktTwfiMsYuK3SlvK07pSVLiUkKJm5uj
	5CFqjz0Rx4xgiwJ8A/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvux-00000008jpt-3YnH;
	Thu, 05 Nov 2026 11:46:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvug-00000008jIz-1Q24
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2949095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879148; x=1794483948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
        b=ctCla3zpI8HPVAFVaZPjyW2Sfn+VzSJepVybOjC/wBcxvtMh4o6mykZGFd8xjTzO+K
         D5zZGisF8/E0hJbAmTqr+4teJ7xRlMxgTnlAfElXJIzK9wSiU2vrSX7hzAxWo0EGgXsy
         nzIgQ4lLenBFpCPzyulymljpXpkR0ZS3o8KM6wW9UT0Kx+IP6Ur2US5ZnLM4PvS3slvp
         NyC0QqztFyY5f+B4datGozS9c4kEAyXZSGdcifwPKghYSHy88R+FUiagqqve+gio6Wts
         +LfbWiYm+HVp0vBoa+hE0b9RPliZxID6niAlHewuDUjI1Gg6qWy4v9ZeL1nbW5VqUvBf
         O6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879148; x=1794483948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
        b=DANcyLrS1J7Htgprl0FSAzfVTPyYY0cPp7Ez1TxxfstRCrKYUamVr05iBksQBdYv5k
         wy9T6eL0yn1xMa8og6VwXTq1wV7oCNjiVWJCjXiByYAqXBb6oixyEaN1GIHsaccw0RoQ
         eABv1+pAnFFU8GUWjjzJ0YAJyI/e+3CxDwrJzlrsUG17OeJgvgmv+ha409SWX0nkxLs8
         4LdyO6yNR/P7hu9J23pawivCBINGZqGTrlqBeBEDfwHkDoIYUrlrEhl4OumEUMLSYBaG
         /YRiShHb2M3ImSn6KDRr3tjXv06Og31GSQDsTLrioDUXdn4BXXGZ8vwFEFIXCpKw3iYm
         1I1w==
X-Forwarded-Encrypted: i=1; AKwUvBxxUD20+nxosG5IT94s0e1UGOCfUOnfimFeTtU4tB3jvVvxESSAReNwq0tUpG4vC4MQWP2Sn0pmBSzijOm2bqyZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8ihAFqKYEKMdDose8eUjXMnVtuaV4lJAul3E2mQBoUWJGcnogd
	/p2cMxpJuAsRNHmVmeUl95NTApyrLY5sQelFte8MIDrz1ZdhUr44+83BEKdfS20GtHk=
X-Gm-Gg: AYBFou3y9nXRfoql46P1QwFiKzMRPI0CWM/4T7wzQj5QbU2NNMHFmX4CuRH9FY3OSig
	RLqzEH6AoSmgnsmEckUnD8Akw/ot5cHzDTNTRzK2UHaaGRzoJx1AhDdi2lB3qhu+JtPm1cCSHC4
	oadyV1IRT4kmXkHjlJblXToTCf713l0jDzE7z3alcupwrR1c9BrKPvlEIbiIkk4YZsc2ZR6vYXH
	U3llJ03cDcu3WK4mHaCiQxNnbgq6jyOL2R72POgX4FX/SjuGQUfRUPBTDeqEe9eDZYKtrp0eX2I
	uWP8GHFOWECjpCK+KaMMJh3CEPrsUe8/1D1dXYxDCCkADk9SzmHlZk0vTSc5lmqyifJmUNKe+rl
	ux2HDJxqDaZtNn2mSF2rS2fwXFx8qeEyWzg0sg5+26c3RO1wtIarJwJdmjkiVx9LITAaUfbDIRT
	/haTZBHpc9OwVDJfgYvQcwTyoKthinjNUk6wlm/kQiX61LhJp8VstEby7L6/TRMgvrj6R0Smp0Z
	Pf+t53ModltaG7RBLMVks0Sl09oUpL6MAk2ndC33hdBcQ2TydJuM6Rtq5FpRGmN0WinODtt8tE6
	YzgycrHRM7NJWvEPZ1UnUSQJIaP5wnwv
X-Received: by 2002:a05:600c:e556:20b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b55e07fb14mr25741525e9.17.1793879148405;
        Thu, 05 Nov 2026 03:45:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:07 +0000
Subject: [PATCH v4 19/19] perf test: cs-etm: Increase snapshot size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-19-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034550_430265_90C9463A 
X-CRM114-Status: GOOD (  12.08  )
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

AUX maps require at least two pages, so for machines with 64K pages,
128K is the minimum.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index 236c4160e480..404317c2b96f 100755
--- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -48,7 +48,7 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
-	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
+	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,128K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} arm-cs-trace-disasm -- \
 		-d --stop-sample=6 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
@@ -60,7 +60,7 @@ fi
 
 ## Test user ##
 echo "Testing userspace disassembly"
-perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
+perf record -o ${perfdata} -e cs_etm//u -Se -m,128K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} arm-cs-trace-disasm -- \
 	-d --stop-sample=6 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}

-- 
2.43.0


