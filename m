Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408EAF436A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=; b=2TFb+z53jQEC/P5+hbJbD6tPg8
	XPXjnD6nsi6Y/LtS+4u/SA8iCA1rPPlkR6qxS2fsOFlsePhZtxjm8mTMMq+KdqS98iP2sznta6hET
	bsI2pfo+DDL07jfgJPNisSqUcjdvuLgqXp7QiL4vbbRkLWp28tIcQ+BTSzaISDVtTOEWVy2RteEHg
	i1PbmxAJLWNx8QmXN2ngPQ5S8FftYbU0Yutihj3hT5j1r75cGVboVZles+nX0Un2rS/y7ZzuTAqHE
	qxAI/RpKYCfHDdcPBMjW9LcnE6ZXnh4au47hK8c7gUdfJsq6zxR+NZuE39y+bR39zdhqs/b2Fz/WX
	JEDyoWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjtc-000000047JS-1BgI;
	Fri, 17 Apr 2026 14:10:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjta-000000047Im-14BS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:10:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HDBvVu3438201
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 14:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=; b=VChwwG/2FWGSCTBx
	Q7wfayNUO7wd03dW3G1G6tSCl+MEf5YnVHCtR/kz8UyuBEVtTr9WrmI3EeRNczAZ
	OmaYCqXLhyvQWwBav1q19M8R/s4OxWOnqm6+GLU8SuSZLJkZr4FXrL1yML0HnxGx
	VchGyjEwRiuWnokUkdF0ltrTOej55GgXf0npFuzPZJu7/w5ihTM/1gaA4TMz6klo
	TlwDUmG5Ew8J6GIxhGrgniMaciwH7mF6awqNyw3DrH8PxJbLAnxb4sQrUe5vJWRo
	pcw/YVgteXrkVDQ1sYg7HNWObdotjL5Crg8tsYM1IbFsr1Zn1uQ91IvdfEi8mB/+
	fI8s3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88shqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 14:10:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so1112465c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776435007; x=1777039807; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=;
        b=ckeeqPgXKaZijEcHpaB1hS+qTDhvPtYzpCnGPAfbEkuSz+TEdtk6ZkxTJEKJsoUTAq
         YgjYzA5ZObLw1c05w5PMb993nBWDQNPiMkv0omZUWlfkhmjDU3uB/GxQPtF8E/HtHHPK
         Ai7rycghQ6C9HI7BRzlbhgSSbF6ejCXKRLMzI2svpGJZbP3zfzMoUnytOYeGhOgSZFVq
         7hRfO4kx49TMdjHkiq+wA3tK6Mk47EvuNu4jcAgND+xuIVUlK+EMILkuV/vT9Kp5xtkQ
         SQugDRTzXkmmeGEEN4qL0N+74B13oefFQcXEvVyx9eNE8SnaffWq+BK3SOTD85d9KLSp
         xMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435007; x=1777039807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=;
        b=ew/1QjJixVCcCrotELWMI4FACVm4QHg3ilVobdzzXhOLBWcvane+Q+EiJxgf9llzCW
         MF/JRtMT3eKIBnPwttCk9vjlnFUmhxWZJS1Owx8rWU3eyaa1Wz8Q+Ka+EST9pZzxSiRj
         AB3HWPVcs7SYDDIHRGvXVR9E1Q6boq01+mcAk7npJAc97WQUBn1c4vXkWMXHR1NQ+I/W
         h/TNriRhyv64ncekERON2L96iQnmG1dzt+8VoalOnQTF5JMQolhWbJngX+VfH2BSzFz0
         AHEFjPonVL18eYyR2Bp3A/r7rkRSzG2h36YTl4hPIfLkP4URdbt47lgA3uoQGJD5RboN
         9C8w==
X-Forwarded-Encrypted: i=1; AFNElJ848ushIg49dfzoa38CZmhwZrhwIbCTrB795YMI6VF6GYSG830twzxjeQzLQSlB9TeFjT4NP449e1asdsD2IHH0@lists.infradead.org
X-Gm-Message-State: AOJu0YzlAivqY3gaSFY/lLU2PiF+pRksS4Dvf9dpGrPp+dwRQmZ+9SaW
	I1jt81WYbEJgdYi9fXgPrgmv32UYqp0+7MqAkhfe7mYLUX3/WV/EkY77qHzarbSvucn+wDd8tGp
	4mecsTu7/G+dYs+6L9Jos8PUaxO8IQqM5IzjIxXri8n81lScfOBXTSMUvQJs7FOGsrD/W84ww9j
	iNuA==
