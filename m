Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6ABC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Asqzu24OO8UYIDi9bC459VXzWsN/7IVQ4DWi2UawXoM=; b=Pu2aLUK+lguDEwd88W7eBdGWzl
	8NOyeAg8hwsB4hw3mKHU79BbkXbYgTzGDC8obT2x9fa3jJNz6w11P2LRZolg+Nu9bDJZI9Pjmgva9
	F7j/bD/oeHpvw31vaiaURyQbT3gvnEasTc3I7um2EjP1poscPxGfMilhgFgvDJnjXLAQ7EoS+S9ge
	m/HiY5tM1vhtCRqBMOQsMS9Et+is26JbB/7z3R13/joaYxHHSd4JzkzjQAgB2eeKAP+ZDPwUZ0QkM
	cUwpE5xxwGuXuu4zuBJd6vk7TLcZgu5uhHBKiO9oGgklDeOwmpbrGMYqyuuY3q8xC/By+w3VSEbI5
	PAE4FmKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui90t-00000007WFd-2kKi;
	Sat, 02 Aug 2025 09:58:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui8yG-00000007W39-0xRL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 09:56:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725eshY009084
	for <linux-arm-kernel@lists.infradead.org>; Sat, 2 Aug 2025 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Asqzu24OO8UYIDi9bC459VXzWsN/7IVQ4DWi2UawXoM=; b=RrMHPVM73DxKGGJg
	qqsIWm2Q/ZTftd8Fup41iicv4JvJklA/4eAeX7aUHbhLxKYR8ZmnvoSWb1utRHaa
	gj8mIJXbltj2Qkz7gEnelSrogPSjtGN6M+uXFhKRM1oaxxxKMCLYCnaVAL01LFhk
	YgK4QaldVVykklAyWbWn+2u9imuUvi4/ZooQeCHIbN/1AdnkMgXEX2bWgu0ts4Q1
	hf+mEcYNDhM5BWjVCLDRFiYxVCuxJGMOrpkU2GAums6U8H0OFxriXG5/2W9oTjuI
	x5OlK/Tf2KXh4u/eXDYp6X8OF/fCQrLcvyI0JZuQxznMb3WYdTAUTACFlOcannvI
	HQ79zg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc0fr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 09:56:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70743a15d33so40176006d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754128564; x=1754733364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Asqzu24OO8UYIDi9bC459VXzWsN/7IVQ4DWi2UawXoM=;
        b=FLg4eg0yGPywLptoAJ4VW9G3fCYNBkdO+tteyxHfyEqnooOwsEXWPHANUgNT8LdGwZ
         Sw/smyTH/AbsmYItviosF+9DKwr9dbPzwkawUrwmIS+965/hlysuDKNoFYCG6TBpZLhR
         D0NK4MICUtso4+4yCrFSBssO0Vfs1KFcTVHnjJe7+8RjPp3GSgDMGCbh5Zs1eWqkBhBV
         bdFCa+f7hNpBQEg9/H2vdo9pNYu/bWjZfFwpjwbtloMLOJzrBQLSXUA/rRLNMR2f24fC
         0QDoYJeoMEWI/uItqOxpiwcUHqsLUH0Icxiqo3dbV7HXUAOumg9RPUH7QqIW0WlW9Eya
         O88w==
X-Forwarded-Encrypted: i=1; AJvYcCUST6AK9vJ6J4eyIsmHEF4Ft8eNtO/DRXTZJxMBcTJhsd4YgzyHy1AaI3yUrL1TBRgTwARSn/np7tsOiYY/4yvT@lists.infradead.org
X-Gm-Message-State: AOJu0YwnJUp1UjFFsG7AkknXeQaDm8zOGtEMBpmBoVWZT14hjubmKJzK
	r2TOe8RI3SYsbATlt0et4o4HlDE0dbkrcBoYNOih+0+nQ03GBmrlJQLBLPHJv82iNF6ThL/2bBJ
	oYVwnC8YRsWl0VGJ/Bm+oo8BhCRzo9PVVh46ONBwILzf5XIydZI392F7HoNxnq9C6pItPo56Agr
	402A==
X-Gm-Gg: ASbGncsRdPxehXXu953hZ7QJAer5BQa/x875jmGwgYhNsm6INcm8GZo1vF35NWcRq2I
	s0v5kYDXDoDAIfjcvae4C4PybWOx+UQlGJbwE5/xrmxsSvrODTfARfKUAY2pAabZQdX41oKO8cM
	K9Y/ZZed63Xn2WKfcNnrYDFEcTB8t1XcRchhVVAc5wa3f54P7YO5xYj/WNPgYuAFIvLLJB/99VJ
	2u1XeRhijrDUUSQnu6QcTOoi5kJsksFY5mWdij++OjTGBhvqymkmHv3q4VXh4qP5aDzQ9yW6nh1
	tuJ6XMjh9T4b96peqjsa+b1muaNK4t/eFYBqSECqZUBl8Sa1yjNulO863QLIXPtcC5s6J66XWzu
	AAeGMK7O/LXAPoQNXikxa9gWP2gIqO4tMJuDLs2RWBrBmSuLMN4iC
X-Received: by 2002:a05:6214:400b:b0:705:8d7:a0c3 with SMTP id 6a1803df08f44-7093630075cmr37002396d6.34.1754128564355;
        Sat, 02 Aug 2025 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOTdM2Iczyvgl46yWDi8GTyzV7HP8tA/9iXZHl881FgxKm6LV0IC4YJNQAmmZo1HrO7zCu2w==
