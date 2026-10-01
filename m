Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EDACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/XzKic3mIkTxbK/Zld2/LgmkZ+m7jvrTtGlJe2zmg8=; b=cR/Q//pFCHvXdgMHWZErwSVFJ+
	KA/swvreMxciDKrSM3863o1hmXbyD9CmBYC6GSlAiroUcHI9RBI7rqEjjLJunMM5q1eUGZ+kkHcmK
	tkQhgWw0jhQXThvwzXOBy/81NqRsa0UGpRFqeFy8NRsBhPjsV15MIsstKxjBzSUGcZCcpEjBl+NI7
	2jaIN7jADkOXzW4TEwkCDwPpmn2bmKAsnMerlHgApe1SIdex3I5bOysP9uMrxw0+eCa3/zuyL96By
	BB6tJsQiP16egvwAr/ooFOUV1+XY2Xhp2acKO3hIUOspfflWnIK1pka8SUa9zKmRXzfrYLTODw1wU
	ln/RUnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHfO-00000009MBW-1B9h;
	Thu, 01 Oct 2026 14:21:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHfI-00000009M8X-36J1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 14:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m/XzKic3mIkTxbK/Zld2/LgmkZ+m7jvrTtGlJe2zmg8=; b=Xac1A4yICZQUpFcO7LRqKxyfS4
	IasUKN359VEa4H6OFadBHD9UnbAszZ1aszlvam1HCom2eDeG3noP0H/hshjNDWwtW1UOludm1v9Ie
	suZwbfXtIqWEbPt7mRmGMD2fs1ejSj4ctUF587CGi4hK8/QLfPc17rjgtJY+QvqLwsaHWBbjB1YNz
	/VeJeH1JuZSUSMKIPsnSC9eDSrSfteUZ+9AJtwdCdsQX0IGTzlIlMTH4wy8m7qgZdB2e3CStuWRZA
	7KmngFRCEjBDosrsHT+t+N679UMlZAO1zu4db+/YMQsmfuJsMM7X2Yp8r4+J6PqJ+QrIqyecjWFGO
	vSQUlfhg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCHfF-0000000548W-2b5Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:21:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso60251435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790864496; x=1791469296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/XzKic3mIkTxbK/Zld2/LgmkZ+m7jvrTtGlJe2zmg8=;
        b=PtT1ebUPkM+qElJInKst+PXDA35dtFah5Jq51+Spbcenh9dPbT/4UR2G9pIrBkWV44
         r7DDt3BeeKtmwwbl8vkJpIAmCyrOxKImHetel0LN1ZZBcTCEtlK9nJNMvVlee6Kr3lGu
         KuzG77dyRZbUPT5+K7EpWsl0G6nsDY3hMcFTzSgmakuG0vM1kz6uuxQ1f6tEJNxAliim
         zIidrw6LBSuYA42tmW4K+7dw/T6qeunjpnHV0BQdbAgTIKY+2G4vuWppA+TLRnEhMX6t
         0H4tI6pgmRxqeBeYvof5E+YHkJWqGL314LM9U0UYQy0kRrk3Z4FNZT9DVRGnafzzSqjD
         T5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864496; x=1791469296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/XzKic3mIkTxbK/Zld2/LgmkZ+m7jvrTtGlJe2zmg8=;
        b=JZjz+CjLU2tGJUOAG6f4sbtP780dd9Yq0DWKMCdOC6w0yX/+ryXJ/XWQZBG3xKErhh
         JNLp8erQp7RJ+W6rPgJFvaoIOyiIc9HGVuWjufg2NcISNuhsGrg355tDRUAQrgegedNL
         DldujHOmO58Q7pVo9gWKFp4kMBMJD0yKWgd26ijpzNMLbtb8dHvanwjV7xfhCpNkg74L
         NM/MoQpg4QLF2b9Uylwr4NwEUNmpJlMxVc8ZZRYNqVtGGrKrOBYDGcF6Ggigif2aTFGd
         GJmX3kKl9oojEyU/AXXNWzdccz9qzBKyTsT235bLUJVUIn5A+0JXW4tgFmgAMOvF58E2
         fSuw==
X-Forwarded-Encrypted: i=1; AKwUvBwN9lD+1RuzQijWted7ddLakG1Mrw0VJmLOW7LLjMmsu4N4YejCQn0xAol2GKb32jIQOlms/9iOMJHQJOoI42RG@lists.infradead.org
X-Gm-Message-State: AFuF++kSEh2zbOeYpI/Ut1DEwD9TGMGzEEvIYbr4zk1Dy1s5nPzyNk3q
	BMgHIrwe2EQPIY4R7keAXtHcgAzG1fpN2juh1sGRnmSW0w0txnFMSTRMABzJYXiUyrs=
