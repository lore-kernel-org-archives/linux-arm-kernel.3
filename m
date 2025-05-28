Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9BDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnTOhc1LJtROB/kjrDGcE/rf8BNOgI+khnoo3xpI+II=; b=1nV4Pqst5hJ24LN4SKBgIZ4zbO
	j0Gj6hzdlZrK2+ak4UrnPY/Tar0qyT1wjnwA3IfCXr2QL5pmkFb+gF6tdGlCcRGtz0KLd1GIeGspT
	YaGPBrU0sC7fMawtoG5+m8pOkm8tFabssKhde4MlteoEYFJeqUtQB5nPfL+snvpeP4jgelN/odZcR
	wUpDdsHVzzEzXmHnXErR1vrec5ATDibpH9RENMja2tMsHCwnSUoeQt5njw1w2CQKxVooxtA3ta9fV
	1gXiGQOeDVb5oV04n0vYh7QQYKBJR1/wdrp37A7c8d2NwK4MPKG3r+YIf18XpPm9yiPJoiqA6cDEj
	+lgZqm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGEK-0000000D9w5-32Xr;
	Wed, 28 May 2025 12:50:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG2j-0000000D8UV-073m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:38:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S59Uu8028920
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LnTOhc1LJtROB/kjrDGcE/rf
	8BNOgI+khnoo3xpI+II=; b=aN5i82Yzl4Ju2K4fPRuXGArnnnjQ0DBL/U89Uyzg
	YEusB0lLkN497fDAn7DxqHzIj70kAMhEW5GON70OU06rh6P3qKlC0Np0tUkIuSJ0
	kcIje/EoAeRrNKOUOYwwZBMg7Ft/3atT3jK1RVuY5HQaYzOuUSQlKpRq3ex8bvSV
	yuB1qeoxTR3SOLJHIHktc3MH40k7HVJFHJ+Pz9+a+tWaBnfbZHhMrilhxBcj7fGL
	r4rmWyA0Yc1dIlKMGXhbe7646KGbXaG7coCM3gWhd0TqpiYcegRTOXGN8T329k0S
	rCZVS6kYetIjbeZS4gKgB6I5yNZgTCGOU5ywJGe2kr0fJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf2js3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:38:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faabeb105fso41600956d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 05:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435879; x=1749040679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnTOhc1LJtROB/kjrDGcE/rf8BNOgI+khnoo3xpI+II=;
        b=IIc8Sp+8APk2xTSkoiaH6Hnokel1HhuDXaUjCddNtRY/nqzORi8ww6bLZdzuMOlnmn
         0yatcH6TsYUjqdxxrv0R9stvRxU74PmGFten7tRA68qKWCW45TKmGQeo+JvKRDbGEUgT
         snlMSb31XiftgpGSJh6oo5A2kD30NKAc4GjsQ3AQIlCkVsJE0f2MOjc6HI5oUr6vNbZd
         8toTONPbRdPQvSEH7UselnEyGNmocbsMjQAfwr/q2RcdzK4y6dY9RSIKt5f/ZZkfbVY7
         /G061J51qHe0xdwUgDYy5YyUpf/lsUNnDU6AbwAnDIbeuj0PMc0BsZRTYyeBVQddHckX
         X5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7K/Fyg71LgVUSVXRummoyj2eOG1IgfsC03/tYuDuEbWzI9hTPAZTxe1/kBhLDp7jHneq0RzPpufhVfH6+hxad@lists.infradead.org
X-Gm-Message-State: AOJu0YzrtQFMLE3p7i9kERAZUaokoKzECmc0VZM6V7GwKRHEYqm27dVX
	4ANz55ZLrc/4EYKvUZlH5HfN2FemTm9hv8PR1CTU6DkMmhMK7tnykmwnHx61idXruYfD4hK4l0F
	RqceV/PhFTXjlCdFGERfIiibgL9DYDzbq6WvKopX/4iT1qsAi6sh+d+RNdF+kDFcsgUaxT6AQEi
	ujgg==
X-Gm-Gg: ASbGncvIBEcnAROFcZ64MvVnjhuxh7f84twIjt0GqlFK1rAk8gEhyFDmzXPN94DbD6U
	omNU8bitqEVNkUdGyv7E5QF2L3TVjpiRNH0eJDsw4Uk75708yPYcIAuxP/ZwiH6NqsKRJAEn7f0
	P+mwJaGMgZJGBePePI7Crk0QWZI4jKzQ6gxhpr9UONT5i3e++tBn3igBiOyR+fCxho+rFxNbls/
	/Oi6wTiePXDeo7M6RFls9nvw77KwMsB/4I6AhSHw37thviKAwuNO9K/cfj1lUXOIKhKBwGrFksw
	6oe+socMSEGUR6JipXdcmggI1/m1OKevfOBYFjCPcZoKUTnwoqGkYpS0NiRwIEjKGVc2DJ2xUzY
	=
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256233376d6.29.1748435879084;
        Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf/wgeitoAgxxj9Q2ekKkeVrKgLV9879XWXLjEkhNeRx4XpQkYYovwYdM7CGYXKyMxm7vwPg==
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256232646d6.29.1748435878664;
        Wed, 28 May 2025 05:37:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a4easm265991e87.154.2025.05.28.05.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:37:57 -0700 (PDT)
Date: Wed, 28 May 2025 15:37:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <zybi7fyii72vm3dljqw2en76d4n2rmdicz7jgm5xdv6netpwrb@xwihqutyfa3w>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683703a8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J22MhVpkVBW5EiQ_9csA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Iuj3afhAtlaDI8ZY1dkMBRHa0dL3Ca_V
X-Proofpoint-GUID: Iuj3afhAtlaDI8ZY1dkMBRHa0dL3Ca_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfX+L3ZYhU0ngqh
 mLWSO1T8XNOQ4kbikznFwR0chWMD+g+t4UfI88/2UHTzU0TR6Je7IeFSPp94dOt7cZbXkBbJRpR
 BHjV/Y3YXA0gHuQHEV4KH8C6JuSXszDfabOmxKxb33CUCimtt2MONBLfCLC6Xnp/FJFq3q1zj+7
 GfsFWTxAjyAFi1qlwRmi40V77Ock2X27NYp95xFWSiSLCSV8EMJudTTjd0QrxIqLGzwHIZ7mWUW
 V3NWPbGAsMyLuUfY7BEgBi3Ma0mqtiebMkjOjQM7p/tJ/nm1FUhB8+mtH6IFsI4FGX4l8RUksON
 55se8nPxnZi2hXIuhY9ZOrrpnOcteB2MOhl6/tjbYauw+osOKk5x6sVHiqoc3cur0ykKUVfEDu9
 8QDGY1BSVGmgvt3EcCNV/eiLRnP9tQU34JWSf9NtA596a85kVGSXxXqjfd8NEb8KLoVcU+97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=686 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_053801_070004_AAB33A3D 
X-CRM114-Status: GOOD (  19.67  )
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

On Tue, May 27, 2025 at 02:04:46PM -0700, Melody Olvera wrote:
> The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
> already existing M31 USB driver because it requires a connection
> to an eUSB2 repeater. Thus, for USB to probe and work properly on
> the Qualcomm SM8750 SoCs, enable the additional driver.

Nit: in defconfig messages we usually talk about particular boards, not
about the SoCs.

Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

