Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5206EC35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFn8jUQoU8QET0Q7Y2/H3zZJ8p6JHV7h1jOFwob8Aj4=; b=UTn9vkHi7O0uXr1Mae4VMVQ65p
	wlyj9MBVaPLy7fTFeTv2iXO6IL3Eqy1JJw1p/gyMRBEJn4T5GvxEfRHza2Dm3gova4CJM4LXnC+pt
	Wc+rnefsKf0aA4Pg60vMargCVmShufhyKeEVONbD6t809AUBkouhNYTAoxaCtqzKhvJ2jpb2ih7K3
	xPJiZ2Y+Uc2xksJK3pBWFwL04TEp6zXP9G4abxEtuqjslMiMoGieLCyCfFNERV3Qj+mUfWcvI+uBc
	wLzahwnAMZ0lxG/iyhu+y5cKJnck/v6+Jcf7FlIOPKSDuQgAnPvEWNP9pE3dgC2UqZ/NwBYswkpRr
	hgdXE/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFkk-00000003mJu-3ytE;
	Mon, 17 Mar 2025 19:03:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWK-00000003aQY-0gH6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GFn8jUQoU8QET0Q7Y2/H3zZJ8p6JHV7h1jOFwob8Aj4=; b=CeKFWjOxoA+qXqv+so/d0qOJQb
	Mw5lpjteKasGHOq8nSr7XB2vkVd2dIQyzo7qCTySO+lw5Lr5QDPvf6ZNOJwV0q1RIelbAX8cS1sR5
	EdrFawM5yAE42/qp61QDIllsRtJQJ+yoGzlPzFWgDAWauJlfzabK1T+3/7yvCwgaR6v+biS+AFZ6H
	sNS4mLaTjM4/Xi/NpwTdLobdGACbpTrEqlE/zeXRko3KD+6nAiLtBY5ROISDz9zjE01YV81rKKxQ/
	CBEyc7aoPFYhbH/MPlnIlG9/9PXxZeFkPwLI7ZhfwEjrsBuP6ypMmYFK2AVxK4Q01tyJSi49MzBg+
	k7R7v+Fg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWG-00000003Wyx-48lX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:44:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAHHuU006941
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFn8jUQoU8QET0Q7Y2/H3zZJ8p6JHV7h1jOFwob8Aj4=; b=SfmNeVzLG4UDcuTC
	nRUsPCZJizAmFUG4D3puygisgNUP7p+B0pUrfLWbbfX8W9FdMbKA/cCciKm3WBle
	CJuqXf1wIP3+WLN5/lnAUVIih/QlCi99dXi05yceVM5waPktSUMfHQkNK/0CFdJR
	pshSteSDeh2HKpulRqtO15hcVejDj8+XwjEbRNZP/4pMEYcteOFrCTugS374Dd4h
	F/oHVMROom/3bqv72e1DzLwSZ69yFNRcFfJ6GLxhbnXEodRw76Y+N8CrLgiSGwGU
	VvA/49d1rumsOqdw+wdgIenthSV4T6rnXjRB8FW8WT5zAkaXoeKpXwxEUZ+AEHtr
	1B3S+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7wg9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47693206f16so97741891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233494; x=1742838294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFn8jUQoU8QET0Q7Y2/H3zZJ8p6JHV7h1jOFwob8Aj4=;
        b=erUXHQXUkKRH8u7z6NFOqvgqlfiwg6BOg4awHODYTK6sJnavW2/8SGZCKb5u8l4hme
         OMGz+3YFOvctZC5RvyiFHEod+4E1BaxxDmXcw34RCpGdcE6OAHqihO5ZZspcmz8z2jox
         WQ33KPzwW38wkWDE3GB8Gv5/ZSCIo3Y9fD7GyRJlwbF7IAHrPCPoUqzSm8LAnyxm2m4F
         dvV62G0xlESjc9X9w+vefBseI9Nk43YKNWX+RFtZOXI4L8aLLbkXv/CFolV5Ng/dZE52
         azI3jV7LnD4JgP2GlMza/VimonbYleGBtkVSZdNc1KeyesBiaIln8p/6SusVQsfNewHp
         GOcg==
