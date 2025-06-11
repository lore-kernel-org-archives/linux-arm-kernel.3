Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289E4C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=; b=rV1iSeSTGG1BF9pczqxEyQE37l
	WpnTs7N+fdG1mnzGlMh2iDAfPSCFJ4F8X/wNTSYc+H9hpDezCaeN6pe6yHv4rt9ALo7TFnNUOXKlS
	uw0TysW/orpMNqHF5koMWxmBJ0JNbgz7/arpaZpzj1WOMHzPDszcU348M6I7fz7g8jK8grxVSJVMB
	UUHvNmM4yRQjFJqDNOkwTBXmO98gkmnv3aeJq6bwOTOe0RhpwkjqdZ1+CutD4hbdxIxAl54tPwz/C
	rCHqiqNyQO6vLp+IHeywRZCOoYxNARUeoT5BZF/rAabrPnLefUuv6keI0Kt327pqBLyzQRhxDZtTZ
	Eb91Mzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpQ-0000000AHFG-24HQ;
	Wed, 11 Jun 2025 14:53:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRC-00000009jF4-3Bd0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=; b=kR/YQX01VWsPBJv/XaUDEKVjDk
	nz8xU3weUY3Q4UkttBfwEdIi2IRj5t5MSnpVrUGFWhXjajP54oRU5X7e0/cTQ8ce0yjzk9PlZ9PGF
	3jEBvrQqJQtA+2YB3PtO4N8Mmj9o/rQYr2YgRWkIWE7MoeFPasSNrj7k2PpOD2jLcHToJ90Qz7g92
	fjIhzWJXIH/1bNwIXZcnbnqrN6Mv1clg/7nGOyFT0x56xsF5YnDdqWdwucXioxd2w/R4n8Cj8p06c
	SMbfmMs0AhVCqs+ejw1wNLrgLZsRga1Kra+4UFFY6GC01DmhjxgfPSLGHmBmQ+xgeQGVfGUT5rSya
	VBktwGRQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRA-00000002LNT-2025
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:16:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DNkD014226
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=; b=C0RsGiU/UHg7iW0p
	svVWXkU0RudSs9AO5l1NmCI7crNwyH2hWulQoF5yVRPLU6Mk/cf1sutTnEBNBlfN
	8vp0rUukMbBibpHBnVWJof2ELlPAWbMYV7Gzl1Xw+aHQMu3A3KW08zVCrj19JWtH
	PcVLqZqq29NMMKHEoStPP27WhjyvClIOI59gF0su8zTychqWCIgDWW/fAFV+F1Yn
	8bmjzOGSzucXTq9bwnNNldkyRkuqeSt/9DxSarOUaYi/lhZkfRjr9ngVPuLyyTwx
	30fXizmPwOi11Ue4ZnJOe+08ZYVVTDYvlJIIab9Ty9+ULKPC1Y19hwOGoLM2JoAA
	E8WQoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmncbrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74834bc5d37so6897211b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640562; x=1750245362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=;
        b=XFcWLyzGhbsKbKwYMKi/v4reUKaMuBVgtO9oWjrKtJuxcXxNadX8R6XQvRd1qz//fB
         6onZh985O/TrUj+YMHMLMCG9d0os/2SSlJwaIU9NNsILwg8nmvUr1dEhKjmMUmMncddl
         RdOy3LV35Eb4Fhi+MQ4qEHH2UG+9ue+V6/sXEHUCe+Yib5WnzEsWKTTYCg45RfWY45V3
         H1ZfopbBGAqsDl9T7rOXdDR5wy3l2x9lCYtB8G9LEhQnCeAbBBwqg11cOOk0mGphPc6R
         NoFY7+r6kPi3peG2201kR1cmfqlc4Zf9solfIKIFTZkC2YoyaOHqQsPf4OUZ+g/F3NPd
         yP7w==
