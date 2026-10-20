Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C960A2606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eEgZ8K3E;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HgTU9/O/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/zvKAWv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NDBcYoeE+sSJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=; b=eEgZ8K3ERNqJZ7tDJllpiy56TB
	GAw3fnY44IMg1eC40gNLL1H7zCEN4mKiktrHcRztgAxvkY95yhm68jQB8Kl5aAOeWb+lUHZ9+TFx5
	LxpeihmkwJri0jZe51WC9TQH5+/pcDxqkkd5r2eluE8PjYhIwmX8vVX6sV6J+Gz8or2JL/NDeqnuz
	2S54li5UktKLyREFXRHnXbf8Qfa3ZwhpiJMoRF161LyYq9Y/qDI7p29I8O6tfQvr7A1CxJf8SoXl6
	sRJoCLzi1ArR1VigGJqeJ/ms2tHAdiUhlITiNiOp+5Z+lYykK8sROxGg7Y8w2s812h+qRtiX8LemS
	mvfo9WoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAeu-00000009uLG-3YHk;
	Tue, 20 Oct 2026 14:17:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAeq-00000009uHY-1RFi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:17:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA57n2809827
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1NDBcYoeE+s
	SJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=; b=HgTU9/O/2Vlzvei/HDHzQCwgv79
	5GKISE2mAhdmqyBEdXw/cwFJ/VAlbLskloD/kBgGq5jDV+gD11g5m9a5HzsR1qT5
	P6E5BsSTxGg4YcTPSTxN1x8AlxoA2BQe6WlQmprZEWpxmAoBuO6Iqw6w244BbUfg
	iXefClq6N94eTp6K/Ecw9PAVlOAN5GIdDGnsp6X9H8hufHhWuBCnlNvJ3O+doQP0
	LjG+OJS1qeqFlHEaGyAbGB31cRyK4XwZXcl/7ZL4Q75aG85zuJtfKk1w45YZQa3k
	TBwFAekXSUTtAcda0VPGPPGbEWEUNYQ1JuC833XfYvi730eAayCWvMsr+nQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2v6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so674229885a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505859; x=1793110659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NDBcYoeE+sSJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=;
        b=i/zvKAWvfkfytpcLXHkfBQcMY0U/qdl8p/BdZwkhGmHVM0+TCkuoAatwHiElFgkf5o
         oO3+nrh6bSwo+mzXLmsJk9LWoPhLDxvtUeXoS7ekYkIxQz/jTW5F+z7t0Qbgu09gEcck
         /U206AZUt8c/vkVZstzHL9PJnfaRnMAlxMLVQBwQGJ20O9yGKKXDhjnvHerCmAqTKRIN
         xrOhFUFdBNDS3cI50dLt4ufhRkcwfRVwTuwa1LpyLBm29xA8ymqsxY1KleWTnlI0ylh4
         g+RKX5K8AulNeRvgQ7kTRjYW6ok3iZz5QcWAM5cr2M/Y3mnw9gmXKsmnM5BBp4BiQ576
         MHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505859; x=1793110659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NDBcYoeE+sSJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=;
        b=mPp8PsyCJ/7Wc6GwTfdSrwqJcBLq2tfScNKJjR0Cnty2OTyjB6l5qcy3L81uQ3ThfJ
         8L3SAUkyXGHIzjEJfEfGP0T0onjr+EwRtOWt+vRCq1cZrR5asF6jX9CPqDtpzbR9llj8
         QuFz+B3+QqE8RJfJGyiwt9ph402nExh/kyHILmN3m17sM/cs7iQcZ8FukGSMPoXb2+r9
         CME9awHcDS/GluUeAsMBf0qbv1MMZ7/obQESNmfRb6LqQvA8r/tJ2/jmrGXTn81Q7l7U
         kkfg/7PEt4Lh5AMOKn1yIrObpgg51OJ3bcXfNdG2WM0XosKSgO4gPnsKc9W8QWCSXKJi
         Q2Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzuQXBtPnnwdSErwqkUedZ3LZDqQP+rhE3jchH/id6oZFebl5t3OCx5PJqu3noQJNFqqIem2/7ChDV0umLNxFe5@lists.infradead.org
