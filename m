Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190FFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 18:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl/6M6Rq/6jNajcCYuhAK92SmJY6l5itfv/1kSpS1jc=; b=H2urAkW0TdBITL9TX1slZxLG32
	cVc6CRwumY/qda8AaQivxCz0QfzpHMRe6iG58+0HN5uOpPR5usfPyeAIZALpYdo/LrCImug7uumro
	xorvq4EkFTIQxr2fKXeweT4UdoQLO/MokEYh0As5UnyMa6TAepurV3C2MagIxHFy/vUo03ePtsI6O
	0pIccCtUtJPJfb13DoYVGRXQ+DQvfNh5S+FxoUZ4RYaI7K56L2U5iKvOKYRZ56g9qZyBN7wsusjhW
	Ikp1SQ0hPg3lmRS1tNWVR0BSNe/mfj7m7dzZbpPMzBWsv6rVjTeFPDZ8e65bJExEGE2orf1DGDkdG
	saOShDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucq3D-0000000DKD0-1Cz6;
	Fri, 18 Jul 2025 18:43:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucq0V-0000000DJxG-0e3C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 18:40:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHGhOa007306
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 18:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fl/6M6Rq/6jNajcCYuhAK92SmJY6l5itfv/1kSpS1jc=; b=SP/chH1akjGFRZXh
	O7YrljpvyrsMFhX/GlscO5L8O70wnWRHydWh1oDUiojOMts7ynMitK2/20PzwLuV
	8icRuhNEYFEWv/YofICS5KQTpxgNdiODfgCEtRIKpNW3/nw0KOgaF+X+cKxbyZgZ
	z2huyAUWYZppO//7qO8F12Ri1drER/ERWbTzZdQ0ZwKbML7AyBSU+8XGi2HXKkGR
	R5jQ8RKYEu3aql6C3snRTfWj4RF6N53moqCZsaWOk52i1JUTV48YIP9FyhQ68AIt
	ekfgqR/TjfJR129IT/2kc0G57Wpg19F2/O1IQYa+PgYoP7/v3SbHAeorc/hdRO1D
	oDm7QQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcads3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 18:40:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab878dfc1aso43099721cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 11:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752864029; x=1753468829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fl/6M6Rq/6jNajcCYuhAK92SmJY6l5itfv/1kSpS1jc=;
        b=h9W/WsvALhHtYNO7UeHxO9kYvC+27MQoBeZ468CmYrI2PIxa4FRIQ3DaC5kNeksxhv
         i20LMvyKSKVcklFvOsS83yscw5h09v4jG4Zste+W3fY5GIv/2lnMikPH/hZUkVzWgN2D
         e5zNH8mPk/A8SaLr0pjtk4yD724v11bfmufYMadeqghuhi3Uhulc/MFmWz1+nWnydyAi
         Ndj3es6Dx2Kf3hpYo7hrujhJRgoxSEL8sPXXwx8lgYClWBEqesqEsu6A1fsHhl7m5RfM
         P3qf1Oqh1j8IiDbg7+xhz8jLX3VPmumxCbZZTquFr0IRxV6Aq+SL/QyFjkZPmEIY+kgB
         lfZg==
X-Forwarded-Encrypted: i=1; AJvYcCVBrdA2YoY2bGR8p2LhBT2of1tUzt75EcE6UaMFgMUrodv9orWcN+oS2CvnPw732Wdpl8PsopQPJ0RiPgZf5bJg@lists.infradead.org
X-Gm-Message-State: AOJu0YzRltY3xcVGaUKbzu9aqTZxt46Hk71s3pYaXxLWlyU20H1LjlF8
	IaDfbs2Jxdz/GtYLHKqEcZP17F5+Zl/cQ0R/7L556fFEdStW4wKLZ+GDehIbu5qyrfqlQISYsun
	amobvNDaPCDLLU8qJa0bF+aAkn7NSOZZ/PPnPvCG/98sBCyjc/6Ekyjf2hZ1YTSqDHJM6hXRWXY
	syeQ==
