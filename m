Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA05606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f0pD57ez;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YP919FM0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQFY4KG8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sd2t6zfawn/sdEB5TPQXH1fGTRUUwWcMIRfzxgxuW6I=; b=f0pD57ezc1BNORYIY+2yQkOksH
	hiDcQ1Tg3iBYKzYrBbyDxbboXtwowlCKPhySUInNPR5MZrtOQJ+jen/RoTXOLCkaHEsMt4bEPN7wx
	08Lck3pQ+QjyhG2CUlX11RV1dHEUTbcxXh1V57SUas6tEA3RfwiBr4A5v6wPCALj1LqtOUWhlgpnb
	PBlI3KmUUu96PKx7aCoXHrrKlFG8L8hzGq1Ggnp8rMqk3xK/+5aQSN5gxZLRiEjVxq0LfP7QBuoK+
	hzh77FmtgEK/obf/o+kiTioCRgMryYz0F4g5jZL+dcHYKKYWyZ5v3kkuotH0JDibKzqKloXZmn7gV
	6nUEYucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAel-00000009uDU-1CrN;
	Tue, 20 Oct 2026 14:17:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAei-00000009uBk-0ZD3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:17:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA57j2809827
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sd2t6zfawn/sdEB5TPQXH1fGTRUUwWcMIRf
	zxgxuW6I=; b=YP919FM0JOYKraNflm4XG/APZyEWo54y3fi66Z0fTAs4bAhHoxq
	b7dfs1GWiIhn1B8gJSqaaEyoHlleHSrPdzUXY6KyRHLEa1ITiRmi3XQQRD1o2KAh
	p72CMes9DeabKGDmY/h9wLQpJv0NM/0CO70eeYndFDGjsdzPaZ44xaYbo6YZ7Im+
	JGtwHe1gp3srX54aQeDrRWV9WIqRUId44loA0wPT1Lqd9DlPdqm6BOgDhVNTUrn+
	MBFvcbC/J/z23LhDaCBphc1xH0rdh40vyzgJJ0hK4wcwbSW3BnYIes9qbspMBViA
	6UiADy+7dsulCTyEbAJN0RzJG5Wm+mv21MA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2v61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso140113585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505850; x=1793110650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sd2t6zfawn/sdEB5TPQXH1fGTRUUwWcMIRfzxgxuW6I=;
        b=RQFY4KG8DXga9DLKmemfr7kRFvYAgzYW4vE0Ys2iVYzOELUOKHCcTIK67O63JPOOBS
         JLk8p3eYRLByE1y3EviYqxegBwdkvySO6trM7VflqYdCCukCnDphaWADrc2DbpSp2HGQ
         dxOs8zyaOGOi6uGi/TB6qXMvTjtkv83tNCdmwk/QiIk2aBdj+Vvg/U3RzYU+8sXMIb0L
         SNz+VkqHO3t52hS94Bg9l46eztn7ONP6An1VNbLeNcZ1tTNFwK13YIYzqKOqD/jlsC3k
         PFQ33sHsX/IjR5YHzxJBQID6b4jtP441u/mBuwLaJG8P7TDVIV6MXFst1rI6koLlKlVU
         QpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505850; x=1793110650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sd2t6zfawn/sdEB5TPQXH1fGTRUUwWcMIRfzxgxuW6I=;
        b=HFqvoaky0tdVQJveeUBJXPlTWpgeSOROFrUySjoYAqV0wIb+CXCr8rKlohpKJAc1rC
         qG2NWlQAgpYLKJdFs0V+vihOZxw+93rFrCCT82V7k+BH0FGBbWDZ4HDP+JbqG0gvMKlP
         38QuoCQlizxYVcaqtcp89YstEqmEsoYiA9bZrrngGmuicsWKjg/+MgX0wAHmj5BuLqXH
         OCYhugt7QjnYgNI3BWdVHRmEVP/JOe+BRyG5gwitz0080NJGeSYYk/dJ8YWuTjhniqS2
         1RU+MO1eGOVsBQ4JFC9380VNdkHOqRXEvWYRyIvX9tuLY6ZIC4Di5q8oZYPNh0EjqB+O
         xnLA==
X-Forwarded-Encrypted: i=1; AKwUvByK9jbLeIrjkhTmhMZlyFfPIj4uXPOxnqg3aYkWN+k6UPSWaifuVEBJIAQCewwGZUdnj+smkS2Gxt1Fo8gbZ58k@lists.infradead.org
X-Gm-Message-State: AFq9FYKihWefezgWt5umKmj367Hr0RLo7yBAeax72OusQjTJdRq9sEds
	ltHugMkAdUYMNV2Fx+kZrJR7vYZtQvrATCAizHjiggL5SD1ixRAHqwxFBaA+497Ht6y+9sKTlcz
	IjDb5DyymGmMcNg+YXAD/JmeedVG62GsNIyCFBAQzfbVHPHoJjQVHGaUfHX9AUhsvD5B2RLLP4G
	B9nw==
