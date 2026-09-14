Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0769C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=Ufexdr/VEMAR8zSyOAzpxsSXEe
	0f4/AXkHfcoo5ymMcrGmD1lTXlKMvUP5IcT3VPX0bJV8X4UwMfu4FluX1UN5tFMm42PlBSGzCKOti
	DKRv6+J4javDElINlnA+KUm6QILPvgZFksue1Ix6xxuZX0ozfH24U8dP4DS18Lw5IqpGT55KJRxvB
	pCuAnJQy+5VIQqGL48dVIKFKCV9+uxWnNRADCLFE3dh+zVnFMm2yQ/E4+kA7hhGXsuaggacx9D62g
	q/g1t4TCcOidr7SgbPQnHKj9zdgPN68w3KK68paiFDhlyDBJU8BUcEiVuUplRrgzAxJRpI1SUtgme
	ZVkZHrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63BS-00000002zsC-1oQP;
	Mon, 14 Sep 2026 09:41:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63BR-00000002zrP-0YNa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 09:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=Mys1We4FPbgMaYsFzO4we7h5vz
	6gTCPy2RXBRCE+jD1010UQrM1bMsRSHeFJphDwdQs1lqLlhGpKuckxHEZnPLrUMRD1Nl5oNPoZMC7
	FNl4Uv+JtQDEl05nQ9THbzqSF2t7ocPMAvbwZ4h0yxzurfksq2AeJqYsXizskpyKEpKQ0pEiBsGUT
	14C4l/i+qMZ/TCvseYcIQHE/k85lQZOoK6rym/2OtrS1YTv/857EVyxjMR3Jn59S7SCtRuIWSDWaM
	x71JBvM2lPEUH0WCYrTs+lfhJ5d/t6fQcU8tnLL8OHNbA1DZ1bJhTEZBYOlKSBNvuOm3NV7cx2Mu+
	r+4vAXYg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63BN-00000005SG4-1mj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:41:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwgE4058525
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=m+b2/amVz9FkEIbJ
	/ULA+M9LSdAis/Bav/3U+xzPZX90vK7+E0zGrfazoAclybv76wHGyJHTnYolQdrQ
	v6fnvNmI498SjqvLj5pzVUNXfCwGj4Eo9CSvXecXjQB+9XNSLdkysi9Qi5tHVsgs
	NPGJnNYfWUheSW6/de5jZbSHN5XT5RNU6ehp7/Agx/zkOARLINGQVisWTdo+3yD+
	ApAqxKdJhcMV/YIDKB4YvuOFEw1F8YUM9VxPNGUyJXrqb2z35fXp/yvZhQOn+VEK
	eDWvDy0+6OGyxnWuS7aBe5HwzD0oGUM7IEbgz1MCqbGa/YFNUfEwpg7byThpp/Ra
	OwdQ8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsssnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so3468775a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378858; x=1789983658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=ULwD9OJtGiNg+JcctUEQ71n6KSJsyxBhVA7w/lzWd1xSOiZ/wTXEAKmBrpWi32oZBu
         1676FjC+CFfYEZjyQUFc226qatjMVVItd9LEVpV9ozoA4ZrKGIgCbDCLbq/xpApqg+sp
         UlZ6MpOut3Y37BPqtU97EnqgGaWNiKtqT5RNR1THrooEuBKxR5fM8G1euYZDVNHusePQ
         n0uguQzrnWAx9WQswFgBew+upLaoq/msnhLjqGeh6X1sM9EiaKjRFUUR4Tf2n///Rs1/
         ApR5spYDNLqhi74mChuD5SKYko+rYoaLHqLMxSolAQ2/fM/DfAD22NHSUu6E2tXcUlYj
         qsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378858; x=1789983658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=coyZTiZfS8nCkEysd7x9SIR67MUBmDLi/cnrRrr8pYs5yhwvuEQs3ossIIcwb4/krL
         Tm9QWk7imh6vcteOAAFtLrIz1SvrBXswvBSuk7ctIE/jy/+t8ad4rv19c5NcihJPLYdy
         hE3vXS8+Re90CPwdl5VgrAdZ/GM65nZyeyxEG1UjgEtCLaoJ882wUbE6LQteap+2S9Sb
         zV1Ef8Hs+Al3my4zUhh9lteAOWYPlD9WEliH6e6UpmbFVXmoU/ap8rlUhH9gJI2ruulW
         xvoUsdzTSjDpoc43GFYgOB3McntObM3SrWCfSh2EMbRBm6QulJ4udPpy9vl/gLGwkq8c
         a8rw==
