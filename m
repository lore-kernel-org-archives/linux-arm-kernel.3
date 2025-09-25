Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC9ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 04:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=; b=idPDo9UXtq/uaDwQMFo22LUH2r
	Fmpuh19DcrK/zcUS+lSMekdQMPMXP2+prNyvWpxZLqPXjyTqFiuHFyMkqphUKzAeWf6T8mMqIy49/
	N0bwDcy1Kp3/HG30C5gFEwH64BNmk7eoD8PPaBjV3SYR+Th7qNmFxBV40rGYoJqEH6kA4jh7aaG3e
	mulkYKErqeJ8PvMgUgHSk0e2VTXbmZTKmGNBVgBz/8Q5LqAfPSeSoH638Gq6cew4Q+xxR/OsZRXJI
	BkTLkeoTK4vm0vgUdX/OluZjko3Cu8EkMy1oJfsx5EVGfMa3YvaR6eCFhYGReqvT2INiM/kPwy71i
	+a1Z6ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1dDA-00000005S8u-1L9y;
	Thu, 25 Sep 2025 04:04:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1dD8-00000005S8n-1d8n
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 04:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=; b=QfVgACt1Wy/shdV7cyK8S/BdMN
	pcONP8Nv9Go+uZtzHh0DbrwlMmsJooEXgi4CiwO+RmdLnLGQ/QJDaasnvL5mJzpG2xObrDct8e5ED
	ASiugaIgjZPQts5LkInQcstPSQVhFKDmlWvTbM18a/kfy8Ixeuh3NOtD1WqUXVGUu7Ww3cME0BbG6
	gpx3nYQKyau5j1IWszrBdtrjmqc6Wpwfu7HQ6CMsyup/5oTPu+/vl0nhumBsihjDb0xbl7cvvgWB+
	AStPdpJKESJKvhxUISx5xK/RFfiiTo1O8qM4P30jUXGwxXbqSZLQnkSws9EheHUjCtQn1TspLMYeY
	RS+d4j4Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1dAo-00000008uUr-0H4a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 04:03:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P17Ihe016452
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 04:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=; b=Pd3iiixgXSsj/gci
	E3l4G7wAxQyNa42+rTKII4AMq+rUVNsGkBpa/g5SNNPnOf/hI1BhC7MX0Zm/dK0i
	Xg5dPonGOJ2QBpcTTrHrbJGJRD2WQLjandGmfdUEONhh6bwc+9v9UGe+Dp2+w6Tt
	tTY0XzEcYKzya1Ti8L21OaqMELHUkrzM95KGvQviKfIiSkXYXlGiPEb6XYa0ch5Q
	YIs6a0SDge50q2pxK5cLXKYO9RV0x5C9FO8WTE5CpZbK92u4C5UOi7156BOgTBXz
	oRaGhF4DEtw6Yu0ojWnFbXJYYKAWYu5IZ5Jc9px4mtpyWmwsZzVyU3bISfeVmtty
	DE9e8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyjg1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 04:01:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d413127749so11410431cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 21:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758772891; x=1759377691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=;
        b=DhJSX5ewaGeMjpRucUMyEBlBG4Q3cu5UAm6I7Uif8R9Yds3WyaBPxAsFErNazbNHvM
         IZdqsECThvYHAbKmaqAGnVZGAsT/Kv0yy5NeazXVf8bfIDJ1v9ueJTDZ3x2i9WefUAQa
         ldXTqzf0xNkg120RD2TYQUQLoTLB5NJTfDUElHjOyCDquGaJqpB5S0mcoIZeG8fhwI+G
         fSvG0NPjv2HyVZBDnWYaDkV085F/aAVag6gQVUvaXCqx0uCZ9jArdjTuwBThp7WcaRHS
         3xzp+yZ8cgx+gGjjZPlJPouYDU0uSM84n3WldvNbgta8vUGM4CaxmeVx4A07suxWJQ1S
         fjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx6xr42uvYsXUOpR45vcCcuQgArwegtRpfTwBL63AXE2Om6VH3IN2vXo8ur/vSEYdla2bvw920MZradOU9WP0S@lists.infradead.org
