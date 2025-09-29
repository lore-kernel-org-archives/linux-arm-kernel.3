Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB389CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSequNqFSYA0hQaFMGDh8sH2KqbBMi/C9WAGDMfQdVw=; b=N+XnK5A/BPCQUL934+gnSxw8SS
	N3y/NKf9OcrUE87ON3n+9Ti+QZdZJzf8RBcNf2LNt5avMX5w4f8ADwF3Jq11m35QPp+jAp88Y9yuS
	BX18vpubDMgAT9etSiVjm7zaS3vx6kHnRM4ypn7KqtiLzAUG1zGN/0vAv8rsC4nAzHRF/I6TwFAX7
	jBk3HJkjT7arH9isVHqAmstfKktcN7sxBljJFTUSk3Yy8U8IDS4E1lz/wR52nlFMAXIR4l6iE2p2G
	2L0UnvRkGjk45XdB9tGw2exXpDgHrRM+xXhWJ46xHjhq0MaSLRPLoKw7qZakFpIaw8Ln40JmD4v6B
	RAyG25FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39iN-00000001qrN-0CIK;
	Mon, 29 Sep 2025 08:58:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39iK-00000001qq7-3dhM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 08:58:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMkvtG027115
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wSequNqFSYA0hQaFMGDh8sH2
	KqbBMi/C9WAGDMfQdVw=; b=CgQghBqqAX6HNwF8cUOrkL+/imUDeljUBwxSMLqU
	EABUCjKImHemM61jfkSa5ngSAaIIN9qk6jx0xNtyw/ve46+UV8CrZ855qA5wkC0j
	FSgIqWNYpuQxbvCgAz83PFQjPOdJBELHYSvfXbYkYH/oDfo4bcf37VgPicVaACDa
	AII0m6+fC6Qsd6ILfrex1yeoqb6DclNrOokHpZOgLmXoY+CV2NQHiV4XpasOiexT
	GvMBOrNzWP8MbsKx+20UPxjPyi71gb4UoYmKNhadnp/a3/onTUYD1TZcHHZKoqBL
	zVv/0A4znKvD6uCf1A4OqshGicsKhhpGhIwxE8Tp7fwnuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977mabv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:58:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de5fe839aeso70308151cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 01:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136310; x=1759741110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSequNqFSYA0hQaFMGDh8sH2KqbBMi/C9WAGDMfQdVw=;
        b=SZV9sifPwLO42rSd5X8ik9ja8nqAxwqJepnvPK0JLEhICAhT2OMz/pMrhXr5tIqK7v
         0IlaltptaMQ7kR+ZV6qtMkqLi/FpoqT9jzKVM9/jJfxqrNM1WZKZWHLCthgktX6ZRfqx
         fRsj6mVtZAjT5iM0ssmOM04GYyN6mGxVewQcKr6tN7f9f7tR2w65EyB7xTNRTrgEcfEw
         CVecA939vrxFbHiV8CGYdPhCWHVegENdply649RTXRq7qGRghKqiQxJ9Sqh8G1KJne+9
         xcl6EE+aiUEloz6l628AV9I8EhRpd2CZZRXslhf4n+cYpnbawgULFzEkHQ6ugxg40nCo
         7SxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRlbmiM8Fod4Qli78CK3sav4o8J4KKVNjmYsTmy5KeS9lCobqnboGuFu8tUmFCffOfbguRpcihAGtLJVumquA7@lists.infradead.org
X-Gm-Message-State: AOJu0YyBnORTPNPoMdjtBXlB9Xrd94A0PJmYu30D6OvqH2rraUmKPqVL
	Yp+543a1z5ywFOPUEZtSekCSq1lA++F/O4kFU2YiB62BHptzrvLGJBQhs/SK2YWJWDKpqqV7dCV
	wfRwL+EUIVA2NJDardtGQuHjgMANuIXQmbi/oSod6AIcO5U+OR3tr0kXkRMFE4PE0oEM6pp1sV7
	KkbA==
X-Gm-Gg: ASbGncu4E0CLhQpANyVqxiyEScg2a7f2Gzi77r29J//+wom7+XYKIk3d9Hzz7Oop2GM
	oD3LUgPvLJLOGql6rovsuZsKb3oQIEv5uqTzPMKJkFk7oNPVTWDNp4id7loel+3aiDMZlIIhu5w
	E9kL3axfV0/7rZJ+MSXEj6ecHWmrS5nk90vEAeN/pUCUrzrJkz2lS0/mtn6SJwbHSlr4Wb+7On7
	833ih4DIMc3bRKq4EACC+3zhq13m6ISbso+vG1OjbQpdiOBZVWHl/80svtEaYJw3hqHKwz0KJVW
	i6IWKThluaLzAe/dInBiQQXhopEwW3+fonCtufSJ7vAIKYZCcDQvRHaHHrxRQVBTLfCFEazIRqx
	xCV7JBfv4FWkSL8osiJFrYhovN+PFQzNkG5mpIHu0CJzR4byd+Dzg
