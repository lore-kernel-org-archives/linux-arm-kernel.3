Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD55606B1B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uerfjLVA;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OSCbaLMG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=; b=uerfjLVAnM3D63
	w33Ajzfj/zU/qRVwWX560nJWgtwwsB6UCRMliCS3Gf+fS1YdNBdSMacW0WAooX4tR5O0nMPZhYe+i
	Fj6rV8eLmURCwVEL3MzRujbzD8CEF2su/Z2m4xVp9G/pSY3Wk+7Nk4QDVBMJ1IAssZ3m9ltAGa9Ez
	yemS1wCgbWQq2ZUYdajYkw5rf6gg3VJ44Jm+foqmCoUprgHmhh4icDCTgmASQp01a4lcCARYIjcTU
	9W4n7hWrz1D45agnqgNkowpV4DObsGtpWkAIwPic14BrboPmUzu6mq+VrR1HTmXH2eeJZdHULqgFX
	pp6uQoWbqfLuOvUYn2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxA-0000000GQTd-24FB;
	Mon, 02 Nov 2026 12:15:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx0-0000000GQPN-2Sp9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so14970985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621745; x=1794226545; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
        b=OSCbaLMG6A9DKplI4NyLujxmOlStrOjpDDb3gNvI7saCMXlxIJzPzNsTT4ygmoK5Up
         34wK1AdflwGg3UY0yLAfv0k8sDM/M8V/zwKvnhOIG0AI0VCAySb1yyeTT9hUhX8y1sJT
         I/7b3Q/T1xDZcvB5530mxh+cJsHqCgLlWRHpxbbWJTeFEFayKakhr+tb5/J471ynNTDw
         U9/WAQG1J2VzCGf2406oBs0yXQl93xQoWCeu6MhmBSE48zplaRpun1LUqkc+jhflaOCn
         KIWJldCekVsyR0LLUbAhAU2ZMaNDAnpNvdCDeOOBiaJq83IRSorf5F6HikztKiHhmxtB
         JFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621745; x=1794226545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
        b=xiiAntktrpTeRU3iDd9rstJaA5UBg10PmPfUy80m3/0wPJRTx+L1SfTLBidIGmu1Bd
         0WMqVNdXsWiekgrUoFO+jpgS4jjrIOCxFZtvJwJNqXpbf37C07QRlnK62LuCEsGJzwKW
         SriWsPJFxl+Hjwu8356PeQWM0Q7LE7Tq7YOsA5Ud/Nv1L43i3rLs3j5v4IaPkYX3D6V7
         BYmxOOWi1zs3bhkmco41QtyOXmzMTVDOS/W17bOcuRQfRk76keeat/ZfCMXDh5fauhOW
         zq63wKrrtEsZFGTkuXFNqEPSCmRdOnvg1k59krDNlCQn/9muKyw1dKX4vUbnkWaq9+JE
         Urow==
X-Forwarded-Encrypted: i=1; AKwUvByk0EoBwi6LfFP/AIg3/I1j+gLCnLWkvzFEjB5APVcbpya15wp0qwgiut4fzDa7ZxFrcAoupf8qBNHfO4crFO64@lists.infradead.org
X-Gm-Message-State: AFq9FYIhe7IGDZHdXHLhWR97jDe+eoBXE7/wuONsYkDyBHB1W3L9KvZL
	nxFuI7wF96xKFD9FjmZfJsR+oYAqLEfTWfhHf1qpFjsn0L9eBwGyZsAl3dikq9nRei0=
X-Gm-Gg: AYBFou3VsYovq2faEgoo5MM+Pt3yq7TNbi4IAi4Ultixu9bn4+wjkrUDkbyY6h2UILk
	b8m1pZZ9hIXCsiIXOXqh6N7k36tFumWIu3r+Cnl3/KZf5NDFPimPZf9KSTEUpEpEukLiuZwMLic
	+Xv9xLbtwF85RlpTF5fhf5vXIaaaFqQWB7kraQadGIlkWBQ5DYfJ9hXBvcd1EopZc7KJkvu4Xpj
	BRdknTsR0eMMMM/wsb9vPg7rCF/l6vS8z4PGodPfbQ+FQ/6154ikxhtat5anD+wmFJoNBXAC35N
	4yq/GHUWo8s0Tl5XZ+Dya9CyL0+i7QYRjAMVkoZ3T3GYw9+1WkBdZr4TD0e4k5weN597NYPBcdG
	muBJlJlhdZeZaYx62mHBcATtI/SJY7s0KuJqviH5KAyNxzgZZqvmQdX/lkEUMYC4bV/jK16ZlhT
	WYF9q1KdBdMEa3w78OZZHeWFt4gGGXlUzz84rU40mKzemyNWdLAZz54GQtX/e40RC3TleLAMqZD
	qebR//ts1PHKepFy3J7gcEf+3xOjukj4M6F6FdTVJMAtzJSBj3GJbS3WRl5Iv3qmYkpM4ksaW7G
	33XxIKS12H3eMQUiD4EthGE6s39+zpq8NP1oRMrhC/Y4zGDR3C0VtQ==
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr246272115e9.2.1793621744767;
        Mon, 02 Nov 2026 04:15:44 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:16 +0000
Subject: [PATCH v3 02/18] perf cs-etm: Warn for invalid timestamp option
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-2-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041546_644667_12666C46 
X-CRM114-Status: GOOD (  13.46  )
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

Instead of silently returning an error, print a useful warning.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0


