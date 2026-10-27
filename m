Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lsHg4Xi4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQtkpOeW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zef4zKQM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=lsHg4Xi442lXe/
	hR3PwWLP0Rd3w1vfwdHDAWjK9jEfMQeiXYJHXil4L2Ni+8VgFgbluM6NHq16Xwrd3sAovd1o9F2+x
	uVIfbWTRNySvy8ql1IDh/M08fJs4QAFeeFRuFaG8zNpbl8ci9sH8SOItUKLIH+Ix3uFeZWYVNwgug
	GDvAXbKLsmIBLsj5X0kHfM75BRQUVgSbwxqThckLDB1zivyayZn1iIvUbb7XQpUIrdF8MyMxVp/Y0
	ewpT4cfeG+ZBor2589JcMRVH7DDcAINj/Wq+67XYZMjKLkWlxoRxpaaH4Q2NxRNwuAm+CAAYLnkjS
	Z+SfTov8TAJdsu1NaK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgz8-00000004l1z-1Ug7;
	Tue, 27 Oct 2026 13:13:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyw-00000004kvy-1UAo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:12:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe7q2432842
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=ZQtkpOeW6Rr7p5s9
	PabEUgicQCE3V5bKyMyuJXVsGGn5t+hMypxiiQM9LOFZlCLxQRFi+N+6yREudGS/
	t5QGn2tt/URhcve/GiK4yFHDEvGeuEG1P994xAPfXNg56quIEdKRDZbpJRrfgkrk
	jzuBfCBlnYILAN6RgkB1IAhN4ZyvOVEXaM6+eZm+J7c9qhIqlmXvW8zLG3srmJtQ
	pSa3003NwioWmUOGYz/0rhPScbSuV1Sy2vJNHL72A2ZygqNlgremXTy+beLDq5OM
	QYdNK8EMdZCqXxzJKiR4VEHKNcXDaNRlLfa/eN2Pe7Y3qMuvuvbuxGqXVoIF3Mc/
	6Fu8gg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kxc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:49 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8acc7fe346cso65624227b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106769; x=1793711569; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=Zef4zKQMJOZZx6eGSbb6k1vHqA0ZyIyQmHPhFi6Ll8MZrVZIGXXnz5FMAmJGlLGO13
         MjABAAo0hOsJ1K+sgSOHXxXk94TBB2StOJbCSuZKp/FOvdg8x1BCFb27CRnSWqgy4V+x
         EyYKfKeXMcuZlxpaSxXLGG8/ycy9nbhbEj+hKx8DjtO+IE73z0WoPt1nwKX6EeZiLi8Z
         Cu1yMsluueq49jDD+M9o0tI7lZ7zBd6SqvRDaJg0qgRbZyBqs6EsO6Vi5zBXUeWRpTZt
         u9R/m11wA1/7NrkSacxSZipQtPiIkvsvPbYquXxR5xHoY3Ge/XByb34GCohdRddoz2Od
         PjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106769; x=1793711569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=XtRt2xniiFzgFTVEDh7zlYb4ReGT8cT87EoktKmBe7tk0q0zf++gRlRs7F4t12NbgN
         qb6kOboYcQck07L3qOwT1phBVS5wkUHFoH37E1Vh0ksiq+YAYPiIVGPsB13dNMvoUHfh
         aZzaDIQcFp8CCxIpdgPVhjT5GsX3OV+zESTPdvWJ3bM79q1mYirWINHBcj6QUP+NrerB
         CyrkxMhRYH9IKiWy1STouVd/7BoehSXySmWDKMWC/YVcs2l1yf93SJfN+v60h0FLKxni
         zv/pbZaIDyUKoHmTmRFLKOeIjUymuSHNZs+TzqPqmparG3u1IfotrLM2CPnCpdI+QAWe
         S1iA==
X-Forwarded-Encrypted: i=1; AKwUvByxd//CjRrc2PkpOBjULsAYvDTexm3oYvwoBB8Y0OCpKzH8+yecU3op7nyoQS51h4nlyO88elzoHxe3Kyu2MKt8@lists.infradead.org
X-Gm-Message-State: AFq9FYJhOE1b8eLzQViK2S7syLPeNOn/vYRzk5UNMCFTxaJUlaE1ylvf
	JV/hVOTmqR93IA6wZ8Rw8pGQXLRPICDhWt5I+V4rhiOo2lZE9A1K5M9d9pULM9RzXlgQpgj74pt
	3baSsGmHZeLwpNorcBHxO6whHwEEBC1PYQeGYkJTx8zv2MDYXZ1iiUsHxE2cQSR5U+5kF5laDYz
	3QyA==
