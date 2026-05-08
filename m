Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E540CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+uqtVLmFUCNQVUxTe/oua215OO0zK52yL+pzUl8BNA=; b=yo0t7xzthIYMXmut1cOXOoKmKD
	+vezgn9z+w57f2Ozdp30yBJRK+OV3zHacuib3afDTwhT3sieO6MT8IoNNGfElealbPyM3avEnXdcw
	EBdvJuSEe3gRSIfaSJtB0l5nmijJ/TOzozrf+xHuUXiefJHx8g0VgihvTk8JXNbJukRaUiX0Q7shl
	m/3VpaIzr4w8KzdfvlapPIa+7Cruv+uFLbmFH4mWpSnIIyGnrCBGZ91gwcDQTO5sU2XPWfdWXKois
	rwPsg96sBhisi9z+Nrlujk/jHUMw9xPEblhB/vUQCuakRBIPLrMUeVKTmPjUz4NjLaDoqoiXKLoEY
	PFspYGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQAk-00000007Hko-0CVb;
	Fri, 08 May 2026 18:43:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQAh-00000007Hk3-0Q5q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:43:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G2uLj724321
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 18:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y+uqtVLmFUCNQVUxTe/oua21
	5OO0zK52yL+pzUl8BNA=; b=WR0Iykffq66Bzco9V06J0clPwQQqWiJ7T6GBC40i
	aaI/R+4yQqoVgDeivQlPSPR0t/zBQnr3BbV45qER6y7859VN3Cb1AziCTtdQxf5P
	dEnJmYrcEszkSPXwdO8rdIHs1c7Fw8feC1xmDXrvySkitQNV1/zJheDgy8O5/9rF
	vTmmkR/y9j6HgFbUMNCvjS1PxDnUi8mRVrKN/VLZgDhSflypaXKHUiBBZ/aJauc5
	Gp3hloRIbJbT7qsfDWFtfbUNBIGufbuy23H7qece9dWfkWVUDUEWCyLWKsQeeUF0
	rxQZzCywUbp5k6s0JuAK4spTAoNOYnwo34F7HynZGFsW3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0ugk28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 18:43:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fba8d8c40so43504491cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778265813; x=1778870613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+uqtVLmFUCNQVUxTe/oua215OO0zK52yL+pzUl8BNA=;
        b=TCNMk0GosavQh2VrZNhOy4VPGnIqiXAnmiiyZ6Oj2I964ly7MJ6peGAb+ZSDGwipSZ
         ngdynmt/S0sS8Gpl8dZgvfOv31BVexJ2tqkfxLnZ6ZB5KCn10PPUdUXnjVSfprnHbON6
         5L0vwxkc2noUo+aUbxaNbAvDI/7i+Tn4h4cMWapSpKV+KSx7rwumcLgVwItC1kvtC64r
         q11B/RGuL8wFg4O8knWyVsHS2talPWlGcWiLOS15QkkPiVn3BoKmdgJjymA0L1O9pxNL
         aU+tHM0D15WGHma/p7oYkDz8n4cwWcu2zf/ywrK3kKmANDw041R2O7Cp0fTqdo6cDfl3
         y82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778265813; x=1778870613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+uqtVLmFUCNQVUxTe/oua215OO0zK52yL+pzUl8BNA=;
        b=ooaAyKD3EhNgXalwKaBPJPbBEsuCX8Rh2+ESxOPOlLQ8HubxAc3KwTSGAp8NCEmX6i
         oqo5MYtQs0Xg9ZUGC/hvorzpO87ryKFDuESRYhTIir5ThydBPlBQik4W5QuELvgQ6Mtm
         jNZuKWLpWIo/XQ8MGD6dSN9+wQL3tGSb9xvV89b74Y+cSX7XyRdSp8gJMHxm7pA9AmOb
         MwhbM/TEXk6LRWG9udyz/dj+PIIsOEDTkB0xecO5quwCkTleFndJmVOskkTrfvM5di4B
         7nLrjygfKnT5DswqCZZyrVxlRaWlaDBD2zRLK4o8ilTh+dw4HuSp5H5/Ok0yP5keNC1I
         2QbA==
X-Forwarded-Encrypted: i=1; AFNElJ9vn6nJuMTYF4h3qB5sIYgVpGOTElWzNknDg7N9dUdH+2L1yCCRvwq0QNkUqfHtMwEiOUyTXzbFaL0Ip+ctDa0G@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3V3XR7Tvu6VxptjkIefv/rsNfiQy1Kt6GtiiGUdLjqn/PUHyv
	8Ac0dOXhh3cvUspYqzZqqWRkYlDUsaxTU1EVXHKnLhaduaVUkFbibzWdDsObY8yLHeqRXTaGy8w
	x13vIMOtG//Wun/H5B7lxGXNIWjaZk/dj+tpWXXgb5fBPhY4qb1k23kxb3GorFXN0+HwyUeq723
	EvfQ==