X-Gm-Message-State: AOJu0YzYf7vIZ4Jm6CsInKNHtshzo7UQJIYHwgmbSAuvF7jZnxkQdoTr
	3MrDOPXNSLQmbd9GEfIpgHVr78NShILMxhoEgf6FRiRleUr4Pspbn6Wf6qUWbX4avIXbsMf7j6a
	L2sAWLqsrb+n0Upp+KTZh9FEVLoSUQ0blASCHYzM67fxVUX5wbyLjZMhXz4Nbkqh7cScwuHE9Bl
	lClQ==
X-Gm-Gg: ASbGnctRt0cs+wPUG1vWueRcW5x2tteEufAu16KPy0DXtP8iLk+T8f1GgGsM0N0ViF6
	7ANkscBSajG32m36WzGH7pVGzCdicc/zaC/uODF6sUQbPZRzNDkWNu+y4nWLD9uwL8GJNpYpbel
	r/ZN45CMQH1NLsvWRA5LIzVJbuQyd9cTK/6lvFrFFjOV014whbNpiMQb9fPpyl1ojbXqHoayxVR
	vZRJOYuAzxUdSz8N1h1hgav0UFGve4BTplUqXLW8haHXTC+AqiLp3Nk8+KdWgejb4zwdXSPj3TQ
	51/9/nlxle0sRJV6Um+QHT5ZBW/D8Ns4wZLS/JfVdFdPkLkH31HW0dcn9LW6ZawhMvsaC28yC9V
	qYZ6UZTIQva0QO9AAdv6YIUfZ/Mpfig5xOwn83ukFBoYbrIzarHiA
X-Received: by 2002:ac8:5949:0:b0:4d8:fb05:d12b with SMTP id d75a77b69052e-4da4744e2c2mr27729731cf.10.1758772890801;
        Wed, 24 Sep 2025 21:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZca+Iw2GZZsul8eiKgFQhtN//Wh11qIWaGFhGrwSz/NV22XiiNrfgNPym6U08AZdNqARbEg==
X-Received: by 2002:ac8:5949:0:b0:4d8:fb05:d12b with SMTP id d75a77b69052e-4da4744e2c2mr27729001cf.10.1758772889959;
        Wed, 24 Sep 2025 21:01:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4773b19sm2521751fa.13.2025.09.24.21.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 21:01:27 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:01:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <6jlv47fgiq4anpflbs6agre4irf7grgvzorrk7roxwprtyuek6@edrya2syhchi>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
 <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
 <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
 <sgvrzhbhkzxbuybmws44kyenhfyppm3blijkarypcin4fiscvx@mnajrlmicyxi>
 <18f55fe7-7c68-4982-916d-11752325c667@rock-chips.com>
 <bh73nttewwhom2pqccfnapnfkrys3zljkykgqmh4hsdalqgyzi@gbl5oejxsp3z>
 <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4be9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8 a=nLKCdIsASqLPV_WZ6OsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: u6WFltGbPD9vxUqaZhl8IKqsEIkVHH-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXwhRji0cePIK1
 cZq+SbKVbfza4CK+YL99Y/D/Wul/xHpJwe+0DyMpBBjQuTEIjxRPV+27wXy2g201gGVBQiveO1O
 8UmIYfOAY+TRvp/qytQJhxJ7ejvf5FtqOFinPf4YD2227LAuZjeEcb6fqlYjQL0tFRwmTiGC9js
 fBR4I9CKPYhVnhkl9gFxEJyqdwUsbJ49iFKgW/ZO/kA8LLVlQVfgXb4w+tldCKioHuYeNonFvSG
 1xjc/nFKXa0KgUfcYiumMfOGRPUUdfT668YhOEFFB/Cwb76btOjgnr5MaJJNZPnMoSQD743BKL1
 gWPjds2i1u5o/ZAnNFTOJXPp3t/APWtBju71CwwBx3I79u3pueilus5Q8URLgAj1n/oAj9qsa78
 qG1WD0D6
