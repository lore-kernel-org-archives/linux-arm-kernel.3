Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=; b=vWWHmWXaZsgGnPBkCLWRQatP5Y
	8MATU56EEqfqtUDfAW03TIhEOEfsqTL7j6ZgJcj7ysLvgaD/qpL/EryucdzS49qKNda+n/o1CP77w
	HowUn1OVOAhxaZgGl5eDDmCIzG/yHW2OXSba35KG+L1jexjEzyl8am/ZoxSTDMLmSBvmNNhggRvqH
	ae7z7LtfoLc6nJlQzUeZDrHljsdEN1c+dgFL091Wj7S51ddheC0d+kOe05cdLL1yM6sG+AKcabw3p
	4LdkasLDdoMZQXFfMJJBosf0cyfq/brt8QhOl0kt8NtP9HFe3LwdeVlBn/KMvqIxMBI/7Kt0RgRql
	kPloF38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd8h-0000000CAXn-3Xan;
	Tue, 14 Jul 2026 13:25:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd8f-0000000CAWh-3Pdt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:25:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOAvY108380
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=; b=aRyaAp7aH5SEoQOK
	km6Jmp/T234j31falyyM4QXkeHCbrZbFztEpbZvnNNmXArVNt3FbJjN1WhbJwh5T
	2v8xcpJlodbeCawsXGGH/mEmKVsmcYyYcQ4ejfl9DQaiGcizak3TkjUdBJ0Mj3Te
	Tli4AjYc8O2MtQtAhDgf8bAfjdn9oWY/GLlXMDEI4+njXIhhnqeI7Ll4jPJ3cCH8
	oBxhFdUJhQi9o98L0UMDFRYUOnCBbT9Njm3AsTENO/q95S46WyLt7a5H7yv7Q2Ic
	9idLhuTPPQ+miS7GRBhHle4zuMkm2bpsfojeVsmu++KmOWCLriII27sExOkUQnoC
	omPPZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa9ufe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:25:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so96156031cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 06:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035532; cv=none;
        d=google.com; s=arc-20260327;
        b=fl/Vj4UTsYk4kwmcQK6l1dg4HKIk+IOhtX+N+JPEGIQ8yGJSY6z2k67Bbgwb75dMZh
         c6I3YLvHjkwdQSg4sqEcqBMiBZzG9x9CtW1qYxpopl/ctiYzK4s22wATUVhyOeFRddw3
         2heLoFP5b4V4NIwn7Sp/NZFQTUKFps7DEvW9gaDrp0HZpp3cxyY6j+O4DlnufSoQ16AX
         6oLVndX2wPgHL3VJYuaKZwJqfqlT83HuaGlptsVrmc0YijixR8QScn4Bbcnb2FQjhCEV
         ODiDLjIulCE05xe6Hc+iCqzflxg4t3uNdnf+blLoPmKj8Xh4x7kpONRCkHewPLE1opfN
         xrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=;
        fh=tB9GLv+GzK6NeRWf/4fDf43y4XbRqBzVbz6tJhzAZ70=;
        b=ACqgmdp3ZNEG83cc9yoxtAN6yfpksdBHgaHHOJav1i9rjiw+P4BgZIRt//dfORYN0p
         orZ12oPXrAb8SIrSyOfWRBu1BI5JuFXK6WBo+HV4K1D+jWGLXVI7l1uYqybOw3x0SKbX
         fC+BYhLlfV1hcQFyTlxkAJqZ4W+YLXodmGQ+XD46pOYJXRTth32V6OAO3M+UqBpofHqW
         BtOFjvCYLj5DUv5OqUWSkAB0ICqESySU1IUQHpmrLVB7K4pigcXQW7xLzpDP8PTof0KS
         OdjbrrNDx3RvuGF7eHEHqnO4LTgckDCstJaOJWILMHCeTyxAGLWh4unlmn7WdN4xb5BS
         7yFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035532; x=1784640332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=;
        b=V4qDQfGT+OpTCKJttmowErodEK8BmBWKtW3awrbZKwVDsa0ew+XxzmdGwCe9OFYQwy
         CkPGt+bMshAI3G7whYQ2p3ly/y/GEK4TXrwGjZ1wxkXKv2w3BHYcjBpGKsWzdjHfyoii
         O5qqrfHWOnVXw+uX/EGPtwfost2/1LfKbaj61SJKsNPDzh/mw8aHKQ3QPBH1Ut29W2+S
         ZOT0iLfxHq8eIfzqjjEcw/NE8tl/IXLKrSRHpIhbQ+c4+Uy1eS1VBuzoO30s94DGN0Ja
         HQ97MbV1jPzR+fiZ4oI/sXRVZ4vZZO1nzBoUY2owK8vs06Ii5ZwlsyuMSTeuuvykK7Tx
         GfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035532; x=1784640332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=;
        b=S7bLXYcavDAfLrnk94TsHYuXh4OeartFdQfpTRE84hbM59j8s8D/uOXg9d4vWrlQ6Q
         bNK/CLV/+zCvJyYmyKtrY7AD0ssHtHLi3XI5RATtb57VCFsqU10/ACyV7/t9R22tyaDF
         /UjSJ2vMMF9zD8TdvpIpLLUiVthEWqhW4kd7rV01TADC+RJuGCHw4xMf6F3mD0xl09sX
         jMURUfcLs3hjk/3s6cGLpBJqS3vQldJlb2Ti59hFak0EjTY4UtN1j9FAgVpa6je3VKdd
         QutCob8J0Xj7GP+z+MaUI6jnBhMR9snsCvsFTyRkRDw2C5FZLrYVcL79gR3D5CjdHg31
         EQVA==