X-Gm-Message-State: AOJu0YxR0X3GfgMDtl/KL3abk1AXCbcWrT6xvvexBFRQg8k0ZNm/r142
	DdiK71xW1YWWBqoLw5/n6uy094hFbQNxuZmX6vI2GZEWZ5kiAsI+2JKUUDrBatoAPRTSeIbfRCB
	XDNMIXh+o0Ar5PGUfABZy5K/TNbq8eRvuAQkasyX4YbyoH2tCOg16b0FRYGLJPn+sLT0OZINYTX
	k0nA==
X-Gm-Gg: ASbGncsuZV7crRve24XIFjlWUEQhqbKg1CWzIZOR9eNgymVeSZs4iGCWS0+BKOsoGbZ
	B/BJpT22SixxzdOpEUXdyAMh9AkVpYRrPK/6bG20wdAq3tk4RftxmUCwYUrgqHRF+03F+mbLwHI
	/nWf5XUdtunz1g1twnWtUn8yQDmZaisL9w4MxNK4wDauAcSv2M9sUVK6jYjUrKoLbzHHAqGjHxw
	bO6OL2TEBCaIURrgFyV3NDKE/8mwr66X/fEvlC5jr/njp9M7ObeYTZkwS7iklvVC9ZWP5ak9nTH
	8qzuHuEyut/AYhaxTfeWHBaW/z2/8YkL
X-Received: by 2002:a05:6a00:84f:b0:747:cd01:9f75 with SMTP id d2e1a72fcca58-7486cba09a7mr3858951b3a.10.1749640561959;
        Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHROg37CoLQX/gpU9C5YtRVK3WyqImgZyCmQYBDNqko/4jqswI6HbSmNXgi+XM35/6CERVSVQ==
X-Received: by 2002:a05:6a00:84f:b0:747:cd01:9f75 with SMTP id d2e1a72fcca58-7486cba09a7mr3858922b3a.10.1749640561603;
        Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:31 +0530
Subject: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=826;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lHxIg8z3r4MYFlwLi2deHZy4r/sg9/34BnWytVOD0js=;
 b=ICq0mXqikfLYi6zoSoY7dUbF11OEkSXzvry9bOOUpbQi4bPFyVr+Va+GQM0kxxwrsM2sVUL3o
 J5HOSoxdbY9CddPxQ42d6Jw8+7mjv5B7uHLuEWJY1k8LDyEMdilimZ4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: g9YSKob8Yqgj0nTDsLEBm0Gfqz0BDNsg
X-Proofpoint-GUID: g9YSKob8Yqgj0nTDsLEBm0Gfqz0BDNsg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfXw97wVqhNbu9y
 Ihh25jj2g/5vnmzxfUdr9Ivd0Qs5wfoFNvoP/Wo5pr9siz2TfRIAcOVzEIPYsNi5ZpuXoWnlH+H
 MTl6wo+2oGfEVRslEClHsb0JUiR7Txh0d50dZKYw37rGucuh34tLMCodl/d//0ccCHcAxW2koUM
 Pg0fOth64L6jdlNOc9SA3Ybxx4n2hkMpNk0AqJvXxpyepWhVUZBfDK6c2YTMZcqUjTjBjzXnKWO
 MCpUc0j9njCnEbCagzojn4hnZpV14DYMrI5TIiWxf7/F2GAwMhT0ZUsaU0YRyVdMFHTfaNWn5jf
 EDhkVB3DI8ByOb/ylHCIs8RVSVb7+rnMMVitE9atdh2QnDn1f7TlB8sYCODpnviIgARhhazdCwW
 A6sPwhVSQ2IDBmQ/JjmaZVH9Rwj9B/PvjGfrd0Tx0wuKprgkaGgN7K+6PonUZIJ9jfVJetRZ
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68496572 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=j--r9fh2p167zETY0CYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=940 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_121608_871250_9787545D 
X-CRM114-Status: GOOD (  14.25  )
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

Update regex to allow multi-worded OPP entry names.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..bba95799919eb52d12afa42354ed909d0ef3c627 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-?[0-9]+)*$':
     type: object
     additionalProperties: false
 

-- 
2.48.1


