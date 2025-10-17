Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA97CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/iro+U2QfFRVr5oW7CIZ7z4yj7nBXig+htQAjDDowQ=; b=uw+AHzpyVk5i/roaiO1tOXP7ep
	abtARVpxFUB0t+jp3Gtl5Q18Ilpc4Vl7NBa4hruwpJ6ikLxEZ0Ej1JC+dJalfvupkDf9Tr9LHnLWy
	ZdOS8Mh365krHkS+a5awcVB8yqV0D2HCZsUONGwhJeabuyrw899ens4/+W0dw8l2/sDs9jNJ6K67t
	8XB6UQIzcqOT2BsUeeXet4+W18o5x9h6oRk9Cm/h8vot0fsjnAm3KADvK4sLo97LIf3+eiGpyQWej
	ODylx9Af4SxvW9jdeM/IppESt7aI1yoRVUhUhZiFECqUJ+k69Ae+2m+M3KaloJNlPisdIoV8BiIBI
	0+QzcFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjV-00000008KIs-1lHE;
	Fri, 17 Oct 2025 15:51:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjT-00000008KID-3XTT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=P/iro+U2QfFRVr5oW7CIZ7z4yj7nBXig+htQAjDDowQ=; b=Xvhb05ADGPTS5mnb+mDh1DVinx
	ZXwiNjlL1283CWcdnxOAeoQyqzaxsznmrRcDiqJ9b0Zcl/AkHGgh6HG8i8TQb/+m00jKeyQM5O+R1
	eCj3SYC1ySxJeYOgM1PPoPoXsPiTNY2KkuZwMiEuMivsf6p/Kz4Bz00xioLge2V3lrsp3Hdu13jaM
	Bi32WzI05a0wzl1nEsdtB8ru8bENvYNoXIndxiKb58meQkgiGf/OR0kXBLoJaSoiynh/ZFlysEgen
	a5YNQnw9P8/oMD2XYDG1LA9kTvBh619Y8Wj7zUTCsGEW5ZtbXasKtR4PoNi3KYGAmHCe1kxsslHZ0
	4g0TpF2A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjP-00000007heE-3RXT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A894143B1B;
	Fri, 17 Oct 2025 15:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07858C4CEE7;
	Fri, 17 Oct 2025 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760716261;
	bh=IVZQed3/DAayxNBT4rjDjAdYm41Vk07Fwb0HkKjvB5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWIrW8KS6exAIcncJKZTz6fpxD/dCklP3xK6yyPmQ7nyFOjJLiFjqE4dwxLAJRsSL
	 oqEoUXK3d1FnDdwQzm7Zfttzybh/ZTO3p6S+v2dp4a5r9q/NLCvreqSW9h+pyP2fQN
	 GZszWx+hczUelyAsZZSMeZu15uk9n74w2XhI/JiU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	German Gomez <german.gomez@arm.com>,
	Leo Yan <leo.yan@linaro.org>,
	Ali Saidi <alisaidi@amazon.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.garry@huawei.com>,
	Kajol Jain <kjain@linux.ibm.com>,
	Like Xu <likexu@tencent.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 129/276] perf arm-spe: Use SPE data source for neoverse cores
Date: Fri, 17 Oct 2025 16:53:42 +0200
Message-ID: <20251017145147.189898172@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145142.382145055@linuxfoundation.org>
References: <20251017145142.382145055@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165104_847281_B872B94F 
X-CRM114-Status: GOOD (  27.15  )
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Ali Saidi <alisaidi@amazon.com>

[ Upstream commit 4e6430cbb1a9f1dc0a698f93026b6178da437798 ]

When synthesizing data from SPE, augment the type with source information
for Arm Neoverse cores. The field is IMPLDEF but the Neoverse cores all use
the same encoding. I can't find encoding information for any other SPE
implementations to unify their choices with Arm's thus that is left for
future work.

This change populates the mem_lvl_num for Neoverse cores as well as the
deprecated mem_lvl namespace.