X-Gm-Gg: AYBFou3D5snwIjF+HhpTxBqaAjtgXc7Lv16Vd1AI/7wrV2p5GkvjnEQLG2zWfKiQODS
	MGqBKx6gUt6PnhK4K9tJ0bRYvQkcr9dHbM5X4x9hGYGSMtrSITPB7Oh4+V40YQENwSPuSEePMlB
	U8j2/47DwqRXVNxDwUk6w7gApcqv+dgp0vttOMyUcCwIRLqGMF/7xIB55SKCRmwX+3/FkXliFK7
	/ll5yMR9wetErFWJM7dWnWvw0tKmw6Xvj+S6E6kial2EwPCFJ9JV35D1ONdV6W2TE0MzQCy8zlz
	YG3Sr2TIPnPpNznehtV8e9u4Hij+k3vn8qsBcD4vhT3x6YObmWcyVaj9PRAOeNV4EZwiEJVOAQw
	+Eu2KUBvYAOp5Ykei8JfQiEPZ6U3xnSkl/yQI+S7DqHgtvqmaepmxUvC8KhagZw1+NxEUqjPBcR
	sBjjBl8pEhBga4ZzD2OkvQZshyXdQgkNhpknBI1l4Pegnx+kiGgw5y9q57QCXNrAlL43TymUxMt
	Q==
X-Received: by 2002:a05:600c:6206:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-4a01b11cb33mr86968865e9.25.1790864495929;
        Thu, 01 Oct 2026 07:21:35 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f1c2sm34783975e9.2.2026.10.01.07.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:21:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 01 Oct 2026 15:21:16 +0100
Subject: [PATCH 2/2] coresight: Retry failed HW_ID writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-james-cs-retry-hw_id-v1-2-4d45ab46cde7@linaro.org>
References: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
In-Reply-To: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_152137_755391_D2929853 
X-CRM114-Status: GOOD (  21.13  )
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

Don't set the aux_hwid_done bit when writes fail so that it can be
retried later if the ring buffer was full. Add a second attempt on stop,
which will always succeed if the stop's AUX output also has enough space
to be written. If there is no AUX record then there will be no decoding,
so the missing HW_ID isn't important.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 50 +++++++++++++++---------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..9238a12628fb 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -536,6 +536,31 @@ static int etm_event_resume(struct coresight_path *path)
 	return ret;
 }
 
+static void etm_output_hw_id(struct perf_event *event,
+			     struct etm_event_data *event_data,
+			     struct coresight_path *path,
+			     struct coresight_device *sink)
+{
+	int cpu = smp_processor_id();
+	u64 hw_id;
+
+	/*
+	 * output cpu / trace ID in perf record, once for the lifetime
+	 * of the event.
+	 */
+	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
+				CS_AUX_HW_ID_MAJOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
+				CS_AUX_HW_ID_MINOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
+
+		if (!perf_report_aux_output_id(event, hw_id))
+			cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+	}
+}
+
 static void etm_event_start(struct perf_event *event, int flags)
 {
 	int cpu = smp_processor_id();
@@ -544,7 +569,6 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source, *sink;
 	struct coresight_path *path;
-	u64 hw_id;
 
 	if (flags & PERF_EF_RESUME) {
 		path = etm_event_get_ctxt_path(ctxt);
@@ -596,22 +620,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
-	/*
-	 * output cpu / trace ID in perf record, once for the lifetime
-	 * of the event.
-	 */
-	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
-		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
-
-		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
-				CS_AUX_HW_ID_MAJOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
-				CS_AUX_HW_ID_MINOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
-
-		perf_report_aux_output_id(event, hw_id);
-	}
+	etm_output_hw_id(event, event_data, path, sink);
 
 out:
 	/* Tell the perf core the event is alive */
@@ -679,6 +688,7 @@ static void etm_event_pause(struct coresight_path *path,
 		if (!size)
 			return;
 
+		etm_output_hw_id(event, event_data, path, sink);
 		perf_aux_output_end(handle, size);
 		perf_aux_output_begin(handle, event);
 	} else {
@@ -769,10 +779,12 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		 * But we should never get a non-zero size with
 		 * an invalid handle.
 		 */
-		if (READ_ONCE(handle->event))
+		if (READ_ONCE(handle->event)) {
+			etm_output_hw_id(event, event_data, path, sink);
 			perf_aux_output_end(handle, size);
-		else
+		} else {
 			WARN_ON(size);
+		}
 	}
 
 	/* Disabling the path make its elements available to other sessions */

-- 
2.43.0


