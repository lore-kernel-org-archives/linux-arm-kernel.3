Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA90CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n2g0Y56LJ8V+gTCm6izqR6cNmLrEHV5/R5UXj9u9s4=; b=ieH/V2a/355bd0epfiWyM/Gp46
	JQj983CY93OIBs558hfg0zQMl16B/Oxa9ozaFwejtaWXKTlOGNA090EvxvURr56PDVOLzKC1121yr
	ibkUUb99kizW9iJaOmG2EYpt0kn2heZdxSLoBG9/UcxTdkIVF9UnYxcy2JU1cm54gETQsBSTnLaso
	mJkSpy2VF9LBCYqh3k+MVhF7MeORnLSXyPflWLVQ6gnXSG9kmG7Rs+czOSOH60vOSXK6xRbgpKdCs
	sB9XK9I8fuyEYSLbuVfhygV+MZkYtLu9PzkARA2ufE/zRkHyB6YT2Eq8WmD6j/aNwdimSIvSXvuay
	G445JU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urInB-0000000G9ge-3Krx;
	Wed, 27 Aug 2025 16:14:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGlp-0000000FgQb-47C7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:05:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kH9U030242
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 14:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3n2g0Y56LJ8V+gTCm6izqR6c
	NmLrEHV5/R5UXj9u9s4=; b=H9ALsPMiECpSZnQXU2DW4FIqnnpUD94/ULdoZiy0
	qN2lzn8VtL6uoNXZdnR2C+U1A1sUExlCx6MMlJrN4HKN3V6S8a7w07U238xpL4mb
	y1qQ0jXaTUHWT/mm4aT5sztcNM0AQpow3HRi6R2SYZGgKC78TFHp/WYXicXa7BEi
	JciTR8mHsb3HCI0x/eOnk6vF9lBZ16987ABMFpPF3ov4RJlGcgEZ45aO6720q+8o
	YazMiJVLwznoljH6k+S9oQfFgOn1gD/1SFCRjT3up7GVWiVlBP05MBYGx7SONp//
	yKrzgMxsvrKdmDYIT0tbeoaGU6i+Lh5zyKpk+ZsgzPfflg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unvpdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 14:05:00 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ef026c145fso22107565ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 07:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303500; x=1756908300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n2g0Y56LJ8V+gTCm6izqR6cNmLrEHV5/R5UXj9u9s4=;
        b=VvY1CneBUxiKONQyPB1KbXZrngCpTUCmq+6kFVxsO7PFAZ+VmX+8VrbM+CT0Gd9XM5
         OhBE0r+EzrZURtbijJfzCN/Jat3Ge+REA1lES7PK4NmnALrFhOXm/MQSU73sBylKHeKf
         WYqf2Oa3yWC5fvKbI5am9pQcp/SdixxS2lqwwpofdAHOV1TfXYEQ9t32sxul56YLYUYA
         cOzKl2xMuIOOZYZ3bZQhlmOLqn7rWMICv2JCl2IM/KD9pC8Qu1foQVm6T06UKt0nYEnf
         W/ZRW/J8Gtm9QpngiD37vfma78qCXGx0PHdYGTSBkHHK2IbdA8WLEmOVNL7bRh2u5eUS
         oGGw==
X-Forwarded-Encrypted: i=1; AJvYcCUh0WqUHm5Z4AeCyy/m8tTrvNmjvryvp25vCtMaD33Eil9LCZ5iFeCVzvRWsb+53t3tOKme9/8f0YKevFddgvCh@lists.infradead.org
X-Gm-Message-State: AOJu0YzoRmbERsCIr//0eCNe8tXk1t/g6XfFT74c3faJo50ZBGwh5F6U
	PcoXVq59SjmhtkEvO5N8wiKXtpnU7VtE8+U82rARNX22l0pMjF8rpza6tX6LoaK5Kdn2Z+x1y3k
	rXdRWUK3030yaJir6vDkL7kNaIH5DYY3abnvEx9SbiKb8baRJNb246QinroLdXuStsVqNURSdwZ
	+LiA==
X-Gm-Gg: ASbGnctru/5l9YCy2AR3jbSktw62pzVaMOWCNJUxFLHgmmXTEl/frEC8GU1WSNVKTTY
	xAD/lvXZ5Px240bIxf5A+djijIsUR5/fcfT2O7bKutf1kMOlQm57k+emjGzgS3nqvSeSvLdF0cS
	wOgaRrqi1JXpqAwh1DhAPM1C261tjxxj67mBnVBxVqfhF8cZ/IAuN01qtowEkuwyr3iXfr3HsJZ
	Xh54Vvd8VrJP4VbzZoJL2Lljc6QDYX38jLLDIJV6nuRNY+yn2r6NGMTvLm+6P+k2pbkMrXG5WhV
	8OsjNfThXLpbyAQB7eWAS1h90O4NQkEXC49q7kgvBO+9s1JCmwZzhR6cBD8RIS0EjI6Hw/jltw6
	rCB0Tv9ubcNVRL8JPf714beo9f1qI/aLDLFXKNfg8XKn2utLo525z
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id e9e14a558f8ab-3ef1b56c9f9mr67416045ab.11.1756303498958;
        Wed, 27 Aug 2025 07:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/xsdrf+XrjtSQ2K8ar35ewr1T+sNBP+/hCqgRfZjcDR4oY8KJbZTP/1e4Kh/mCkfx80z06g==
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id e9e14a558f8ab-3ef1b56c9f9mr67415045ab.11.1756303498104;
        Wed, 27 Aug 2025 07:04:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c11ffesm2878362e87.40.2025.08.27.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 07:04:56 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:04:53 +0300
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <jrvjvayhjczgb4yx3xshbv3e6ndzkmb7uu3ynoes2maniwjg37@hamxu5mzqmf7>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
 <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
 <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
