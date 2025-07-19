Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B76C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahStHSrVpuKQhFyGWBebgfTyDgnCYq3IKD5gtRO66co=; b=bXT7ATecSpP4FtCPh1gnORX59n
	QD3SqPtMA6RxTloOiR3sKWQ+uHkaUqrIzFvSUwV5MQ0RoxnGiiI+4hdFxY+pJvt1DJXdey38Qr2a5
	JhJtkL+1zC+NmAm97ta99W6/zSOBY/A2VlQmUWnNmy58V4alvcWiem06CwfztYmYgL2ot8NWox/T0
	jIGeCZETXAB3eMsmym3o6cjQLafcNgszra2uyHt8OmJx0TNuqM7eoCOPePwF3N2/xbziVUIHd9+uY
	1/XSdrDz+95LTVMMQ7YeNeavOKZgQK+8s6QHx/U/qBpJ2hJKf8j5uAx4mnmAoZJQbk/pBRoAEfk42
	CgSTP3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucynP-0000000Dqew-01Dv;
	Sat, 19 Jul 2025 04:03:35 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyWB-0000000Dovx-08tY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 03:45:49 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23507382e64so25324895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 20:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752896746; x=1753501546; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahStHSrVpuKQhFyGWBebgfTyDgnCYq3IKD5gtRO66co=;
        b=Am3g10LZhJKZGL/nicUi0vFivG4su+p7HXyLiBME3uti2Z1XpfThihDh7tKd0JFP2w
         aUXPGgAuM69tWJia3OB5hqUdPmY9dLrehT2Zbn5G02z5Z4rGDMQ54EIqDBb1CvWBVLbj
         Dajp9aBINPYvrwEhwoa2rbeQyPmwP16TH4TgbcG38Vju/Er0ySV/CCNC9umXLamf2Zne
         ufKe95uLsjcd0Zj5ryjYXg+VD+GU6l2klYseCJdomzUgisQQZzgZcxpOGppF7lhqi43c
         yhe4PttWobhXX9lUZ+4WvFJRrnUvnTYJgowxBprC1PdRrK8BIz0/jTxw/ast/0m3lKnQ
         zIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752896746; x=1753501546;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahStHSrVpuKQhFyGWBebgfTyDgnCYq3IKD5gtRO66co=;
        b=gK1xGyPqoCHgxokT3ZOBg+qXxcv4jFDx6terFkayZGnCOt+38HxzKKbx+UEIwm5KAQ
         ZN+5xlRCx+CadFPfQhYQERG6XcUSp6ogyuwtHKzGRNo2yRmkwgtJsATlFEqJUwf1vFTg
         78hoFpe580AkBATtqUmWd730Bzb5L2PAVWpGwPrCiO04SKZflFvomjtZwkynBmQS1jO6
         7yKoWWHEgmDI7cUMD6WgRph9xcZaUV5tVrgExwAhw1tneU5RQYp/RNNiU0PPIgLT39XI
         QVNpB/v0Yf9vCluQADsxH6MjP9os5sIGjVs/kvKzbSNx/g8a7g8Tr5sA8VFfcaWuNVGT
         BI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCim2SEoGOCInYrt2lqK5wsTLFrCjTUcSue60VVLsiXi3BFH02gOE2rPNHxDoelPnf8C3iSMpYu5SujuyTZt5l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1sEV279OMMHRcssfa3D/nRXTu8ZlOog0j3yw4xZm6gh3ILmyJ
	JahqBL4BmUxkL6irZZ38rfS/jo3sWMBdXS2u4/XHytYlhZtHG0G/9iwEF8x4uwcvrrR1trf6r/D
	akbZunPrLSw==
X-Google-Smtp-Source: AGHT+IGv0sffouYqm1gOpRs6Jr1vqe1c28k9q/lC5/fr4WrVy4M79yj4O+gHrSlforNmYAwEPqNVcHwwUXyz
X-Received: from pjbsj2.prod.google.com ([2002:a17:90b:2d82:b0:31c:15c8:4c80])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d48f:b0:234:a734:4ab1
 with SMTP id d9443c01a7336-23e2566b004mr175340085ad.3.1752896745919; Fri, 18
 Jul 2025 20:45:45 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:45:07 -0700
