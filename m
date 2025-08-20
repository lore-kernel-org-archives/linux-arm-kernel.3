Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68464CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS/mAyLr2b7OYnR7JU7D3yhv4WGKliyobGTdxLp6JGk=; b=2hR8vaNxt/IJoxRWQiLxRGVyDq
	buEaeuCoNFwDsnCfbWW004qGZWPBVggAg9EMa21TIRZ7rG1faCluG9JtQKJ9EqKoBQNnJXt92GKG+
	mQVYBeJNQbD3Aw5qSVnfKFffnuq4Pe9u8L5xr6a3lvTFyg27lMvOrfo82bx5Xo1ndu/iQlEM/OPLo
	aZZPcLCmNVl/R+mEcw1BdYgdIstFqyBBkHaEjYNvMZaB9gAXuyRJgxvHfNeDfEuBhrlhXuC/nFaFl
	7g5jHpebFJWsSHdhjVM4BaPSRerhbHe/sU2yATIGTAPXpxxd184p2zP2qV0ddTSkJRv+WznItgZze
	7+PMZTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogMm-0000000DEeM-2k7e;
	Wed, 20 Aug 2025 10:48:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofV1-0000000D26Z-1qGj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 09:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vS/mAyLr2b7OYnR7JU7D3yhv4WGKliyobGTdxLp6JGk=; b=mmLR4aLJ+i852e8OCjANbekzpm
	kXrGGqnAQHQfYIKiR1SEQNtqMdCqGkbBwtY0yFqjJZg3xxTdcM/fB+LfxCfS2osd5lrFwxGOLe7mT
	54D4ALKQmPcAAvOfB/A1c3b6RHKIXVT6zA3LIrEpdBiVmLfTE+2Ab4wNPxRBtHIBTSkoj68yGenhY
	O07fTPYDEeWl3XRX2dj30Qc2g10lD1vEWD8VWQ0z1gEKNeCJSUB3niKU9tzLzTah0lpY2WS2W3+E5
	QJZ4ngosW/4wL1b0jjK8ZdidNkCtFAKcIRkwkYJhk0Gonv/Ycyc6I0ryFmVUjIVp0cu9eS+Mvkg08
	LMejdAMA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofUy-00000000Hpz-0dlh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 09:52:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1opEb011829
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vS/mAyLr2b7OYnR7JU7D3yhv
	4WGKliyobGTdxLp6JGk=; b=kzYC6ChphM9DjkW+m3Y2ie9m0ho+HuIohiI6AXbn
	TevF+7Exk39Pz0riittMo0GLI+th9Te8QDV00MGqOyvKojU9uBUfe3/2I0Pvumb2
	VHbU4TvkmmWpIXSinhNVwY2JTGbRI45gddHGk6QI+/kVPeg9+PJm2c9JGgUtSenj
	RWvXOL6YBwLCbXPucUBE3uzsAYrJ0Db1Yb2s32sYJ5Q2ot0HE2TO3/joGXt251fg
	+itwixEEZvS1drv/pkVVivZEwULllBWP2yUyXrBQxXCnkyS569qOvlgbvPVaRbU4
	0q9Ln385/pTvBYksAd1HlNCUR7eaIC5gGG22ZdlZy4Mw7g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s8wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:52:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-709e7485b3eso16569296d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 02:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683568; x=1756288368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS/mAyLr2b7OYnR7JU7D3yhv4WGKliyobGTdxLp6JGk=;
        b=R++ZGnNKXHojMYAsUz9cupa97LcmwOWcXJ3YVzJ0hxcdkQuSTaDpMAVPBBbfl4jwHL
         EO/43WyTkOqAi+eUXndvZSKawNnzU+O3zMltC9xIcunDcxaedH/VwoG0tfuENYy5qMiJ
         Dpqo5yuUPwDbg92DIvgU1BrDSYacXMu9LJLjL34bMfJfABWFGIbrbfn0p+yPcr7vzTed
         FFIfqZjT8DkQ31hhz7H5O9rLSBo0+jXsQGySRdBWT9hdcIPAYgdQhEdUtJmcLCM2ve84
         hiYbAqH5ERLlaeiRRickQguGvUh356ggTOW5wlJxe0LoM4dJpw2PxvKPhnB+5MSjhsH7
         9zjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpNTiznsJiuIOBN5l+fMj7/mdEEPoME3CTfyd+ZLg7bfYvfbkJJhBfhYXzWhxPGR/caJs4cQLKCq20fMbmg1oj@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCs7DgDnbaKbmcO/1feNfaK5Pi64Vyi0FjwJOGkP3WaJ7rWYV
	WGonyijxkDr++ARHa9Yetm7wqv9xZk9B3c8gz//dSZtJi59tli9D5Wu/70YeyFDLe2obTa91RtN
	F2vI0ImHv4fG6dzYBMXNCywYNBfZ2/mqAOzQ4qtmDEz+dRiMkONRiKKW/FfIW5pJvUJUvnWH9u1
	VZTA==
