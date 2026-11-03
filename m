Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADED606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0G7UnuMn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TuFzJHhT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6RpZaRg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A7NsQZTNCEpuI76DkH0hq9WDv34r3f+hg60tw4bENak=; b=0G7UnuMnNKxbTo
	qG+7eGiFTZCLj8D/NNqysY4yxR6gN34PkQLow/jJF7zVOaA7hcHG8HaZfoVnm72zTLQHtywVYdv6F
	9nQ8VCivyWu32hLKHPsoPq2RrM1VarO9fN1MKBAM7pjjy3XmHyLJG3gT1ghw/ORqCBcGkNO3CrsGm
	PnS9YxZdMjyOASde1OpMPToGVrAdtl3xt+5Zkf2gRYr2dXktCuv3G4V2CodiE/q3tK1tAr8jNLIQv
	6Q6cjuOz453t/AYBZl3M6Xmu68aI/TgSIC7O9vfRPrsMENqCoQ1Q+m7ctcS3i/s3HtRF2jTGnJbOy
	CQ5oJAUWaIAwoPqsWduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SL-000000015Sp-0qFl;
	Tue, 03 Nov 2026 04:49:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SI-000000015Ps-1RFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:49:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34hCg4750972
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 04:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A7NsQZTNCEp
	uI76DkH0hq9WDv34r3f+hg60tw4bENak=; b=TuFzJHhTWHxQxHA0pTM41uZOYLe
	eo5Mai/4L2Qv7ZJen1fq6gxd/Lv1rL4sIM2VqDpBtUc2HvNemGBYPH4Uc0i0oeUo
	op6wmlvKd7HlQbvxx3lAnb/6gNbueTPPTy2a99tRop3KOBO7HnEK5kp3TEYRoTyU
	vaWEtv/lCcBG55hMMnF6v9i3TYeix5fEehqLmtlPyGf40IZk1xSup+xQtCyjf/2l
	Dbdrd/tBsmZqIQ7kTRG0B0cGnE1yW85Csr3j7AHX/B8qy4ziy7Y2wbN5K1/plZdh
	+EMB0/lUwE20FJ0K7fM6idctXAIc+OLBAoEbs81PIALJHo23xCb/qsHCvtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5g0kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:49:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so890363285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681344; x=1794286144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7NsQZTNCEpuI76DkH0hq9WDv34r3f+hg60tw4bENak=;
        b=C6RpZaRg9me4yoEuTeC8YfU5FiLDBx9sKVHRQ2aZVOdv1ViqAysYP3VaQPNekrONyd
         rd0KSJeCHMEEr2e6kHqjZXvHAsSuXGSOtk4zjp97K0sbTI5kFp+t2BNyrcMb4NVmnXUw
         T84kFWJEft8nm+tVHhixi8D69agKuUbX1QIpH2DsYmOMGU9Ck4iP76JeipFHzEUR41mk
         bk4Tvzm3/cEMQn6b+fGVdKYmp4ScZYgTqs+WjdznLEtZx/B/xP5nLjqMw1Y2Gk+IOACz
         ivmR593MfHtQmK8GLfiXO6vilDoaH5PdZc8S1UyjFgzsbZoSMvAIS4jxbiKfC2vv8u5p
         Dvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681344; x=1794286144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7NsQZTNCEpuI76DkH0hq9WDv34r3f+hg60tw4bENak=;
        b=novtDz2/hP3aoeN3huaYA6E09ZVnHzdb6dZb5Uirz0RGKhx0HfnXnyge0x3rwQszGx
         gYPAe9qm8mrHO97pS5S2WdtRE4RNh9QKq6X+HuP9dbBiPPTonwgyrMpVUuwbziafPCgZ
         kf0rVC7C/rouft9Hj7V3nWhwMzm+KB1WZkasPXAMAiTtZL9ubWcdj+YQ5txI6LmIivDY
         0Fk2cqwLNGSjvTds6i+HRL3ZltEyCiEvlIJprYnfe6jQQ2FB9aca4QhdMwdL6p/ltEOR
         N0clwU1rAsZXUw4K1bTWWQONtIyE+Qe/Q6sqJgYFMw2C8rJnHWswJB+FMbACkQ0+A1BH
         93wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrGjeWc2EcBGPZGGwlwEKRoFhDxNIlfp+RaCcJE0B2Dxx2NkC5hiaOIF7AvcJFtyyCmV+s/Idsp2FizlKY3mYB@lists.infradead.org
