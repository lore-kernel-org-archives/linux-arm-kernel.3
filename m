Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28866F364C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=; b=s3qQiysv92jmbxS64L8LhlhXj/
	tifegPcQQfptD5//EFMbi+YQuTCASsa4jbyAP/YMRTuH5mifB6IXcqR1flXMK+WmLo4lxaaEuSC8H
	gEOZaIxMy55nJaCLh51/l2Ofrmju1pRN8hrD5iMOgucc38o8BUOMw/AAnTLg8s1wa+DpTKyk9sxG+
	K7MT918BWzccJihY/rdLngFjZDgMYeLtYi52LQJCHLRj7/nkDi3Ay3vu4OCAT6X3NZW177X1IkoF+
	BIOcHCMlGCd6d6+opuLq5oYCGcMEL9B97BZuoG5PLJqE/j/SLGSFbkExknksLsXD2ip8hPH8L0B+7
	qbpHglsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAx2x-0000000BF1D-0j3B;
	Thu, 09 Apr 2026 21:36:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAx2u-0000000BF0U-0Gee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:36:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HkUHb2698383
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 21:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=; b=kOA4YSqWunwDnBf7
	PZEsJ4gRm6TFadnMermJIbJp9qe4l0tJMan+tjJ7C5KdmtduGZQzJjQJHHjaxNeZ
	o8qFJAwB9GlGMdjgGzNoVI0Uz1OLAPUFl2pChxXveCHHZiwuvliq3Oivjx1iTD/y
	Lyw1/v8ADl3BsfOHtd+bV2SlJc0UznsdZP2ySJfeiRCgF/8csU0oAuFVDflZrvTB
	XkTi7O2EM6L1ifqceIEVmZTK2f7P2BzGWaK/JlJDF1+NkjxpzJ+6E055M/Br2KET
	i1Yy3fwJNRpt8GS2EwNDYxGYwLJS0dn6PfBgk2D/Bo6BETBfnqmvVVJCShGiG9B2
	7HR0IA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9rn9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 21:36:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so40120951cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770574; x=1776375374; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=;
        b=OzW2FSK615KBgN7pYBSZhocRvySXdic1s/efGtFwHA3AQhJOnN2Cn9E56zTxQSwc3u
         Is0JFpfXuE9+PbARn9nR5cJti59/JT0IxO+Dlf5VSJfQyG5TvUCve4o/DrD+z7xjuDL4
         UKWuojQzTpJPnhe1+0YKDYHIw/rwF01N4cAPRgpS9+UbboU4gp0t7fCzhcO1Af50DeWH
         Ci25CTG+Q/yOSkjzNFoW30BbyxWYKm2w3siBZv+q4AMd8ulSJtjChFsHQsnIr2do6FuI
         UMY36YlxXdlpianzoyHmZPRB5OrPDem0U/mnIzzPrAypL1iO+KtFIZrrRjyu7KsvNFv/
         ip2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770574; x=1776375374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=;
        b=fSYGKid4DlSA2beAJTnZ6xtseiAsPTrl4ovfs4FAXcEBCXQFkU4rwOhWhszFFqx4vs
         ZrDhEJMdeJoH1RbfPmqDJfOXQdpDisLt6RdV/5VUKFEOO0212YIrsjgpQzeRpP/fzxLx
         VDitTr+Uq0/hWHemyEuWP353QE8WUzYvTe0u8mi57hxVPG9UTHuKvjKUlzxpX7X1zzOv
         2tx/Dnak97E2sKp0DLMKsHXpyiKt9d6PrruPyuWiiD0GUgSrMj+C4oDVJmXqeh7zulgY
         a9uXyP960VV+ah5c0N4tvLvV7mfaiFlyMPtevOVtcG0nfz6gdQXBM8WTpkATxDCaNV5d
         J/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdid/ihf5c/B9THVm7MOXgnEawV1fzNNMnc88qMbVyOY0rkX1fyQfAwSe1Flu/XpihRrDvdCFESvjQgw/ezDK8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn4adJxDV+paPfSrWqbC9/Bs/0cwhSwnscyUHKwkdLidqJ7qTW
	I4PwDfBxyOxKYHXwRDldHzv2RmOIawu1n9PzfzWI9/2Y4n0k2vaJdbfLJ0Num2jSKNKvp+P1B1V
	vruBIXI5SEsfCkf2YWneg/9fJDaV8poFCRPUXk8Xt9a7VX2oCFT4O3VQnA7OgVHMU6XxnMubV0Q
	yNtg==
