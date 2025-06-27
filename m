Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86D3C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVA/E99m8jk/UyTEwuAnkJNV1Y+Lm5HCf/54Z8Iu4hM=; b=g/wnHRYH2lL3D13ZclQlV56Bsm
	ouk/wioXiu4q9ERcLuyff1lu401kOjMeXQpeONNHikrcxWwFaugAbtLO97igoyaMM0n5MP4Ns2qI8
	j6RL4zY6yXrwpigdTpD2/W6DBZdTbJjVkLdIfRPenrD/F4JQR47lws4W6boDgf11AfXbxH7TlVTgD
	r8Fl/Y0qVC5IAPyv0BcdHqmwE1QE50BPs3YqVyVImMhkYzzt8NFhIM66mrfq18R+hiyTX4zurOm6A
	A5BNCryiFqcZeVJAJ1Z2LZtvsxodJaM6TRhVjS+rze+509WwiFDPHhGtv8g2ZY0946UOQ19T+e91x
	dS3fiLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8ZC-0000000EhEi-3Nfp;
	Fri, 27 Jun 2025 12:52:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7v1-0000000EbT1-2Y4b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:11:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DDs4011368;
	Fri, 27 Jun 2025 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVA/E99m8jk/UyTEwuAnkJNV1Y+Lm5HCf/54Z8Iu4hM=; b=MUG2pOxtxCAG2GG5
	LmczI1UzWc1ogxlKqpZAE5empRKikkwJLXwa+L+W6C6KcFl6qDoyoR5QlMydymtx
	NFsTXEMmBAPHjyVLt4A3b6PSnqDs+Vqv3hX+Cu/Z95HpdrOXARXet8+by6BDGlGC
	ujdodQQVc8gL2mVVVvdMkJGNF1AlZnT8LAFv+wSJj9wrOWmVWVP5bdHYyDYc30gZ
	i/UQzVb2Eqmg7p3MOU3tqoqDwePnBxehmBa3EZNwPv8dCMUtNrypoItjjN1BEWMn
	p8ATTqd+EwvgK8LGm3DmHJkYIpmwW6vqLkBQVhsYvVdYTk7RC19jQ1V6aKMDntvP
	sRqZDQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgpq2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RCApuN028202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:51 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 05:10:46 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 27 Jun 2025 20:09:23 +0800
Subject: [PATCH v2 7/8] arm64: dts: qcom: ipq5424: Add NSS clock controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751026208; l=1477;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=LAiMCfEkRw0czC6gQ9SgL/AqEwNwCGtbnIlRM2HjGfk=;
 b=3oOSJbFpi0as7v6DgNpHzYT3+umTLSotqOwh8keiDPs2M++u6fzpncz0NSxni1A2TNtV2cUms
 ZRlbfRnkjcaBTmx86wlVRNwtDzZ5uWilv8nbtOCMOUQ6iGKvOjYooez
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ITUb5kP9oKsIFJpapnFegj3q4VBTnXQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX31e+FREfDjp+
 K95aI4jXN5fDcKMDPcByfNkMFCeHy654pTvDC4BGB/+Qp1zrwbvNHf3pHXoAG7E1Jmhqs2bRjlZ
 uSXg6w8FG7M+qaQmLbLgAs+qmy18HDwTTKreMoNg2MUkK+kSY71OUuZS2ouZXV7cVpv0hpFjKDW
 iFWicbsxyJdUoFHTQG+mkWgO1RSszLYuImBqZgmz8Tl/Zz4jVFzPdEQZO+vE6nd3nglm4VqfjAd
 gpz+G+o41cirxlgxCE6T84fhax9uiWWkEtiyqcySU+mYsZzON87ToVGzeeV4uaFYFgsX21Tyeyk
 0x3V7zm914+GDx1iaVCB2lkhRWELC/F8OfdZFEgDo2uDo4V2NBHq4DycUJkp0I71Ry4bwcxsp8q
 qu+fiGc9XbdWMKbFRiQffEspayESX614k7BRgGEjQTT6j129NE5CCAAq97+SWkKtmKoiEh8g
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685e8a4c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Oz6Bvq9tbknDtF5eo60A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ITUb5kP9oKsIFJpapnFegj3q4VBTnXQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051059_768015_26156EB7 
X-CRM114-Status: GOOD (  10.38  )
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

NSS clock controller provides the clocks and resets to the networking
hardware blocks on the IPQ5424, such as PPE (Packet Process Engine) and
UNIPHY (PCS) blocks.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 2eea8a078595..eb4aa778269c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -730,6 +730,36 @@ frame@f42d000 {
 			};
 		};
 
+		clock-controller@39b00000 {
+			compatible = "qcom,ipq5424-nsscc";
+			reg = <0 0x39b00000 0 0x800>;
+			clocks = <&cmn_pll IPQ5424_XO_24MHZ_CLK>,
+				 <&cmn_pll IPQ5424_NSS_300MHZ_CLK>,
+				 <&cmn_pll IPQ5424_PPE_375MHZ_CLK>,
+				 <&gcc GPLL0_OUT_AUX>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>;
+			clock-names = "xo",
+				      "nss",
+				      "ppe",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
+
 		pcie3: pcie@40000000 {
 			compatible = "qcom,pcie-ipq5424", "qcom,pcie-ipq9574";
 			reg = <0x0 0x40000000 0x0 0xf1c>,

-- 
2.34.1