X-Gm-Message-State: APuU4Z/67HmEQvYADQtXhZk5xNYnIvSJ0reCK4JsOuoqaJlMul8Ljkuf
	KI3xEd3LLtb3EIU2iADsu4Op/5bFGoBVPLOsZm2J5sOT4wPpy4JXyKwj7Y6TVm7s7+pXDdzmc8v
	aouXGoU5akLNCzSbhyjeQQ6+Dx9LfdTDvCJFvD8jO22HbwzL1/X6cTxp3w3fqkSax56zsc35mMY
	JJBw==
X-Gm-Gg: AYBFou2WoIYfepUoiGg9anmTgslAhZeCvkJ6MA7fkoaAHdwcONlB2i95HB7HIAYluu1
	CCmL//W1/6Gzi1jVvbkvBDZkIhct9O1cAsoOSAdiYG804+s9iWsw+CmATU9VPuyJAznxabtcCxV
	d6DtsTW8BfqvIKQ/zM620zaAAJErZ3YqQ0bOtyXkABmqJcOF8dXtf0pENkteMZHzNaA15KW51AS
	ah5zNZmL5fv3DS+6RvQdlHUQfEGsVZcJnlB+s4FuxHML9xjcRPoOPUG+skbGmZzhgcviNYYMtN9
	PFH65eNo8KXwUNNgS3dwJAKgZN15G+LIxU6ctHQVxTkAobgPfLwiIocE4MA4ounCUluWCnVM3PS
	aiPr9pHZAFwgt5KFaCQO0Hkde/GWD6NnQuypyS2dHYu6GOQf3nII9g40VVlZ7IDagW2s5zfvozt
	G5
X-Received: by 2002:a05:620a:28c7:b0:93c:720c:94e0 with SMTP id af79cd13be357-94421736bc4mr1947324385a.30.1793681344197;
        Mon, 02 Nov 2026 20:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:93c:720c:94e0 with SMTP id af79cd13be357-94421736bc4mr1947321685a.30.1793681343579;
        Mon, 02 Nov 2026 20:49:03 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:02 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 2/6] selftests/powercap: Add powercap hierarchy creation API tests
Date: Tue,  3 Nov 2026 05:48:16 +0100
Message-ID: <f2f968446f02795e4e35baae53d89ad981dbd042.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k5Y91SAKfsdXjUbJiXzIuqkFxN-ChI41
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX6rBS1Dl7O8kx
 tC+u6NvyljNqC/axLQiDrcw1z1jrSTdzJnVyvXZ/ql7SdMv/Y2AbZlQoML2QahI0gi+hUVl1eHv
 EPnZ7Sw9LUilKk/3NbhBZy6pLglPKz0=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae967c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=HObOqzEOzm0AAkIsdZgA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: k5Y91SAKfsdXjUbJiXzIuqkFxN-ChI41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX6v7I0glYs3P/
 8o3MuepAL5QChfyQO0Df8OgjOLhA+pDM+EV7nPpFJhf76jAtDsq/+hyhz+5s6Xsto54M/29fBiq
 kl5R+DYOBD6M7XDd1GObImoVvGXgmiuEgItukNSkGBXa+GZyCM7/0ZQlIGekhtl3hcaIuT8REvs
 juY99lqlEilv6HlyGLPEQ7di3zpOndjklVMH48xgu2yzXMnx3qYddMaO0ZZ1nPhsAld4rCDyKu6
 IYg0+k2lIx637JXOayykzj4q0Ej9r2NTNMurueiQUWzHltpJWhBnD00cIm34PYjj4Rzuhj0ttaW
 MAG9+Ei21szentZ+8XYHAkbSeTl5zLp1lrI3u8Ueu5APwlK+QrZ7NQBieYju8iV3eJyAcSmE0Ml
 M6tZ+o4vw3e3k0ByOU0kNoliD28NU9HgSLksLrkc7V5JDdUDeVykGmRLlWTC7T86Tl7bXoTMWlf
 EI9BS6PK5JTltLKl4Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204906_513366_68B30D80 
