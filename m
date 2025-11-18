Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3576CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=; b=LppkfFU+gRJ1VpQVzkiBkuyil5
	vmpEFAoP/FwqvzIvVFemXOn6UhUZtRYd9yUGSDbP02jkgddyS4NBdEuV/dGINpQiCJcEq/qxccBFe
	iCHnMGYIYC/pJw+F8iqP4o9L1cpWSVFijc7miqtTTk/LzVr+4pWR1oxAZq/klShOTTFNd1PbAhTxg
	P11+LBHBmbaL0y0i7DrHuXaBNdn2s6IpAltz5mgl3Fk78UDg15XPyFWja5wrSdLWp3jSx36dwjaTo
	w8gg4KDYMD6QtwzHUKVuj3UV4mpSrWQqNpzxbi3gWFtqMDUjc0HH//jLV8pRUktAa/YUWezV7HP/G
	+cSHu+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTF-000000006ZS-3m7z;
	Tue, 18 Nov 2025 08:53:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTE-000000006Xb-09yL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Nov 2025 08:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=; b=T5Rfa8Zyqkw9sT7L7TiWBVDk6Z
	oU0xRBx/9GKIrxUImjT8x9rc74ytvWVfCRQl3oZhc2Z7sBcw0fnx5wOtbCR3Iyx2h/pQKpGTEE+Uu
	uPW+Wiw9qofoyxxhpEv1AosObHYG+qIzCUoVyjM2SdF/5726swKP85n1ZzTSXaEimxdnmAw/3+F/b
	6+4c/VtNP3mT+O9tJLfg5vQmvAk5BCm3eErZnKIsd2gIUxHNwrlGgGaTngoFTX+KC3vWw6hF8ZYMh
	X0IGBSa3OggkEj8GqyhDH3C7vbz1kzAOjx1t5oUWmIj9dWHmOo39wbBfBWXrOU0yST/2FBbZmkdWi
	foBRILhg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbW-00000009Cpk-2LQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6g2l4623728
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=; b=LkM0/TTxA6iBg2bp
	caqvCVp4AjAO+m5Yu2BZAMmr8BO7QlZoBeEw+Hflflo3pG/0iBP8C5s7vXjiKk/J
	R1bCYLuvJ+V0DganVweVFB1qcAgnVXA9Pwdxx0yCBQ910NYtuU8EC/84LxjkRDqf
	Tp+xO9z2tVUlzVQnxkTCQPKpHDSOxn9VWHG51GYoEgNO9qWgcrEQ4WBccmf4G549
	78m6z0UOZQMO8T8JtxWZ3PW3bBT7NFb8bITNhHSxJZcKoqCjbauPNME+rgRUF8Hx
	ktK3Q+oRU6eDq/rReA3pk/NEMoIPjmI/Nb56Hr3LnPAy7Rx/o0jKpVmuwJjiNigZ
	QCoHig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9st1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso177425605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456025; x=1764060825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=;
        b=S8wpgdlURNBStYRviib7+dED57B5Jj0BN96eTu2wv4ThIVFh2cwtZZw5nm5n0I59Tb
         13aeZN2S6f9NgX5KJ5NTx3d80lcaQmHS8D5yDbNA31+3fR3lcK1dWPAgqLH9RrQR5Ixq
         yvqaID+KozM683wM8+CuvPyQ5+jBLgCdlMh4+Vfia/NEK0/AE9lMIFrnbq4SJHlrfr0B
         tgHhF3DcgLko4u/rcVPnwaYUfg/FRXfY4Ie/S8Ejuc490muEEesajGOkUfhiX15NwE+4
         xV060J48ZeeTjecmnBoqcyFhBViS82oTpwR9q8obQiuoLr7K8Ig8oX+ZBx8Xgdkptfit
         Ei/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456025; x=1764060825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=;
        b=NiwUJs2ULNdUWi5j9qPz5eb7ORWAxxuEq/MCHnHhq/O1auFrEWYQi6uC8L9cGKr2vf
         VkQhmLxgX8c9KoGrPcq63cpVHetd+wx8lIPRMqDIQZbwVqba6HShfkzEzaYuWVGNhzBl
         dhdGsog6BYcUFtVzkfcZzgIuWarO73HlNq+KidQv1jT81hUH7pO0T4MSIa0ktiY7DUIk
         NMrumUF+6kJk8tpiSzQou372zs2IsPLuiDfxaxIS41kyIbn+Qs81nfwskXBSXDhQdkZJ
         EssH02ui5I3FLTmros6uFkEKkYVT5oMpTZh1XOneVZQb5fyMio8tXgTAOvAIfCQj6IXw
         KXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+W0obrBVNPJ5/j/EbfRvfmYAJhYjfPxRHS3UWxqK4G5a7JPIrBVDKSqy+Rp2rjLPtDLt5MtjHRAYfVLICBWfE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5LfrBCfrLWcdKMBqFccpOHWC9hWiw0xc/ymDJHmYVm3hOh7QP
	E8Vnx8ZBeIPg2NcVK6M5Yk9odljT//7U2p/WxEaek95v3Re5YYYzzgHxv18NmiFG1deqnBye3pf
	yi/sFhfCnf/KXI7Drh+iJd4eQ10Bw0w5H3rTdtowMQQM6m3Z48YyJiwkZVrIobzec+W0YtAIQzP
	jcfg==
