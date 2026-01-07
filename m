Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A880CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=; b=Y2pmaMXmsjR0E6QqwXSSr1MhNf
	jmlBdXhoQbCm7L5Pp2Gkx3ImMWoIbQxYY4SyST0JeYtjGq4p9LVC/vXQy6nVfZrFd2U4taip7H7Xh
	lOzov48xpygcZjPtbn90yNGF7UkqRrrzKz+qLDMipaGrImCuIkVCr+kYiYNNEFF5xDpsqVO1p3sZT
	4EQnhdsVz0/3nuLFYLloGkiEExnURLKTcy+t+AAuoADCtHKi1KtsswlLIYTdNXOzU7CetpSWmKcbA
	Bms9A+foCzbuYUU/ko0QPIphWW30DOxhuqja32B6bF3SuLY9wn1XiXR+c009IB3ieWz203ZgjPVuT
	axaLjNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWDh-0000000FFAJ-02W3;
	Wed, 07 Jan 2026 16:17:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWDe-0000000FF9w-0WDb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:17:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsSeY2239474
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 16:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pNn2hydp6mFmiGWfG0RE3hVW
	bp3VHRZ/n5+RMle+1R8=; b=MqJT1EKHl9gRMK8gc0rPEEOryXVHNkKqHzOPhh/n
	AKEEjEqLEKTW2bGKBRI06bwASHx6DmgC1ikIzDdo7anBNcZ5nmByjlDBoE8wIxNV
	+qN2hpoZ7gwmTY6KSu0q6Pf4wE8zoHUNLC4X9c4L03FSu1IyrVpPQ8MJfDfJ0BxP
	JlfcRMskQheJx3n0Ayixqm/1rzn3HG8yNxshkN2Vuew7aB5yQgQmTG2ciXHcKFc5
	qZm3c85gkUlgOELx3bCYSq48So95d7h4f/ckw3AO3Myt+rakPPYY8a/OvLQAtatW
	Wz/OFC7xxjapfrQeP3diKItz8xhCoNAaIoK5tBrS5BdLzg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg0nk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 16:17:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-941311eee99so2950820241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802628; x=1768407428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
        b=iPP0PoUzwXh5Uf4K8prGWu+rlCVHzpr6vrEiOTvLDlwPh4sZkTmbn/kzEuPxd11ZU4
         MXRDSwzHNwzIGB91vyR7zjH0/ouYNTbXldHJZm9+GIADXS59NjtzN1delrcmal/MaNLl
         wJv6IFY+h5PdMEUiQZ+KYpUiMHmePTM4mX7IB2Iwti8LktEdJr7yT4Ib07T6h2S0fNFo
         gjsxudZlTK0N1czC1wsMlJH5yWTV30NKW+0nXWCjgsoGN6QPBxIznM56NAfUNw5KS7LA
         +Sx00icx+zYekakyFl4i+ped/yAD5cgVZsS79kdQObRUYXJZLxpp6MtNBhiHyy4ObSbJ
         YysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802628; x=1768407428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
        b=RGyt4+mQCQoyPb4+0NBkiKWlP7N10VqH83aBYixQ+63a5/1z9XfpkhOF8BuYfz5AP/
         gsptmYTvIhPGtO2ZgvFy5UZpHjLL6grXRgHlEsh2HsXRrRU437aRWeckBspidAJ0MWCY
         GjKrDR1vHk3vh/uVCdzbNQ//pnBHhk5tmSGhXLb0ZuK2rcwnSxUGdNA3jw7lICu8gKWw
         n2M5IHfzeszqrRGAiWNj5WLRsAw+9be4Zf6jRnBVTcj/F3e3mlHNCZZR+laPz+PjsleX
         qDn733FSyy5TPoc0d6mKvhIMAEC+Cly5Ln1LPt0lZgMDl96FrtIHlqmETweLccQzqqff
         UgEg==