X-CRM114-Status: GOOD (  29.32  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Provide a config fragment for powercap and module support. Skip module
builds when the configuration prerequisites or Module.symvers are
missing, and skip runtime checks when powercap or the test module is
unavailable. Resolve inherited kernel output paths before invoking
Kbuild so cleanup also works with a relative O= argument.

Keep the statically initialized mutex in permanent module data so its
lockdep key survives initialization. Use a separate init-only hierarchy
description to exercise duplication and release the original node array.

This provides a regression test for the powercap hierarchy helpers and
their integration with the powercap core.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806110159.69690-3-daniel.lezcano@oss.qualcomm.com
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v5 (since v4):
- No changes.

Changes in v4 (since v3):
- Rebase on v7.3 and address the issues reported by Sashiko.
- Add a config fragment requesting powercap, modules and module unloading;
  guard the Kbuild module target with CONFIG_POWERCAP.
- Skip module builds when configuration prerequisites or Module.symvers
  are missing, avoiding unresolved-symbol failures during modpost.
- Resolve inherited output paths and pass absolute O=, KBUILD_OUTPUT and
  module-output paths to Kbuild, including during relative-O= cleanup.
- Keep the static mutex in permanent module data so its lockdep key
  survives init-memory reclamation; duplicate a separate init-only
  hierarchy description.
- Return KSFT_SKIP when powercap sysfs support or the module is absent.
- Update the commit description to explain these fixes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Use TEST_GEN_FILES and MO=$(OUTPUT); preserve the common clean recipe.
- Use powercap-owned allocations for consistent registration cleanup.
- Keep validation and counting in the main shell so failures propagate.
- Add static creation, skipped branches, reuse and -EBUSY checks, and
  hold a sysfs descriptor open across module removal.
- Document the tests and describe their actual assertions.
- Fix closing-brace indentation and __initdata placement.

 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   5 +
 tools/testing/selftests/powercap/Makefile     |  46 +++
 tools/testing/selftests/powercap/config       |   3 +
 .../selftests/powercap/powercap_hierarchy.c   | 314 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 128 +++++++
 6 files changed, 497 insertions(+)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/config
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
index 000000000000..9300e779db0d
--- /dev/null
+++ b/tools/testing/selftests/powercap/Kbuild
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifeq ($(CONFIG_POWERCAP),y)
+obj-m += powercap_hierarchy.o
+endif
diff --git a/tools/testing/selftests/powercap/Makefile b/tools/testing/selftests/powercap/Makefile
new file mode 100644
index 000000000000..39d9ec73ba74
--- /dev/null
+++ b/tools/testing/selftests/powercap/Makefile
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# User-space test script
+TEST_PROGS := powercap_hierarchy.sh
+
+KERNEL_SRC := $(realpath ../../../..)
+KERNEL_OUTPUT := $(or $(O),$(KBUILD_OUTPUT))
+# The selftests parent exports BUILD as <absolute kernel output>/kselftest.
+# Use it when clean inherits a relative O= through MAKEFLAGS.
+KDIR ?= $(if $(KERNEL_OUTPUT),$(if $(BUILD),$(BUILD)/..,$(if $(filter /%,$(KERNEL_OUTPUT)),$(KERNEL_OUTPUT),$(KERNEL_SRC)/$(KERNEL_OUTPUT))),$(KERNEL_SRC))
+KERNEL_BUILD := $(abspath $(KDIR))
+
+-include $(KERNEL_BUILD)/include/config/auto.conf
+
+ifeq ($(CONFIG_POWERCAP)$(CONFIG_MODULES)$(CONFIG_MODULE_UNLOAD),yyy)
+ifneq ($(wildcard $(KERNEL_BUILD)/Module.symvers),)
+TEST_GEN_FILES := powercap_hierarchy.ko
+endif
+endif
+
+.DEFAULT_GOAL := all
+
+include ../lib.mk
+
+ifeq ($(TEST_GEN_FILES),)
+all:
+	@echo "SKIP: powercap module needs CONFIG_POWERCAP, CONFIG_MODULES, CONFIG_MODULE_UNLOAD and a full kernel build"
+endif
+
+.PHONY: modules
+
+$(OUTPUT)/powercap_hierarchy.ko: modules
+
+modules:
+	$(MAKE) -C $(KERNEL_BUILD) O=$(KERNEL_BUILD) KBUILD_OUTPUT=$(KERNEL_BUILD) \
+		M=$(CURDIR) MO=$(abspath $(OUTPUT)) modules
+
+.PHONY: clean_modules
+
+clean: clean_modules
+
+clean_modules:
+	@if [ -f "$(KERNEL_BUILD)/Makefile" ] && [ -d "$(OUTPUT)" ]; then \
+		$(MAKE) -C $(KERNEL_BUILD) O=$(KERNEL_BUILD) KBUILD_OUTPUT=$(KERNEL_BUILD) \
+			M=$(CURDIR) MO=$(abspath $(OUTPUT)) clean; \
+	fi
diff --git a/tools/testing/selftests/powercap/config b/tools/testing/selftests/powercap/config
new file mode 100644
index 000000000000..76ae5bcb1dde
--- /dev/null
+++ b/tools/testing/selftests/powercap/config
@@ -0,0 +1,3 @@
+CONFIG_POWERCAP=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
diff --git a/tools/testing/selftests/powercap/powercap_hierarchy.c b/tools/testing/selftests/powercap/powercap_hierarchy.c
new file mode 100644
index 000000000000..e43d510d5426
--- /dev/null
+++ b/tools/testing/selftests/powercap/powercap_hierarchy.c
@@ -0,0 +1,314 @@
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
+static struct powercap_hierarchy pch_test_description __initdata = {
+	.nodes = pch_test_nodes,
+	.nr_nodes = ARRAY_SIZE(pch_test_nodes),
+};
+
+/* A static mutex's lockdep key must outlive the module's init sections. */
+static struct powercap_hierarchy pch_test_hierarchy =
+	POWERCAP_HIERARCHY_INIT(pch_test_hierarchy, NULL, 0);
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
+	hierarchy = powercap_hierarchy_dup(&pch_test_description);
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
+	pch_test_hierarchy.nodes = pch_test_nodes;
+	pch_test_hierarchy.nr_nodes = ARRAY_SIZE(pch_test_nodes);
+	ret = powercap_hierarchy_create(pct, &pch_test_hierarchy,
+					pch_test_create, pch_test_destroy);
+	if (ret) {
+		pr_err("Failed to create the static hierarchy: %d\n", ret);
+		goto out_unregister_pct;
+	}
+
+	powercap_hierarchy_destroy(pct, &pch_test_hierarchy, pch_test_destroy);
+	pch_test_hierarchy.nodes = NULL;
+	pch_test_hierarchy.nr_nodes = 0;
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
index 000000000000..9a81d9afc010
--- /dev/null
+++ b/tools/testing/selftests/powercap/powercap_hierarchy.sh
@@ -0,0 +1,128 @@
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
+[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+[ -d /sys/class/powercap ] || skip "powercap is not available in the running kernel"
+[ -f ./powercap_hierarchy.ko ] || skip "powercap_hierarchy.ko is not available"
+
+trap cleanup EXIT INT TERM
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