X-Proofpoint-ORIG-GUID: u6WFltGbPD9vxUqaZhl8IKqsEIkVHH-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_050157_773839_E30032C1 
X-CRM114-Status: GOOD (  58.85  )
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

On Wed, Sep 24, 2025 at 05:55:39PM +0800, Chaoyi Chen wrote:
> On 9/23/2025 6:40 PM, Dmitry Baryshkov wrote:
> 
> > On Tue, Sep 23, 2025 at 05:07:25PM +0800, Chaoyi Chen wrote:
> > > On 9/23/2025 11:11 AM, Dmitry Baryshkov wrote:
> > > 
> > > > On Tue, Sep 23, 2025 at 09:34:39AM +0800, Chaoyi Chen wrote:
> > > > > On 9/23/2025 9:10 AM, Dmitry Baryshkov wrote:
> > > > > 
> > > > > > On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> > > > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > 
> > > > > > > Add default DRM AUX HPD bridge device when register DisplayPort
> > > > > > > altmode. That makes it redundant for each Type-C driver to implement
> > > > > > > a similar registration process in embedded scenarios.
> > > > > > > 
> > > > > > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > ---
> > > > > > >     drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
> > > > > > >     drivers/usb/typec/altmodes/displayport.h |  2 ++
> > > > > > >     drivers/usb/typec/class.c                |  8 +++++++
> > > > > > >     include/linux/usb/typec_altmode.h        |  2 ++
> > > > > > >     4 files changed, 39 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > > > > > > index 1dcb77faf85d..e026dc6e5430 100644
> > > > > > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > > > > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > > > > > @@ -14,6 +14,7 @@
> > > > > > >     #include <linux/property.h>
> > > > > > >     #include <linux/usb/pd_vdo.h>
> > > > > > >     #include <linux/usb/typec_dp.h>
> > > > > > > +#include <drm/bridge/aux-bridge.h>
> > > > > > >     #include <drm/drm_connector.h>
> > > > > > >     #include "displayport.h"
> > > > > > > @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> > > > > > >     				dp->pending_irq_hpd = true;
> > > > > > >     		}
> > > > > > >     	} else {
> > > > > > > +		if (dp->port->hpd_dev)
> > > > > > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +						  hpd ? connector_status_connected :
> > > > > > > +							connector_status_disconnected);
> > > > > > There should be no need for these calls. Once the HPD bridge is added to
> > > > > > a correct fwnode, the drm_connector_oob_hotplug_event() calls should
> > > > > > deliver the signal as expected.
> > > > > It seems that only drm_bridge_connector can do this. I'm not sure if I remember correctly. I'll give it a try.
> > > > Other connectors can implement the .oob_hotplug_event call. Calling
> > > > drm_bridge_hpd_notify() also depends on the connector setting the
> > > > callbacks via drm_bridge_hpd_enable(), a step which is done by only a
> > > > few drivers.
> > > Hmm, let's go over this again. First, drm_connector_oob_hotplug_event() requires a connector fwnode.
> > > 
> > > On the Qualcomm platforms, the fwnode corresponds to the USB-C controller device node, so
> > > 
> > > drm_connector_oob_hotplug_event(dp->connector_fwnode, ..) can handle them directly.
> > > 
> > > But our platform doesn't use the USB-C controller device node as drm connector fwnode :(
> > This sounds like an issue to be fixed. Alternative option would be make
> > the AltMode code find your fwnode and report OOB events against it.
> > But... I reallly think that using connector's fwnode is the cleanest
> > solution. In the end, your final 'display' connector is the USB-C
> > connector present on the board. If your display has a USB-C connector,
> > that will be the socket that gets the cable from the display, etc.
> > 
> > > So I use drm_dp_hpd_bridge_register() and drm_aux_hpd_bridge_notify() here, I think it just create a simple hpd bridge to bridge_list.
> > > 
> > > But drm_connector_oob_hotplug_event() use connector_list instead of bridge_list.
> > The OOB interface was created by x86 people, but we successfully reused
> > it. I think that addign drm_bridge_hpd_notify() calls just duplicates
> > the effort unnecessarily.
> 
> Yes, that commit comment said,  "It was proposed to add the displayport OF property to the DT bindings, but it was rejected in favor of properly describing the electrical signal path using of_graph."
> 
> But in the embedded case, we don't seem to have the opportunity to describe this kind of of_graph relationship between drm connector and usb connector in usb-connector.yaml. On the Qualcomm platform, the DRM connector fwnode to correspond to the USB-C controller, which is a clean solution.
> 
> However, on our platform we are using external USB-C controllers. In v4 and the previous versions, I focused on directly linking the USB-C controller with the DP controller. Referring to your suggest in [0], I think maybe this can be achieved with the help of the drm bridge chain. Assuming the bridge chain is like this:
> 
> 
> Other birdges ... ->PHY drm aux hpd bridge -> CDN-DP bridge -> DP to HDMI bridge or other bridge or nothing...

