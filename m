Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19760A2604
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WRxs9GeU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbZnINQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=WRxs9GeUvdqP/G
	UCYYbaOoRgI0dtkMJth72vtfFhtlzzCoXHAJGspRi+efVEyIMe5o7gxzS4ilTNY9XpWl8Luu/WjnC
	Fzco9N/2i6+Yvuac3e8oBV4gnvfpt3BxqAaerlW9n3qdm/60ZDMt4Y/TBKbkST6H6YEQx+KbQmvpL
	eok1ZyUp2zuLWc1KDkhq+5pnxb2rd7x2piM2ExXhVzb2CPqXqBf4uQ/1PYCEIAzrFPWqBla7qDpYW
	6uU+oQom3nnkAN9bYXxzMX1QaejI1gZKV5q8K7ut/3XfVV9azCWfjXzD3SUTJSpre14k5Jfc8BEJA
	7JKcASKRQz3T247MdFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgq-0000000AsRh-2lWX;
	Fri, 30 Oct 2026 06:02:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgm-0000000AsNq-17m1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:02:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F6Hw2871159
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=D4oO5zfB0ukpVjYw
	cTk8tCKl+AE3jcORtYJHG7tWO9ZGjdcduXPIbCVfA+fK4HR4hE0pqpFfVfAdKfGd
	NkI0N1tiqC8IapTi5YOGJcd9F8OJYLMWSdpg2uNY5fX52Jv4Tl7LRYV1jXJJP/a9
	OchfynMmeE3qJmKvCDiCHKxi4iQQY6iq5r4NQet6TJvaGm317DgJVUvOzdSo77J8
	JhKs7vP70ldaeOC5d370wQH7GdyJJAony4kk04FIW1oyHjsrgIeDGTKgOz3WZQiK
	W1VWuCIxKTkMTpaqyV0p+CAE1XmCMOeNJpnoW5/NRoHzdh1CgJwrpx3RdOftMIBx
	VwV4rA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhfr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:02:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso274540a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340126; x=1793944926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=WZbZnINQqB6VwRVp4cDYaBig1hzHMW7LTLWtEan+0EE4aGOfJ+fnpS9yXytqe0Qn4f
         1dMD9cqc7fdhMqNtZBJHcGR/EB9+UYDf8Sh5r5n9tJKwBaVsvFdCZ748J2zHbokFNwTJ
         lvKKt0I0xwEz7j1fKgj2e+qVmN4tvfXow9BOl+ip2QJzKB8ZFTvhdK0EGNDSoLYtrVdb
         7boZDEqmYRNTLrhQC34Kmpfd5+buOBC8f553+MlUpnexiEM5pEM/DY5xfcHc43RguqbX
         Ad7aVDRk3ruAGqqZ9QknOGMXeJg8gkd5GRcQx6kwSXoDOpTKUWP/oyvCrY/FnWxIEA/T
         +fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340126; x=1793944926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=SX/8oTlfjM+tPvH3BSdU9sbB4X1xE6areE2DO5ttiURsUCKKyxoZRWVJGuwoTMKy8S
         +eIMR3m1qRdNKBJIq4odeVNBVM49NjxXwOytASZVyOtQpHysk/L3gJVWGg5H2E19mnID
         hGoxfiKTaQympgtti/zqqMQW2KdfE3tAE+px6KqtNfUaCT3ZbhwxiwvHlHAuC999aVGR
         t6TvxMcKwkj00NVW5bwLt4FnTD6HvInnScWnUervEQFkpNMbPu0FlHwugxDQwQ+qg9ze
         oCmVbp2cVmTVXvNfDJjwMMUsBsu6I/h8SjRy6XDI7S3hezKzQUordZNJI5wqlANDb6oG
         HICQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpH0RSff3KkZN5uB4pgPyfiJ3eAESLPtwgR1zLYndzKG1dG6vpSYdMNvKfI7EMM+OMOmXr5KmvPaQ2KYsk0b4F@lists.infradead.org