X-Forwarded-Encrypted: i=1; AHgh+RptaRWDj27viFgZxXIy2JeHKmFxhgmq5A36lkn3To0qBzD6VbCc/EVt9jHPToTTGGqOoWaksLmExHz4RfZIHjan@lists.infradead.org
X-Gm-Message-State: AOJu0YxUI7k/Vqt7GnGHtofb9nUezys09E+lcCGlgP224DimHpGXPlU4
	hTNXXsJO6v39r9/F71dcV5xGIORe+hPa5VeoJ9tFEtEI0vzRMI0Qi6P/tz9Dgy9HpZXecYHTrhk
	K5iUAv4KaDJrB9/RFvuyLWfOQ9AefENldVY43COZrFEKQbsolS+tWeLHyBVFnNYF2EKxAixU0GX
	APeir2fAysenrnOeRuHjS+6RlCOHhNcRerHjXuyYbSSlSAlJwsS1kI
X-Gm-Gg: AfdE7ckdiUK7xGD/4ZTSF9Wc/lZQfZah/4C50q3rKakvjwtz2TVmD7NOxoJtADDQyeo
	UwyoVF1loBNSRKlfmXwgG1cAMdKAI6bVAqa7zDDM6sctkyn76d6cA2LaXDjEG7vsLRn5mZT1M6c
	cVA29TtXem94ZyfZ9R9s9dhVfThQd9jfPbrcvy3CnCub1m2H5gYzuv2VXpOi5o0vm5XcjP
X-Received: by 2002:a05:622a:4885:b0:51b:f0ab:2b1b with SMTP id d75a77b69052e-51cbf26daddmr133077661cf.49.1784035531806;
        Tue, 14 Jul 2026 06:25:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4885:b0:51b:f0ab:2b1b with SMTP id
 d75a77b69052e-51cbf26daddmr133077151cf.49.1784035531296; Tue, 14 Jul 2026
 06:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260420022254.302740-1-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260420022254.302740-1-zhipeng.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:25:20 +0200
X-Gm-Features: AUfX_myUc1dBICALtzRuHVKIlbb7qfNnmRBTvv_VDYs9K5Gif0zPw5ow6tXTGB4
Message-ID: <CAPx+jO8WidzjwnGspSTLa6urva3w3qrigJ46CDnqOTLAh06XBg@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: imx: Make IMX8M/IMX9 BLK_CTRL tristate
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: ulfh@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xuegang.liu@nxp.com, jindong.yue@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfXxJtW1/mREH6y
 nx1LrZpQ52HYxp37lHWTnGuNVuVh7fANXEaqJem+Yse2yk5TMGuGEVCjQlcUdhxcxiNpE50SCj6
 tNUP+unPtWS6GcUD1iXf9UENwPBf6hg=
