Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I317iZXQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyS5S6oI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBfBNvDu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QaMvQc7YPxqzERreS7uDmkIOc8TUZOr8mXcE/xhevoA=; b=I317iZXQdv6fKAOp24RZEt/DDs
	0nkY4VnkK/rwrBa5lmLBEgxaKYYt5qC9tg7+lTTGT1aKcHH48pZ0wYEyAZHSfplyCd8KVBtI7q19x
	zYDnXTxFWHhjSS9XAGHyy1J7iIkYE0QdRhls1bbuqB5r7TIzYSws0Np8QjbUGU0WjDgT2hg9rDtre
	nciqpKjMLvQ3EsqGCgle6XgpOFKWdvQK2LdSCFFiATix4wxcGhU7FF1RUXGnuHKYPws2A8dGjTfy8
	vaeElj+I3eCj9SuneMOS3V3Ysn1p5UfmpVXw6g08Nqp/UoldD+xjl6g5y5804W1S8qUEK9yT5oxvB
	tLVyRBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SB-000000015Lj-0trN;
	Tue, 03 Nov 2026 04:48:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6S8-000000015KX-34y4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:48:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34hCg1750972
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 04:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QaMvQc7YPxqzERreS7uDmkIOc8TUZOr8mXc
	E/xhevoA=; b=cyS5S6oIf1Po/eJc0NRAJ+h+J0JEeZkHQEeiRELOGNXlBQCgMVn
	tsLQ/dynwsKN7YmfZkjHARE9RumS3C/rHEJO6866e9ykeTVdNDpYRJw6j2csUgL8
	jhCyteS8BBXZWbKXrlGLVH3DOVNtBMnRQwCxWqiaz50QU5jNvLpIJoX9w7ftdYSE
	HLvub43wxvNdXgHqt4xc3jd790ELVW6g9kolPcrllvfDzMQ8cwODPSFdEOOM94JL
	Forox06Pgt2W1Mm8tH6DCuz/h/kF5hOhPgGOFraxtRuU6zng3NsQTPBdzunxxsm/
	cXcqgBED7XSTf+Fogf5AYM5ZD5AXh9t4N+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5g0jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:48:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so691637785a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681335; x=1794286135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaMvQc7YPxqzERreS7uDmkIOc8TUZOr8mXcE/xhevoA=;
        b=UBfBNvDucw/ZShyi0lf5ZeMbQjWNasx7qn4gXqJxg2k9u/UxKMq6/LGzgn+tFkjBC7
         zujmiCISxke2E5aGqnVlF8s4R69iKVgxNFeN8bd4UHMvmIF4H76SDUPIV6udaHCCl8jE
         88JPSa5PopynLQmIsBTcbQ7xGlr02xjsGPBdVX/7D5oVblhbQxZBdbvZovPqd7weHqfY
         lpN3DlrvJ5x2JPOnYUFIEe20JaJnHpZTMKpaCPTbgqGtRtr0lD38j3sXQDctYk2elvwi
         ULhjNvLxd+fqD7zlHlsPuhloKwZq3F5g+qJdoCojZSriGHwq4D2YuCVSSZnhUL2YPvjW
         8Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681335; x=1794286135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaMvQc7YPxqzERreS7uDmkIOc8TUZOr8mXcE/xhevoA=;
        b=TbM2XWltne76uXJyTrRpnS+HUoiR4nChicSRW50XyWgym62GVAwYVuRbX1QalR8w8H
         xPEdwbZFfhFa41Gm9RKWnOufhpRvZeZKJBx9bVVUDpORbATZ54JAF0EZ9TKhcMLbJwta
         5XJMOOzgQhyfe56QC9Xg+8xCTQ9Y4ep4FzVUKSDRA5POZToqm68GEtCjjBRzsWxZGRoo
         TNc1bUYpN0XSyN3Yzi0RNUcEty6kqqLlF1Eb8GMWU1rFfpTHkY0iyyuAV7PYs6viR3gs
         A7T2JEpnXK5/6wCclxC921ti1Dm1U1e2l5vx1MAfKMG5zbvRTeus2mQ9MXCa+7qMF/m7
         QzjQ==
X-Forwarded-Encrypted: i=1; AKwUvByPOWL/wJ8vq36FM6isgoDn6ZFjWaWpxjRRJUEAr4OFzBI3peILo2tYoW9fWIBnZoEeOB8SVcngZOrylYGJ2cOe@lists.infradead.org
X-Gm-Message-State: APuU4Z/aMMbDqFwnyjyPwQZJnQuHV4YSgdsYEWRyK8PvEII5j5+lnjW4
	w4ySSD/nXWoBsRm3J7d35RbCJJxSoe+bPagGCMSToZEY0fs12/UrGqvezhuGz+/dYjIjbvjPgVf
	xKtIf6VTCYVNSqkAIgE6oykn3iQ0nk/DiaHQva/oQHBSxqJUcH17TdH1yaOV0jeCvAOFAG4vEk+
	CUYw==
