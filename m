Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF93CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hFrW2tCyaPS8qm9cBW3XS4KeJB96G/QpNSDirWrlko=; b=lIkisr+oG2Lmae6BMYKuDyhCwD
	s8bZlLTdUstyXQeaIlJEUXZNQG4nHuubgpyj42rYgieY1e/pDE5i/P0bXPgbVryT5Qi5mASdWRk5j
	4rQCthJJHOWhjP7OqrofIBLH2v2oJFy+l87MTYlqdW0fkr3TzIpfhDhsyURCU1hQXQvbvZtJ+9+KQ
	uZzvndQLRSiPTEpctbPtE6iaOXNKZJLhWHowboczNEONEb8kH2z4boE8QDxOJANw7NNc0xkIohu8k
	lPi3Wpsq7BckV2tNOoGdGrqrs8PbsEyuFL3IH8vb48lAWgRpyjkItyfVaFqefNT1Z9ByWGtbTdm+l
	Ep39N9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6g-0000000G5uL-1D5A;
	Fri, 05 Sep 2025 02:23:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJgt-0000000FDce-0ZgV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 23:48:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HeQBc032207
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 23:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1hFrW2tCyaPS8qm9cBW3XS4K
	eJB96G/QpNSDirWrlko=; b=Qmme+sIohc8NdQu3MsiTwf41dHFazz/ksTqlhs07
	XAvg6aBe++8kBcViHxKjklyyuwVpi0vbnSsr1ZdGSPhegx/pgNOgRBRF45DQgjHv
	ytjELEWpLLoaKKSJMsWAzsPP38HO4Y+bJ9Tc8s1v9OD/SzJ+kFQV9YiA0b4z8Y3Q
	FHCqdIQ5UyrJy2ZaN3oWZ0Ygsxxss+31jZcymMiEortEsFvfEteRGtJ38syXW0Yu
	QPwqgpB13RMbrXnMN/UShR5yng6/xWgrpZrg2nXo5vjCHJs8FAcZHff1CN6/MxWr
	mqLd7A5MJ+n4CIBHA2+L3OWGQriinekWjMA0i9fW8Oh+ug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnphchp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 23:48:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b335bd70b8so28173841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 16:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757029709; x=1757634509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hFrW2tCyaPS8qm9cBW3XS4KeJB96G/QpNSDirWrlko=;
        b=hQOMWigVX43kKUismhZC3njkNLlufpK4+q0zsC3oiDnO+TJli0YYWBpYeEKQoOeocO
         jFjfKCRUvJ4AbYKXyEgn6G+1hCpg4qsexfopVn8oCA1yzUvB+0rpAHagbY7UolCJQ0YC
         qUEFx1fzhWw59IoFkdiSCCDgK5fYY73CLB/vncpyZUc1V+ouA0fy1o+w1j45pWoyZC4Y
         M4WlEitCjfY6R6O9hMzEST5B5mn7SkK52TLXfLCRnxHJ7mm2D/ZH/dwnTuGNRWSDi24i
         WolWTW5TaWBcV50ekfH2HC9Mg6450W3CjhP3mTuR7w9J1T4O/HHncxdb4l5ZEA9IqxZj
         6eAA==
X-Forwarded-Encrypted: i=1; AJvYcCXAzX6o35XsFuEcHyDiGbv6l4jU4zpRH5o4BjryA+EeYTh8TyLeHZGAPmNGhMHYyknrciY+auEEay5vYJhS2eW9@lists.infradead.org
X-Gm-Message-State: AOJu0YzXlLgGO0cWuYqnpAdehcrczQst1aYSWe0TKZ34veoE6ZeUhS2g
	ahHVs6AtBXCNY31ddfhLLsA1YAVX2cCBDcNLSJYY+MdUrMysuu3+pkPOHPt5AntUG2qh6LoNMhr
	Owt6g+SE+K8QTOMfHrr7Eig+ygOQag75F4v36l6mIKYw1/8cqmeZA6yW4H40AtB6cKI1+TmLcKU
	2ndw==
