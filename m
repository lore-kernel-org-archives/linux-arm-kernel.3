Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385DD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Yesmt2T;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfTUPT4K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=; b=0Yesmt2TN4BbuH
	d1v0aXMEAeYBpkQSK34qt0n16dEmJwc3N0yq7iE+c/RIiUaslhHE3VF+rULQwrrLf2zs1QrBxLSAg
	M3gOJlWlQorU4DW/ZCXcscI8XGJCBfxNzyDNbCejlYycyg4F/ceqFJdlXhoYvKlVkQ+7Fm+Ls2Th6
	zGFTPUsgSnitX08Cu4PShQghnFF3CsuohMylO2Q0AmsLZ6zJO/vh9m3LKYYXUUyCjHtsdReQErBAi
	8fAKzoxldRZagTWvMBN9xT0GPRwB/3sS2EYQ6QwK9xwnpTx3cSmenFf+kox3NPsWw+zVShK0oSMSk
	oLW/vk6Pd8u0OnqoXt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28u-00000006tRE-3Jmw;
	Wed, 28 Oct 2026 11:48:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM28s-00000006tPR-0NiR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:48:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2nh1538953
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=; b=BPCNdJwD35hChuwT
	JQOnqjp4G0M2tcP2sveGVgO1bOK0Bi6WszVbz4yjet+bzzstrO+Ga2YJLSteeRj8
	zCm42pWeQz72IU8i+1ECjHGVVZNtf5PwqQyYDJtMfes91o39rKJijOyGDco56M5c
	ogvPLGrZdMsmdhqKBAHevYqq7Jk4f+rjk1ThiBEwpAPPnQcyoCUJGE7t7Afj6m/N
	D4R4C0yWpbs5VzefSQuBsgs2ggSgQKBi5cJctkqN/ZcdugzgaV6IUGLI8Ad61d9u
	x8JtSyATjx5267hYSLyKBKxmrERSXui9G+D2B3OU1FZ9jO3U/BOjx5raAkVnvOHh
	VSY5GQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rqqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:48:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e869e00005so10696595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188108; x=1793792908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=GfTUPT4KQxrN+bjAjxIAiawXRWMkZXQ6+JSE9Jtp2IPzmJfMeCb8m0cO3Qrrz5SbzE
         BIJ2gcoPam3vevUNPOhfIKaudpNtxo8lG7h/v/PbvfwPJZqmBSWC/G9kW+HuA7a1T29l
         lD4v10OkCMFPMvgCrD6TDlCSeC6wFUq6EMOnILRBQ3+H6XbKyHhf5Y4Vns6O9m8G5GmF
         +7eAS9Dibhqsd6dKfqilwESV259KfMqFa8oIfAgb0YRlVIfSPGZtQwbAT5Zw4EhLZz+I
         Ic6KyLvgdyhMV77U/siwPsxnOX0ns/vlccEVMjlKPs+2SVEB0UciHcdFpXpZS7kIXFeP
         uUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188108; x=1793792908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=j3LLJvKSsVTdyMjI0ck9ecmP3TMI1/fSOLEZQwr8Pp9qTPIuqgq1Eb5S2oVFnHMOa+
         V8FGZncpzG0IDjq6307vH+xUaVJX92UIUm5286TF0lhNK62rU+u5BHb7tGiVHEGRyqQk
         s4UvyEF64bznQDueaOAwTUbf2QCkVhP9zZM/ITxI5NxnDgN2x4+bip6xS9rdy2aCMQIu
         IOA+98eXtSFvHM5qpLs5GbrPY23Xd73l26OU72LirTh/EYArvEFmzkE9I8yT9I1CIWCT
         z3iPyh76j4fo3QoBlzjaL1XqJEQB1ZCZibGa7q0MjlAZJsgPnk27yAm9pBUp2Vkn+8w6
         UFuw==
X-Forwarded-Encrypted: i=1; AKwUvBy0fgL/2TvWBC3ZbGPo2BTBa1lO1EDYJuq3OS5oPXpd81qsYNKlHSDvP7U9zjSNx0nQ+MljC9c+g1wNVnRL6Xyx@lists.infradead.org
X-Gm-Message-State: AFq9FYJ91+Gd62ibnrgxvbZSzA9KFe5pH6VSAk+gSr6H/Cv5hxKBIPT/
	zXjzywntxBPp6so5bVAi7J6BqX1FOlxizoh0gfi9LDb9qr9xbBt/ylVbf+1YulOWQGFGnOqcJ6V
	r7cDKkUoGmSILQFYvFkIEHzmqetvYoER1ernb4VaLi3dbXnhrQacZJb0R0CfPVq3vhPxwdMabZf
	ZE9w==
