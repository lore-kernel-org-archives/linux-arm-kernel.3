Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C16C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzyptaVYzzRiiqOe580gou9yL5Xd/cRhnh+9PDrH8JE=; b=uXWvvlvQNNnRLW+MzZhIMfCSvq
	a1Fa1qwc86PhHSXQxAnKjcYB6A89eISlBt+URm0LQ4+YMnFxfu+IfVL4ImyVLOAo1ufgUg6id5XIH
	YKDKXu9bYNlUocfI6MM/848XM1F6tX88rSyMgxl1gOuwb2KOE2maxk8BkaAoUxlYfrb6jvmqse8hd
	doouOAGUKc7z/ReYMNr4z7uw2yVX1SiOTykVC4qegihGtUauy0aFTZ+jza4IhJkqmMMF8hQ7Iah0C
	xm1fUocysd2JWrknunsdmO0WYynqCGhYb8lOBhfvRE6JofcfJHXTz8b+IywtqfBu+C10/NVZ9lrBp
	SEJnOWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turJo-00000008lXx-3MnY;
	Wed, 19 Mar 2025 11:10:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turI0-00000008kzn-0LvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:08:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lptU002066
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 11:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WzyptaVYzzRiiqOe580gou9y
	L5Xd/cRhnh+9PDrH8JE=; b=a+2BTofQxHcdNpEBdZY25rpiValaCN5Ck0hEsoDN
	7Sp9HN/LZYdY3nxuL9e9qiQ3dTFCh3eRiUyvjMQnlknVkikcOrOId0Jeng7OHVYG
	TZgx15kJvxNXIFVh7t3a1qPsepi2b3jV4aa6dQQa5SDt2k7X2TjxCcZF2rWtfSa+
	n1G644PvPuqe0AgbIVdio2W4kt7vRpAau/DnpkLGiKa/aYlcn21GFkJQ4pzaMb4z
	c8vrrK9RRelTkYLkgFAsbEJWZY/01y/PZbScZ/gVTb12/kh9A4pYtlCbu64CB4ed
	yfWlYtiR+EtpCnGsIn19tdDmWiytNvFgPnBn26ERnvEbMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbwnut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 11:08:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so1077309085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742382526; x=1742987326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzyptaVYzzRiiqOe580gou9yL5Xd/cRhnh+9PDrH8JE=;
        b=vqDcJDhzrTTL0e6VuqFKTFacgqJ9fT3G7OLHbO1iHg84gj4nuHdzgrhKFNDLhLVA01
         Qj3C+DYGgYeCRG6cfRZ4Ha68juN7gHzGg/uGIzmUivpcqJ92b10e4zg0ydph8MR6rdXC
         B3F+csSRgdJn0JGe2p0A4lkQ+hm7Xd0E2Q4zGIoX2vOEQEgyrhWV8hG6p48VDG0B7MfG
         bCVkYMkhW6fWSVdUeaNyDLxOGyGXfJH/lXGnEUuUl6WB5Iiz7wlicjvKaoVw9qvlhEsv
         356c6pULZ1ycOAlakEK7WTWJPUp9j6ypQf2TGxYlIx5MRHNQ4Q5NOMuDW4vh0Af+zVvm
         coLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoJ/5rFZypDqik6i0uL0sigIdaLyFjbIBVb5XKPQuY2ijB4sSNrrAsxwGEJIgAzoDCKTr6RLc4vVYyrj29VbZr@lists.infradead.org
X-Gm-Message-State: AOJu0YxYRS64ItnjbR3DntmkVrREKEldeUfrELN1KFMMyjVAEzmtbfZH
	nW91tb/BlTxZK8VCm4tNQ5hf+9GlCAcGaduU+IqyEMeEwayl+rvywi6ozut+eC61bZ1V6QNAARw
	qs7FsWNgGtEqSdN9AkyqbdQBJ+y7tEOOzT1Gf60bY5MZbrIg+xYvjB8uIKipZsDRZbPZO58x55Q
	==
X-Gm-Gg: ASbGncswEMlcZPsMhvvowk1ChcSYBBuC5ZG9S1WpGrzHSA6uWMp6v5AbmqNU4G+UrKn
	a2P9F2P17dF/GSU057JVbYuAwLIBD570+VvSil4dJMxHCaC7QwoNQ22AUCun7nkuMSkD2JWTHoJ
	XjbBejqD4rF1L07+7hqZ1psKRdEN3vNlWcVMcly7zEG4WEyfvZkzJzw8FvOBqv7VbPjpurJzDN/
	ygGyr41G5By3KG9xAyIRgsIdbcfZe5+0NRi6osM6IUoD36uQeXFkhVNSPyDim7nPmMOyUVPgptL
	G/t3DDh0lwkeLAtcqJPd04VUiq9R5evDLfSLRfQxNLdzTy6IXg5cYZQj8MHMDoGCzX6NHUKFaSz
	+hIs=
X-Received: by 2002:a05:620a:2a02:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c5a838ec42mr250546285a.14.1742382526273;
        Wed, 19 Mar 2025 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZcIi2ghP6ESmSAMRKD4aGrSgNmlI2K/vEMqdFO+ac+ilM5F3UbWyPluESd1UDuKYaE54d9w==
X-Received: by 2002:a05:620a:2a02:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c5a838ec42mr250541485a.14.1742382525800;
        Wed, 19 Mar 2025 04:08:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864c12sm1988818e87.157.2025.03.19.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:08:43 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:08:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <sxrae5pmykx6ul2y7uc24fss2kdeezkkom7ev7mavt3fbc6ckv@tghyp3whuxnu>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-ORIG-GUID: g6OZvuBOj4YB4o1Nu4w1pDv_0WhgmqX6
X-Proofpoint-GUID: g6OZvuBOj4YB4o1Nu4w1pDv_0WhgmqX6
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67daa5bf cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=XJ2MQsQTle-X_OudA-YA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=867 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_040848_245202_47222082 
X-CRM114-Status: GOOD (  23.50  )
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

On Sun, Feb 23, 2025 at 02:22:24PM +0200, Ivaylo Ivanov wrote:
> Some platforms initialize their eUSB2 to USB repeater in the previous
> stage bootloader and leave it in a working state for linux. Make the
> repeater optional in order to allow for reusing that state until
> proper repeater drivers are introduced.

Generally "works as it is setup by the bootloader" is a very invalid
justification. Please don't do that. We should not be depending on the
way the bootlader sets up the devices, unless that _really_ makes sense.

> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 4e5914a76..dcc69c00a 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get regulator supplies\n");
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