X-Gm-Gg: ASbGncvzWKzxa2D10U8hZlBqUyY6lO/r/q1uDF2BA63TEo52C8tNQCPs1h3P1+0C/vU
	w90uyHnOYkXl91L1hehYVOAPXtT6IOnEcMFv1hcDfju5DBSfetWIvqQk/AmANKNdCS8hvJ/OCJu
	hH6fcjKLLjFhfHMyyEIkiDSidHmX/RF0ZtEPsbUI8Qn00FMuAu0TfpzliCZ+ZGl8ZgtAhm0WFED
	JdJ89C4F7Q0Q1EUMsoEfZyzSscQ4G9h5WRPS90daaQpHcNjU60fqS50LN8W11EmL/2lQGWEC0az
	dQCbzr6AUNPzxwfqJBa4e2ZNDEivQMO2YTzEoowSbQrKQI1q+t1JL5AZ7wi4+eP9U9z9XxNGFPh
	oPfdRVIK2Cv4OyN9UECjzFqM=
X-Received: by 2002:a17:902:e84c:b0:295:9e4e:4092 with SMTP id d9443c01a7336-2986a76b624mr185293645ad.56.1763456025383;
        Tue, 18 Nov 2025 00:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJLx55VIEQR1X1kdhaTupHT64CD5j1PJ74J97Jx8OWItPIbJf1c2CruPdv9q63aQsbVJdMRA==
X-Received: by 2002:a17:902:e84c:b0:295:9e4e:4092 with SMTP id d9443c01a7336-2986a76b624mr185293105ad.56.1763456024830;
        Tue, 18 Nov 2025 00:53:44 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:44 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:46 +0530
Subject: [PATCH v4 19/22] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-19-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=984;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b8dhLGeLQCmbMQGCYbMJAVhuNtUDEylRDp1y1629j4w=;
 b=jOmgC3U/mxErhlMr4MADnr67IrIUEIl8TZO8WCrxFy8KxEMIAkZL3bL9elKhtgNJKsYb8oNbp
 LrlluiY4THhC/9gW3BN/csHmcffGEBaqOL6sP0AXVDDO4ygLkT1IjBr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX0WrjzEdqJviQ
 0+OYb3ddFYvUuk498nrl1F00vLSrbDLcm71TiOZSRg/qw5GPZrR50Ovd4VI27tP6OG9iZ886jcr
 3ZV/vMEx+JKLJLe4Hl1D0cCtnBzNCle9+L6Qf0IfcCNmJVuaOAbxfruWr5DTXl5lpIkO9heSeqx
 1nMhipspZiE7I0V5XtMiTGbFDfPDztnXse2RvIkdXhiB8/QQIohbfx1+IoBgrNtXNTMqy9U+lDi
 CIbXzPGufxn4Vv9LG4FM6JiQBneBWWofRDkt3Sf4zECZcmxRokXZIKVLJ1tI9UD/pMylZKLXxC+
 NZzNdH9B89Jm8mEHoe7eWD6ZUKMPt+adnqcrl7E+LMpYWjfP7tseTp7yDO4NGsJEyoYm9qyCURt
 CaCUdDMXWpobgwFb+KynSNZjCQCczQ==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c341a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nx9Ee08JJy_q_36Bb04A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IbQ9OPFkCc3DrSHZWdAR42urGbjvdEO0
X-Proofpoint-GUID: IbQ9OPFkCc3DrSHZWdAR42urGbjvdEO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_075823_155920_965A076D 
X-CRM114-Status: GOOD (  12.88  )
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

Update the devicetree bindings to document the GPU SMMUs present in
Kaanapali and Glymur chipsets.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..c9efdd1a6d1c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -89,6 +89,8 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0