X-Gm-Gg: AYBFou05s9drey6F3WHG9OvfS7cZZkT4jEi0DyDJWwfpS8C7AcP98k/VbheQdDoM7OH
	fFhkIvTPikyJUGhP3DRq5WewMOk4X4OxXNMVpPNSkNl0DDDywNTdUoqKChkNAG6SrNnjPduiZ8H
	pKHioZFMBgTpeIPAb7yKXSfabOmPgdUCoxYO4mLlvFyAeokZ0rDtk3V1g41r+5SbaKSUOmHlVvb
	5Srgg0MNe8EnSA7zzCiUFW9kCgxv1rDTu99cCS0Maa+49PCDPW4kcfY577clp3Kw6YVESPA4ZO1
	yeM104JxCDmrYu9AGawNRvo4ehLws3/ei6vAz7l1LHy/B3K8qyAhMqbbQI52jW2C1wVHRcp30Nu
	mbMNYxBZdNiqU+p5VwkSGFwLXfWfKiUiOa1TEs84KV6vULC7PBsI7k0csCPluTYGA2z68TV3vtz
	pj6JUkfdMNXd1hy4HgfknBczeAb/tF
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19433055ad.5.1793188108022;
        Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432715ad.5.1793188107526;
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:46 +0800
Subject: [PATCH DNM v4 6/6] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188049; l=2980;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=EIpg2fIGRMBRydrB5ptmJ7TII/dpx+YM1XoZaljDCw4=;
 b=x/J3ue5uV1wMxc65LI2QTgcNRDwtcWB8n7h0nyP0eO1K1PUyDd6XfFsaaNBgUK2zJSIqu8/PW
 qhoFFd1vmHqBIA1YzSyn/HzTI0xkTspyTgNaiZf1+/H9UOE3fkw1nRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1e10d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E729PEQmlT8dJWfmHKxgXhXesefvGKEa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+3qjJsDH9Q+h
 sEezAbovBD/fceYRwVuRenQhpH6NVvPwBTKPjFEx6TaopRwIeEn3EkM+DeQJf4NjtzYMLgjWt71
 Qi/YqMmcVff/AC9asExVLrgIH9jMZ+I=
X-Proofpoint-ORIG-GUID: E729PEQmlT8dJWfmHKxgXhXesefvGKEa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX180sY2YwFx4a
 DPbWTPWndqR3GWurzPeyJI7uwA6Dn7Kd1rEV2NuC56JihVBGYNZ5wypYHeSrGAWKiJZw1R42ha3
 HP0Yu11YUL4wLnUzbZxBWf29qqEHQ/ZFVRtE8al+nzKahxQ4U198IJoZ837icGf13hjZ/Iuq9p4
 1TBfp5hWy+RuBH+vRFEmzrW2rYwRCiegJi6HGNkVzGR0BCNqCWJdrC1nDEHpFwq+Jamn5wq6xQx
 ZIDKlE8C8gjEhuzdUw0bI/bkFY8bSsMl1ut4j9BuIRnUuLy5DdP//YUcs1Xd2p0s0z8Oglr1jKF
 yEAhoOFj/nk+dpdJt5wi4Ta2yN/Sjd3Km5K+ZAKQtjKlFzQ/MwHlIKjsiODbtT7d5ha0vshrFBC
 9e+lfB3J9Xm3veBcQpX/s0RfNm/UJE18Mo/Bw3xrdeu/r2Z7hDNk6JA1KGSGo3YqMD2rfKR04U1
 3DRFILhfMkbMQynWjUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_044830_613567_7BA224B9 
X-CRM114-Status: GOOD (  15.98  )
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

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node, using
'ranges' to map the MSC's register region to the physical address space.
The MSC register size is 0x2000: the Kaanapali platform implements the
MPAM registers up to offset 0x1FFF as permitted by the MPAM
specification when MPAMCFG_MBW_PBM is not implemented.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..10aee29a1ba8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -49,12 +49,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -121,12 +115,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -532,6 +520,46 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x19870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x19870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: cache@1a870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1a870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1a870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1