X-Gm-Gg: AeBDietTatexfNpNjJ6ZeE1Obu8bs/KRvOtGZoe545CniqGYB/HjqGb0mwoIQGNKQO4
	+EhXe4Tw9Ytrv0UBYXCrBXulGmo+2s3WlE7Zn5ubAsyXOp8FY4KQA4SuNWSBvH0a9JS0XGqsTPw
	kQFU6f6zkZ91zQpKx+Q4yRJl7k3PHoHaPuEitkBbJQTI5LrsVxlbbi37gqjzwiw+N5j6fgN/xGf
	FWc81LZmbseXLtgv+E1qVFcf9Z1HtH3WSL1qgcNdf5xDwXqrgZKf3O1UgLLspfiDbiVw52ldtki
	TuXoFCAnUlGufRx+CL7xpH9dCL7Q6txQH4z3IP/pnQFXMkCDVQ87xYJKYBbSrxiKmAfATDhZs8i
	g1hntQIdQJPS2Bhbai+Q5t4Erh6biJR42+B39SOrz/SwpdWQ2Nhsg5EP+cNCNlb966+LNjlcDw2
	E7ytTVm8+MdlFJ9xpf7m7UCuZwi5XDUZVajlY=
X-Received: by 2002:a05:622a:6096:b0:50d:7c44:e144 with SMTP id d75a77b69052e-51461be0b74mr190178861cf.11.1778265813098;
        Fri, 08 May 2026 11:43:33 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50d:7c44:e144 with SMTP id d75a77b69052e-51461be0b74mr190178231cf.11.1778265812631;
        Fri, 08 May 2026 11:43:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f62693f8sm6884831fa.38.2026.05.08.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:43:29 -0700 (PDT)
Date: Fri, 8 May 2026 21:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <qfjsg5r2doqoi5dwwpgccbrasnacwcshtshddwoiwyrndyrwyz@6xfmctnfem47>
References: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-0-472b913b5cb7@bootlin.com>
 <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-3-472b913b5cb7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-3-472b913b5cb7@bootlin.com>
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe2ed5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=UZaUIiQ-CiS0E6Nlr5MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: VLwX7sD1Ojrs4dqjKcPt_PTgD4jmyTbS
X-Proofpoint-GUID: VLwX7sD1Ojrs4dqjKcPt_PTgD4jmyTbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE4NyBTYWx0ZWRfX1f5du4yJQzi2
 DehHzL5AxJ4bYZNMsTJKZJrUGkPaB0e1pU6vysgAqpYYJIOTE9Fvo6Ts+03pTt+2YvdeL0swO7W
 e6c2Q22GKMi4NMgGypYE7F3nH5cPixH/1ZurHB1QeyI/uK2iIFNHRKzFQV9Dc3ASYAKqAu4BPgm
 gQl1VKI7kB8Rf/qJHwWh8+uM+Tnj57JVGIH5M5EkgSAxhSIK0BJrC+fwTWIGuf8LcEDYP89IGOo
 XASdsze5oRqP1ujH5q7pcb8gU3mRPItF6LzCrOi8EkFBlZTiSbIhZZl9guzG2km/miTXZETV2UD
 kFbUU/ZAKON1jgoWXs5WwMapWYpBylFm9QtVTjDNwNnSc/A3uXplX7JYW1GhJydqpGxbxjTWLvG
 qfXuR3hI9wP6wrLkH3oxSO7UxKcBtEAY15CDSE5MHYE6YQcTwrZDp9a/f18H6hx2BQF9Y0conLy
 1v6We+pL7DO6AF7rLmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_114335_258599_591E6122 
X-CRM114-Status: GOOD (  27.32  )
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

On Thu, May 07, 2026 at 03:45:21PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v5:
> - simplify error management code flow
> 
> Changes in v4:
> - ensure next_bridge is put on later probe failures
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index d9491aac1a89..3640be8c1bf9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -285,9 +285,14 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>  	spin_lock_init(&hdmi->reg_lock);
>  	mutex_init(&hdmi->state_mutex);
>  
> -	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
> -	if (ret && ret != -ENODEV)
> -		return ret;
> +	struct drm_bridge *next_bridge __free(drm_bridge_put) =
> +		of_drm_get_bridge_by_endpoint(dev_of_node(dev), 1, 0);
> +	if (IS_ERR(next_bridge)) {
> +		if (PTR_ERR(next_bridge) != -ENODEV)
> +			return PTR_ERR(next_bridge);
> +
> +		next_bridge = NULL;
> +	}
>  
>  	hdmi->mmio = msm_ioremap(pdev, "core_physical");
>  	if (IS_ERR(hdmi->mmio))
> @@ -367,6 +372,8 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put_phy;
>  
> +	hdmi->next_bridge = no_free_ptr(next_bridge);

Following the question on IRC. Yes, this seems to be too late. So, I'd
suggest keeping the current assignment place (and call drm_bridge_put()
accordingly). I'll rework that to use bridge.next_bridge afterwards.

> +
>  	return 0;
>  
>  err_put_phy:
> @@ -381,6 +388,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
>  	component_del(&pdev->dev, &msm_hdmi_ops);
>  
>  	msm_hdmi_put_phy(hdmi);
> +	drm_bridge_put(hdmi->next_bridge);
>  }
>  
>  static int msm_hdmi_runtime_suspend(struct device *dev)
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