X-Gm-Message-State: AFq9FYJyp1B1ZjD8kZNaqaIkHt9JaKgk1l0zdFiBL9XyjKFyUzqEWq7U
	5P/7KW1ed4xuKE8V/FZqWoXt2b7F2rMfb8Dfo8L1qGh7DYsk9e9Q3eKBg6SxDOK8wmv8cdrtKbr
	51223MzHJUS19y3a3mHsr664xiBTzTqmIckE3TrCvSa//4MLm4BKMtN0Ol4eDvom4s6aeLAuzcD
	xqkw==
X-Gm-Gg: AYBFou0kROSckPH1u62Q1kn8ZP43CxgDS0wEUIw/GqgEYvjmvQdbEOOr9ETJyMgXNx2
	EzABUztfpl/gT4G1cAJdKFfZE5I35SIEexFuHXAvqBnAKWz3YATckSml0VuvjC1g+S4wLy2BCHj
	DBCoI7/cUn01xq+LY3v1exFsH/w3e/MAIJg6XvCUYsQUub0wpjyAdP6XBnRSBE3MMX3tVRjNanA
	XgecDCVMwNXObIadH3oRjFdf3BPRK089Ivi0OdgbrFt7dPHMj45ZEiaFFRKBxoyhehGB1lxlCOH
	YmAGtPbGhokNasFKxJDdRv9CLF4tVFZWKsH+QY+KiUh8jb2PRO0bZneAbPp9UYaXBsAwZaql/m6
	pOeJLtTNhAHRYaFnXD8dM5bx4A5O03ucxShX7BKlswmCo/thEBYZuklKGJxZ+50M7sIzLCdfaQU
	HLTF6AFlSbTHM/qVFFlUvWug==
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755891637.46.1793340125316;
        Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755846637.46.1793340124566;
        Thu, 29 Oct 2026 23:02:04 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:02:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:31 +0800
Subject: [PATCH v20 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-7-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340078; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=JfkIeEFLPGzKUpG0HRMgkqeOptx9ErA+QuK8jh3YSakUhmfAPmYeCF6CMtBo/QwluH/Eyd0+O
 jXmEfKT2S3qBgkxPuXok1OqX4eD8wBAkcfh1cGtpxBMvv3/454koBsT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXx688o10G9u1s
 9zzs8qa9u+YPSSSyMFwWuY0D55vHnjokkWDiMZVpXBQ+g8HrW4xv45zCVrUwAc4/uobqCQq1ciT
 CxuildaZxu7+mn4zLGIlGACA6c0uaOqp826PTdu5pvutFuzMLNC6XOCVX1cMnDRQ/OEHtu2X50O
 NX9D6ZEE7C1zQc+XWtOXK2tjVAeshy3juolDHLvF0vO/6v8glU8pBg9jJN7oB2UwFhTE2vl+fZr
 1uD0g34Vd/rStas61mEd5LfgTBINUebqPz8nuNylbNiVvuTOnG+YMNjr9EFta+D9uCpVjcwdBzF
 brjAsHD025j5A0SO86uDDTSjgHbvtBM8/M6JOvySKOW8ONi+uTN/rwKPNL5V8oJM1pbx9Rpy+Nt
 52Leg4Cch6M5Ptu6D92+Ua6xNc3WOdoRt91nPpofkpV1fwdLchaZcNfNeSmzwJ8/TvUao9arUPv
 1LWa08hSxr0Yp09rLXg==
X-Proofpoint-ORIG-GUID: jAxgkHRHVt8ZyZ7tLwPaNl9KO9Nzw6TV
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae432de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX2xVVa4oLQMla
 3nZ+r8uASydDLY1AQMCl6kGJ0Tl+GeTRUbR5JgLX67MiAyPtNGRIKJxjERwwktkudJdSC9j9CVh
 0iBBDi6rnLcgKvjagbV2pwguerz/xB4=
X-Proofpoint-GUID: jAxgkHRHVt8ZyZ7tLwPaNl9KO9Nzw6TV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_230208_436647_E98D84ED 
X-CRM114-Status: GOOD (  11.92  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