X-Gm-Gg: AeBDieugLm6SP6MpSu8MvWU1ZplkafhLbCep657/hOXGbDbAci2wZD2/K8PLYzLWjjW
	gHfl8RZJRulHICNMJnbau7dkect+qPaKSyoMrP7YvpNlQgePn+4HbTVnvMDgiFKKGb5zvAblJDq
	c23CgQsy7YAUQUgw0E/a6RsaSC5gtrFlTsBZlWccPFc80LrNwIJGWBzCbB3Jo2jzJRjNb+4hEsE
	4v03NxUm5P21U/PBLdLxZEl0trd2xrGDALLCC/T7s5smHx5FBW2eQICfvssaaaMPnSeKrfulRAU
	Ty9D46Ykzm58sW9Z2xscPmFjRz2qafZABpqfMI+VTQyq37iJvAvKVhVOvAuJeL/3c1ox+bkiITA
	13P3FqYusmEh3oSsJdy5WaLb0h2/U7Cw5OMR4+75XwW0a3YY9OVsYu0SuP+xSoTGvZuBrMK+FHX
	k=
X-Received: by 2002:a05:7022:6728:b0:12a:6902:ddce with SMTP id a92af1059eb24-12c73f75d0cmr1432465c88.10.1776435007250;
        Fri, 17 Apr 2026 07:10:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6728:b0:12a:6902:ddce with SMTP id a92af1059eb24-12c73f75d0cmr1432394c88.10.1776435006470;
        Fri, 17 Apr 2026 07:10:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm2243346c88.15.2026.04.17.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:10:06 -0700 (PDT)
Date: Fri, 17 Apr 2026 22:10:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
Message-ID: <aeI_OPSESxxz8WMR@QCOM-aGQu4IUr3Y>
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zBFVqHidmJ3_7W9zGGKdqEZkCiqomZI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0MiBTYWx0ZWRfX3tcww8E5u1zd
 wYgtK7J+nda/3MgFasT1WxuaFjoFnrgQQQoxWkS44iKeb3E2U49SXGlOB+ugyP+FOABbI6u7FAM
 TRlHcoZnKkFN5kAH9IQSEISouRvHUEYzhwQR84HRpq8nhoEEhKByUrcHYlIB+vcOMAhBPv6iM/u
 E7GBCreYqz/XoPYVM4mGnWGPZnkauHnslKOknfTTO1FVf1TofA2d0mSYHPAq3wKyiAyMz0S9uP5
 7KhziPv61KvdAGIhZZILTokpKOREJ7pIGHPzCiNUW5t0fJJ6EIWdL6QFQzzEHdWmUoP3yflr1Hj
 HVVAvDKLa6v6Q4hsm2VX7G7dC0GwVd4gWmYyQQWQFjuuVsCD2Ks/xH7/BZFKAKB3j/5JBLjHlfO
 lodLmI4H4QuLg021stEvWCTAjWMyWen40LCOP4TW/6jIgal1TIVzsgNGzFkNplMfcNFSCjDsXTn
 pnzLgVy/5w2z65wPG6A==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e23f40 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pfcpBET5JRzwQ_8xOogA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: zBFVqHidmJ3_7W9zGGKdqEZkCiqomZI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_071010_410267_473FEEC8 
X-CRM114-Status: GOOD (  17.91  )
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

On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
> the compatible string for applying ACTLR prefetch settings to FastRPC
> devices. However, "qcom,fastrpc" is the compatible string for the parent
> rpmsg channel node, which is not an IOMMU client — it carries no
> "iommus" property in the device tree and is never attached to an SMMU
> context bank.
> 
> The actual IOMMU clients are the compute context bank (CB) child nodes,
> which use the compatible string "qcom,fastrpc-compute-cb". These nodes
> carry the "iommus" property and are probed by fastrpc_cb_driver via
> fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
> each FastRPC session. The device tree structure is:
> 
>   fastrpc {
>       compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
>       ...
>       compute-cb@3 {
>           compatible = "qcom,fastrpc-compute-cb";
>           iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
>       };
>   };
> 
> Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
> device being attached to the SMMU context bank, the "qcom,fastrpc"
> entry was never matching any device. As a result, the ACTLR prefetch
> settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
> for FastRPC compute context banks.
> 
> Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
> in the match table so that the ACTLR settings are correctly applied
> to the compute CB devices that are the true IOMMU clients.
> 
> Assisted-by: Anthropic:claude-4-6-sonnet
> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

