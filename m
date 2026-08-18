Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD71DC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=; b=IpE23knOdcjuvR3V+1GUV5PHkZ
	sHbavZxyLAuLe6qkYB+ttiK74IMFn8LTueg9VGec1d1hprpuu8vrmVCxcKT9k96CdZ7faS1907fG+
	pxD977F/GoDlm7WUH1G2qyU2Yz5U1zLVzvouHe+955iX4Oap0lTpCzYMgiVBGG98nb8q5Jm1Wm/3w
	tt4usR6T2YLCHGgSpyJkHttmecbIjzpTSi+Czyfml2KNCzjGzfAk/aGSu/C35JortSx3Dpj2ZOtTY
	DgqNsjoIAjzKOEvTM+CkIRx9M3OIHS5CuiEObNzF5hmb+iNzCMdqOa7XvaPvnoggdKBmXA7Tl+qGU
	BByA7kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA5O-000000077qW-3Nge;
	Tue, 18 Aug 2026 03:01:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA5L-000000077pY-3rqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:01:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28ZWJ2884830
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBz2J/YR064wcCDlSxnx2LWj
	NaH5A+0wFaq4Q0GwWVY=; b=CCt8SSDxuZAlXZCuVF7FdA4BBarebF0vi6DR6AUJ
	RohD5U3q065fxZ/SPY/Rj9yA0N/spjaxzfI6evKJnGwG9NZwKtYfIZlE+CAZ+VJm
	+jDyQlAqD6yFHtqJ7Y/wBOCet2HFnWUm/P6QKmnOVY0B5rQvXm5xag7Z1AEDvHLy
	0FTqbuMBdjcecjzVJ2w4QjuEt7kFy75e57f3gZXsF5/YLP4xJ8LViC0as/IfBbAB
	EKf/ZpbDUvXuMWFlBjjtUHGs+pPDy9yb2Eh+SYO7vc0nOv8KoOtrO9XMAmdGGJdx
	srrZQGKI+SrtZoXjSwkJsdqp0jzPrqsap/sri0fjwskkAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpr7ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349c5af52bso686294885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787022114; x=1787626914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=;
        b=eNF4/Rl7NFRjWKxFZfYRkoDrPd4AI+wuwaeazRTo4iThPO4zzOc/9fME1iRxxuqVPG
         W1RXLkUIshjYlVvW7yIGvzUX43H/5DJFhCF+/CN3vEWRwLrXAiMTNT1DVSXG0hevylTi
         VjeLvDwGA+qt89PwwGv4Fsm4Vtav2qV23rGLMAED0UMRZyybp1p6Yu+jmKvww/2uazOz
         vn/8blfuXCPI3i6Cj+MWsgFPw6GKWKi1R0jqLeaOM310SNQH1TWUgHb3rZd5MIaxNh34
         c1iWJChLPuWRT19C//9P1u7mF/wu6GiDNXdyTgk5xIf6w5PKwrrbaKkZNSTRtvcGaJ28
         B+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787022114; x=1787626914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=;
        b=q54d+k7tVb0Rz0SZQYoKqqLsxQ8VQ5PO8/bEbY6X5r1XHrZVQ968othntOu6EG7J6L
         7VN/cFeGZGN7+nhNU/dENSqr5pX60ufIZ8tb4CYQWRNCPqOac/RnsUEoikT+3xs8zCjp
         G0NixPM449VsHCD0e90T9aLroOJ2Ovo10WNU4fCZGsbDNviBmiCh1U1DLK2nsrszktOr
         Lo/HoqsWgV+l+gfPgniIK+sabcfo3CnDW/PwlW/tIFJG2bH0ODhEPEiyLYzPk3bQ733F
         b0+a8SMH/n1rXmO9/4WVi6CKlqJ1aldcgDAUK/o6hZAARBQOaM8s6EnNpge1o6jr6xlP
         Os5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rodorqti7Z385CBVjo4v9BVkwGljpVyLLcHMoBXFwoiIy5KLzQZO1iXksfe+YRzi6akXzgCnLVw2Rf+NOaiwACZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyIxqUHQ22YXRRs7yL7DeioqHT87r2np4BB8uN2Cw3QRtT+xpKc
	CSuToyR87cdwOh0EK2qXJ+MND8JtBQqTet71/BuvtSRrfumd3xDQaFnO0oLtbzTqv/wgoZ0jCl1
	hKcu0VsQkc6ZJswNQJqpKvZsuVwzl9CjLlExJvJoj/6UF5PpQmP9FDjGUl7CpWqcnCeMt9jaoL+
	vb+g==
X-Gm-Gg: AR+sD12hfmcdIq6t7bDC1uOVzvTnwM1uIx/FK02qEuSqcrzUoZa921urt82NNTw8Ef9
	qV5bgiV2hHg3Itoe6pcGkXj2xKs96iuOjlLTdHgy1Y5bfJ2dgGkyXCLX+VjLnvO4KCwx9Sjon79
	VGFooMHq8yLI1/+uDC3WT7JN+x4ewleBGRNVyj0ORVSrgEXqmqXgu1EaaHNwk6xT7v9ghVnrg1X
	TGH9OmaFNnw6NNb1ZYVPj+RsuPZYxqix013lOVk2Zx31iafXcAa5vOYTZNPLIFzni/xRQEy2E/m
	c5SktQrUM4e6PHfCCeQRHoju5fWtCyx/fzHF1+Ng9bBozW8Tym1g2H5liLKV21A9NrK+TaNBGOD
	RlA4qDzvKjbqSUglC+YkSqEJJ4Y/yRpOgpj0vVskqsoYoSglkzkNDdFi8a1P1aFVo4VIxNMQC8K
	Comnm8D0MSHH7g
