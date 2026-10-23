Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v29HtcPI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKZn6itY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9KEdRm1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=; b=v29HtcPIWPfoDQbpVeTSOKB7hc
	aPwdBMulAh+g/rOYp1mN9B5W+HZjzciziGGBapQZ8rNAyHeqEeeloG/DOZkihBvGHcuPJG0B7ci+u
	v7xpMnpE1JJ+puFTYngHTiTN/5xGlhGt2OGWHtP80cUYMOFZvYsbvUQoAlSn8nzZavUSbDxgmf5Hq
	BJkMjAELMaVqs2GhTxPQB5yB0D45UpolsorapgSLZEwlmGDlYeASS+VvulXhEQwXVz16Amimf1wJT
	3DpLw1XKcrIiHuwFvTshkt1jdlc8Jp6l1m5X+Fg4mOIYZ/5syOP9GxFe7IAnkWzxIjzbhtHCtU6fb
	pfk1OtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFmv-0000000GSCa-0NdW;
	Fri, 23 Oct 2026 13:58:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFms-0000000GSBq-3Q20
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:58:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUot3550605
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7Lokafbtj5YFNefAbCjS5Pj
	lLoXzpnAAjQItwYXw84=; b=eKZn6itYuZIK1NC+9xHZfchb8KTvAyZ4XOZFYKW3
	0+eTAk+I5XmKxB2IVs6XMk3Q4p/ByPrf1ZTnpvQHFTOeI1KGya6D0PwH2ZIYkgrC
	7/7GGI4RqWTsbZhM5FFlTpPlspHcsdoo0xAMW3mvg4cF340wjMk+EcguNR7RBcnB
	Zo5LqK4fOujLdPenSVOkz7Oj7zyEgjkhOSYGBWpROdPrzaVvRMXhrDPDG6O1uF0e
	bCJhqZmO7E20D9jboC3u2wZEW8oVDDYtHRQAW0FVHWH1+eE70DXGzC1uBMkSDGj9
	vH7u0yaK7343vdgcpUEcNsip5r2jE9+ZdhE4dhen2LK7YQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrby00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:58:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso146191285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792763905; x=1793368705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=j9KEdRm1uwSgGREGw3xV/qA7+DAtIsIkUaPalsG5gXXIqhNWdP3OAI7JB8NuLVtrEK
         rfEi3ctq1x+aupYsqyexOkyXwiA//V0rPNfe0lXH2ru2Q6ahnaEIgrp+1fL1vAWrmoVV
         B1AgziDu1JnOAkK0Pe0HyjHDTBVU4F7gHiEPAaKYwkG6wdPuiFJypvT3SekKjR4L5OHf
         dvM49YvTJahbth3A9LJ1okpgD1SJ6XvpEFBmmqM7fMr/wnwmh5Wl0eVLgi0YGDiQvrlV
         /2e4ifl40PhqkRTjGq+qtHeC1ssksnNpsVpz67XAxRtHM8F5SnuFDuObunMjmFhNQy5+
         61SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763905; x=1793368705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=0sxU0Z8YmMd7vVgfRjloyPU0WLkeyI1rLbEHEnpSzPmiNgKStvtzM0L+xCxAAkHuzC
         Wfqt4SQC/ablbQEprsucG9hXIw9K6Me1DL3caOQtIHRktwLchGPoI1iGX4WoYMnnfheO
         fXhL6cI5CzHEPaXFojYeAvtZQqHix23UIzEaW/dOAzhSwBUImPMRvLSvKotrQD4EZc95
         3RmqULUFwSeZ+zGXD+QmsRbh/5PCj+TjqhDL7W9kC0coevRWfHur0ngSe5mr72e9HxKO
         SFsgXs0Qq6uLHkiEFV+mE5GYJR+gcYzRaV7zEGfMb+Txb0Wo1AKo1YolDZ0o1Omgh9ov
         K2/g==
