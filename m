Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCECCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCKLHPclZ92VqQVzO2ihLAAMvehhf/ZUsH5t+sSqD3E=; b=bPmJ5Oxe0RrPpkPdomydSs0ESH
	vTZUvYBsskiGdTdWAwA77fGqCVmMM3GyHAAXtH+rFvGHPpk5s92L3tJh0bMowAJENsCIMW3wcCyTL
	H1siFrf6tIv52gR9ZiUqf/aiFgbwBik51YwL2Pk5ktPKzNldAsTQWl4JNvk5gpakydOIHMQCLyxbS
	Git+0XvrAUOKuUXNE2ARN85007/FlfQMkTxBpaRi/gxgEW9mPeBv14vFs7N1HCFiRrxpZAXcNgXBZ
	TPkK1a/4nSTUHaaP0LpXABgsycaQaLge7D43eKmAp+u00xfOa3ZCVV7QQupZ+GTGgcua/n6wx7Wt5
	GnNarpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nNP-0000000AJbW-1Q2D;
	Thu, 25 Sep 2025 14:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nNN-0000000AJYv-0HGr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 14:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UCKLHPclZ92VqQVzO2ihLAAMvehhf/ZUsH5t+sSqD3E=; b=StoGNNno0Ka8HWO50sRM/lKZhg
	iLHGo/04NgrhKYgjQMEOmpNIiCKoO3gfTvFoWF0lwf2MC2diDJvVikZWfFEFU8J/bh43Kkrv5D2BA
	ZQVZf033JstSaz5aKYMKTV3g0D1ht6C8eisAKnEtTkAviBDdAVTBb8hTOIlMy2jc5BbqJ+vjeOpIX
	s1iS67x+Wmk4DjLICKyMVoNpB155FLF0YxFXxIlEBb77LGmf2dfFLGtXJ1GR+8POlHnAABcGumwdn
	a8txvmJ0Y4P+4hm/T+3Yo2ET+Uw64G0Voif/EUichgD1hpT90t44PRkWpnu0+thIBwlNroQRq14zj
	+gOmdvgw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nNJ-00000009Hra-45h2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:55:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P99ln7002127
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCKLHPclZ92VqQVzO2ihLAAMvehhf/ZUsH5t+sSqD3E=; b=SMkLq9Wewvn6bGnz
	U6J7wYFE1wJkqpjahkh1SHMxuKKtZ/CX0Um8belckqxAZWqAiF3rrkmvbE3uzYYx
	4ZFsp3seTfAf6Vhz2DeIXiAA5j7kehb06ztPgyixJyk3J61J2ZtBELgE3zrBIV1B
	+BwHNiJscVYUc0aWDDmlVzdnT/I7WeNvcb9MbBxbG6+oWbk5z8gq1XPyGSsbiw5J
	GjvheJ9P4XTtsk4TqAdu0uzJG/rBGjkfB+3qovsYXU/np0EidbIgU3IqRbpmaWrA
	oc1g0MRUlchQSjOwmn8SsjQZk5WDZg50wlJhQaWDvwFpYhnLJFTJ9FjSXkD8BsZy
	TZ0azQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98rfyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:55:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ecf597acso24184111cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 07:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758812110; x=1759416910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCKLHPclZ92VqQVzO2ihLAAMvehhf/ZUsH5t+sSqD3E=;
        b=OV0RkSESdRn3voJKy7dQyLnpQuM1Yc99enKLRhTkkb03XHaXgxaNdur581qfGEJBVW
         Fo0Hut1HqQjEf7F92fWDZErK8tmugYSj7ujhibgMajnDFC4+/xUIEFW2xdV5nCEoq2Zb
         2gee7db+kjVD2rE50ZQGAEbSaLnFSt/ViD0CEcXf+b1MQiPXwiGFVscK/sysaBzrE1ol
         kPrf+mGBA7grzIFm3SQGz693V7TI8JWZfQE2n37DOnorgKg1GYsiaKEjUPOzOEMMfrOA
         rGLBoMIzQ0CJST+3EXfZ+VKZx95TNYaauE6VzDX/WSY/7xqYwTwfQRybnU4+IoH9rHIJ
         qIHg==
X-Forwarded-Encrypted: i=1; AJvYcCXyhCm6TH/MUmZLXEybirPUbDfzmMvVw4xKaxEARdr4pEpi1CcM8cozG5F4bqtoMHnYvfnt8WVr7QJpEfYbshoE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5miYhkBAzKFzbkcTGbgoQ4rm9SqlJYnMVbb0L4xucSaGEwZiO
	dM7ucu5umhGxvUgkW6WrzrEvbin7ZINhPRXw6tbwedDDzNvOQpUWtXACJphyqgNYLBrL/UweeLU
	Yo06TTfuMVAhb3RdGYANyerklseUB9MyC1EQYGTv491l52uYWRp+YGGxvfuaeNRVpGx3PJDB6az
	YJKQ==