X-Received: by 2002:a05:620a:28d1:b0:932:df7e:b31d with SMTP id af79cd13be357-936d227ee03mr2727443385a.12.1787022113810;
        Mon, 17 Aug 2026 20:01:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:932:df7e:b31d with SMTP id af79cd13be357-936d227ee03mr2727440185a.12.1787022113404;
        Mon, 17 Aug 2026 20:01:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcc39sm8342611fa.29.2026.08.17.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:01:51 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:01:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
X-Proofpoint-GUID: J119ssZRPq_71MPHWW5Ky-Hs0A9zNYAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMSBTYWx0ZWRfX+QZkhs1I3hNE
 KlXUzCt3F0e4adyGbOQzeh/bdb3XBP2RwI3JuOSD+B40fynKSBvjWhc3xmGFhP1YHqhEWQpMMKn
 169ylqwOR7OL6fojSnmPQLtMA0Q5Hx5BnJVa4OnyWAc6DNmrNMJnPUw02daMpF+0wTQ0SFiInTk
 vgu7M+r9NkAtjKj1XthlOJFb1xaje5D1h2f/Ds8az8eH3AVNNhBxJpDNFNz0H5gYpYDmyJngI++
 mPOVsV53yu9VXtP9Z/fcFImSNIHS8kq8k7ZWN4E6uc/z6B+3FrcmyPeBfjuZGrzaordoML2aOJj
 qIY2OUIm6WG61eM1ThvDwVlW7Ye5GNpojh0nnPLoiO6WPu/ORTb0Pu/MFGrkXFTBWfFWLX+lI86
 wj57smTo9wz52RcGEiKttXyn6wlP03KP9YgXc/AAYORr+SJflqs7rP+gSNFzx/hncVRVE4NDgXW
 b6nh3TOi9ExNODiNTxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMSBTYWx0ZWRfX4fN4dR0vYaGc
 IkZlLyTSoZW9PxHjXzcDJJesGBolZ77e2EHPm6UpP8QWYsZJsvHzA2fD2ate298YAQPD2eNq60/
 +rwXkBFJxT59bJXY67/UVBGjhHQaF5w=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83cb22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WMPlNdQLU-vNwlj8jccA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: J119ssZRPq_71MPHWW5Ky-Hs0A9zNYAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_200156_084734_123D741E 
X-CRM114-Status: GOOD (  37.12  )
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

On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > The bridge connector framework currently invokes all bridge
> > > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > > event afterwards.
> > > 
> > > However, not every HPD notification requires a userspace hotplug event.
> > > 
> > > In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> > > IRQ notifications through the bridge chain while the actual hotplug
> > > handling is performed by the DRM DP MST core. Connector creation,
> > > removal and userspace hotplug events are already managed by the MST
> > > topology framework.
> > > 
> > > Allow hpd_notify() implementations to suppress the bridge connector
> > > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > > can clear this flag when HPD processing should not result in a
> > > connector hotplug notification.
> > 
> > Why? Worst case the kernel receives another hotplug notification which
> > gets ignored by the driver.
> > 
> Hi, thanks for reviwing those patches.
> Let me try to explain the motivation.
> 
> Semantically, IRQ_HPD is just an IRQ notification, not a connection state
> transition, and shouldn't be turned into a userspace hotplug in the first
> place. However, drm_bridge_connector_handle_hpd() currently calls
> drm_kms_helper_connector_hotplug_event() unconditionally after processing
> the event, so every IRQ_HPD ends up reported as a hotplug.

What if the IRQ_HPD is delivered together with the first HPD event (for
example because of the TCPM processing those events)? See the mechanism
in the displayport.c AltMode driver.

> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
> not about "one extra hotplug", but about a burst of them within a short
> window.

Ok, if it is level-sticky, it should be handled as such.

> 
> Every one of those hotplugs is delivered to userspace via udev and
> prompts the compositor to re-probe the connector. In the window before
> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
> and performs aux/DPCD accesses, racing with the MST enable flow.

If there is a race, the path needs to have a lock, preventing concurrent
access. Otherwise, you are just shortening the window instead of solving
the problem.

> 
> The amplification also isn't limited to a single connector: on Hamoa
> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
> any one connector causes the compositor to re-query all 4. So this burst

Please fix the compositor, it should not need to query all 4 connectors
if the HPD event came from the single one.

> of spurious IRQ_HPDs during MST enable ends up amplified across the
> whole card.

How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
the HPD event to the userspace?

> > > A NULL pointer indicates that hotplug suppression is not supported by
> > > the caller, such as the connector detect polling path.
> > 
> > And nothing in this patch makes any use of it. I'd say, it's
> > questionable addition. Let me check other patches...
> > 
> You are right, I will reorganize the patches in next patchset.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
> > >   drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
> > >   drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
> > >   include/drm/drm_bridge.h                       |  3 ++-
> > >   7 files changed, 21 insertions(+), 12 deletions(-)
> > 
> 

-- 
With best wishes
Dmitry

