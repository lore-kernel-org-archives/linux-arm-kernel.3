Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HWIEsvkO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UievcfT0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KV94vrDC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvuaWsfIyW/E=; b=HWIEsvkOyJCKgDrfbhdcDDgplS
	s0tt/z4ojwjXcNCHZAxsXcexiEPhcVQ0I79Fh40awN2Gcl1xwE6H6v4Su/lUc5ZgjbfCJ3Gn4H2Cj
	djuIRRfoOXm+K1SyvtcBe3xP/Yc5Bqdr92k+TW5uXkWAojDf89tKUhFsotoZlFRGUfykqsEWrzr07
	5FPqNev4Wq2KTPbkWu4wZ2TDkHVGB0pagnqhFrvdSsIhkV/EJKy7JHJccv9hImmTo/uI5tuFyHCEg
	vsWEJ6+rG5lc+a8pNUQOH4fYEDiPKjYxwSRIPZkZIMIMhczd+II/UAEMvN4FzLUkW3DTpLM09dKY2
	7wbNUGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRS-00000009tDL-48Tg;
	Thu, 29 Oct 2026 16:57:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRP-00000009tAt-3pj1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxYV3872933
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvua
	WsfIyW/E=; b=UievcfT0DQjO8FjvbPe1RKj08QapsD968FpQwzYlqJWV2/9ukGQ
	6vBzNSNLqJ9silL0CZCw4DCLWZAFiYyrJ0Pdo1RBZ5YFOHhLp452A6iK8Y2cAJ1z
	IkttFda9ZoOZQ5UTgviDWsDh6Xp+oe4VeygexGWCPgXsCQ1C3JClyl/oTRfZ9DbB
	U675GynJLwRTHqzoxb1Gsf4agGAOgK8OgceVtl6qmoGyAfZTgaq0TuSVKd7cR0aS
	uuPuEflWE5oHqycrzJzHZBytenUX1Snd6ZowrihMZEWLkYUBbzBzvwLITVqE4dgN
	UXb0M77CadJJV2DvRIfqW2ec0x0l/m2HenQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7620yv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99076c676cbso537697241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293046; x=1793897846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvuaWsfIyW/E=;
        b=KV94vrDC1J5yRfJWsz0d6vk/OmwfsfHwOucFcEvgpCR3nx3w1SbccEnjO1bwoKGiTR
         0PNi2l86rDwrX0MygU01i+tUkoPfXfaBssrH7FsrPkpbdAbPhJmJkjK3pB/iSz5Sizpq
         RBkDHC7FCGxLAVLsK+4nM16s6qrxSCPm23ugT+9+txXvxuVvESLfU23f3vIRlUQIuSN3
         SkQgDPuXHVO3y2603n8k8prssMcxTiRmPUKH1IL2AIoC7krnClqng7XMmKDHSLt7QWOv
         +XUua3lLWDRWaQ4qbiXCuWdhJA2Ki0/HThQl7euvSiQbE/seFVfTOMbzj31qrPDLXkke
         KLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293046; x=1793897846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me5c7m/qzPaBItKrxG31JKNm+LqR9airvuaWsfIyW/E=;
        b=vek4VnEfDv6+x76SPKnwVZrGgZG+9KPDcBAO9ldn14Ke6lr2yEsn5baN9rPVuFh3lT
         n78yPu4Hzi3RT6gYvxFTdwGIoNBEELy97i6qBHluw19x43E4MbjPnErvOkRZUzkDCE8J
         ZNJ2VY/LNgMkLoOEfY8zj1t/RfEHqXCKiIllK2MYgz5H7YYi+yPWCT7z0e2QNdz21ZAx
         ms79kWxqDjMbH5tCfZuvuKS+MUOdadANSErZ8FuHIYRLuHbE7C48STZ/bMiJCvvg9Pex
         r2X1JnFCs+4U0xLRFLs5SgAWmNHlVPbbwQdu4Cn4xZ240nyyPfq+jkZnY13hunePfzas
         X/Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxWJKkV9XyI4s95dfwz7ahuB/oPSdoUXby0tvfG5ZG7T5+S7BpYE1MTGCdtdsgKWTecEaQkcc5YkxQ5F/P1r3EF@lists.infradead.org
X-Gm-Message-State: AFq9FYKrAwpNa8wYQ8MthJ7koThAf6BgohghIoFedudjgs+GFCW8RYRE
	1NhB1OJ/pxUP81SPgJBF3bruDaZjoRYymC0r+cwy83l92p7RpOAUXgm8OuVkFjWvQUIjnyb0oYi
	eCaahEEfcKeoMZvW0Hm14cPCZ0XTNzDW7NbXKNrQEIFrtKvbaKyAVBKBm5Q104WP2NBRGMOxMbm
	8+gR/rpueKJQ==