X-Gm-Gg: ASbGncud4FDFbXBKCgrUcjjf5ZHxkW+TwpYSn69l4j4CQI+pAfpYMm/U+pTLPMbKU9a
	TvAxVZ7Fteuyft03Shdqx4hcVbynL9iTT5WRX42exVxO6YjMQMtJOezMLFJIHoy2oxpjYqX61xU
	wNWEJt+YXOtKXUGGetWjIcu8iSvBKOzHm0UQ/UlOZEzv3RO95YwVFFw2Z8y3BONZvmxsqWTQcdU
	jm0I3SsnmqV58mnyXYorr3imHTPrB68ohyrq6JiX2ql0nEbi/wjds7Gf9AoOtNy/UcdCzyTkdco
	clCFnFj1yh8gyqxWPo62lRQvWUF15LGhKd6cL2sSYwKBmmmxwq33ceWy5Fzf5mmlMq9HZD00GgF
	+m660vEWcyoG+bDgetF3VVZtmuCB5kyHDJN2b+UslB5mUadOue7Yk
X-Received: by 2002:ad4:4ea1:0:b0:70b:ca78:4f52 with SMTP id 6a1803df08f44-70c67846f04mr66771966d6.14.1755683568527;
        Wed, 20 Aug 2025 02:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbZVfxSxGCwPd3oehLj8RTp0Pg/kMsu5jl3xY9Xrr59eonPeKRysDyx2GcL/dNxiu6DA0/Q==
X-Received: by 2002:ad4:4ea1:0:b0:70b:ca78:4f52 with SMTP id 6a1803df08f44-70c67846f04mr66771546d6.14.1755683567880;
        Wed, 20 Aug 2025 02:52:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a48b46bsm24544711fa.36.2025.08.20.02.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:52:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 12:52:44 +0300
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
Message-ID: <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-artichoke-silkworm-of-election-521b5e@houat>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a59af1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lQ937gVn5cPVmAjJ5oIA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: txfQycsSE1NkF_L90_BcbpoS2RSW8u5J
X-Proofpoint-ORIG-GUID: txfQycsSE1NkF_L90_BcbpoS2RSW8u5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/sa/GqW/31Pv
 5EYoyIMMsuiWItk9LZGf4zxxsfGPOVRCLB3yJxF5ujUTIRqgAnAvb+EfcYXuCGYy5sUDw0wg8F/
 h8QQ6IDNzL0hzKf9W45sKDmWBm6rAgNoEbNP9ebk8Wh6Zbcx/4ocRE8tkAUZj/rcmTWYZugSsBE
 L8O/XwWjsxWvKy7QPEOWc6df90Ji24W7YV9eiyPd08nCT5z/dR0D7DfOfIZSmhtBieoj8zj3frR
 1dNqNJWC/S1W0xysGzEO9KuaIRW/QHRkge/hIAKSDDT6qpX2rtqEmydclkOHFZny7DW4RFkjDWh
 aj8h/OXxwEUtLz8KLbfo6UVtx852mQDi2zHSCcgn4Oyhv2fyqJ6WkFpl487YqnF9AiHIR7Axj5Z
 YdSEBtPRdSfbpE1aVUtTvxBIThe3zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_105252_526585_582EBA8E 
X-CRM114-Status: GOOD (  32.35  )
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

On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > Currently DRM framework expects that the HDMI connector driver supports
> > all infoframe types: it generates the data as required and calls into
> > the driver to program all of them, letting the driver to soft-fail if
> > the infoframe is unsupported. This has a major drawback on userspace
> > API: the framework also registers debugfs files for all Infoframe types,
> > possibly surprising the users when infoframe is visible in the debugfs
> > file, but it is not visible on the wire.
> > 
> > Let drivers declare that they support only a subset of infoframes,
> > creating a more consistent interface.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I'm not really convinced. Infoframes aren't really something you should
> ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> audio support is enabled, DRM is mandatory if HDR is used.

Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
provide support only for the AVI infoframe.

Some of them can be extended to support other infoframe kinds (e.g.
ADV7511 has two spare infoframes which can be used for HDMI and SPD).

> SPD is indeed optional though.
> 
> So, it's really dynamic in essence, and not really something we should
> expect drivers to ignore.
> 
> I do acknowledge that a lot of drivers just silently ignore the
> infoframes they don't support at the moment, which isn't great either.
> 
> Maybe we should standardize and document what drivers should do when
> they don't support a given infoframe type?

The chips might be generating infoframes internally. This series was
triggered by LT9611UXC, which does all HDMI work under the hood in the
firmware. See [1]. The series I posted hooks HDMI audio directly into
the bridge driver, but I'd really prefer to be able to use
drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
implementing CEC support for it.

ADV7511 likewise generates audio infoframe without Linux
help (audio-related fields are programmed, but it's not the
infoframe itself).

Maybe I should change documentation for this field as 'support sending
infoframes generated by the Linux kernel'.

> Something like return EOPNOTSUPP if you don't support it, and we warn in
> the core if we get one for a mandatory infoframe?

[1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/

-- 
With best wishes
Dmitry