Reviewed-by: German Gomez <german.gomez@arm.com>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Ali Saidi <alisaidi@amazon.com>
Tested-by: Leo Yan <leo.yan@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.garry@huawei.com>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Like Xu <likexu@tencent.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Timothy Hayes <timothy.hayes@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20220811062451.435810-4-leo.yan@linaro.org
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: 039fd0634a06 ("perf arm_spe: Correct setting remote access")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../util/arm-spe-decoder/arm-spe-decoder.c    |   1 +
 .../util/arm-spe-decoder/arm-spe-decoder.h    |  12 ++
 tools/perf/util/arm-spe.c                     | 130 +++++++++++++++---
 3 files changed, 127 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 3fc528c9270c2..3e36934477154 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -218,6 +218,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 
 			break;
 		case ARM_SPE_DATA_SOURCE:
+			decoder->record.source = payload;
 			break;
 		case ARM_SPE_BAD:
 			break;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 46a8556a9e956..c3943eb95e305 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -29,6 +29,17 @@ enum arm_spe_op_type {
 	ARM_SPE_ST		= 1 << 1,
 };
 
+enum arm_spe_neoverse_data_source {
+	ARM_SPE_NV_L1D		 = 0x0,
+	ARM_SPE_NV_L2		 = 0x8,
+	ARM_SPE_NV_PEER_CORE	 = 0x9,
+	ARM_SPE_NV_LOCAL_CLUSTER = 0xa,
+	ARM_SPE_NV_SYS_CACHE	 = 0xb,
+	ARM_SPE_NV_PEER_CLUSTER	 = 0xc,
+	ARM_SPE_NV_REMOTE	 = 0xd,
+	ARM_SPE_NV_DRAM		 = 0xe,
+};
+
 struct arm_spe_record {
 	enum arm_spe_sample_type type;
 	int err;
@@ -39,6 +50,7 @@ struct arm_spe_record {
 	u64 virt_addr;
 	u64 phys_addr;
 	u64 context_id;
+	u16 source;
 };
 
 struct arm_spe_insn;
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 569e1b8ad0abc..7b16898af4e7f 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -34,6 +34,7 @@
 #include "arm-spe-decoder/arm-spe-decoder.h"
 #include "arm-spe-decoder/arm-spe-pkt-decoder.h"
 
+#include "../../arch/arm64/include/asm/cputype.h"
 #define MAX_TIMESTAMP (~0ULL)
 
 struct arm_spe {
@@ -45,6 +46,7 @@ struct arm_spe {
 	struct perf_session		*session;
 	struct machine			*machine;
 	u32				pmu_type;
+	u64				midr;
 
 	struct perf_tsc_conversion	tc;
 
@@ -312,35 +314,128 @@ static int arm_spe__synth_branch_sample(struct arm_spe_queue *speq,
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
 
-static u64 arm_spe__synth_data_source(const struct arm_spe_record *record)
+static const struct midr_range neoverse_spe[] = {
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+	{},
+};
+
+static void arm_spe__synth_data_source_neoverse(const struct arm_spe_record *record,
+						union perf_mem_data_src *data_src)
 {
-	union perf_mem_data_src	data_src = { 0 };
+	/*
+	 * Even though four levels of cache hierarchy are possible, no known
+	 * production Neoverse systems currently include more than three levels
+	 * so for the time being we assume three exist. If a production system
+	 * is built with four the this function would have to be changed to
+	 * detect the number of levels for reporting.
+	 */
 
-	if (record->op == ARM_SPE_LD)
-		data_src.mem_op = PERF_MEM_OP_LOAD;
-	else if (record->op == ARM_SPE_ST)
-		data_src.mem_op = PERF_MEM_OP_STORE;
-	else
-		return 0;
+	/*
+	 * We have no data on the hit level or data source for stores in the
+	 * Neoverse SPE records.
+	 */
+	if (record->op & ARM_SPE_ST) {
+		data_src->mem_lvl = PERF_MEM_LVL_NA;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
+		data_src->mem_snoop = PERF_MEM_SNOOP_NA;
+		return;
+	}
+
+	switch (record->source) {
+	case ARM_SPE_NV_L1D:
+		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
+		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+		break;
+	case ARM_SPE_NV_L2:
+		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
+		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+		break;
+	case ARM_SPE_NV_PEER_CORE:
+		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
+		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
+		break;
+	/*
+	 * We don't know if this is L1, L2 but we do know it was a cache-2-cache
+	 * transfer, so set SNOOPX_PEER
+	 */
+	case ARM_SPE_NV_LOCAL_CLUSTER:
+	case ARM_SPE_NV_PEER_CLUSTER:
+		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
+		break;
+	/*
+	 * System cache is assumed to be L3
+	 */
+	case ARM_SPE_NV_SYS_CACHE:
+		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+		data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
+		break;
+	/*
+	 * We don't know what level it hit in, except it came from the other
+	 * socket
+	 */
+	case ARM_SPE_NV_REMOTE:
+		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
+		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
+		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
+		break;
+	case ARM_SPE_NV_DRAM:
+		data_src->mem_lvl = PERF_MEM_LVL_LOC_RAM | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_RAM;
+		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+		break;
+	default:
+		break;
+	}
+}
 
+static void arm_spe__synth_data_source_generic(const struct arm_spe_record *record,
+					       union perf_mem_data_src *data_src)
+{
 	if (record->type & (ARM_SPE_LLC_ACCESS | ARM_SPE_LLC_MISS)) {
-		data_src.mem_lvl = PERF_MEM_LVL_L3;
+		data_src->mem_lvl = PERF_MEM_LVL_L3;
 
 		if (record->type & ARM_SPE_LLC_MISS)
-			data_src.mem_lvl |= PERF_MEM_LVL_MISS;
+			data_src->mem_lvl |= PERF_MEM_LVL_MISS;
 		else
-			data_src.mem_lvl |= PERF_MEM_LVL_HIT;
+			data_src->mem_lvl |= PERF_MEM_LVL_HIT;
 	} else if (record->type & (ARM_SPE_L1D_ACCESS | ARM_SPE_L1D_MISS)) {
-		data_src.mem_lvl = PERF_MEM_LVL_L1;
+		data_src->mem_lvl = PERF_MEM_LVL_L1;
 
 		if (record->type & ARM_SPE_L1D_MISS)
-			data_src.mem_lvl |= PERF_MEM_LVL_MISS;
+			data_src->mem_lvl |= PERF_MEM_LVL_MISS;
 		else
-			data_src.mem_lvl |= PERF_MEM_LVL_HIT;
+			data_src->mem_lvl |= PERF_MEM_LVL_HIT;
 	}
 
 	if (record->type & ARM_SPE_REMOTE_ACCESS)
-		data_src.mem_lvl |= PERF_MEM_LVL_REM_CCE1;
+		data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
+}
+
+static u64 arm_spe__synth_data_source(const struct arm_spe_record *record, u64 midr)
+{
+	union perf_mem_data_src	data_src = { 0 };
+	bool is_neoverse = is_midr_in_range(midr, neoverse_spe);
+
+	if (record->op == ARM_SPE_LD)
+		data_src.mem_op = PERF_MEM_OP_LOAD;
+	else if (record->op == ARM_SPE_ST)
+		data_src.mem_op = PERF_MEM_OP_STORE;
+	else
+		return 0;
+
+	if (is_neoverse)
+		arm_spe__synth_data_source_neoverse(record, &data_src);
+	else
+		arm_spe__synth_data_source_generic(record, &data_src);
 
 	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
 		data_src.mem_dtlb = PERF_MEM_TLB_WK;
@@ -361,7 +456,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 	u64 data_src;
 	int err;
 
-	data_src = arm_spe__synth_data_source(record);
+	data_src = arm_spe__synth_data_source(record, spe->midr);
 
 	if (spe->sample_flc) {
 		if (record->type & ARM_SPE_L1D_MISS) {
@@ -1047,6 +1142,8 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
 	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
 	size_t min_sz = sizeof(u64) * ARM_SPE_AUXTRACE_PRIV_MAX;
 	struct perf_record_time_conv *tc = &session->time_conv;
+	const char *cpuid = perf_env__cpuid(session->evlist->env);
+	u64 midr = strtol(cpuid, NULL, 16);
 	struct arm_spe *spe;
 	int err;
 
@@ -1066,6 +1163,7 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
 	spe->machine = &session->machines.host; /* No kvm support */
 	spe->auxtrace_type = auxtrace_info->type;
 	spe->pmu_type = auxtrace_info->priv[ARM_SPE_PMU_TYPE];
+	spe->midr = midr;
 
 	spe->timeless_decoding = arm_spe__is_timeless_decoding(spe);
 
-- 
2.51.0




