Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79152CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 03:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6pXxYvTpFhxbjh80IOUWJOQ14f2Hl+NCOsXpDoJFW0=; b=qMtLedfUfzNvBtzYPCgatQyldj
	ZBPV53nAT5EICg7RayJYG/YPQ+Zv2nsTAF/ipO5Y0ahuDUGvFU3HENap5WAytxhptSbBmWf9J4ARC
	8kByY5Q/anZJc2KzF8w/3NX0rtTVakPtRNfzKcIov1DLhSMw9UbfHjxKmsK3BRzDf3Su0ATzFrdix
	nSR/F5OjZg1yNI22T6ZtSz/qNOg6YfYk7gRVObv4IaapMs+PXsWw1wKTZECAQOTmOFIt6BfNexYVX
	GiQsbAvwXRjhdVJv0PxkCYwhPmjad3rUmmAGXOh1in4iYUjop23M5LSZhO4fs7Knbb45UHlzVt+xC
	oosBaNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utI2p-0000000F6Bb-3sZW;
	Tue, 02 Sep 2025 03:50:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHxu-0000000F5C7-1oOh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 03:45:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S6ek030596
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 03:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u6pXxYvTpFhxbjh80IOUWJOQ
	14f2Hl+NCOsXpDoJFW0=; b=Ev9pT7Vohd0UOB4LnTx/IZrhMtHulcxpfjHQMKUB
	5u/wMkziB4dzmBnAFLVx58QV1K8TDsrSiJfyBGOBWYiQCEKZkU6OUm0KbPHN4zlW
	ejptTarpiOyuDXmL03ukZbF4K1AfSDOP9b5cojzU7kGGn+BClV04TEWmHQeKybXe
	ds5k7eFix+bNnbuRSHptuH4a12WISUyNCf1IzRCib77WLOF7AjnR/HFg1ZO2y8zh
	HTnj8P/tr1VD6TDZIdCwA7tXAbgNG6NGr+0S9cAzaFa8+4JNa6K3med4PBeaeBLO
	aX+/UhkaHqV3kpC4Zc8Fud+ioRUwYoPqZlpIaooTP8WLUQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8pbsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:45:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72108a28f05so5224036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 20:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756784749; x=1757389549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6pXxYvTpFhxbjh80IOUWJOQ14f2Hl+NCOsXpDoJFW0=;
        b=YXLVOAqHs2ZdwH9plXzs8ONWyJecsSuFHBioqMJJlMK0oJ5Vy61wGFI13rLloqXeWr
         I8mgT2WXXzWqNlSKcJDsWW2xEFPzCHJfJNfVNKrStffDfVmJD6DQToz44tHR4pKW7yET
         7uChnM43nm/RW06pjaSvPUsn2SkI6bsR+j6Q1sZLa4JyMDZM733HkOg9UMvTH6azhv7Y
         vpXKSmHtjwWyieobpJ/2SgC5rVJSc3sXmT25ZqP+U8Jmp+6aLndKfpCl0/wWKwGSeerN
         s5bgvjsIkpCxJI2SUs7IjYXeMYRvLSe8BXbKR6/pYgx/SVr7O81MWgkssqyib2gv9uf1
         2WIg==
X-Forwarded-Encrypted: i=1; AJvYcCXlMhxUfLU3oLxLifvMdcj+UPV6NoNWLzzEA2l50p+X5NcIEk8yupK1sy/zLjKIMxuztrk6OoepWNPwt2i5Ht3D@lists.infradead.org
X-Gm-Message-State: AOJu0YwVAJ90gUQS7Ofj4mZTsjcnXabEKLL8gIsOJYtnVxYCStSL4702
	Vz45t7K05qTmv6DXegcHCEqM029Zs7r5H0QMyNKLep5jAWiN6Ny23Zj0U9AJ4mXKkqZrwLbT0nB
	oLfKhg6ge1/MPoC4DkhAEuVUIknIxq4pUOgb8lnS7BzGRSSOrwYqd1Z5tmDmYI7rMATTFrd8iaj
	0hWg==
X-Gm-Gg: ASbGnctSaeLACtfIOLACm+vIWXUaV0PpMDjoq0iWE0bs3dH6mdbTnmo46pq2LV4odA2
	zbMD9s81U9wY/qLduM/TYc7GTPSmsZYfJNeyNyS20HpwhJpf8tLBbwfi7Ku1Qarnhx+fDGHfda6
	fliapr8Dq4fEnb70C8FqBRHeEoi1g8cj3AWxfAccj2ml38u/0Ju1mGg1kUGrC6vWo0gDFXwojxj
	bwNp/vu3NcaAMr3Oz8sNvgImm9APaLA/P8E3cU2YIY5qswMi1+Q6VjJEIdKpGvRsmy/F1XPSmVW
	8R0Mz2HuB60PhD/edNRbvpFjHYxH3G5vKLt8Di4RkeZElxcZJ0XfyY+xTxAsbtUif81U5ng3f/l
	dHRgbyDpNJCN2K87WujYpA+QPdpgpM+cOwSLzf9N/AQA+SejRBg+n
