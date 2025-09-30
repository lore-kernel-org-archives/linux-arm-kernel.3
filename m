Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A854CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8MgadJhrhV1HSlrIC9UJrghBv6+bn6nyOEgzE424I4=; b=0SEDPZsoRaurY95kgYjfY2wr77
	SJuK0oXOi7tpaCM0hOVZsMtiZ3j00/OttMdQGwpCfhVBMJIEoP83ZqZb1/15+7vDgVAqHCHTrdCDn
	MePSZI/3XRogg5JYgqDTjphqyA2olpWKDd72587TgqLXvamiOJwqoOOJTwsBTg1ZWW0qve1PpTM+w
	MrS//2lSjf5IY+vG9ZeubiOidTKZj+m7BHoq4sKVxMtvrlnCufL65fuaMP4rw7fnF22PepKoDR1Ro
	Zz0S/BkhdSmdkinVZZXW4SSutOq6W3EDnfy7ba4lYwc2XIBkg3393PyfhKS56ohTyNf58wdy34GM0
	CXXHkc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gnx-000000069zS-0VAY;
	Tue, 30 Sep 2025 20:18:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gnt-000000069wS-2l7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:18:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBQh3Y015470
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n8MgadJhrhV1HSlrIC9UJrgh
	Bv6+bn6nyOEgzE424I4=; b=KC4LMGSI/MkfGts/Zkvpo++UDTVu6cGxuLJRMZN6
	B3V3ISoLz+WZKqAOjUMg1ITb///6JCiV70XD/NnyJP4qb8hEt23JcKTMhFQlytzk
	WFRy4OOmGC+cv2PTMqMUgxUVX+O4B41wIOhjLvHhgRZrJZqg47a31LzD9X6TSHwx
	66AqZTneRJW3OwKZZGG1tMul6aPdINuXo220OJlxMO3cLlRixLKH09JCmuddVpKQ
	XaH+Du6KXizvQnTqc5ct2MX+9rfjAf42liLu+8BTrYS0AOO/iR2rEEwzsalGWn0P
	YQE10RDlZZ01gGBQiahlpcF2hMToLxvPI72MqumAKq9Fmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr2b5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:18:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d905ce4749so126966091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263508; x=1759868308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8MgadJhrhV1HSlrIC9UJrghBv6+bn6nyOEgzE424I4=;
        b=Hu7QXdqKWM+7+OSs8drwdoab3tMyOvXItK4M6VA812xINBtJhCV0KYmCGUerex+mWG
         +j2CmviwoLfZXRZz64NLwgnDhU/nP83nt4NBMbxjHOApNrgKChOqYBRgRojFS75ktL8P
         2pLwD9ut+/wLdJp428SSZIjCHKRIsgqdvsrOMQ6dCd42kVrjPmV9LTWglO/sjlds3Wcl
         BquxH0NJllo85LU8qWTaGtR/vmMCTafIMuGeuS3Ju+5dnpZfVwUwDrLBOQeyOiraD9lS
         5y+JFiahZYAMTtbk0Z3iB83ODjcGmibb6b/rrZfiR4/odf4qepA1fSALsALMF/8aUTUH
         tORA==
X-Forwarded-Encrypted: i=1; AJvYcCVc75N4UYJQvxG397erH40MLyJTD0bnsaUYveUZQCrgNgTgOYUPlHD+j5F7qohF8j7B6KxW7x6zQ7hqKU4wr7Lp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2cIusiFmqxEs4iAohAns2uyN+OOPgmwWWAEBOv5mWfd+pqccs
	60UGidT2FUSTkQIAgA1wMtw7Zz0RGb0hyT3aCrDPM3qnZdLM1q5JMyKMkXVuXF+rXxWwcj6wb4J
	K0GbhuqM07Jr4gzPMy2+yzYgWHSe14SDfQegLbojqhFSX/Brwu0OszW9OKKy4PqlNVVaa1C0u7d
	j45A==