X-Received: by 2002:a05:6214:400b:b0:705:8d7:a0c3 with SMTP id 6a1803df08f44-7093630075cmr37002056d6.34.1754128563864;
        Sat, 02 Aug 2025 02:56:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388d8ca4sm10105271fa.45.2025.08.02.02.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 02:56:01 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:55:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
Message-ID: <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
X-Proofpoint-ORIG-GUID: wJCgQI7KGNmS467G4BISHPv6X4E3Fj8i
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=688de0b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=s8YR1HE3AAAA:8 a=GTOoGQlhK9DRF86BnBwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: wJCgQI7KGNmS467G4BISHPv6X4E3Fj8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4MiBTYWx0ZWRfXw+9lxvHvmvz2
 6KjCzvggb4hEUurwTPQ+dtSNrIqZbxTpyi16+OmlCNOtsJ76drv25TV1RjhXPnjp2N0Tu1+zrgI
 MWp1H8cDZYjp67IsOmbmsaUSlZ2dgNvME4ZKXxs9RxWG+MDhWe2GSyHKcenXieUr8xmw/omjb3t
 seEtu4L5p2JaZ2L8kMbMUHqNAf2NsKSy+zUVpj+0n0GeGfziho+O9KnSUrAeNg/mPQYVztxz8nw
 OsT/em3Dauf+o56hJu/utc7dXdI9jJejz7lNrCeDAIBWp89vgzu/JCS5wyW6i/KEFIBobnFMTl2
 VcsaWFx6X2IWwTGYj6ymZxLuMvGzH769+ZUMsR+2PXiG/wTigHM6KN/+E6eB/23fHTTloNqxAXH
 3XucIcOQK8iFSpnqXSysAelpLPVR7jxqVcntd+9vDtCmSUCWjaPMgamIVoXjIwJ+Het4L7Wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_025608_278557_96F93397 
X-CRM114-Status: GOOD (  43.00  )
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

On Thu, Jul 31, 2025 at 10:19:49AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 7/31/2025 3:13 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 29, 2025 at 05:00:27PM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > This series focuses on adding Type-C DP support for USBDP PHY and DP
> > > driver. The USBDP PHY and DP will perceive the changes in cable status
> > > based on the USB PD and Type-C state machines provided by TCPM. Before
> > > this, the USBDP PHY and DP controller of RK3399 sensed cable state
> > > changes through extcon, and devices such as the RK3399 Gru-Chromebook
> > > rely on them. This series should not break them.
> > > 
> > [....]
> > 
> > > ====
> > > 2. DP HPD event notify
> > > 
> > > The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> > > the CDN-DP can be switched to output to one of the PHYs.
> > > 
> > > USB/DP PHY0 ---+
> > >                 | <----> CDN-DP controller
> > > USB/DP PHY1 ---+
> > Could you please clarify this, can you switch DP stream between two
> > USB-C outputs? What happens if user plugs in DP dongles in both USB-C
> > ports?
> 
> Currently, the software simply selects the first available port. So if user
> plugs in DP dongles in both USB-C ports, the DP driver will select the first
> port. This process is implemented in cdn_dp_connected_port() .
> 

I think Stephen Boyd has been looking on similar issues for Chromebooks,
which were sharing DP controller between several USB-C ports. I don't
remember what was his last status. I think there it was easier since the
bifurcation point was the EC.

I think, CDN-DP needs to register up to two encoders and up to two
connectors, having a separate drm_bridge chain for each of the DP
signals paths (in the end, you can not guarantee that both branches will
have the same simple CDN-DP -> PHY -> USB-C configuration: there can be
different retimers, etc).

Both encoders should list the same CRTC in possible_crtcs, etc. Of
course, it should not be possible to enable both of them.

This way if the user plugs in two DP dongles, it would be possible to
select, which output actually gets a signal.

> 
> 
> > 
> > > BTW, one of the important things to do is to implement extcon-like
> > > notifications. I found include/drm/bridge/aux-bridge.h , but if the
> > > aux-bridge is used, the bridge chain would look like this:
> > > 
> > > PHY0 aux-bridge ---+
> > >                     | ----> CDN-DP bridge
> > > PHY1 aux-bridge ---+
> > > 
> > > Oh, CDN-DP bridge has two previous aux-bridge!
> > > 
> > > Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
> > > state between PHY and CDN-DP controller.
> > Does it actually work? The OOB HPD event will be repoted for the usb-c
> > connector's fwnode, but the DP controller isn't connected to that node
> > anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
> > this case.
> 
> Yes.  What you mentioned is the case in
> drivers/usb/typec/altmodes/displayport.c . I have also added a new OOB event
> notify in the PHY driver in Patch 3, where the expected fwnode is used in
> the PHY. So now we have two OOB HPD events, one from altmodes/displayport.c
> and the other from PHY. Only the HPD from PHY is eventually passed to the DP
> driver.

This way you will loose IRQ_HPD pulse events from the DP. They are used
by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
change on the DPRX side and the DPTX should reread link params and maybe
retrain the link.

> > > Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
> > > Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
> > > Patch3 drops CDN-DP's extcon dependency when Type-C is present.
> > > Patch4 add missing dp_out port for RK3399 CDN-DP.
> > > Patch5 add Type-C DP support for RK3399 EVB IND board.
> > > 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