X-Gm-Gg: AYBFou2x7N0vW5ffxwKflVzBzhbMt9k47glKHZdMf/mPXOdCnAZTt6zmf2V79Uv7W2Z
	ZObt809TpJRw+fkJJqILKQybC8ZqMmVPjfTAO4U6H0v9/FcouD6FpI6jQYdTjDu6YTyeoOPjyK3
	MtMi/MVuEz+UKj/0gIDuTaMTgiGYaU7Fq2OcNMwsyb8gaAezNCUa4vl1EXTiggEgs1JqyXE5OyI
	9Q6/Ris2hk7hqeTAe1jA6g4UQUV5uZ7tMj91phXEv/uKehUzsHztcaNK0kFta7+LdseYJKZOb1v
	sZ5/S/J5gBK+OwxaXUtIPqcPyYuIDVbM42nca8L4cpsnlqtSgb/69B5ssCgJBuDQf1ASThH9Qzd
	ZxCfkoym3gyFkIMFiHsg8nNbjKC4I
X-Received: by 2002:a05:690c:e3ea:b0:8b0:a8cf:f424 with SMTP id 00721157ae682-8b166c2e9a4mr82725867b3.41.1793106768500;
        Tue, 27 Oct 2026 06:12:48 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ea:b0:8b0:a8cf:f424 with SMTP id 00721157ae682-8b166c2e9a4mr82725537b3.41.1793106767943;
        Tue, 27 Oct 2026 06:12:47 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:47 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:41:10 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add CPU idle states
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-shikra_lpm_addition-v3-2-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ZnLGNV9oQobHeXgDfZngn36a5StIkhMbOX9ZnhpmU10=;
 b=XU+jcypzv9RuT0psWnM/ZKwJr563SNpvvhU4OYtE+INNFKYelQt+/uWw9MwD4F0tQX1wx+z4w
 8mfkJIwQqBHA7Y9FoVhjroZa/36QvG2EgNzUqJ59AlvjN+8+QMKH/MG
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX9uMdjEEdjavu
 vkcOoAWBDlNN0aN0zCe60k62jFLvIoaJQI3iKjzxDnf8w7oauEayEIA9RLqbw2RSP0wQqk5MU/m
 oAmQlX52rt1qWBL5YjTUxOoaj2hJg+w=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0a351 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oZC7bev9MFt5y4JAElUA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: GFhbgGOIX8tHNitmP15XoGn1c5WVLD8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX4Exb969WzvoX
 sny90ijdJ5TGcvo0KskSdCo0sqDSMzvOgJU5tRimp9ZGLxmQty+gpsd3IPcgUBoYH2NMjJXa51t
 2Ee2fe6g2TZK1zWkWWYvWx7SeM/4R1OIkLu+SdnUyY9W6F9v6K9JVGq/iv+ovC3dld9GEIf36Vp
 /Syi4QXTH8vdnxmPJiCJUxN4VQjlpb1o5+hEHJIizlUxAIKyFghhXVpc/3qVF7ytjIVEvW+5HVe
 ZuPavuhGLH28frdliIrY0/s+A7J9ro23VPMB9acWJSVojFSRVshwZwwP++I6PPveN1ggz0iekEa
 y8J7cElug5j1t2NKZwcxCwOd/TDIo2YRp5+4zTKO54kKqvDIjNa8LzXsZSCOsrSD+O8CnmU8BNW
 +mrkYEcgynugabxddkjE+HUAYZoZ4COPKAk9/tkKZA1+92o280zeBMI2GvVoG2wkjwTbDh8ZLcs
 fgDmNlF+CRdT4TlTGlw==
X-Proofpoint-GUID: GFhbgGOIX8tHNitmP15XoGn1c5WVLD8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_061250_405019_214A1A51 
X-CRM114-Status: GOOD (  15.44  )
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

Add idle states for the CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Remove #power-domain-cells from MPM device so that the driver follows the
cpu_pm notifications path to handle RPM notification. This avoids other
probe dependencies that arise due to MPM being a power domain provider.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 +++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..74be82ae50d16c7dcc7bc7af4deb28794efd47e8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1