X-Gm-Gg: ASbGncuWFxpQNhhw+YGFuvV6qi2x3KveDaY/7pQFfxOgnEVHCZU9cVJPwmxBdhd/E1q
	lfcul5D/uWMIz95z2giqsCTeNz2Hd83pDWV6EDkugommxk+S+1C3jjePc/R7yyWgBBCYw2ZBi/h
	YkwRpTvmqCNxwf9OSnUjA3Q3v/Zbonx4S+/FjspIa7+OilS+NB9lUlCmRxbDYBceAdgLDozRcXL
	hZrP1nAshlzdQsV8+qgEN6K+zBdxQCYYIBzBDWtoFNxrQk19WOL7o1IHoeUlPKRM1WKrtAlEz9t
	ZVYoMGxubshHzBG4Zz7TQYbZxV4QCF3ar6xkoASe8Z+PmfQ0YOPQ80kTlxw/yxZS/2WIcoT+3GM
	o4G2mymMD3gOMdM/oTa0SvePVBYwp/Tgzs3XlVjbIzD6YzRXc8lOT
X-Received: by 2002:a05:622a:4ac4:b0:4ab:887a:66fd with SMTP id d75a77b69052e-4aba3c8dfccmr129184781cf.15.1752864028758;
        Fri, 18 Jul 2025 11:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2cRSkLcZStyjZjNMEN+wUSX0qjErIvadVGsd64otX6kO10enQxXworlq7oMTTVOWMN7HNzA==
X-Received: by 2002:a05:622a:4ac4:b0:4ab:887a:66fd with SMTP id d75a77b69052e-4aba3c8dfccmr129183731cf.15.1752864027979;
        Fri, 18 Jul 2025 11:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a90d4ebdsm2876781fa.8.2025.07.18.11.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 11:40:27 -0700 (PDT)
Date: Fri, 18 Jul 2025 21:40:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64
 bit magic
Message-ID: <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0OCBTYWx0ZWRfX85MmBXF3SOj0
 FkBLBKW4VJ5rT9Ic7gjJznjxkCQQzpCkh4NLuPJ7NdY3tvJ/eUEd6lFfr3USKZGPsHcgGvFAZiv
 JU3WB0YkQYGTcBKRmltDUduWz0jYqFJnuUMxFqMISyAY7pbUYJmS8IP/mdAiIUGjs2gr5IdtEOG
 de6xwCIt4RmsL0opgFq4KfOou7n8mufqJN4GqmRyOA48Zh1wxnM9cq/dYF1O48r4dbtpJsdHDPX
 3eNIvmjkVmmTfDbFaWwmXNrxWVo1qwMkTvAG3yGS2Xl64l7YmvByG9AHwEopsIRs03dNWI6AC0u
 GsVPpK56GwzZ5GQmBYtMjzItAx+ULH/v9cJ4zPMvMp9L+3Z5hV5BlH30ErZrtQRuZj6FmOSsIlS
 0P6PdM9aom622bdDETjqayJMAs7rHin7rtkCTElxbAn7lyfOV+WEnNYha9RiyOxK837s3jqe
X-Proofpoint-GUID: hsz-nXKsmNW-ROzYYctLMb-MzlqX2SSY
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a951d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=fKl0S-9-5daLM7QqcyEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hsz-nXKsmNW-ROzYYctLMb-MzlqX2SSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_114031_313315_9053F1ED 
X-CRM114-Status: GOOD (  33.32  )
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

On Thu, Jul 17, 2025 at 06:16:48PM +0530, Shivendra Pratap wrote:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation – reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
> 
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate dual 32-bit arguments when specified via device tree.
> In cases, where no second argument is passed from device tree,
> keep the upper 32-bit of magic un-changed(0) to maintain backward
> compatibility.
> 
> Update the current drivers using reboot-mode for a 64-bit magic
> value.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  |  5 ++---
>  drivers/power/reset/qcom-pon.c           |  5 ++---
>  drivers/power/reset/reboot-mode.c        | 27 +++++++++++++++------------
>  drivers/power/reset/syscon-reboot-mode.c |  5 ++---
>  include/linux/reboot-mode.h              |  4 +++-
>  5 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..e3eed943fdefa271b22e1f1891abef5c9095b9a5 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -16,15 +16,14 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
>  
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	int ret;
>  	struct nvmem_reboot_mode *nvmem_rbm;
>  
>  	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
>  
> -	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
> +	ret = nvmem_cell_write(nvmem_rbm->cell, (u32 *)&magic, sizeof(u32));