Looks good to me.

> We can use drm_bridge_chain_get_first_bridge() to get first bridge. In this case, that is drm aux hpd bridge from USB-C controller device. Next, we can obtain the fwnode corresponding to this bridge, and once we have it, we can set the connector's fwnode to it. In this way, drm_connector_oob_hotplug_event() can take effect.

drm_bridge_chain_get_last_bridge(), yes. That's what
drm_bridge_connector is doing. You'd need to make sure that there is a
drm_aux_hpd_bridge() registered for the USB-C connector node (from your
Type-C controller driver or from the altmode driver as per your patch).

> 
> 
> Would this be a good idea? Thanks.
> 
> 
> [0] https://lore.kernel.org/all/p3kgqn3euumhysckh4yyqavqv5y6any5zcrgkrcg3j5a7z7cyw@lfpkla5p3put/
> 
> 
> > 
> > > 
> > > 
> > > > > > >     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     						hpd ? connector_status_connected :
> > > > > > >     						      connector_status_disconnected);
> > > > > > > @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
> > > > > > >     	 * configuration is complete to signal HPD.
> > > > > > >     	 */
> > > > > > >     	if (dp->pending_hpd) {
> > > > > > > +		if (dp->port->hpd_dev)
> > > > > > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +						  connector_status_connected);
> > > > > > >     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     						connector_status_connected);
> > > > > > >     		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> > > > > > > @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
> > > > > > >     			dp->data.status = 0;
> > > > > > >     			dp->data.conf = 0;
> > > > > > >     			if (dp->hpd) {
> > > > > > > +				if (dp->port->hpd_dev)
> > > > > > > +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +								  connector_status_disconnected);
> > > > > > >     				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     								connector_status_disconnected);
> > > > > > >     				dp->hpd = false;
> > > > > > > @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
> > > > > > >     	NULL,
> > > > > > >     };
> > > > > > > +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> > > > > > > +{
> > > > > > > +	if (alt->svid != USB_TYPEC_DP_SID)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> > > > > > > +						  dev_of_node(alt->dev.parent->parent));
> > > > > > This needs at least a comment, what is dev.parent->parent. Also, the
> > > > > > of_node is not correct here. It should be a node of the connector,
> > > > > > rather than the device itself. Consider USB-C controllers which handle
> > > > > > several USB-C connectors (e.g. UCSI). The DRM core won't be able to
> > > > > > identify the correct bridge.
> > > > > I think  alt.dev->parent->parent is the connector device. Am I missing something?
> > > > As I wrote, it needs a comment (in the source file). No, it's not a
> > > > connector device, it's a USB-C controller device. There is no guarantee
> > > > that there is a separate struct device for the USB-C connector. On
> > > > Qualcomm platforms, the device will point to the USB-C controller (TCPM
> > > > or UCSI), which contain usb-c-connector(s) as child node(s) in DT.
> > > Thanks for the clarification.
> > I think it should be fine to pass the fwnode of the usb-c connector that
> > is outside of the USB-C controller device (if that's what your platform
> > uses). But I think this should be:
> > - the usb-c-connector node
> > - it should be coming from the Type-C controller driver, you can't guess
> >    it here.

-- 
With best wishes
Dmitry