X-Received: by 2002:a05:622a:5c17:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4df45b11effmr106393371cf.69.1759136310529;
        Mon, 29 Sep 2025 01:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRXtkJG4+SzyzmUaBbzgU9Nn5Sl1tWg+sCFw1xHVc4pJ5o/wczABJ+K+k97kihrHCINuJSYw==
X-Received: by 2002:a05:622a:5c17:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4df45b11effmr106392941cf.69.1759136310059;
        Mon, 29 Sep 2025 01:58:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343130asm3993046e87.1.2025.09.29.01.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:58:29 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
Message-ID: <y3sndmfnwtljkbrssyycg6scjujt4kkjfo3gjclo3suzvqdahl@bdrdzmiolcb4>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
 <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
X-Proofpoint-GUID: mgUZ-Gb67jByJpgy-0F1WXXwfyslgedY
X-Proofpoint-ORIG-GUID: mgUZ-Gb67jByJpgy-0F1WXXwfyslgedY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX45K93wlACVmj
 C7X6LJCtwVZ5mmmQ+JPKahII6ynVV8qsqfPzMvc4gT1NPwPGrfVlZr+YcmcuQPghqTM0PcAliEz
 afLJaeKlER9XASyee/9TQBo8/R8kdFyN8QDxEU73jPQFKwbFDE0R/m74rJHRnkLHFZ4DycsdOxo
 sLfR17yv+BixaIw+qNMLfWT6XL7MsG+EmJSzk0bw9aNfInEPlcB/ZHJoynWk30IHgEec76HbKF9
 6DdKydIPurvkI5BqTV7p8WS9sjW8zs5kpfiXwB1iVqOII1hel3tz0G4UaLfmzbG9/9vA4cP6/Mn
 cRY4ipJKrkPlgBHcxSUCrZyc4YV/NSiCChx7PH0vsNoCnRqTlE3c5bYuvpTjQrRzyDHJSCT5vMR
 I0nBQQZT9duUJcgl2tc1YdIJ62CXRw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68da4a38 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Wi-JpQQdkJIPRSjGzdwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_015832_910160_7DE4CD3A 
X-CRM114-Status: GOOD (  35.93  )
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

On Mon, Sep 29, 2025 at 03:56:31PM +0800, Liu Ying wrote:
> On 09/28/2025, Dmitry Baryshkov wrote:
> > Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
> > return -EOPNOTSUPP for unsupported InfoFrames and make sure that
> > atomic_check() callback doesn't allow unsupported InfoFrames to be
> > enabled.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> > index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
> >  		break;
> >  	default:
> > -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  			     ENABLE_PKT | REPEAT_PKT);
> >  		break;
> >  	default:
> > -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> >  }
> >  
> > +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state *bridge_state,
> > +				      struct drm_crtc_state *crtc_state,
> > +				      struct drm_connector_state *conn_state)
> > +{
> > +	/* not supported by the driver */
> > +	conn_state->hdmi.infoframes.spd.set = false;
> > +
> > +	/* should not happen, audio support not enabled */
> > +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> > +			     conn_state->connector->hdmi.infoframes.audio.set))
> 
> Maybe use drm_err_once() instead to provide the reason for the warning in
> a string?

I can change all of them to drm_err_once(), sure.

> 
> > +		return -EOPNOTSUPP;
> 
> As this check could return error, it should be moved before
> 'conn_state->hdmi.infoframes.spd.set = false;' to gain a little performance.

I'd say, it would be negligible.

> 
> > +
> > +	/* should not happen, HDR support not enabled */
> > +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> > +			     conn_state->hdmi.infoframes.hdr_drm.set))
> > +		return -EOPNOTSUPP;
> 
> I don't think IT6263 chip supports DRM infoframe.  The drm_WARN_ON_ONCE()
> call could make driver readers think that DRM infoframe could be enabled
> in the future as audio infoframe has the same warning and IT6263 chip does
> support audio infoframe.  So, maybe:
> 
> /* IT6263 chip doesn't support DRM infoframe. */
> conn_state->hdmi.infoframes.hdr_drm.set = false;

I'd rather not do that. My point here was that the driver can not end up
in the state where this frame is enabled, because it can only happen if
the driver sets max_bpc (which it doesn't). Likewise Audio InfoFrame can
not get enabled because the driver doesn't call into audio functions. On
the contrary, SPD frame (or HDMI in several other drivers) can be
enabled by the framework, so we silently turn then off here.

> 
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_bridge_funcs it6263_bridge_funcs = {
> > +	.atomic_check = it6263_bridge_atomic_check,
> >  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >  	.atomic_reset = drm_atomic_helper_bridge_reset,
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
With best wishes
Dmitry