X-Received: by 2002:a05:6214:414:b0:70d:eb6d:b7f0 with SMTP id 6a1803df08f44-70fac700c86mr114372196d6.10.1756784748534;
        Mon, 01 Sep 2025 20:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW9DgkBw+MvElYTBWkwujyNrejM+p6uDFpj7XgGpJNMn2Ua2wxQ/b8FTcUSXpCO+uXL3IIqQ==
X-Received: by 2002:a05:6214:414:b0:70d:eb6d:b7f0 with SMTP id 6a1803df08f44-70fac700c86mr114371806d6.10.1756784747861;
        Mon, 01 Sep 2025 20:45:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827900absm337975e87.66.2025.09.01.20.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:45:46 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:45:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-voracious-classy-hedgehog-ee28ef@houat>
X-Proofpoint-ORIG-GUID: 2ArtjV0TdCVGwh6Y2_pz7iuV_xOELAoW
X-Proofpoint-GUID: 2ArtjV0TdCVGwh6Y2_pz7iuV_xOELAoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX26CS6rwlLy2r
 42Bw1cRH+nUeZLQ3w0LrSrS8tpkMPjDl84I9hfY/o6z57e56mFzYMWa5CpU9+8T1WxBFluyE3cz
 MuQUjFNfQLwOeX+nIZkyiELHZQr+vYojbuiAItLX33Sg4Q3bYMpVNJlor6uNnKuaCglZxpOcWYf
 vodvjK7SNujpbDIm+mIJjEZrZYBv6XvQbD8+CiB+2L4FLu2Ude0f/5crj9QGUmHBaC6T6llSHhr
 lxd2aXqpOrVv8FmftFfj8UDM+4DTKoYmO3ai7cTsAyu4dukcL+ReLSpLYKBDneL9dnqQcylW9eA
 /nFi6OLjZNId0jWd+JLpoRvE74DXE4yhlEe/wEjaaLdyGKIvOwSIHXvcKkuncba7PUIqqQnSbme
 nVKAyO+k
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6686d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pHNJB9hyKJ2XXRMnjhQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_204550_591124_459024FE 
X-CRM114-Status: GOOD (  51.54  )
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

On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > Hi Dmitry,
> > > 
> > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > It's not uncommon for the particular device to support only a subset of
> > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > problem for the userspace: we end up having files in debugfs which do
> > > > mot match what is being sent on the wire.
> > > >
> > > > Sort that out, making sure that all interfaces are consistent.
> > > 
> > > Thanks for the series, it's a really good cleanup.
> > > 
> > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > packing it into the two GHDMI banks. So the supported set there is
> > > 'all of the currently well-known ones, plus any two others, but only
> > > two and not more'. I wonder if that has any effect on the interface
> > > you were thinking about for userspace?
> > 
> > I was mostly concerned with the existing debugfs interface (as it is
> > also used e.g. for edid-decode, etc).
> > 
> > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > HDMI also have those. I don't have at hand the proper datasheet for
> > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > generic).  Maybe we should change debugfs integration to register the
> > file when the frame is being enabled and removing it when it gets unset.
> 
> But, like, for what benefit?
> 
> It's a debugfs interface for userspace to consume. The current setup
> works fine with edid-decode already. Why should we complicate the design
> that much and create fun races like "I'm running edid-decode in parallel
> to a modeset that would remove the file I just opened, what is the file
> now?".

Aren't we trading that with the 'I'm running edid-decode in paralle with
to a modeset and the file suddenly becomes empty'?

> > Then in the long run we can add 'slots' and allocate some of the frames
> > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > want to use). Then the framework might be able to prioritize whether to
> > use generic slots for important data (as DRM HDR, HDMI) or less important
> > (SPD).
> 
> Why is it something for the framework to deal with? If you want to have
> extra infoframes in there, just go ahead and create additional debugfs
> files in your driver.
> 
> If you want to have the slot mechanism, check in your atomic_check that
> only $NUM_SLOT at most infoframes are set.

The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
which is -ETOOMUCH for 2 generic slots'. The framework should be able to
decide 'the device has 2 generic slots, we have HDR data, use VSI and
DRM InfoFrames and disable SPD for now'.

But... We are not there yet and I don't have clear usecase (we support
HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
guide I realised that ADV7511 has normal audio infoframes). Maybe I
should drop all the 'auto' features, simplifying this series and land
[1] for LT9611UXC as I wanted origianlly.

[1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/

-- 
With best wishes
Dmitry