X-Gm-Gg: AYBFou2UEO87CQtAPWf2sO75r1R0ytorcWrzq6cznkIXPxC2G4UQoPq5yDrcS80rt8u
	n1MvhjFK5rlC3sWGzIJFWL+gzuNGmSsdWKNeHQm4SvSAgK3HH8LuhkBs/dXMEC+2/uHJfUXPKxM
	LJd995QP2Ccbpo4O/1n1j1Um0JqoGBVGnSY6AtN9CZYptDiS+qYGnUxyrMundmpKU/xQxLE2Mic
	YNYX0oMdXgmY3nNCMbR5wlw+zfN8ddbyxjCO/q71xJKq21gR9Wvf0Qy1zsb9s3pr3bdtbDyMnfT
	KsUqvrllfyxpMH0a2RWPcjx1M+mVLeWqTyZ+SbMJ2JMpoTr2zGgyAqDDU4ckPJyzcZHJGxLlGVD
	E0dLK6n2oNacrp4LGl66jQdTa5YPv0IPJpSPRY5zf3TAksGo8/W2lr9OH0og1CE5rtYFCY6e5Pz
	Ng
X-Received: by 2002:a05:6102:5698:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7d03a5b4865mr2521762137.26.1793293045849;
        Thu, 29 Oct 2026 09:57:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5698:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7d03a5b4865mr2521743137.26.1793293045283;
        Thu, 29 Oct 2026 09:57:25 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 0/6] powercap: Add generic hierarchy support and convert DTPM
Date: Thu, 29 Oct 2026 17:56:44 +0100
Message-ID: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -8576lHJHVeeLpSSGBp2fUJIrMpO3N93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX3FWBkp3aIDZi
 x1EddfbRW3KtNwftW0zNrR48uXHbSAelNeoT01eAWRGoB0A5nH646V+s3PLxptd+jg5g7oeAG5i
 qmkY/rV+o0SgvDjt3ccNk2ThXfvWILv9f2kc4+gAQ6FLDWyal1M+0qZ5IcYt2pyb0zLpLH/eLkc
 PFQ8LmIos/wlrYRlf3BFleuM0OBZ+YqK/s0+OB3okIO/JHK3zYQ8TM+r7sIYmzjIPWaMl7TmQyK
 tuA3YOOyzpxni+lxzOSUBsL5q4MXJHFHjE32tW+pz8mNm51j/+i4WbOWVgqYiVJr+C5yY1RFvj+
 koXOKTA9G/rCLEOdpPbbzsGVbNl59TMa4HQDDGabxd+tgXvMFO83EOLeu3HEuOmRAc27Aa0GvT8
 3pmy4jIfuQFjv1pjMDgC3qd0ztceFzngynrHJw3rjJIKnMmk0X+orFYIfkk+2r1xhA2wD1bu0pQ
 fCJGydnpuVAlxI549mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX0O2qUEc1q4mF
 8ocmW6AkHQuS5iDglM9APSBnx6IoGxaf4AhT7xtrSCFdARddcoywku5VC9G4BcqpHW1X3hHYuom
 5lnH9rt6gmWoowbDjQm1QJkcTyTyQyM=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae37af7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6LeHEQr_I3XcUWd-WmkA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: -8576lHJHVeeLpSSGBp2fUJIrMpO3N93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095728_286037_7CE20125 