X-Forwarded-Encrypted: i=1; AJvYcCUhqNF74XKs3lZHApJhyB4AXXHeUAKbQpojFiG7A/FxRNpf7VtwYgverUhuMjdO7U7oqFPo6IHtlELXUDkxEclK@lists.infradead.org
X-Gm-Message-State: AOJu0YxJj+PacIo4ZHQehkP82UBiaOMeHYNXZzicpDKegJkKzQxM2UiV
	G0mcuVF54oHMFZJ7TxuuoftNemLvYeWz+ayaXbYgkLSXNoKFmv7kwtlSzLHlBoaQ3h+GNHMFkXN
	jHGKiu9cBF1/SngdqzLIAjAtsq/9wu4paKTDS3bOtrzqcdkdP8Ib+ELJAgXAz5Z8AEhTbrksvJg
	==
X-Gm-Gg: ASbGncsHhZMs07lervyLGUXupZaxvUsAWZC+mlonyJtmKNCwycoddkpLEU3zd9R/gCg
	AP/xUetrguWpoCvGPzjyAXdB5m8B0kIzG/71BMfiv9PQd2K9c0Kock8XfY1Rs0MI4+wXJSA5FrT
	wRK75mTiuMNuLfUMIqPCP2iYOm0R4vvIVC4BE+mnYCyHF112HEZY3migyxDfvfvZFzr67gxhGry
	szoVFd2wgNMd2xEH773Lm/GVJKueppvywnSpWi1d7cIeWgTJSfa33MK8YPDyKVSBlCgT/Q35gdZ
	88DLEHezBHgJELzCNegBqdTHH6mwMjEZTy10yPje4qlZPN4xNrP69ECeIKff9Yn2wrWrIT2FIg/
	oKo3A+wDcmzt0JMZiAwy4GPmxsfMV
X-Received: by 2002:a05:622a:114b:b0:476:6215:eafc with SMTP id d75a77b69052e-476fc99009fmr8243361cf.22.1742233494509;
        Mon, 17 Mar 2025 10:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx2iqeGGhoECD06EGgynljrm1UFU3tlDa0Y7tDDJEaoK3LeQgEoilub/oM8WSkmjHqhW0GDg==
X-Received: by 2002:a05:622a:114b:b0:476:6215:eafc with SMTP id d75a77b69052e-476fc99009fmr8242831cf.22.1742233494160;
        Mon, 17 Mar 2025 10:44:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:38 +0200
Subject: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGq/9ihy3yPuzqQSqDIFv8MiEa9/Oun5e7X6iSFdWZM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+GFIxO2iAYR/ha0nJwD2Eg1yX3HfVf70gE9
 iv5i7HiwYyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1S3ZCACUOskqPOEvLD+01HgOWPYEMTBKeOD3R8D5mw/V1g4VsuJsnarn4H9Wn4AS5RFONL1lwek
 ArrfaM0aKFgphWcaMu0v+84IJxdrqpynpdcxZDrDeUletCeEgDgh3Jqw/IHoqKqTzcksEsnwlgQ
 Kl5BGF4KL5oypxeoqSomLu+wfO+5Bihbdp5YygDCa6keiQ8FQr8sep9fQRASPw2SGtM9cMbUDV/
 3rRhy+mv6Lp0znl4g6MlbyFhDy0YcCxyCVXD4dqumtoX7Ck5anXlMjCnyNQRCa3nqltK16L3GHg
 2sUeDfKK1geSSi38zzbQA3vQseK4c9ri/3i6FkMudcyxOdvx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mkzNrlpNw-FRUQCr8abCTzBDRP_VOs1b
X-Proofpoint-ORIG-GUID: mkzNrlpNw-FRUQCr8abCTzBDRP_VOs1b
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d85f97 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pxxQaWppw0d4f0HdsPoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_174457_333826_FA69E0FA 
X-CRM114-Status: GOOD (  14.48  )
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

Add schema to properly describe the SPS SIC block present on APQ8064 and
several similar platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ccacf6f45955177dd9302107e09897bfa2f1fd78
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Smart Peripheral System Interrupt Controller
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  Smart Peripheral System (SPS) Interrupt Controller (SIC)
+
+properties:
+  compatible:
+    items:
+      - const: qcom,apq8064-sps-sic
+      - const: syscon
+
+  reg:
+    items:
+      - description: SPS SIC register block
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interrupt-controller@12100000 {
+        compatible = "qcom,apq8064-sps-sic", "syscon";
+        reg = <0x12100000 0x10000>;
+    };
+...

-- 
2.39.5