In-Reply-To: <20250719034515.2000467-1-irogers@google.com>
Mime-Version: 1.0
References: <20250719034515.2000467-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250719034515.2000467-12-irogers@google.com>
Subject: [PATCH v1 11/19] perf vendor events: Update jaketown metrics
From: Ian Rogers <irogers@google.com>
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Caleb Biggers <caleb.biggers@intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_204547_097127_0E4EC07C 
X-CRM114-Status: GOOD (  11.18  )
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

Update metrics from TMA 5.0 to 5.1.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/jaketown/jkt-metrics.json        | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json b/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json
index 6f636ea0f216..250c73b21385 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/jkt-metrics.json
@@ -1,49 +1,49 @@
 [
     {
         "BriefDescription": "C2 residency percent per package",
-        "MetricExpr": "cstate_pkg@c2\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c2\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C2_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C3 residency percent per core",
-        "MetricExpr": "cstate_core@c3\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c3\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C3_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C3 residency percent per package",
-        "MetricExpr": "cstate_pkg@c3\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c3\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C3_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C6 residency percent per core",
-        "MetricExpr": "cstate_core@c6\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c6\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C6_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C6 residency percent per package",
-        "MetricExpr": "cstate_pkg@c6\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c6\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C6_Pkg_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C7 residency percent per core",
-        "MetricExpr": "cstate_core@c7\\-residency@ / TSC",
+        "MetricExpr": "cstate_core@c7\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C7_Core_Residency",
         "ScaleUnit": "100%"
     },
     {
         "BriefDescription": "C7 residency percent per package",
-        "MetricExpr": "cstate_pkg@c7\\-residency@ / TSC",
+        "MetricExpr": "cstate_pkg@c7\\-residency@ / msr@tsc@",
         "MetricGroup": "Power",
         "MetricName": "C7_Pkg_Residency",
         "ScaleUnit": "100%"
@@ -71,7 +71,6 @@
     },
     {
         "BriefDescription": "This category represents fraction of slots where no uops are being delivered due to a lack of required resources for accepting new uops in the Backend",
-        "MetricConstraint": "NO_GROUP_EVENTS_NMI",
         "MetricExpr": "1 - (tma_frontend_bound + tma_bad_speculation + tma_retiring)",
         "MetricGroup": "BvOB;TmaL1;TopdownL1;tma_L1_group",
         "MetricName": "tma_backend_bound",
@@ -296,7 +295,7 @@
     },
     {
         "BriefDescription": "Measured Average Core Frequency for unhalted processors [GHz]",
-        "MetricExpr": "tma_info_system_turbo_utilization * TSC / 1e9 / tma_info_system_time",
+        "MetricExpr": "tma_info_system_turbo_utilization * msr@tsc@ / 1e9 / tma_info_system_time",
         "MetricGroup": "Power;Summary",
         "MetricName": "tma_info_system_core_frequency"
     },
@@ -308,7 +307,7 @@
     },
     {
         "BriefDescription": "Average number of utilized CPUs",
-        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / TSC",
+        "MetricExpr": "CPU_CLK_UNHALTED.REF_TSC / msr@tsc@",
         "MetricGroup": "Summary",
         "MetricName": "tma_info_system_cpus_utilized"
     },
@@ -348,6 +347,7 @@
     },
     {
         "BriefDescription": "Average number of parallel data read requests to external memory",
+        "MetricConstraint": "NO_GROUP_EVENTS",
         "MetricExpr": "UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182@ / UNC_C_TOR_OCCUPANCY.MISS_OPCODE@filter_opc\\=0x182\\,thresh\\=1@",
         "MetricGroup": "Mem;MemoryBW;SoC",
         "MetricName": "tma_info_system_mem_parallel_reads",
-- 
2.50.0.727.gbf7dc18ff4-goog