X-Forwarded-Encrypted: i=1; AJvYcCVlUrMXpHOlmcvmYh6RERVqp9VX/MwlQV+sHhUdEGUJ7liBzpKURUQhfoXJmrEqLWYV4HMkLoUozKkl+TNPSrdB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/eKJ2LXK2tUrCppWRuXv9cWULVSmoOiAq4mGqTeqa9fpnT93V
	PFoRAtjociSCsMSD9n8e6YEb2URszSgl5P/oeYokFbx8FoZiW7CPprb2Xns7UcO3iiccgSlF/if
	s1CL5v7bKAXvROM5hO02lmbgJZ6Txd6CG3/TAV7xyDseU9faLbiB3xJv2lEV+J89ToCp21SV7xo
	F8gg==
X-Gm-Gg: AY/fxX7tkzj6mjdDc8ntilvGvdz2jv1W5jmzklGtuT+6ltEoaU6T39kkkb3ot83lTMF
	hg12Zxf6c9v0C+Ut0rdlB0u+myMKKXS6PvcGKF48NLJP8eeajIjma4LPi+RkxXVn/iUPQtMOUR8
	jyHc4lgRnnIjjZKa0fUm6acPl+cirZ4C2g7685RUAWx+9P8X9Gnygc+JOSQ7MNrhPagPaje08V3
	MzCxdPoy5LdS3ickWF9KczPMCeBTpUTk3PRjPKG2MlieIVci7pS5NFvf1KSu99b9UteuEG6jCAY
	bybpV7gHDQjbX6O4vzC31ww4GTrgRt6UUxy7kVT0xJjoLVUYgUKXRAh/72Z/2A+hJitao/aG9Fe
	eMhHg6h/+ZEA05dJs/pa3ZHX+NhZEpjvldzbp5H1gx5DJRjHOVAap2NQya+V3+8MPilIr8wxboQ
	O/u4CdwYB4cH0RlRZ7EzfWE0E=
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5ecb65744b9mr936505137.7.1767802626932;
        Wed, 07 Jan 2026 08:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWo7kmpZp++avSupk4Uz/4kHmAaLqQIgTBTPz0DzPK5KyO/RxzYBCX2g8LY9QhwFIztQxq7A==
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5ecb65744b9mr936476137.7.1767802626202;
        Wed, 07 Jan 2026 08:17:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea872sm1384019e87.2.2026.01.07.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:17:05 -0800 (PST)
Date: Wed, 7 Jan 2026 18:17:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/11] clk: qcom: dispcc: Add support for display
 clock controller Kaanapali
Message-ID: <3sbqfijv6b2lxvx3kwcu67a233d7xcpvc5x7ysc6ktk2o3d4qx@6eagaimfqd44>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-GUID: ygVjOutQ4LC_PSL1YbPwuwoa-mY_6Qs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX6i9GP1uu8Q9L
 XFcUX0jy/1w3iIgUJhia/k4ND2BuGthzkHJwysloA6MCKMWmGFFzV8wG4m71qm1DdabFoj2oTMc
 8w8jKVKo1VqhNMy5DoA5bJ5pgXW8msKRBX6HLTg12CGPSchfTL9tHw5xJVXRBOnK8qHmhDlPPhL
 xZfBxZB9O2X6aE4CPgBB2mUqiy0vy5Fxsjd98AB3Zcnc9nt35BLj/cHvp+EKQdVC/xaTwOzXD3O
 Zx+CKlHi7Zy0wuazzHwu93tdvtm+gTalCsz5U1VRNsChPFratQP/iut2/OSDawKokYEgu8gFEUl
 wEarFe8uxvCr+9t0pQr0LE44dmh5BdNf3MijxsNPKVbmHUYDaBmuH9Oc7PWVsnumqa4E41w5lns
 E90pC8TwwO3z0arjATdUAFPM9wOGdRTb6PBlk9faPm20yu+ghBWul37N+E4I97CDGedRg2x5IdR
 h9tOyBCYENQWymdbCmQ==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e8704 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gpaIcbXCgmfx5VOTBCIA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: ygVjOutQ4LC_PSL1YbPwuwoa-mY_6Qs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_081710_292388_ACC84CCF 
X-CRM114-Status: GOOD (  15.20  )
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

On Wed, Jan 07, 2026 at 03:13:11PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