X-Gm-Gg: AeBDiesehpWjnTEEmV93YJihkGcb/oxmY82HBnwe1/08HSINAKO+td4e0OXqEJGnqIX
	3XDGtq9lUQgvufdIdVNZxf8rwZEbNSmRL0Zn5e4cvFU5mwh+nj8sgZoTYEczwcqyY4cf/R/EB4T
	8CbMgZf5O49HJEA1OcPHZ/RPqOZ0sfEBelLoM7GWqn4cHZziHi26ULWFKXTkDcWZPASic+WW4Ig
	QQXz++R88gsQ6C81amdQO0Uoa8l2WyUDV0ydA8lIiww9d5v98ucBxgcaFX/2Dg/O/O1YpDK2RVu
	EpkEyYeiLxY/CDVbN+f2x4ouomfO2wP2hgXKnegWjzbhMUcQpgZkk+tQKxqImosM4i34hED0+CH
	RINdlT9CEV3mO5erWu1PoTuQyHANiAecYEjDhs/akVojnDJ8dedSPu/pMVWOrA9UtzZQcxVuyse
	nuybvbroZdQ/5xwzlj6EvKmZr+id6o0VYDOZo=
X-Received: by 2002:a05:622a:8305:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50dc1acdc38mr55451121cf.25.1775770574006;
        Thu, 09 Apr 2026 14:36:14 -0700 (PDT)
X-Received: by 2002:a05:622a:8305:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50dc1acdc38mr55450611cf.25.1775770573510;
        Thu, 09 Apr 2026 14:36:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86784sm174147e87.8.2026.04.09.14.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:36:12 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:36:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 00/12] Add support for DisplayPort link training
 information report
Message-ID: <u4ononk4cpccx77gvlywtfen5rmyslvr72v7olkhdrjf65aqce@xo777vofhcan>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <adgNxaFhbQaxC5E_@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adgNxaFhbQaxC5E_@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OSBTYWx0ZWRfX5oBWW1/oXiJw
 kwnWGnTf/2tL1J/i2ZyQdKFKaL532YbK0m2/tht6s5Vhq74SKuw1NSqizIFJfSyVQuX407vCfL3
 wmffhelYOZ/LmLlPCYrOJX4K0hAXKABv63nkkvFmkJpsSokUgGs9Di9UTwzhJr+vapHT8qN7auh
 CAJF1s5hxPigrEbruiAsqhjCxhhRzxvx9vDzI1o6nBKZ5DShVwQ1+fuuY9rBZqiETKcI5WuqRDG
 qLUrD6q/vDfYchYiSd4ABbQWOQfu+EVaFM77ncqtY6xsOtE3MjFL0+k5NfAyNBgRws7/ZdIp7B0
 J8ZFeFyul2V4IaQNhNQq6mME2X7SEzKuGh3itMjOGqAzbkFFhieJu06SFWMANXJFBZ/ihaEv9bW
 UL04OBw+02jVWJsPKMAmtP5Sg0JVCKb1/kybV5V/MNOjCYqv3Rjb/Gu+nDg025X0/x7AptC0yP5
 DLjBiwj6FkNZMXuH63Q==
X-Proofpoint-ORIG-GUID: 24kWdRsScoMrWfz2Bc5yehUD71-7-siI
X-Proofpoint-GUID: 24kWdRsScoMrWfz2Bc5yehUD71-7-siI
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d81bce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=F7xsp-YMIWaRqylmYmQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_143616_216522_1BFB1573 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, Apr 09, 2026 at 11:36:21PM +0300, Ville Syrjälä wrote:
> On Thu, Apr 09, 2026 at 07:08:16PM +0200, Kory Maincent wrote:
> > DisplayPort link training negotiates the physical-layer parameters needed
> > for a reliable connection: lane count, link rate, voltage swing,
> > pre-emphasis, and optionally Display Stream Compression (DSC). Currently,
> > each driver exposes this state in its own way, often through
> > driver-specific debugfs entries, with no standard interface for userspace
> > diagnostic and monitoring tools.
> > 
> > This series introduces a generic, DRM-managed framework for exposing DP
> > link training state as standard connector properties, modeled after the
> > existing HDMI helper drmm_connector_hdmi_init().
> > 
> > The new drmm_connector_dp_init() helper initializes a DP connector and
> > registers the following connector properties to expose the negotiated link
> > state to userspace:
> > 
> > - num_lanes:      negotiated lane count (1, 2 or 4)
> > - link_rate:      negotiated link rate
> > - dsc_en:         whether Display Stream Compression is active
> > - voltage_swingN: per-lane voltage swing level (lanes 0-3)
> > - pre_emphasisN:  per-lane pre-emphasis level (lanes 0-3)
> 
> I don't see why any real userspace would be interested in those (apart
> from maybe DSC). If this is just for diagnostics and whatnot then I
> think sysfs/debugfs could be a better fit.

I'd agree here. Please consider implementing it as a debugfs interface,
possibly reusing the Intel's format.

-- 
With best wishes
Dmitry