X-CRM114-Status: GOOD (  21.56  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Powercap controllers may expose trees of power zones, such as packages,
clusters and CPUs. This series adds generic helpers to duplicate a static
hierarchy description, create its zones through backend callbacks, and
destroy them in reverse order. Parents must precede their children in the
node array; the helpers validate that ordering rather than sorting nodes.

Drivers supporting multiple platforms can place each platform's hierarchy
description and node array in initdata. powercap_hierarchy_dup() creates a
working copy of the selected hierarchy and rebases its parent pointers.
All original descriptions, including those for unused platforms, can then
be reclaimed automatically with init memory. Names and backend-private
data are not duplicated and must remain valid for the working hierarchy.

The controller supplies creation and destruction callbacks to connect the
generic hierarchy traversal to its backend. The creation callback receives
the control type, node name, private data and parent zone, registers the
zone with its operations and constraints, and returns it to the helper.
The destruction callback unregisters it during rollback or teardown.

The API supports both fatal creation errors, which roll back previously
created zones, and optional nodes: a NULL callback result skips a node and
its descendants while allowing independent branches to be created.

The helpers were motivated by the SPEL work and also let DTPM share the
same hierarchy infrastructure:
https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/

A kselftest exercises static and duplicated hierarchies, skipped branches,
reuse after partial destruction, and rejection of repeated creation. Its
userspace script checks the 16 exported zones and selected attribute
values, then removes the module with a sysfs attribute descriptor open.

DTPM is converted to the generic helpers while preserving best-effort
creation when individual backends are unavailable. The CPU backend finds
an online sibling when a hierarchy's representative CPU is offline.
Entirely offline policies remain unavailable during initialization.

The RK3399 description is reduced to one CPU entry per cpufreq policy.
The old backend already suppressed duplicate registration; the extra
entries were redundant descriptions, not additional registered zones.
Finally, a shared Rockchip virtual descriptor and an RK3588 CPU hierarchy
are added. RK3588's three frequency domains are represented by cpu@0,
cpu@400 and cpu@600 below a virtual package node; no GPU zone is added
for RK3588 in this series.

Changes in v4 (since v3):
- Rebase on v7.3.
- Address the selftest issues reported by Sashiko:
  - Add a kselftest config fragment requesting CONFIG_POWERCAP,
    CONFIG_MODULES and CONFIG_MODULE_UNLOAD, guard the module build with
    CONFIG_POWERCAP, and skip building when prerequisites or Module.symvers
    are missing instead of failing at modpost.
  - Resolve the kernel output directory and pass absolute O=,
    KBUILD_OUTPUT and module-output paths to Kbuild so cleanup works when
    a relative O= is inherited from the parent selftest make invocation.
  - Keep the statically initialized mutex in permanent module data so its
    lockdep key does not point into freed module init memory. Retain a
    separate init-only description for the hierarchy duplication test.
  - Return KSFT_SKIP when powercap sysfs support or the test module is
    unavailable, while retaining failures for actual module-load errors.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Add POWERCAP_HIERARCHY_INIT() and document static versus duplicated
  hierarchy ownership and lock initialization.
- Explain how duplication retains the selected platform hierarchy while
  init memory containing the original descriptions is reclaimed, and
  describe the controller callbacks and their arguments.
- Reject populated hierarchies with -EBUSY before invoking callbacks.
- Validate names and parent ordering before zone creation, including for
  static hierarchies; document the accepted hierarchy structure.
- Use explicit mutex locking, a signed reverse-loop index, and the clearer
  powercap_node.zone member name.
- Define NULL creation results as skipped branches and retain rollback for
  error pointers, preserving DTPM's best-effort behavior.
- Handle offline CPU representatives through an online policy sibling
  while holding the CPU hotplug read lock.
- Fix selftest output-directory handling and module cleanup, use
  powercap-owned zone allocations, and keep shell validation/counting in
  the main shell so failures propagate.
- Extend and document selftest coverage for static creation, skipped
  branches, hierarchy reuse, -EBUSY, and an open descriptor at teardown.
- Fix indentation, __initdata placement, unnamed setup callback arguments,
  and whitespace-only lines reported by checkpatch and patch application.
- Correct descriptions of redundant CPU entries and actual sysfs checks.

Earlier generic hierarchy API and selftest submission:
https://lore.kernel.org/all/20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com/

Daniel Lezcano (6):
  powercap: Add generic zone hierarchy creation helpers
  selftests/powercap: Add powercap hierarchy creation API tests
  powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
  powercap: dtpm: Use generic powercap hierarchy helpers
  powercap: dtpm: Rename Rockchip virtual node descriptor
  powercap: dtpm: Add RK3588 hierarchy

 drivers/powercap/dtpm.c                       | 177 +++++-----
 drivers/powercap/dtpm_cpu.c                   |  62 +++-
 drivers/powercap/dtpm_devfreq.c               |  22 +-
 drivers/powercap/powercap_sys.c               | 204 ++++++++++++
 drivers/soc/rockchip/dtpm.c                   | 129 +++++--
 include/linux/dtpm.h                          |   6 +-
 include/linux/powercap.h                      | 205 ++++++++++++
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   5 +
 tools/testing/selftests/powercap/Makefile     |  46 +++
 tools/testing/selftests/powercap/config       |   3 +
 .../selftests/powercap/powercap_hierarchy.c   | 314 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 128 +++++++
 13 files changed, 1150 insertions(+), 152 deletions(-)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/config
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