X-Proofpoint-GUID: TOyOwNdIhbbxcaiRCzWgxj_tcus94OrY
X-Proofpoint-ORIG-GUID: TOyOwNdIhbbxcaiRCzWgxj_tcus94OrY
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68af108c cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WI-fMjCVXOxGoBDYoyYA:9 a=CjuIK1q_8ugA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX/Z5aOZa0lWer
 3IyRzICDIq9qlQiNKPqY7gs7qCtX1+kBqmezhz/luEnP6S4cvv0LZKOborfh92BClTC+jDFjMck
 XtfeYqaH7ZTLLXjtZ7g3SLZUXKWcFcg0L1AcB2O7iza42QUjI2Q85rqCWRgs1s9NMMcJ3g7R2dG
 kWvyMVtar/WqDI1yHSuejN6Efr37WmjcwL8zWiIbF02ZnKUWb8+hjvquaxjp6uzDKejOi6AOpkY
 /E0W8Ue/grMsoXxNJscSIIwiggqbgfrwNdUA+Ldt4rn67D1lBcbsNzBAKpVSa6nZka9bf3VgrlS
 ZvXI0bUHGBHJHhHNP5xZjeO2ZJVsxVG2EGF00vqbMOH8zXPlwYVoZdsDJzsiYDTBITHZduh4Gu2
 sJtqebK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_070502_131766_A94F7034 
X-CRM114-Status: GOOD (  51.11  )
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

On Wed, Aug 27, 2025 at 09:30:20AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Aug 20, 2025 at 12:52:44PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > > > Currently DRM framework expects that the HDMI connector driver supports
> > > > all infoframe types: it generates the data as required and calls into
> > > > the driver to program all of them, letting the driver to soft-fail if
> > > > the infoframe is unsupported. This has a major drawback on userspace
> > > > API: the framework also registers debugfs files for all Infoframe types,
> > > > possibly surprising the users when infoframe is visible in the debugfs
> > > > file, but it is not visible on the wire.
> > > > 
> > > > Let drivers declare that they support only a subset of infoframes,
> > > > creating a more consistent interface.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > 
> > > I'm not really convinced. Infoframes aren't really something you should
> > > ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> > > audio support is enabled, DRM is mandatory if HDR is used.
> > 
> > Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
> > provide support only for the AVI infoframe.
> 
> Yes, but it's still something we shouldn't paper over. The spec mandates
> it, if drivers want to deviate from it it's something we should warn
> about, not silence.
> 
> sun4i is a good example, to me at least since I have the doc. The
> hardware supports AVI, Audio, ACP, and SPD. HDR isn't supported, so DRM
> isn't either. The only missing one is HDMI, but the documentation isn't
> the best so it might still be supported. In short, it's a driver issue.
> 
> adv7511 supports AVI, Audio, ACP, SPD, ACP, and looks to have a
> mechanism to send any infoframe as is. So, again, driver issue.

I've send a patch, enabling SPD and VSI (HDMI) InfoFrames on ADV7511.

> 
> I couldn't find the other datasheet, but I'd be very surprised if it
> wasn't the case for these too.
> 
> > Some of them can be extended to support other infoframe kinds (e.g.
> > ADV7511 has two spare infoframes which can be used for HDMI and SPD).
> > 
> > > SPD is indeed optional though.
> > > 
> > > So, it's really dynamic in essence, and not really something we should
> > > expect drivers to ignore.
> > > 
> > > I do acknowledge that a lot of drivers just silently ignore the
> > > infoframes they don't support at the moment, which isn't great either.
> > > 
> > > Maybe we should standardize and document what drivers should do when
> > > they don't support a given infoframe type?
> > 
> > The chips might be generating infoframes internally. This series was
> > triggered by LT9611UXC, which does all HDMI work under the hood in the
> > firmware. See [1]. The series I posted hooks HDMI audio directly into
> > the bridge driver, but I'd really prefer to be able to use
> > drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
> > implementing CEC support for it.
> > 
> > ADV7511 likewise generates audio infoframe without Linux
> > help (audio-related fields are programmed, but it's not the
> > infoframe itself).
> 
> Implementing the write_infoframe hooks as a nop with a comment in those
> case is totally reasonable to me.
> 
> I'd still like to document that drivers should only return 0 if they
> programmed the infoframe, and -ENOTSUPP (and the core logging a warning)
> otherwise.
> 
> That way, we would be able to differentiate between the legimitate
> LT9611UXC case, and the "driver is broken" sun4i (and others) case.

I don't want to end up in a sitation where userspace has a different
idea of the InfoFrame being sent than the actual one being present on
the wire. It seems, we need several states per the infoframe:

- Not supported
- Autogenerated
- Generated by software

E.g. in case of ADV7511 we can declare that Audio InfofFrame is
autogenerated, AVI, HDMI and SPD as 'software-generated' and DRM (HDR)
as unsupported. LT9611UXC will declare all (need to check) frame types
as auto.

This way we can implement the checks and still keep userspace from
having irrelevant data in debugfs.

I will update my patchset to implement this, but I have another question
beforehand: should we just declare VSI support or should it be more exact,
specifying that the driver support HVS (00:0c:03), HVFS (c4:5d:d8), etc?

I'm asking, because e.g. MSM HDMI controller has hardware support for
generating HVS frames (but only HVS, the OUI is not programmed, register
format doesn't match 1:1 frame contents, etc). I instead ended up using
GENERIC0, because it was more flexible (it's like SPARE packets on
ADV7511, the contents is being sent as is). However if we ever need to
send DRM infoframes, we might need to switch from GENERIC0 to HVS, for
the price of being unable to send HVFS frames.

WDYT?

-- 
With best wishes
Dmitry