X-Gm-Gg: ASbGncsv5RQGnwND/uFW65hP6Bx/a5ZMIGL66sjNCnO7vVtNMsGg62M8s54aQXA1laf
	zFmv+3xjA2w2hZzFh2+APyGoUeW9/ufKJ0kdrr6KWKKbvJpm3YplE/Ggb6SSnQAS8PUnkaA9azw
	oM5W5SgoEb5OdMSKJc/kUQ5OpGarMSx17Kqw837rNeMCFlxv8aJvTsa4aW+Nk0lcHL3D8Tr8jy1
	kpQ3bQExTtXpIo3zhl6I6aIvPJLdepeDXM5pAX2vmwp5byIrvj3dQiWSG7M7NQFCciZkgwUwoPL
	CtzbXAHYzTdJnSKPdTaFTVD6QczCwGkqvYA2biZYwOrU9L5NRT0N/b4THYWkPPdC+q33jQTgwgL
	y3l++DLJPGRIOvh1DzB6V3oUDtaHrzrFhLV1YLgfpA1SmDzDHNQMP
X-Received: by 2002:a05:6214:d89:b0:71d:9d4c:192a with SMTP id 6a1803df08f44-71d9d4c3057mr102311016d6.36.1757029708969;
        Thu, 04 Sep 2025 16:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGyjZe+NSX9mpYQeP9HfjJmgNoHuKa4eYSD2icUNBITBoWtqUVLeB7F2OOeEL/Zt7cpc6XQw==
X-Received: by 2002:a05:6214:d89:b0:71d:9d4c:192a with SMTP id 6a1803df08f44-71d9d4c3057mr102310786d6.36.1757029708573;
        Thu, 04 Sep 2025 16:48:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c151sm1515072e87.2.2025.09.04.16.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 16:48:26 -0700 (PDT)
Date: Fri, 5 Sep 2025 02:48:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Algea Cao <algea.cao@rock-chips.com>,
        Derek Foreman <derek.foreman@collabora.com>,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
Message-ID: <ncmsmxdcvhj4jec6wmqf5abrb7nijx7ac2i33tvvcc2prljez3@uks2cb6aunnx>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
X-Proofpoint-GUID: vHpwOurWK4rokKLijxofMXr_7_G2t91N
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba254d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=Q_aPI2XdcSPthaebfpMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: vHpwOurWK4rokKLijxofMXr_7_G2t91N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX9LG/Jjh5JjhS
 CwmRecZ1CRp2jClRMKBUGXtQjrfKi3wqUF5YbB8RqTxGRm7798mfBkmOkyR43WyTVy/pOH5HeY3
 62V64aKVRhiedXcDvjJOrifSZYusy34TLnR3mpEPYA2HonmeDI5UZ0oL3h/x4fNceFpkRsX/Hap
 LXPUCUiGSZbD0FitpwclGZypYoTDSsWQQWIFM4OfSKwTk4z8Sqb8I9S7CG5x7yywl4qnRmBs6jG
 Xw+Dx8UXqOJdy88auwpUxBVqv446T7Vdn1jFq4au55cvNO1gp/F8QWPPbjbAWMVpv2pEkLth1Gr
 e+iaIhxf2kklICxyud0tOO9H25cyS5fSfoXQvtvvFGaoN95mf2JyYtmTUD86hxwSRpoY5Bv2m12
 hD7VQ2YK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_164831_305402_31CF395D 
X-CRM114-Status: GOOD (  22.83  )
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

On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.
> 
> The second patch is needed for RK3576 in order to fixup the timer base
> setup according to the actual reference clock rate, which differs
> slightly from RK3588.
> 
> The following three patches setup platform data with the new information
> expected by the HDMI QP transmitter library, while improving the error
> handling in the probe path.
> 
> Please note the CEC helpers were affected by a resource deallocation
> issue which could crash the kernel and freeze the system under certain
> test conditions.  This has been already fixed in v6.17-rc1 via commit
> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
> unregistration").
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Cristian, I'm sorry for almost off-topic, but as you are working on this
driver: would it be possible to support HDMI (vendor-specific) and SPD
InfoFrames in the dw-hdmi-qp driver?

-- 
With best wishes
Dmitry