X-Proofpoint-GUID: nZdM7TGS6sntn467I9qhGFK0bDTQBQ4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX70lW+lp/7Pih
 SwBL8bPs32rTCrRy6rV5N9JpBgxkBMrFpu8pPmIZ3MnHhtJJCaSBCfG3nHigowns2j6MkhSE/nk
 trPeshNgHCmQk18na/NZEbpqJMf7NE0XlHnDFFFSqeRuvGGEc+26V3r5UUCxs5EV9G6hQdjlhR+
 kJQirxDs0tkJ+2sxb8hqSVGQQfpIRD7jxOO6Dgn5UIFs95cXoeySFLPq1OI01VcA2+1Oo8Kv3c1
 FNEm3oLgiWnZvlGovLLwi6M/tJxioSCk1BJH8JT9u0+HmCFwdGq9rvGdmDqCnwNkxzvAZrD175m
 eCyG276wvDwBrkgFIwxjhMX8xHC08225LkzjajLnfAvHCOp/vhNX0JiuU/6HybIS2YKwm13oMR+
 r1oKWjAJDz6kByHdcDQZBYsC+1NNBYYvl3idvx6M0NODYr0tCNuSDdQda2sUVDi0gTMBFpOeClD
 DxdyVxSFpAHn+Z4/TTg==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a5638cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=TQfnek6nW7prAsdi_scA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: nZdM7TGS6sntn467I9qhGFK0bDTQBQ4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_062533_863020_7EE2AC66 
X-CRM114-Status: GOOD (  27.55  )
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

On Mon, Apr 20, 2026 at 4:22=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.co=
m> wrote:
>
> Convert IMX8M_BLK_CTRL and IMX9_BLK_CTRL from bool to tristate
> to allow building as loadable modules.
>
> This change is required to support Android devices using Generic Kernel
> Image (GKI) kernels, where SoC-specific drivers must be built as loadable
> modules rather than built into the core kernel image.
>
> For i.MX8M and i.MX9 devices running Android with GKI kernels, the
> BLK_CTRL drivers therefore need to be loadable. Without tristate
> support, power domains cannot be initialized correctly, making these
> systems non-functional under GKI.
>
> Add prompt strings to make these options visible and configurable
> in menuconfig, keeping them enabled by default on appropriate platforms.
>
> Also remove the IMX_GPCV2_PM_DOMAINS dependency from IMX9_BLK_CTRL.
> This dependency was incorrect from the beginning because i.MX93 uses a
> different power domain architecture compared to i.MX8M series:
>
> - i.MX8M uses GPCv2 (General Power Controller v2) for power domain
>   management, hence IMX8M_BLK_CTRL correctly depends on it.
>
> - i.MX93 uses BLK_CTRL directly without GPCv2. The hardware doesn't
>   have GPCv2 at all.
>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Apologize for the delay, I have simply missed this one.

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - No functional changes
> - Added detailed explanation about GKI (Generic Kernel Image) requirement
>   in the commit message to clarify why tristate support is needed for
>   Android devices
>
> Changes in v3:
> - No functional changes
> - Fixed typo reported by Frank
> - Added Reviewed-by tag from Frank Li
>
> Changes in v2:
> - No functional changes
> - Expanded commit message to explain the architectural differences betwee=
n
>   i.MX8M and i.MX93 power domain management
> - Clarified why IMX_GPCV2_PM_DOMAINS dependency removal is correct for
>   i.MX93
> ---
>  drivers/pmdomain/imx/Kconfig | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/Kconfig b/drivers/pmdomain/imx/Kconfig
> index 00203615c65e..9168d183b0c5 100644
> --- a/drivers/pmdomain/imx/Kconfig
> +++ b/drivers/pmdomain/imx/Kconfig
> @@ -10,15 +10,18 @@ config IMX_GPCV2_PM_DOMAINS
>         default y if SOC_IMX7D
>
>  config IMX8M_BLK_CTRL
> -       bool
> -       default SOC_IMX8M && IMX_GPCV2_PM_DOMAINS
> +       tristate "i.MX8M BLK CTRL driver"
> +       depends on SOC_IMX8M
> +       depends on IMX_GPCV2_PM_DOMAINS
>         depends on PM_GENERIC_DOMAINS
>         depends on COMMON_CLK
> +       default y
>
>  config IMX9_BLK_CTRL
> -       bool
> -       default SOC_IMX9 && IMX_GPCV2_PM_DOMAINS
> +       tristate "i.MX93 BLK CTRL driver"
> +       depends on SOC_IMX9
>         depends on PM_GENERIC_DOMAINS
> +       default y
>
>  config IMX_SCU_PD
>         bool "IMX SCU Power Domain driver"
> --
> 2.34.1