X-Gm-Gg: ASbGncsbnETPg4TuWRxBG0VuGOZO9HmQnMsfFgsyutzM6EyAQ7uK+yJJh94QvBTd1pT
	Dc9QXuAG3nbym6PsYFR2I9Yx4xvWWHiF9w3wwAl3YrRytje2DSOaRfwxYf/CBC+P0l8fjbXXo5+
	5mCeb2HI4oQEqW8iJJv3tXQXrgzl8e9mxwpr1E07+rZz4C/Yhit151rl2zrGeR2oEE6Vr79VfR3
	OT2EvadpFRN8hzD10vk+7hNxqzl8OPw0aK0A2Ygn0MjOxPr3VNODFDFvgMuQV5sNIpR7wAWMO4H
	vppVoWsOt64BSvBkkwG5+YBi3jZi3BKFA5kqT0unMi1OgS0lIAHNXRF3TLtsaGe0Yd4puerkSXW
	VPD3/k5j1S15s5PTtdmFUmYXqPXaTT+hqeA3XVuEcQqRyot4Kg/Nu
X-Received: by 2002:a05:622a:2c4:b0:4ca:d221:7f47 with SMTP id d75a77b69052e-4da481d5671mr49733791cf.20.1758812110047;
        Thu, 25 Sep 2025 07:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZICDfrSZTRJ2GaxTMZc5seKL08CVV0TR7RmaHg0ybBZh1gfpRHIOxkw8Z+UaKEDm6GC1Ahw==
X-Received: by 2002:a05:622a:2c4:b0:4ca:d221:7f47 with SMTP id d75a77b69052e-4da481d5671mr49732751cf.20.1758812109007;
        Thu, 25 Sep 2025 07:55:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc02c1sm853387e87.60.2025.09.25.07.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:55:08 -0700 (PDT)
Date: Thu, 25 Sep 2025 17:55:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925-didactic-spiked-lobster-fefabe@penduick>
X-Proofpoint-GUID: ZPbvMp15yQdntAcISuQLxt-ycu1_eLsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXymJ5t0mrG3OG
 G6Il8kyNe9ty1zpTA2EZ4zeLI9tEnA2fTTb2Xx6zR4Woja7AGkAKc4ikbqzvj77EjH7CRwAAe5C
 ULoOW7sPqgmBtuVAINM+ZQFokDjU6ykXm1tLHX+JJ6gqsR3Fnb4BpvbOEh0uvopj6SY55s0xyyP
 BG9oy42AKEpRd5AgkuL6SS6aaHu4RkxcxaqwHeIHmu8iupY6T25otR2ZhYoOdDLuFbq6d3QSFHW
 M4/1u4NpRVaPsaO0HCRxne8GqM1WlwELNKmYD/BKZIFKygyRpnLXvb2TXPnmBl1jreEZKuM3hJ0
 g3t8U3BhZT8G0bnw6Z7uoOEGQvh9DQkUxnfX5Hyr7OBpzWIYD8uLMpzLc4S4TKmbETuAAC6oQzN
 1bBKC6Gw
X-Proofpoint-ORIG-GUID: ZPbvMp15yQdntAcISuQLxt-ycu1_eLsO
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d557cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=jixIfWMKhexVEAdDGxYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_155514_451209_CC16CD46 
X-CRM114-Status: GOOD (  69.05  )
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

On Thu, Sep 25, 2025 at 02:36:46PM +0200, Maxime Ripard wrote:
> On Wed, Sep 10, 2025 at 06:16:25PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 10, 2025 at 01:03:47PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> > > > Currently DRM framework expects that the HDMI connector driver supports
> > > > all infoframe types: it generates the data as required and calls into
> > > > the driver to program all of them, letting the driver to soft-fail if
> > > > the infoframe is unsupported. This has a major drawback on userspace
> > > > API: the framework also registers debugfs files for all Infoframe types,
> > > > possibly surprising the users when infoframe is visible in the debugfs
> > > > file, but it is not visible on the wire. Drivers are also expected to
> > > > return success even for unsuppoted InfoFrame types.
> > > > 
> > > > Let drivers declare that they support only a subset of infoframes,
> > > > creating a more consistent interface. Make the affected drivers return
> > > > -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> > > > not supported.
> > > > 
> > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > > > Acked-by: Daniel Stone <daniels@collabora.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > Again, I still believe that it's a bad idea, goes against what the spec
> > > states, and the framework was meant to be.
> > 
> > Please correct me if I'm wrong. The specs (HDMI & CEA) define several
> > infoframes and whether we should be sending them. If I'm reading it
> > correctrly, CEA spec explicitly says 'If the Source supports the
> > transmission of [foo] InfoFrame..." (6.4 - AVI, 6.6 - Audio, 6.7 MPEG,
> > 6.9 - DRM). For other InfoFrames (6.5 SPD, 6.8 NTSC VBI) it just defines
> > that sending those frames is optional.
> 
> SPD is indeed optional, but the HDMI spec, (HDMI 1.4b, Section 8.2.1 -
> Auxiliary Video information (AVI) InfoFrame) states that:
> 
>   A Source shall always transmit an AVI InfoFrame at least once per two
>   Video Fields if the Source:
> 
>    * is ever capable of transmitting an AVI InfoFrame or,
>    * is ever capable of transmitting YCBCR pixel encoding or,
>    * is ever capable of transmitting any colorimetry other than the
>      transmitted video format’s default colorimetry or,
>    * is ever capable of transmitting any xvYCC or future enhanced
>      colorimetry or,
>    * is ever capable of transmitting any Gamut Metadata packet or,
>    * is ever capable of transmitting any video format with multiple
>      allowed pixel repetitions or,
>    * is ever capable of transmitting Content Type other than “no data” or,
>    * is ever capable of transmitting YCC Quantization Range.
> 
>   The AVI InfoFrame shall be transmitted even while such a Source is
>   transmitting RGB and non-pixel-repeated video. When a Source is not
>   explicitly required to transmit AVI InfoFrames, it is recommended that
>   the Source transmit AVI InfoFrames.
> 
> So it's recommended in every case, and the list kind of makes it
> mandatory for how Linux uses HDMI.

