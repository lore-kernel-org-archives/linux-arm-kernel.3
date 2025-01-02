Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045C3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wkxnVLKaPcVLV18GVfwTwoCPcbkICHgEPGRzwsz0BQ=; b=E9uAIRJuRfS1Cvzm7/+KnixJiQ
	0ZpvnjTUIlWR3S3iadphDUbvanhk9YBSGYTg5E3gnxBaREve7/kaTIvaFFTNQFq9XEr9BWDlTikhq
	amW35zBJ4/bNHu185uS1ISWFbnBHqw97dS2iJ3OcNBSVott0ENWwy8ECYURo6n0xCoK2rx50Qk4F9
	q5tSfc14+lHEkbMXDoDJarOenIxuu8B1kx5nodkHufWQUfRuMu+3zs4vdhFxev1tSWVAxUlw5S+dw
	ptKE2COCQqtITrAlIMQMS1APWL7XMiOxB7T8B3RsfjflopdaaxvYUASCLqZv7/uDOE6TEOluvuRbQ
	4GysKhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQvG-0000000BHcA-0YIi;
	Thu, 02 Jan 2025 19:31:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQu2-0000000BHRa-2Ttp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:30:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502GvWfW006509;
	Thu, 2 Jan 2025 19:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wkxnVLKaPcVLV18GVfwTwoCPcbkICHgEPGRzwsz0BQ=; b=RwR5Xqo2B2kVnS2P
	FDJAaSmVY4Fl8Uyn+xoAM5IDde5EyveBCg+GoMoeuqNm9wjqT5LmKa/JtTyL8DYo
	wJDYpIET+8LfFA/Akrg7C0yqobi+i6ZF029c6XEG/scUMwDvV4Vo0btYmIzZDG7F
	o7ypL7kEoRBkJCuYK3qvVsHEy16I47mUqK9IhI73l1M9afkq0TBJoPlDofgJEyqu
	5/DkIlBzBQT6/DI+809jYtH9rfg889x02rE33P2iPDIfhnOqQB5MNUxPrHFXSGeC
	sALNJQITJhM0Zu73W/Agc5rlAAnasyNlsIEZ54qcAf5drw3J3nOkXew6ZHzsR6Cf
	9HvUpA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wxse8akc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:30:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502JURRu016768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 19:30:27 GMT
Received: from [10.216.23.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 11:30:23 -0800
Message-ID: <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
Date: Fri, 3 Jan 2025 01:00:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Rob Clark <robdclark@gmail.com>, <iommu@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Robin
 Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark
	<robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM
 SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250102183232.115279-1-robdclark@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20250102183232.115279-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YDh91vVfSSkMzPYw5IPqAqzAjDs1CRvS
X-Proofpoint-GUID: YDh91vVfSSkMzPYw5IPqAqzAjDs1CRvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_113042_764151_C2DF11F9 
X-CRM114-Status: GOOD (  25.62  )
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

On 1/3/2025 12:02 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the weeds.
> 
> What we _think_ is happening is that, if the GPU generates 1000's of
> faults at ~once (which is something that GPUs can be good at), it can
> result in a sufficient number of stalled translations preventing other
> transactions from entering the same TBU.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
> v2: Adds a modparam to override the default behavior, for debugging
>     GPU faults in cases which do not (or might not) cause lockup.
>     Also, rebased to not depend on Bibek's PRR support.
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 6372f3e25c4b..3239bbf18514 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -16,6 +16,10 @@
>  
>  #define QCOM_DUMMY_VAL	-1
>  
> +static int enable_stall = -1;
> +MODULE_PARM_DESC(enable_stall, "Enable stall on iova fault (1=on , 0=disable, -1=auto (default))");
> +module_param(enable_stall, int, 0600);
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>  	return container_of(smmu, struct qcom_smmu, smmu);
> @@ -210,7 +214,9 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +	const struct device_node *np = smmu_domain->smmu->dev->of_node;
>  	struct adreno_smmu_priv *priv;
> +	bool stall_enabled;
>  
>  	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>  
> @@ -237,8 +243,17 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>  	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>  	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
> -	priv->set_stall = qcom_adreno_smmu_set_stall;
> -	priv->resume_translation = qcom_adreno_smmu_resume_translation;
> +
> +	if (enable_stall < 0) {
> +		stall_enabled = of_device_is_compatible(np, "qcom,smmu-v2");
> +	} else {
> +		stall_enabled = !!enable_stall;
> +	}
> +
> +	if (stall_enabled) {
> +		priv->set_stall = qcom_adreno_smmu_set_stall;
> +		priv->resume_translation = qcom_adreno_smmu_resume_translation;
> +	}
>  
>  	return 0;
>  }