X-Forwarded-Encrypted: i=1; AKwUvBx340cqHge3nJxodZsvpQaqoXLxSGzbU3zlPsTlbE9v+Y5rreXadUCEAyeAyg22XhvyqlgIOFv9cnRFSrOJ1ykL@lists.infradead.org
X-Gm-Message-State: AFuF++lyVmS/jfU6T+GREMtKt60tFhYJgFkahfr9NOJCMKJIMWKlp4uO
	EV8Z5kG/6Itmlq9AD2qAadh/KrIILh2qVJkucd17JWvZZDo/ISFe//ykTCu5NuxgJC7hLXi5pg9
	GV/BJaA49eWn4DiimMNYA9jwq9hhfI+XzYXGUSwYTHBwCQhvdW+VKNyi0evZ68CwsbyhAuoHLUe
	LbVw==
X-Gm-Gg: AYBFou1YrkoDSglGW7gUniPXYKZo2QfyQPV7kT5AV86uszfNfAuqKvc2N1sMJxk9CoA
	CiXwUe3sUSsgy6m1cLA1wHP/nZFiAA2uftyDqzT6IHg6la4sDABNYSpnrUhutsA7wkPd3Ty6C4M
	K3m+pkU0I8aDxkhQpd4Ip2Tuiy3iva9MiH3ihdMD6Q1MT4tnDBzXiJpHrg3wIIxK7sCKlFMs4yl
	HHuMnWboZOZjW+oR9tztUD+fticZdG6rQbiGPLF5ZWYW65bujud7VdvVzTA/IjL4rPz+XRt0PCh
	NaaMYVJO+0anaFZmTYoXiZwMlWpwl3R26p/gAdI/U+N7jESXHUA24N2oBuxX4yjjCBffYwtXHYr
	h4nfqFqrf2kDz5NAhrYhtQYopGNQK8gUVS0JqX9FzYH3a97AsmoY610u9
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39debf89013mr4001317a91.3.1789378858470;
        Mon, 14 Sep 2026 02:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39debf89013mr4001238a91.3.1789378857857;
        Mon, 14 Sep 2026 02:40:57 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:57 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:58 +0800
Subject: [PATCH DNM RFC v2 10/10] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-10-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378768; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=iu7wOe3pfXWPmLd9My3slCaONNEzZNUVdCafaRu9tdHeskrAI1rGcPR5+/FkZ3oE4TQJB8zrM
 osqqskJa3ouAOWjaxKCGP0Lu65YlrgiKPPiqMAugS7iGHYIymBIDBV4
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXzBmEOPAKEorZ
 O/iovdEhaX68NC3sFvMwh2nFIWXUW8ORr4DdA+e0NhXmYHQMAoZcNHmGhLH48Qy6+rCEG/gfnI+
 ESKgwD2XY+Xjivm56aMKRLDOTuFnQMIrhAwEamjatkj0JmU81/nS1K/s1IgofRlbHIaL7BNhDoE
 lr9UWUF4ngO90d3o7oBdE3P+y6+Ia67TodFnwKi6BjddWcygvkk9j+/Qsoh7VKGxhLeZdgnXvM2
 YTtgcPafeqvGQlWmA88f7myVCgZ3jW/dByXh8gvnaicj3VBBjt2hi1cEEt93dRm03I/DIIa0oLk
 r/j5JwWZOiOusMoCueVzzZFgi3onr0KU4Nd1NpBIc/dBcXG2aaGH2peAR4Qx61igrtovuOyC2K3
 IUyucHFe2iTWTiG8D7L3gAx7/33ywR+bZ35AsjCNRb4KEDLrSU0q8G37eZC//rVWrpNIysBt8ic
 sSmtGjaN7zAR6Pz73cw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7c12b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: t_nJakE3IqX7VqGyWebdi-ZV0oblt9HK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX4luZGioo19rH
 1sP4peN9dPNSa0BO+jWvetnVoIpWraVUi1MLl+1thA2X/eIHxX84+a5wn3E6mIXtzhVfKYCSxsQ
 iZ5kHnvRcmDwR128rEI6GMee6TbHAG8=
X-Proofpoint-ORIG-GUID: t_nJakE3IqX7VqGyWebdi-ZV0oblt9HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_104102_360931_97717C20 
X-CRM114-Status: GOOD (  16.58  )
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

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
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
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
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
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
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