This will work differently on BE and LE systems. Assign a temp var and
use it.

>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>  
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 7e108982a582e8243c5c806bd4a793646b87189f..93daf93c097f970afbaf43d36b1e4f725ca7a81f 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -27,8 +27,7 @@ struct qcom_pon {
>  	long reason_shift;
>  };
>  
> -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	struct qcom_pon *pon = container_of
>  			(reboot, struct qcom_pon, reboot_mode);
> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>  	ret = regmap_update_bits(pon->regmap,
>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>  				 GENMASK(7, pon->reason_shift),
> -				 magic << pon->reason_shift);
> +				 ((u32)magic) << pon->reason_shift);
>  	if (ret < 0)
>  		dev_err(pon->dev, "update reboot mode bits failed\n");
>  
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index 0269ec55106472cf2f2b12bd65704dd0114bf4a3..1196627fbf98d87eec57a3d4ee544e403e6eb946 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -19,12 +19,11 @@
>  
>  struct mode_info {
>  	const char *mode;
> -	u32 magic;
> +	u64 magic;
>  	struct list_head list;
>  };
>  
> -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
> -					  const char *cmd)
> +static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)

Why? This doesn't seem relevant to u32 -> u64 conversion.

>  {
>  	const char *normal = "normal";
>  	struct mode_info *info;
> @@ -35,11 +34,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>  
>  	list_for_each_entry(info, &reboot->head, list)
>  		if (!strcmp(info->mode, cmd))
> -			return info->magic;
> +			return info;
>  
>  	/* try to match again, replacing characters impossible in DT */
>  	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
> -		return 0;
> +		return NULL;
>  
>  	strreplace(cmd_, ' ', '-');
>  	strreplace(cmd_, ',', '-');
> @@ -47,21 +46,21 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>  
>  	list_for_each_entry(info, &reboot->head, list)
>  		if (!strcmp(info->mode, cmd_))
> -			return info->magic;
> +			return info;
>  
> -	return 0;
> +	return NULL;
>  }
>  
>  static int reboot_mode_notify(struct notifier_block *this,
>  			      unsigned long mode, void *cmd)
>  {
>  	struct reboot_mode_driver *reboot;
> -	unsigned int magic;
> +	struct mode_info *info;
>  
>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
> -	magic = get_reboot_mode_magic(reboot, cmd);
> -	if (magic)
> -		reboot->write(reboot, magic);
> +	info = get_reboot_mode_info(reboot, cmd);
> +	if (info)
> +		reboot->write(reboot, info->magic);
>  
>  	return NOTIFY_DONE;
>  }
> @@ -78,6 +77,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>  	struct mode_info *info;
>  	struct property *prop;
>  	size_t len = strlen(PREFIX);
> +	u32 magic_64;
>  	int ret;
>  
>  	if (!np)
> @@ -95,12 +95,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>  			goto error;
>  		}
>  
> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> +		if (of_property_read_u32(np, prop->name, (u32 *)&info->magic)) {

Again, somebody didn't think about endianness.

>  			pr_err("reboot mode %s without magic number\n", info->mode);
>  			kfree(info);
>  			continue;
>  		}
>  
> +		if (!of_property_read_u32_index(np, prop->name, 1, &magic_64))
> +			info->magic |= (u64)magic_64 << 32;
> +
>  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =  -ENOMEM;
> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
> index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..6783d05e80fbc2c812b45ffe69755478af90d30a 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c
> @@ -20,8 +20,7 @@ struct syscon_reboot_mode {
>  	u32 mask;
>  };
>  
> -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	struct syscon_reboot_mode *syscon_rbm;
>  	int ret;
> @@ -29,7 +28,7 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>  
>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> -				 syscon_rbm->mask, magic);
> +				 syscon_rbm->mask, (u32)magic);
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>  
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 36f071f4b82e1fc255d8dd679a18e537655c3179..d9d9165a8635e5d55d92197a69c7fae179ac2045 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,10 +2,12 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
>  
> +#include <linux/types.h>
> +
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> -	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
> +	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
>  	struct notifier_block reboot_notifier;
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