X-Gm-Message-State: AFq9FYLtI2gOiqgrjEZ2iVd9ub8Jpmk4ItiqKVqPM4V3H646wLAZ+0BH
	zEVu01iWOr/XvPUANbdkOYC9YX5+lSHM7SUmQ700LAE+GU5UxJ60MyVIXOnEvXkcv3yYqa5QJjj
	gfqW3bx0xqvQ+ZcqxltQjAbFaZWoGwCWD74Zj8m+F8GAXn2zMfxpF1JS3MRXgrAxchVoefAJDYK
	bDRA==
X-Gm-Gg: AYBFou2//cJeFxBmufKzvxZZEsv3g5gz4Lrbe2uqFRRdx4pX+hkmAbE7u+0tHweGXi+
	WmpdtqYpz4xDQi5nFsFQbvxbs6I32huNOekZc0+FekU9PFxeVkrsUM/8ZzPRhPO0FkWOdrHhmVf
	Y5toRwKfdv32vzfRjpDKBMwUOJg3uvXE98nPHscrfpC3u5E9yDUiLrTOsILq0eJbyyp0mp5XOe+
	WpqzFLyN6005YD8ObJkiPDcVJTO48XXE+nQ2L6F8Al5f1maiwak/w+tMN9Hj6brIOg6f8wUTv9S
	6vN1tyHGT916DS6oHf3DOqj/JPPVQnnpexRzl7npU41dJFYrE/rECU4XrSKSOk89ikQ/f+FuLzF
	K7MI1ex8OYH6DU2Wc6tOI913iKNY=
X-Received: by 2002:a05:620a:c4f:b0:93e:6c02:d181 with SMTP id af79cd13be357-93f29cefaa6mr1839543785a.14.1792505858335;
        Tue, 20 Oct 2026 07:17:38 -0700 (PDT)
X-Received: by 2002:a05:620a:c4f:b0:93e:6c02:d181 with SMTP id af79cd13be357-93f29cefaa6mr1839537185a.14.1792505857796;
        Tue, 20 Oct 2026 07:17:37 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:37 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org,
        Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v3 2/6] selftests/powercap: Add powercap hierarchy creation API tests
Date: Tue, 20 Oct 2026 16:16:52 +0200
Message-ID: <83799bf79e85e9e2ab77140e632f11d96b17a04f.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MlQFZLKvNnoBcb2YPKUkhzs-S7x9t8p8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX63EfkQiTgA+8
 a0ygE9RYkI108w/s662vDDqoDIvoYgftMgzTSL4OP4BwmpeQ5h+/qywbq1G++MB4ZFhJYqeOq/E
 buu8Gvr4yCKgFeuRgahjw0GRRtIHkDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX2SHrjjQce/db
 jCQ0JpWGjIdvtxZAo2hlHF5OyfJDGOA0corr2E9gr54nWopOJy1PJCWDDg2C+vj3HL4+iJezNQP
 t3RafUMN2VKcGNJTAjSgwkE/sKqfolUuKNqlVuRQiqzELhpxpsNMGMXlU3j2PeLdZPeRqDJas/B
 xbL5X7GwksaKi4d+DkVOPG0ZQ4foyyFeWCzkPmCHJVlT5W/6rdA5WFn0jKJp5vI899zb2S0bZmK
 h4Oeu6B4CsRUAglvkphqpqVsDcPxcBV1g5JM54aaOHHHZIqWLnYMJvF3mi56+8DgKQzXYzWHQ8R
 Ei2aZ8gRSiXtrENKDfcL8FLtMIAHzshQlwdS4cluhRpvsp9VmgLhEyp/ysPc0prlhimdpPayFOy
 yC8uW6sHL6EcNWWAA3JfoJO2pu5GP9zGQR0nS/1v8+T5wplEs2WRj4rQBujQNFkxNoI2PdA9Rfv
 3Ht2R1Wsk30G8WFKjhA==