X-Forwarded-Encrypted: i=1; AKwUvBz0YyRB07/j5e+ntqvoX3kyB6crZ7x82nRjfrzNDWPe/CyawhGEee/ig0yd7mNpvh5Gzn2xa30dI9RfEKMfaMGu@lists.infradead.org
X-Gm-Message-State: AFq9FYJeoXJgSB4i330fTv/LOmzkCeR3R/WDK/lktUkatHvcFIou2bXU
	5FdiCtB5dE2ZC73XPmis/iErX0em9srXqXb6OOX+IHVSJxXjyENQJe3anbHCv0DWr5jYmbLN/Qc
	FCrbSz3tqOrP55gcglB19ZE4YWTgwy3oPBWOpe14wgc+y3EWBHkE83V8TQcLJ55wAaq63z1O3+w
	7cBg==
X-Gm-Gg: AYBFou2gKnG2i8ABPUe68NM/XnSRGznsYujY/eRVXHQlq+7MUQantCGsWRHpzBUGq+q
	+ESK+TlHgvDrTsBZLR5qcku2k+ZqMIJ5FkBLP4R8LOiKmzRmhbW7cWBtcNIiiSmPi5HILhcWdEN
	AYBYJITlT7V48cJQYHCXGCS5+2V6hIctWuHDaK99aO3+oMSVbmSjl+3C2QjG9iReCiSLVU7QW6K
	6RfAFx1a+IXRkzS8KBUm6HJ3Q7Lm4ezPJFzacVdnsStYY/4m01mfdOEOGXnQQ+DlTugxCYyH5t2
	9uFDYrZSlwq7o5DFbbXLTyRlsCyMJmH91VvjOCy0px/ecV1Krj7RK++PUbz7esN3+5mzMh9OGKf
	GawMFm9e5xA9MnbI4wyH3X30/weKgQMxxOxqnc15MEKVtt8p2QudVsTcEgoPWi7DtsW3okcU8LI
	IQCMeIPnYjWCA3
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398211285a.32.1792763905134;
        Fri, 23 Oct 2026 06:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398207285a.32.1792763904719;
        Fri, 23 Oct 2026 06:58:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a2033sm389578e87.77.2026.10.23.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:58:23 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:58:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD callback
Message-ID: <g5jbcwga22grufhguvkmq7scyd7ur6kxqeii24bedzli7nihfi@4hg5tcvlftnv>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Proofpoint-GUID: OH5ijMP2N_wo18q7fmzVaen21RZ7HJk0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX/pEnvLrXrmPO
 vx4O0QolTvMX+NKJhQus52ZGvepLhyDVdvUsLOwPprt+G8KBV86F/k76ltoZbwUdqqM0TPtur+G
 yHl0AF7SLY2BqoflJIITTerSoNcWUEI=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb6802 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FczUWju-UfBOor4io5QA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXxDCxSfbMNqTw
 att6Q1gJD66RqpoBc1szFb5BWDTMongMjbGYmfNu20ZK6u3w4Q/TuHWLSE1irqRJ27ImU2C/4tX
 uh57H4kN9jUhgujFW4JTq7VJZe0XmbMma7nsE7hzS6jmJtnMXWsOKq31Gwj2akrOKvxk7IQwv4C
 VuOZhC5HXNcQ+oFfKWcXOLrwc/5GBhlkEBIRo+uykUkLTTQN7zzZvC9EreoSzE5KiAVfQgKjlEY
 fTJOdrLy27pCdz2ripY8/+nBKdpPoRL2MxElPSZsplXb9SQc4vzhs0zwq1mnlyEfxufH7HcDD0z
 4Lwlz4hPU/AsAA4S4RraciOFxoqdQZnwGhtq8RFWTgOWtLr8uMQ2+R5/OeYy5Fp3gOb4g9hlsw+
 9pLwfqRfHlkaqzETV6p1sw5ip7iCk+aI/etQFlWn50Ug1xAF7DGjqZr/3ns7MpiIhCaZuuXPd++
 DUXm0n3MV0mqj2neMLw==
X-Proofpoint-ORIG-GUID: OH5ijMP2N_wo18q7fmzVaen21RZ7HJk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_065826_881267_9A627C84 
X-CRM114-Status: GOOD (  21.92  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 04:39:44PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
> 
> Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
>  drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
>  drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
>  include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
>  7 files changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index c542ba6ce7d3..a21f9355594c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  

This chunk needs to go into the previous patch. I will update it
tomorrow.

-- 
With best wishes
Dmitry