X-Gm-Gg: ASbGncu3Kn7k0BzaJpDs3amx4Ibncf88zfx3jQJRmpVu96CMepG/LyekDiNWfKcU5T2
	yVej1YLvmFi3fOibUcvj+mnWynyb8Vt1oUcEvAzzx94MR5E5cyVLQ2dP+r3PAg5AFweMi3q1pCy
	J/iIhSl0seheGLusOYxtt2sGVffZSFI4a3dFTe5WfXGmKpOvcrKQY/7jKySWWiuAvXHh56whgii
	t/JOTVPku5+M13IEsc3hho5rXZ6+spm1ocglEmRGS6JzaSdCueydHKrvtdNXHa9+gu9N4lRQhiW
	nQf+md0Xh5tyd2sANpVsCgEVOE7Z+SMai+oZn7gxTqXY1qz6+N00q1hGUwZ4n/Y/jzudksv76WO
	V3K3H/h0To4mdgT9oGWQB2m16hwnFrNel7yiDlglgtn1s5mmno5AKi4IzGg==
X-Received: by 2002:ac8:594d:0:b0:4d9:1d03:83c9 with SMTP id d75a77b69052e-4e41c733801mr12497541cf.25.1759263507545;
        Tue, 30 Sep 2025 13:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETZ6omCmx9fZgdyWrCa0U77D6Uv9hU6fSO42h/F5hPLOdENOJ0bn/O6k9+KhYjIKci/Pfe9A==
X-Received: by 2002:ac8:594d:0:b0:4d9:1d03:83c9 with SMTP id d75a77b69052e-4e41c733801mr12496841cf.25.1759263506980;
        Tue, 30 Sep 2025 13:18:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff5bafsm5186157e87.136.2025.09.30.13.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:18:24 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:18:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 09/18] drm/bridge: analogix_dp: Move the color format
 check to .atomic_check() for Rockchip platforms
Message-ID: <5ed4lpdjqru6fbjl5ulaqdex7kppk7bsze2hv37mzgq3c22qir@2srh3jc7sqnf>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-10-damon.ding@rock-chips.com>
X-Proofpoint-GUID: gfr-dcUBlYoQV2Mg8yfQcDdTrNIYOm5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX7EMvb1gYeTUx
 V/vP/bYWO5y55BLS0B2rhKP6hqORmDM2KJI8hKCM0Tbb9QUKkS1lf8Ki1g0tQs/u1n5XkMfj4z3
 xDrJa0AixEu91nUQ+R9sze0rGEkkTkIlNVipdRR++fhwx0P+ZKBap50QBqgk+5Utrwu+8/zTsd9
 rwy3HVBw3HoPkR8VnryhiDpdpwdfCBK3oQLvAnimH/y9I6zJyzUgfde9p+Z9vdYD/6H02LXN+pe
 PzgRC10iC0jQR+vgv6k07057plSWM+B+QIQolybQa4x0+S+AjLCDSU6A1iJ1g8wpKZXcnzGkcs4
 kcpN6hHluqrwKIgYeWpOq/Ljy+UUiiNL5NvpDkADWSQl/tFmaL1a4G5PLjFi6dG+d/z/5J2QyQm
 8qDxJbRXeKLq2Y8EKbYiD57gU63cdA==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3b15 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=0r3lTzsetTvyPaIB0MAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: gfr-dcUBlYoQV2Mg8yfQcDdTrNIYOm5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_131829_700492_24A0F877 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, Sep 30, 2025 at 05:09:11PM +0800, Damon Ding wrote:
> For Rockchip platforms, the YUV color formats are currently unsupported.
> This compatibility check was previously implemented in
> &analogix_dp_plat_data.get_modes().
> 
> Moving color format check to &drm_connector_helper_funcs.atomic_check()
> would get rid of &analogix_dp_plat_data.get_modes() and be more
> reasonable than before.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++++
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c    | 18 ------------------
>  2 files changed, 11 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