X-Gm-Gg: AYBFou13uRRqc16BGjYgoUJooPzM/EcDWZF2voFE6/BtfQdb+p1XDD9FQ/SwDbSxZle
	5YrdMjDQwGYXFNMaxp8BgHiEUFGgsFJ1gM6XPifocSLApjFNUxzpWLhcT1akWV6lmJVay1w8BL0
	aVingmRaKLaXfUxI2JdPORA8XAnIILQxSvcJpu3aPd/IhQ9IFSI9qsHfw8KNXUjyNDlNKbZOJ/8
	Q+idv/PmYDcNeXVLZtfu9MMgcrZGjP1aBSFZBBha2j1FlqfX8BbwleaWPysT4H9L1Qv/pLCo8Wr
	Tt+fSmA27cnpNUExmkoNN+f3f4pA+UOAMv50f9Ww4epYFbmEuOhaJ8tIk1jiTxNmxYgAlkCu7k0
	17T82hvkhMJyFCd/4BtKYRjmdrcg=
X-Received: by 2002:a05:620a:4493:b0:93f:4498:603a with SMTP id af79cd13be357-93f4c993775mr333473185a.35.1792505849957;
        Tue, 20 Oct 2026 07:17:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:93f:4498:603a with SMTP id af79cd13be357-93f4c993775mr333466385a.35.1792505849328;
        Tue, 20 Oct 2026 07:17:29 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:28 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 0/6] powercap: Add generic hierarchy support and convert DTPM
Date: Tue, 20 Oct 2026 16:16:50 +0200
Message-ID: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yFh7h6ZINZxDFSUJaOGkCMWBs4dp076A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfXyEXTnI5rqYsq
 dbCGcdqlL/Azl5z1r+xe1TABmJpARLdSNphMeL3hEO8wskDvjhOSG48q8ku/5G5R02cg7A4YTlg
 yrMu9GSU9GTV5yigDAbAqTuHOMrF4IM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX2V1lnGCe63Of
 kWDV1kl99yhr8cOVwjfLtq2Ti3c6Lzyc+B6F5vmB/MCSpkqTrh2MwNm8pLLST427K1/TDlygeJM
 CpajFcavh+6PcJ5g/gyOOTdBfxnNCZ6apzgC68mizB/S3fADuX3c24piuQi4wMCYZqyxhCWm6vl
 Q2pKGdts1QnS+5Jj+JjE9vTjvghUISdhgUIiW6zpqXSdlLyLgiM5MBy72CO8Op5aF/RwmlKboZk
 OBAovtk9diqv3B5KnX+iYN3mNlrJRK6p/SH+fEEDZOdCGZ8K3DwhcjPnlX+fkKBKimJ8z8glwp6
 uHd2Vl3whtZRmKFLlTpEfB+sq7AhMlGjEJw7XC0fBihgPYmD97KR393V3xsD1KYzPFqlRGz5zdi
 WiJvh1GmgJ9tXDtjCyMF0KKvFVXu/q/uMyLVUfsE93JE2s+Jlzk5g9sVVQJV5b8NebNV7xz5SVS
 UE7LpJphz3taLZ1+XYw==
X-Proofpoint-GUID: yFh7h6ZINZxDFSUJaOGkCMWBs4dp076A
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad777fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q5TblVhm6hz4NYUcPxYA:9 a=IoWCM6iH3mJn3m4BftBB:22
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
X-CRM114-CacheID: sfid-20261020_071732_169949_5260CD9D 
X-CRM114-Status: GOOD (  18.96  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
- Correct descriptions of redundant CPU entries and actual sysfs checks;
  add Assisted-by attribution.

Earlier generic hierarchy API and selftest submission:
https://lore.kernel.org/all/20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com/

Assisted-by: LLM

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
 drivers/soc/rockchip/dtpm.c                   | 129 ++++++--
 include/linux/dtpm.h                          |   6 +-
 include/linux/powercap.h                      | 205 ++++++++++++
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   3 +
 tools/testing/selftests/powercap/Makefile     |  27 ++
 .../selftests/powercap/powercap_hierarchy.c   | 305 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 126 ++++++++
 12 files changed, 1115 insertions(+), 152 deletions(-)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0