Agreed.

> 
> Also, did we ever encounter some hardware that couldn't send AVI?

No.

> 
> Audio is mandatory when streaming audio, DRM when using HDR, and we
> don't support the others yet.
> 
> So the only we support but don't have to send is SPD.
> 
> > We can't even infer support for InfoFrames from the Source features.
> > E.g. CEA 6.6.1 defines a case when digital audio is allowed to be sent,
> > without sending Audio InfoFrame.
> 
> HDMI 1.4 section 8.2.2 - Audio Infoframe states that:
> 
>   Whenever an active audio stream is being transmitted, an accurate
>   Audio InfoFrame shall be transmitted at least once per two Video
>   Fields.
> 
> I'd say it takes precedence over CTA-861.

I see, I was referring to CTA indeed. HDMI takes precedence.

> 
> > As we will be getting more and more features, some of the InfoFrames
> > or data packets will be 'good to have, but not required'.
> 
> And drivers would be free to ignore those.
> 
> > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > 
> > Oops :-)
> > 
> > > unless we have a discussion about it and you convince me that it's
> > > actually something that we'd need.
> > 
> > My main concern is that the drivers should not opt-out of the features.
> > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > (yes, stupid examples), it should not be required to go through all the
> > drivers, making sure that they disable those. Instead the DRM framework
> > should be able to make decisions like:
> > 
> > - The driver supports SPD and the VSDB defines SPD, enable this
> >   InfoFrame (BTW, this needs to be done anyway, we should not be sending
> >   SPD if it's not defined in VSDB, if I read it correctly).
> > 
> > - The driver hints that the pixel data has only 10 meaninful bits of
> >   data per component (e.g. out of 12 for DeepColor 36), the Sink has
> >   HF-VSDB, send HF-VSIF.
> > 
> > - The driver has enabled 3D stereo mode, but it doesn't declare support
> >   for HF-VSIF. Send only H14b-VSIF.
> > 
> > Similarly (no, I don't have these on my TODO list, these are just
> > examples):
> > - The driver defines support for NTSC VBI, register a VBI device.
> > 
> > - The driver defines support for ISRC packets, register ISRC-related
> >   properties.
> > 
> > - The driver defines support for MPEG Source InfoFrame, provide a way
> >   for media players to report frame type and bit rate.
> > 
> > - The driver provides limited support for Extended HDR DM InfoFrames,
> >   select the correct frame type according to driver capabilities.
> > 
> > Without the 'supported' information we should change atomic_check()
> > functions to set infoframe->set to false for all unsupported InfoFrames
> > _and_ go through all the drivers again each time we add support for a
> > feature (e.g. after adding HF-VSIF support).
> 
> From what you described here, I think we share a similar goal and have
> somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> we just disagree on the trade-offs and ideal solution :)
> 
> I agree that we need to sanity check the drivers, and I don't want to go
> back to the situation we had before where drivers could just ignore
> infoframes and take the easy way out.
> 
> It should be hard, and easy to catch during review.
> 
> I don't think bitflag are a solution because, to me, it kind of fails
> both.
> 
> What if, just like the debugfs discussion, we split write_infoframe into
> write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> 
> How does that sound?

I'd say, I really like the single function to be called for writing the
infoframes. It makes it much harder for drivers to misbehave or to skip
something.

Following this discussion, let's take smaller steps: modify the drivers
to disable unsupported infoframes in atomic_check() and return an error
from write/clear_infoframe if the type is unuspported. Then I'd probably
like to correct SPD handling, only sending it if it is supported by the
Sink. I still think in the end we should have the bitmask for
truly-optional packets and InfoFrames, but having only SPD doesn't
provide enough pressure. I'd just leave the FIXME and let somebody
working on those features to implement that. I am tempted to implement
ISRC support just for the sake of it, but it probably doesn't make any
sense.

-- 
With best wishes
Dmitry

