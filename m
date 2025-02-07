Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D96C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 23:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmHzhVzFd5mif999kp1XJSue2tJ4TDlaIOnPujM17NQ=; b=wrrMc4w9RMKwnXfZh92IyzqIgw
	d3j0euzJ9dSGT22qXDp4d5Cy3hGszj9XBmEbx3iha2nPVIW3y0ckGn+8J2495k3RVTkOmeUg8Ow2X
	1qljrR4adw9f04k62Ky9UidAEjyE7aay+mICy2kTBBheoe/UARMI3qjwERKRFmN6TbzJu/X0O7L4h
	JRXFq1vBU10txuH3+KiGSswqUqBRsg09oycD9VsqU6sQnx6944r3LsExgRiDawRUTn6ntPTh0/Gj9
	x1U18LospBO+mlLl51hNB8JdltRlz7ubE0cOWqesVwFvVitac4+BR3CVtl3p/2911IQPg2eQx5RI6
	opiosWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXLa-0000000BTMC-1Zhf;
	Fri, 07 Feb 2025 23:01:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXJM-0000000BT2e-49Ow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 22:59:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CrSaF007782;
	Fri, 7 Feb 2025 22:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmHzhVzFd5mif999kp1XJSue2tJ4TDlaIOnPujM17NQ=; b=YeQnfY2jCZgcR5We
	v57meKi/o2EUmHcdnCKOFSUVfcYzt5MXeUhLvc/VGP+s1a6FqoMrV7Knl3Cy8SK+
	mnIiDvmKEwWaW9mZSR8n+fCPsTTFwua13QfprWhxiHr4XuDEOX3dyQKpkYkZaV58
	IPyRw2QPPOZ3nRxGWB9/UaF0BWEMoKeARHLXVG5heVFg9FMCnbKeUkiwhFrjBl/Y
	wnIbEIlzOQdqIzpSxHusEegxMHRUwpqO6DlBLEIAOBLe7Na57ablSa7ADilBiRMI
	RXlCd4+a2+RBweACb7Jo+Q2S5YUw8DE3lZZR7AWsLHqh/Y8LEK0x5m/50aLmIvaU
	xDe0Mg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44njk1sd96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 22:58:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517Mwn30008243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 22:58:49 GMT
Received: from [10.110.94.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 14:58:49 -0800
Message-ID: <46bdfe78-d10a-4824-b1f3-3c7cd9e426bd@quicinc.com>
Date: Fri, 7 Feb 2025 14:58:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
To: Douglas Anderson <dianders@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
CC: Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Roxana Bradescu
	<roxabee@google.com>,
        <bjorn.andersson@oss.qualcomm.com>,
        Julius Werner
	<jwerner@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Besar Wicaksono <bwicaksono@nvidia.com>,
        D Scott Phillips
	<scott@os.amperecomputing.com>,
        Easwar Hariharan
	<eahariha@linux.microsoft.com>,
        Oliver Upton <oliver.upton@linux.dev>, <linux-kernel@vger.kernel.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
 <20241219131107.v3.1.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20241219131107.v3.1.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JxjpuAYvZFMo1iArDtT1Tb4lYnvRByZw
X-Proofpoint-GUID: JxjpuAYvZFMo1iArDtT1Tb4lYnvRByZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=717 adultscore=0 mlxscore=0 clxscore=1011
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_145901_157861_581F145E 
X-CRM114-Status: GOOD (  12.76  )
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

On 12/19/2024 1:11 PM, Douglas Anderson wrote:
> Add a definition for the Qualcomm Kryo 300-series Gold cores.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 488f8e751349..c8058f91a5bd 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -119,6 +119,7 @@
>  #define QCOM_CPU_PART_KRYO		0x200
>  #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
>  #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
> +#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
>  #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
>  #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
>  #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
> @@ -195,6 +196,7 @@
>  #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
>  #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
>  #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
> +#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
>  #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
>  #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
>  #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)

Acked-by: Trilok Soni <quic_tsoni@quicinc.com>


-- 
---Trilok Soni

