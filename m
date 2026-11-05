Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B0606A926
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIbtQCdN;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e02FAbj7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=; b=mIbtQCdNPk8bBG
	dpapxsM0/EqMEjlDeGQf3JZ1pcjsNlnzfi3oar2L6LJ1VpbZL/U4kaBaTTxpRhTyAcdx9j8yv9MTI
	jlnMfVIW/I293Nl8Hwf78HnfLgY2SvqVcyg+gO6IssnEXkCATntkCFRx+VSrd9jssKFmNTCB6ocTP
	pQaoJAqsyKazAnak6krk8NgaOHEgZhrWNh7gzteMoWM1zizpZWGGQVnzPIgjPOqG017P/cYCut+Lh
	dlvOg7/VYf3lQk1zSPOULSGzXTg9jYry/Ss4M+Hob/pyqm5XiXyJzJQsL989KsYvCEtmFonFKKGo6
	cB9w3hxFjExGL809Sw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvul-00000008jUp-21fl;
	Thu, 05 Nov 2026 11:45:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuV-00000008iz7-3DJ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12472745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879138; x=1794483938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
        b=e02FAbj7FhuXPZGHBNClIGcgzRtU/PIzUtZxeJETWJm02y6ZuiBYxTBFRFhinu6iHq
         AsGTagQaXZtFXDIop/YC4Dpz4xs7FDvPsNVIrWvqg4rQdu95lIrpjwtmqOCiqw67ffL5
         z9KhFaUJ0D0JYCwwVKv0+0nuf6nbdPY8bKCpxFsJ+qoTp/VKm2yO9KcjoVuLFF7HqXZB
         ncuT2K0d1Ez6EVFz7A2o8NIDz3alxCGOq3ghRGfRSMRagU+R7G/w/TAKOwJA2nffl307
         yfA2UrNJiDRmD7D578vcYBeZ0oaG758mLWbMuaEUqMHZVBG7jAgI8s0cbRuPNacP4R/2
         hi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879138; x=1794483938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
        b=fJgEQMTCc+oC16lYEuoawLOUZj5Ne5/2fDwhMAmezBnZIQtWOgtWoqZCKJpGdbWNlE
         a0RzoodWaeUwkQ4AUkKP2tMZSUefhd/QlOkMXI3n97uuarDZXav6/U6JaB15K2Ov0zJT
         ro2jiDv2qsw+aDDZXYIjuNswgkRs4OJ5lWcqyraeLbRa6vY9wbt07flnwZY/0GdN+75E
         kIL3WAa5AugBc19/uhnI2fSf2FGYpvycmKD1Dytoim4NqtEWBPUe5wz78fCpcBznCYcR
         iPS8NLI5Uul57CLrUdKeocuLeIP+9Vjyzcu6nzYoOMpQ6Go0N/PHLs3pHHV0PbP4eyzs
         aO1w==
X-Forwarded-Encrypted: i=1; AKwUvBzjycI4HPpe24tfgzjkXO6bnXmc4psAkJSoJ17a8sq9gv5NWmvIake7uFnEc0YANGxplSpRmDJfXd0ltz2X0yNZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9WM+RiRlvISMV+DShvuk/gCZxyjqr4CA04kiBEB2vNzYgw1/WA
	hSrInIBjDael0sfd8EhbbgejpF9No5Dka/DUOS6s9KHkq2ZQ9Q1AA367tQ8sJ4CN2to=
X-Gm-Gg: AYBFou1uyjBXSHFyOqZxv+oAMG+Oii5Ee2q54VpjpfUPVtkziSligVFemwvbe88dwHL
	pg668blEU2xgl5s0PMtTE8LFZcCqdvQBVDPgJ+pEtzc7YAVuG/XwGXYm6d7BUFVVmN7A5TDZU7W
	MjUelv8epzq9ufGWnpxp2OY9cgLOlRTEvJ3K4uUGizNBLPa45OtMeqdJOTQLUsFHGoZBfhywycC
	Z1lySWqU1Ny+WpDG5I3qKza9rOv34kSyIB9lEZpCKANWjPSx1T0IK+6GEpYrBdB9Y4x9OWYzWTx
	Gob7NKSjY5eeiJWllZsdoIvJOAhgM5BgaCprQxoXriqqA/1xk96ZDdby9FIqLrSI19OjFOL8Kuq
	U7TQRdYyaguVmLypecXado4NDPlEZ7brmu2hJEJLcxPOAf3DpI0NUOHlCe1jgBP9b4vsVYdnCVK
	k2xRNcVJgvsTwh9ubZ5At6LZNMsG7PVWsLE5a1BKOslpn14LllSvolF8k6SwtHM5yssXQduaYGG
	y8FhqF7OJ0W8CJt1ayTaZuAbYkAShrsi9x2a+q0ZWIgqu98icljaRPIf5njSnBLHOcwY5BHLunG
	zEDVZJQKhN4PP6oH0pK+gBEWKK207HqS
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr113538265e9.21.1793879138032;
        Thu, 05 Nov 2026 03:45:38 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:02 +0000
Subject: [PATCH v4 14/19] perf cs-etm: Don't print missing buffers in
 snapshot mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-14-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034539_876603_4BAA8FED 
X-CRM114-Status: GOOD (  13.82  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 320164645f61..51431a4d5db7 100644
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