X-Gm-Gg: AYBFou3Si/Qyu7TcE3se/8ftTVJoJyfyOdBNEOF7A7Nw2rm6TTn95V9CvbF8AMj20LD
	KFioRK3Pq9HtvVBdgKglPd5tb3TNjKUfen8gtelFPyxiZ79WGUjr6p/TXQnzwUmbPOmjlrCrN9k
	/6/ybxnZWVEeSPjCu8FkdMmSRByrvUnZJYvwpDO+9F4qjPv/QbESVtrPyZM5m4uaWJjJkzXptQL
	ZoEHEvtKRR0Of5fnM3GAQx8DkASVdnO6vFPeR40LDdKvLNuLZhLVj5YJ15RuoznO+zTkInRne+R
	mE3yni7QYIpDVWz0Tw7tO4KPIK2x0lqSNKiPIWlwa5RmVJ0J1lGabvPbTf1D1qbTGG1gAd+vjY3
	EzjlNLeI4zC1FgKzrry1OT6z3KUgAO9lqRayX51ONzOh0mC+I8Il0zAuWlkP4G/vfCGmRxyVig0
	Y9
X-Received: by 2002:a05:620a:3945:b0:93c:70da:e45e with SMTP id af79cd13be357-94421677245mr2452915985a.36.1793681334921;
        Mon, 02 Nov 2026 20:48:54 -0800 (PST)
X-Received: by 2002:a05:620a:3945:b0:93c:70da:e45e with SMTP id af79cd13be357-94421677245mr2452913185a.36.1793681334303;
        Mon, 02 Nov 2026 20:48:54 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:48:53 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 0/6] powercap: Add generic hierarchy support and convert DTPM
Date: Tue,  3 Nov 2026 05:48:14 +0100
Message-ID: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S-MrRFSWxE7H8PUdW91-NNstfgIT7RZa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX0c+fADqPJLfl
 fXKKK1tPgfcePD3bdPhHnzLcyLQ4vwXspe9ktHzZ0NlSantcKd0qa2MJ6Dn2lSxIhXywycn4zE8
 bqb4uc9wCEuzcfe3hgmVwyrVbz0elFk=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae967b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Lw0nehYz5hoo17msdR0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: S-MrRFSWxE7H8PUdW91-NNstfgIT7RZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfXzQsBqeSMUqAf
 hF3LaNXel7sP3HwXAZ9SkUHmJza+GmiLjKo3NXf6dGQI1WwfYTKnCX8jEBUnyPITpZU9Mw72hly
 +wvoHCQw25j17lx7+mcFikwyqc3d1+sDEIs+zWUlKMpRyxuLEN78umcfxVdBk37fEoGgbq568rh
 1Q5Rzqm1N4UEMPpxmKm70XXtzjk+C4mvnp1RzVPNBc/aV6j3mtP9qY5ovzCKfhEwuXTkMi5V5gY
 Co7J6K0E2D1/60fX0DUDqUgwQCr0lxiFTo1DA+QjpWS5O8cmMsehE8f5NdgnniyBhnJvyb4COPv
 SxBQ8sAhMbkAYU44X2a4yehoe54fNW/XZTTbA+87o3T01/5ywIpq0cRqfsLAfEh4/rsqLIEDcQG
 OFzIhgxMjhY/LwMdyjb9G1NdYcnPpslq6RbkpU5wP4LbNfjUX6+JivhRRVYjTw4xPUea6L6+oJz
 Aud1xm0aEPUUMBM2IEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204856_912766_47A9EB7E 
X-CRM114-Status: GOOD (  22.97  )
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

Changes in v5 (since v4):
- Address Lukasz Luba's review of patch 4: reject a DTPM DT node with a
  NULL path before calling of_find_node_by_path(). Treat the missing path
  as an invalid descriptor (-EINVAL), rather than skipping it as an
  unavailable backend.
- Collect Reviewed-by tags from Lukasz Luba for patches 1, 3, 5 and 6.
- Keep the v7.3 base and the six-patch organization.

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

 drivers/powercap/dtpm.c                       | 180 +++++-----
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
 13 files changed, 1153 insertions(+), 152 deletions(-)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/config
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0