X-Proofpoint-GUID: MlQFZLKvNnoBcb2YPKUkhzs-S7x9t8p8
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad77803 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=NQaYcpb_sPWQE13iVsoA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_071740_395305_2BB1E38D 
X-CRM114-Status: GOOD (  26.11  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The powercap hierarchy API introduces generic helpers to duplicate,
instantiate and destroy a complete powercap hierarchy from a static
description.

Add a kselftest exercising this API. The test builds a synthetic
powercap hierarchy composed of a package, three CPU clusters and twelve
CPUs, registers it as a powercap control type and checks the zone count
and selected sysfs attribute values. It also checks that the controller
directory disappears when the module is unloaded.

Exercise direct static creation, duplication, skipped clusters and their
descendants, reuse after partial destruction, and repeated creation
returning -EBUSY without replacing existing zone pointers. Callback
checks verify the controller, name and backend-private data supplied by
the helpers.

The test consists of:

* a kernel module implementing a synthetic powercap hierarchy and
  dummy callbacks;
* a userspace kselftest script that loads the module, checks 16 zones
  and their power and constraint attributes, unloads the module with an
  attribute descriptor open, and checks controller removal.

Use powercap-owned zone allocations so registration failures are cleaned
up by the core. Build generated module files in the selftest output
directory and extend the common clean target with Kbuild module cleanup.

This provides a regression test for the powercap hierarchy helpers and
their integration with the powercap core.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806110159.69690-3-daniel.lezcano@oss.qualcomm.com
Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Use TEST_GEN_FILES and MO=$(OUTPUT); preserve the common clean recipe.
- Use powercap-owned allocations for consistent registration cleanup.
- Keep validation and counting in the main shell so failures propagate.
- Add static creation, skipped branches, reuse and -EBUSY checks, and
  hold a sysfs descriptor open across module removal.
- Document the tests and describe their actual assertions.
- Fix closing-brace indentation and __initdata placement.
- Add Assisted-by attribution.

 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   3 +
 tools/testing/selftests/powercap/Makefile     |  27 ++
 .../selftests/powercap/powercap_hierarchy.c   | 305 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 126 ++++++++
 5 files changed, 462 insertions(+)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index bc4fdb6f5337..764cca6182ce 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -104,6 +104,7 @@ TARGETS += pidfd
 TARGETS += pid_namespace
 TARGETS += pipe
 TARGETS += power_supply
+TARGETS += powercap
 TARGETS += powerpc
 TARGETS += prctl
 TARGETS += proc
diff --git a/tools/testing/selftests/powercap/Kbuild b/tools/testing/selftests/powercap/Kbuild
new file mode 100644
index 000000000000..baa0d0ba9593
--- /dev/null
+++ b/tools/testing/selftests/powercap/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-m += powercap_hierarchy.o
\ No newline at end of file
diff --git a/tools/testing/selftests/powercap/Makefile b/tools/testing/selftests/powercap/Makefile
new file mode 100644
index 000000000000..5041ff1acee5
--- /dev/null
+++ b/tools/testing/selftests/powercap/Makefile
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# User-space test script
+TEST_PROGS := powercap_hierarchy.sh
+
+# Kernel module built as part of the test
+TEST_GEN_FILES := powercap_hierarchy.ko
+
+KDIR ?= $(if $(O),$(O),$(realpath ../../../..))
+
+.DEFAULT_GOAL := all
+
+include ../lib.mk
+
+.PHONY: modules
+
+$(OUTPUT)/powercap_hierarchy.ko: modules
+
+modules:
+	$(MAKE) -C $(KDIR) M=$(CURDIR) MO=$(OUTPUT) modules
+
+.PHONY: clean_modules
+
+clean: clean_modules
+
+clean_modules:
+	$(MAKE) -C $(KDIR) M=$(CURDIR) MO=$(OUTPUT) clean
diff --git a/tools/testing/selftests/powercap/powercap_hierarchy.c b/tools/testing/selftests/powercap/powercap_hierarchy.c
new file mode 100644
index 000000000000..baabd2420f9c
--- /dev/null
+++ b/tools/testing/selftests/powercap/powercap_hierarchy.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
+ *
+ * Powercap hierarchy description test module
+ *
+ * Test coverage:
+ * - Duplicate an init-only description for use after module initialization.
+ * - Create and destroy a hierarchy directly from a static initializer.
+ * - Skip a cluster and its children while creating independent branches.
+ * - Destroy the partial hierarchy and create the complete hierarchy again.
+ * - Reject repeated creation with -EBUSY and preserve existing zone pointers.
+ * - Check callback arguments and preservation of backend-private data.
+ *
+ * The complete hierarchy remains registered for powercap_hierarchy.sh to
+ * check its 16 zones and exported attribute values. Module removal destroys
+ * it so the script can check cleanup with a sysfs descriptor still open.
+ */
+#include <linux/powercap.h>
+#include <linux/string.h>
+
+struct pch_test_data {
+	int value;
+};
+
+static struct powercap_node pch_test_nodes[] __initdata = {
+	[0] = { .name = "package",
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[1] = { .name = "cluster0", .parent = &pch_test_nodes[0],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[2] = { .name = "cluster1", .parent = &pch_test_nodes[0],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[3] = { .name = "cluster2", .parent = &pch_test_nodes[0],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[4] = { .name = "cpu0", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[5] = { .name = "cpu1", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[6] = { .name = "cpu2", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[7] = { .name = "cpu3", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[8] = { .name = "cpu4", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[9] = { .name = "cpu5", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[10] = { .name = "cpu6", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[11] = { .name = "cpu7", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[12] = { .name = "cpu8", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[13] = { .name = "cpu9", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[14] = { .name = "cpu10", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[15] = { .name = "cpu11", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+};
+
+static struct powercap_hierarchy pch_test_hierarchy __initdata =
+	POWERCAP_HIERARCHY_INIT(pch_test_hierarchy, pch_test_nodes,
+				ARRAY_SIZE(pch_test_nodes));
+
+static struct powercap_hierarchy *hierarchy;
+
+static struct powercap_control_type *pct;
+
+static int pch_test_get_max_power_range_uw(struct powercap_zone *pcz,
+					   u64 *power_uw)
+{
+	*power_uw = 0xBADC0FFEE;
+	return 0;
+}
+
+static int pch_test_get_power_uw(struct powercap_zone *pcz,
+				 u64 *power_uw)
+{
+	*power_uw = 0xC0FFEE;
+	return 0;
+}
+
+static const struct powercap_zone_ops pch_test_ops = {
+	.get_max_power_range_uw = pch_test_get_max_power_range_uw,
+	.get_power_uw = pch_test_get_power_uw,
+};
+
+static int pch_test_set_power_limit_uw(struct powercap_zone *pcz,
+				       int cid, u64 power_uw)
+{
+	return 0;
+}
+
+static int pch_test_get_power_limit_uw(struct powercap_zone *pcz,
+				       int cid, u64 *power_uw)
+{
+	*power_uw = 0xDEADC0DE;
+	return 0;
+}
+
+static int pch_test_set_time_window_us(struct powercap_zone *pcz,
+				       int cid, u64 power_uw)
+{
+	return 0;
+}
+
+static int pch_test_get_time_window_us(struct powercap_zone *pcz,
+				       int cid, u64 *power_uw)
+{
+	*power_uw = 0xDEADC0DE;
+	return 0;
+}
+
+static int pch_test_get_max_power_uw(struct powercap_zone *pcz,
+				     int cid, u64 *power_uw)
+{
+	*power_uw = 0xDEADC0DE;
+	return 0;
+}
+
+static const char *pch_test_get_name(struct powercap_zone *pcz, int cid)
+{
+	return "my constraint name";
+}
+
+static const struct powercap_zone_constraint_ops pch_test_constraint_ops = {
+	.set_power_limit_uw = pch_test_set_power_limit_uw,
+	.get_power_limit_uw = pch_test_get_power_limit_uw,
+	.set_time_window_us = pch_test_set_time_window_us,
+	.get_time_window_us = pch_test_get_time_window_us,
+	.get_max_power_uw = pch_test_get_max_power_uw,
+	.get_name = pch_test_get_name,
+};
+
+static struct powercap_zone *pch_test_create(struct powercap_control_type *pct,
+					     const char *name, void *data,
+					     struct powercap_zone *parent)
+{
+	struct pch_test_data *pcht_data = data;
+	struct powercap_zone *pcz;
+
+	/* Validate the arguments and private data supplied by the helper. */
+	if (!pct) {
+		pr_err("Invalid NULL controller type\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!name) {
+		pr_err("Invalid NULL name\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (pcht_data->value != 0xDEADBEEF) {
+		pr_err("Invalid pcht data != 0xDEADBEEF");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pcz = powercap_register_zone(NULL, pct, name, parent,
+				     &pch_test_ops, 1, &pch_test_constraint_ops);
+	if (IS_ERR(pcz)) {
+		pr_err("Failed to register powercap zone '%s': %ld\n",
+		       name, PTR_ERR(pcz));
+	}
+
+	return pcz;
+}
+
+static void pch_test_destroy(struct powercap_control_type *pct,
+			     struct powercap_zone *zone,
+			     void *data)
+{
+	struct pch_test_data *pcht_data = data;
+
+	/* Destruction must receive the original private data and a valid zone. */
+	if (!pct) {
+		pr_err("Invalid NULL controller type\n");
+		return;
+	}
+
+	if (!zone) {
+		pr_err("Invalid NULL zone\n");
+		return;
+	}
+
+	if (pcht_data->value != 0xDEADBEEF) {
+		pr_err("Invalid pcht data != 0xDEADBEEF");
+		return;
+	}
+
+	powercap_unregister_zone(pct, zone);
+}
+
+static struct powercap_zone *
+pch_test_skip_cluster(struct powercap_control_type *pct, const char *name,
+		      void *data, struct powercap_zone *parent)
+{
+	if (!strcmp(name, "cluster0"))
+		return NULL;
+
+	return pch_test_create(pct, name, data, parent);
+}
+
+static int __init pch_test_init(void)
+{
+	struct powercap_zone *zones[ARRAY_SIZE(pch_test_nodes)];
+	size_t i;
+	int ret;
+
+	/* Keep a runtime copy whose parent pointers survive init memory release. */
+	hierarchy = powercap_hierarchy_dup(&pch_test_hierarchy);
+	if (IS_ERR(hierarchy)) {
+		ret = PTR_ERR(hierarchy);
+		pr_err("Failed to dup the hierarchy: %d\n", ret);
+		return ret;
+	}
+
+	pct = powercap_register_control_type(NULL, "powercap-test", NULL);
+	if (IS_ERR(pct)) {
+		ret = PTR_ERR(pct);
+		pr_err("Failed to register control type: %d\n", ret);
+		goto out_free_hierarchy;
+	}
+
+	/* Exercise direct creation with a statically initialized hierarchy lock. */
+	ret = powercap_hierarchy_create(pct, &pch_test_hierarchy,
+					pch_test_create, pch_test_destroy);
+	if (ret) {
+		pr_err("Failed to create the static hierarchy: %d\n", ret);
+		goto out_unregister_pct;
+	}
+
+	powercap_hierarchy_destroy(pct, &pch_test_hierarchy, pch_test_destroy);
+
+	/* NULL skips cluster0 and its descendants, but not the other clusters. */
+	ret = powercap_hierarchy_create(pct, hierarchy,
+					pch_test_skip_cluster, pch_test_destroy);
+	if (ret)
+		goto out_unregister_pct;
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		/* Node 1 is cluster0; nodes 4 through 7 are its four CPUs. */
+		bool skipped = i == 1 || (i >= 4 && i <= 7);
+
+		if (!!hierarchy->nodes[i].zone == skipped) {
+			pr_err("Unexpected zone state after skipping cluster0\n");
+			ret = -EINVAL;
+			goto out_destroy_hierarchy;
+		}
+	}
+
+	/* Partial destruction must leave the hierarchy reusable for a full tree. */
+	powercap_hierarchy_destroy(pct, hierarchy, pch_test_destroy);
+
+	ret = powercap_hierarchy_create(pct, hierarchy, pch_test_create, pch_test_destroy);
+	if (ret) {
+		pr_err("Failed to create the hierarchy: %d\n", ret);
+		goto out_unregister_pct;
+	}
+
+	/* A second creation must return -EBUSY without replacing any zone. */
+	for (i = 0; i < hierarchy->nr_nodes; i++)
+		zones[i] = hierarchy->nodes[i].zone;
+
+	ret = powercap_hierarchy_create(pct, hierarchy, pch_test_create, pch_test_destroy);
+	if (ret != -EBUSY) {
+		pr_err("Expected -EBUSY when recreating the hierarchy, got %d\n", ret);
+		ret = -EINVAL;
+		goto out_destroy_hierarchy;
+	}
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		if (hierarchy->nodes[i].zone != zones[i]) {
+			pr_err("Recreation changed an existing zone\n");
+			ret = -EINVAL;
+			goto out_destroy_hierarchy;
+		}
+	}
+
+	/* Leave the full tree available for the userspace sysfs checks. */
+	return 0;
+
+out_destroy_hierarchy:
+	powercap_hierarchy_destroy(pct, hierarchy, pch_test_destroy);
+out_unregister_pct:
+	powercap_unregister_control_type(pct);
+out_free_hierarchy:
+	powercap_hierarchy_free(hierarchy);
+	return ret;
+}
+module_init(pch_test_init);
+
+static void __exit pch_test_exit(void)
+{
+	/* Remove zones before their controller; the script checks disappearance. */
+	powercap_hierarchy_destroy(pct, hierarchy, pch_test_destroy);
+	powercap_hierarchy_free(hierarchy);
+	powercap_unregister_control_type(pct);
+}
+module_exit(pch_test_exit);
+
+MODULE_DESCRIPTION("Powercap hierarchy test driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Daniel Lezcano <daniel.lezcano@oss.qualcomm.com");
diff --git a/tools/testing/selftests/powercap/powercap_hierarchy.sh b/tools/testing/selftests/powercap/powercap_hierarchy.sh
new file mode 100755
index 000000000000..6d1394a7d56b
--- /dev/null
+++ b/tools/testing/selftests/powercap/powercap_hierarchy.sh
@@ -0,0 +1,126 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# Loading the module runs its in-kernel hierarchy API checks. Then validate
+# all 16 exported zones, their power readings and constraint attributes, and
+# removal of the controller while a sysfs attribute descriptor remains open.
+
+ksft_pass=0
+ksft_fail=1
+ksft_skip=4
+
+MODULE=powercap_hierarchy
+CONTROL=powercap-test
+SYSFS=/sys/devices/virtual/powercap/$CONTROL
+
+fail()
+{
+	echo "FAIL: $*"
+	exit $ksft_fail
+}
+
+skip()
+{
+	echo "SKIP: $*"
+	exit $ksft_skip
+}
+
+cleanup()
+{
+	if lsmod | grep -q "^${MODULE}\b"; then
+		if ! rmmod "$MODULE"; then
+			echo "WARNING: failed to unload $MODULE"
+		fi
+	fi
+}
+
+trap cleanup EXIT INT TERM
+
+[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+
+insmod ./powercap_hierarchy.ko || fail "failed to load module"
+
+[ -d "$SYSFS" ] || fail "missing $SYSFS"
+
+check_zone()
+{
+	zone=$1
+
+	# Check required attributes and the deterministic values from the module.
+	[ -f "$zone/name" ] || fail "$zone/name missing"
+
+	[ -f "$zone/power_uw" ] || \
+		fail "$zone/power_uw missing"
+
+	[ -f "$zone/max_power_range_uw" ] || \
+		fail "$zone/max_power_range_uw missing"
+
+	power=$(cat "$zone/power_uw")
+	[ "$power" = "12648430" ] || \
+		fail "$zone: unexpected power_uw ($power)"
+
+	max=$(cat "$zone/max_power_range_uw")
+	[ "$max" = "50159747054" ] || \
+		fail "$zone: unexpected max_power_range_uw ($max)"
+
+	constraint="$zone/constraint_0"
+
+	name=$(cat "$constraint""_name")
+	[ "$name" = "my constraint name" ] || \
+		fail "$constraint: bad constraint name"
+
+	pl=$(cat "$constraint""_power_limit_uw")
+	[ "$pl" = "3735929054" ] || \
+		fail "$constraint: bad power limit"
+
+	mp=$(cat "$constraint""_max_power_uw")
+	[ "$mp" = "3735929054" ] || \
+		fail "$constraint: bad max power"
+}
+
+zones=0
+
+namefiles=$(find "$SYSFS" -type f -name name) || fail "failed to list zones"
+
+while IFS= read -r namefile
+do
+	zone=$(dirname "$namefile")
+
+	case "$zone" in
+		*/constraint_*)
+			continue
+			;;
+	esac
+
+	check_zone "$zone"
+
+	zones=$((zones + 1))
+done <<EOF
+$namefiles
+EOF
+
+#
+# Count the number of powercap zones.
+#
+[ "$zones" -eq 16 ] || \
+	fail "expected 16 zones, got $zones"
+
+#
+# Keep an attribute open across module removal, then close it afterwards.
+#
+exec 3<"$zone/power_uw" || fail "failed to open power_uw before removal"
+cleanup
+exec 3<&-
+
+#
+# Verify that the hierarchy disappeared.
+#
+if [ -d "$SYSFS" ]; then
+	fail "$SYSFS still exists after module removal"
+fi
+
+trap - EXIT INT TERM
+
+echo "PASS"
+
+exit $ksft_pass
-- 
2.43.0


