Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3445606D235
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ozQ6lE0W;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBOBCL8i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=; b=ozQ6lE0WaYa8Xb
	zmOC7Y0g2bpvo8RoG5vT9ekY24xHhx4CcgRMJSeIP6KtEq/9SgaM44YFm76wTfQ/KqKl26d24aJ4s
	5G62LVNLUpRYDoGg/+PMAVu+Y8e8src53mC75WOhOzuwb/F14J/igRrzVF+YuHe9GNrMlG8Djipk0
	W/GVk2n5O1ONwK37A4jPsaHhdRhoZ3QIY4vLnNdfe3mNQ5dCwi1CA5PSFbpIXl6OhW8lN27xhzEHz
	6Yos+VXInD53znkuFmZhzNGUD6ziaoCrNbcfNrSieM6GzllhfodIO6SH80fuxTedNrcAfjRG5zBRL
	pUsAnwwVjXK0IuWI7Ljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxN-0000000GQp5-16GA;
	Mon, 02 Nov 2026 12:16:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxH-0000000GQaS-1Nm0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so25631165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621762; x=1794226562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
        b=JBOBCL8iDHaKxwWVXyKtKPJg2499bD5nPzywyVq2MRGwziLoiftbgVNvwBfV70wALu
         hmUCxxeR+SXLy0xPLo3v4HW25wggY+ajugWkepKxOu1k78n8z40F/JKP+WpF4vMcUab/
         B4ZdiutdoBDo5dHIWoDH/Oy3cYcDBmDapO7qacUUHcW5Uz2EApAb6cQ6rWLaMMBEDMUB
         FbVMjw3XrcgrWkxvTG0onSBX6jMm0ONm6U8GUlqOoW54DpxhWn5OLM3wuDkvo33jwAAX
         LR8GSixcgd1ZeVkGaKVjN0zkjxnqvErRG0TpebcngSmf7+oXuhiYu4NyF+iHyeTGDwLz
         yn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621762; x=1794226562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
        b=i7F1s1hckgX365Frse27rAtFdbBnniljfwpbCNAxVpibMyBrOVZUe+O0jfo8WlKo1+
         lgJfimdAR3j5YBicq01hc2sqnG3t9jvMa9jvw347NJ+WjKrsvp1cjc7gzICdBl4JyWgw
         IYG+iZvj1WazEItwngLqnbRJA21aCLcGo78pDdKJl9cZntbnQCTDtfceidx64NxvW6lq
         dfZZLHJbx3uyKVtavCfaiJ/PsN5GalD/rh1EvzsYlKlTqKMPRmaxWAk2gVWfiJ594i/C
         2MwKDirJ7tP69aPyIuoozqvlhItTQEZ28lvKVew89wXFUVUlAGKaGtY6qsj9lHn+IjmO
         6PmQ==
X-Forwarded-Encrypted: i=1; AKwUvByF/PSm3R0s2xMpgFgSK4AQNeoDea47wFwyN6+yCjg7Ajq1k7Y095//DlhFtcqRezMb2cs7+oumYRCTNaerY8Xy@lists.infradead.org
X-Gm-Message-State: AFq9FYI2++o1FKCafX/wLlLLbGw9Z1ThH71R7g62Jwhvfkx+ZKoMgNEQ
	OVPHBZh2zI6YLpAGE+bUUQ8vFpiQf868nBqNFsobduhvy3Q42TalL/MkTU5W8fofeiw=
X-Gm-Gg: AYBFou1Dotben/Kv98bIIxIn8hTNo/uj25XNe2ZUrsUYg7ttXQyoDKavzjVxLh05xvk
	0TfWngZvv+o8A0dJnBwVD/bZo7iRQ00MPEL+rRefJ6nnNZ6IJHXYbSeOyEP4QtKlLOzvuLhLbg+
	7YZRC297qq2yHBflAob2b/CI5oEuFKS8FvsvC6s1ct2iYEROk/44D95ZEoGRLyV9bKgJlwvRtK1
	meAiYkO6aA494BpzBgk7cFmri83aoTp/t3yHalzW9TG6A9bDGXhdZA5oRVnkBBwHvQNQ7sj6zno
	uernmxuaTJsBCT1SD0xIcUtD0tOtcqnbudD55By69HQSIzT9lKXFD1jFBf22rkfDeJz0I93LOTq
	ZSTkZr+4QtRPeIxYIm4HrRoHpr2sifAHR6ovgEW1ur7UX1QjTYWBqF/kJg27p8pPXR0LuZJxYsN
	NZh+UwuyigrhTGuFoCHG+JQm6Y4mWe5J+C9DGql95FPDTdPDuoGCimxCp5rTxSwszJ4i1qco+py
	y2AaUqxC4Dn0d6v6azuXSOnsEQs1uXhVsIakNcjkSnXkgfzitZ0+OAfP6kb+HUCfiLKeaeVirXH
	VTgvstglmdFK2BnCKUnrhd8cFAhFUHOyS7brzEVE5sTUmA9ADfRAOg==
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr222521195e9.34.1793621761658;
        Mon, 02 Nov 2026 04:16:01 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:28 +0000
Subject: [PATCH v3 14/18] perf cs-etm: Don't print missing buffers in
 snapshot mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-14-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041605_362427_19F7F073 
X-CRM114-Status: GOOD (  14.33  )
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

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index e899d82b7c93..c880a1ca7533 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3361,6 +3361,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3414,8 +3417,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
 	if (!found) {
-		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+		int level = etm->snapshot_mode ? 3 : 0;
+
+		pr_debugN(level, "CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
 	}
 	ret = 0;
 out:

-- 
2.43.0


