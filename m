Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456F2C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=; b=VBwyHTM9bpIiCuNEvq6uPJ+juG
	Ue/oLCax0rHpMiuKyGaR9Y8WAgXEXx61GMr0ceaKYXisQ9VkbKNLkn55QLL+xXc1L1YMhy/LrgyUl
	Zo4I0ls1jrvtSjzT3/ENBXrLVhjYfXTvS/6KlTMats8IXkt6ZB+sQHE9N/izixiOHoWNivYz3b3uN
	pGOxm1UoEzaP0oHIhxcZ3mvcssKdgI04D17RFaOYcsox5iB8tRgI/DOR+0XM+NLBorG2X0KHFJezn
	9TcTOVrIwGoJcPSs8w23dI/146OgXHkYIuNLS4h/j2QmsushPQWYn4drUOw5oJsgoU1+R5d5ZuYNx
	KROAoAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vaT-000000097Ea-1A2u;
	Tue, 08 Sep 2026 13:10:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vaR-000000097DD-2brR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:10:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkmAw3363910
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=; b=FYEEsmu9Bp4RxlKr
	bdlkDU7MM956qVwX0TH40aknbPt8f8sGAAXZ569953xVF3qWYKwmqH3MRoKTZFai
	Np5YiUDQlpNmS04fiP2jqJAFyhgQSTYFXOcYrMvKa2NyfvdZNaV1oab0T7ZKD9fH
	J35pDir6rCVbmXaohQRWqfEfnOvXhRtK2lq+3M+9oby/aZFToyIGfH8NLjPAnSUM
	IETCZxEIXjKh3J6fy+Wq2QK/v8PySRCtHvQIN5iS8OtaytEq7tdZczXAM2ZOBHk0
	lfM+L1SG8GTvnYPZP0EBQTaOp3hL4bFE+G4Rv8iax5C42AHCs2SksxywO9+dIeaY
	0JKEig==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7hnnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c5db8b6d03so1663653e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873005; x=1789477805; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=bEYb88gksFNuEYvCJ6N0OMx7bT+qQN8+oyr1ma9OEkDyci2dI8otr67FFo8LDRfQwh
         hnxVJ3Z3zw5yXQcJSNvE+NlcL9QsBTXA6ikGCLWcEuoBkbN/IPI3KUVsZD2qV1f5OwLy
         gXfyL0Gi8k0CF3lmadM2Nd+1LIPmZsX1OVc45uTF6jprkSUlCwoVuEZ9fI1R7bhXhVwr
         cVvwfD39xUbnH5rij/ddlD+nS7iME4DzTSurObDAqpsETPCERR4a/JdfJB/OhF9wH+Eq
         d/eFaOx066zHY60tDBkwFplTFi7lZDbMoy1p5vJ5T+wmbfdNovDjlXhIG2+/0ih+fRwa
         SOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873005; x=1789477805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=GH29e+NL2A1f+8gm86YNh+vtrCZJmOQz0ww9W1/0pcJggl7435ImojJt9zA8042UQz
         YumphbQ5wK/NhOEyxuqu8Jevx5AG6I/1EFMIAEqRSb625wue8Xrbwe9xl9EaEoHL9mee
         T+rd/Gc3pAqz9bcmt0THyWGFBFlo3f+xI553XrSAmKnFt3s5M8LujqBoYbLe/k9RDL95
         FcDGko27hGU5T9f04KGnTrPcI40+znLv+A4S+uktQqZ0GH1dBf03wnkb8DQ6JDRc0lr5
         N4JKhN4zpENXEdNZqz3vzVhYX7fGDLAzvU37t05TbbbjykBixPmeh/5mO2bKFl5gung4
         i9cA==
X-Forwarded-Encrypted: i=1; AKwUvBwo0cyS844pYMkJJao1ek6mnrKisLLd1HnFVM+M47lMNrJr5BL3bj2Z8gfP7/D0NPbb+xK+hPhbjbk6XfkuNNzK@lists.infradead.org
X-Gm-Message-State: AFuF++n6cKzC8a3c6oFz5akcF8kY2UB8YL6rxmNPB190JVpuoyDyz7Wu
	8JBSiMpjJNIU4VEkX4HyWf1kwbwuKlkddZhl/znoIOqQrQQfYyQ6SKEnrw7dFZ5MkUqTrli0Ere
	gWy7ADb+zWa/Bwp1nuSmfJ/0QG1qDJYvgVE8eFeobIQ6pGXyk5wtf3xpKgkY1YHqO3lP/9W0hUS
	5TtA==
X-Gm-Gg: AYBFou37GRQyRNdxAU426uEGjuoRRtCX10jmMFj1k1jmWNeuOxct15mmzfQWA+T40GX
	j0FYESfagNLEU0GD1iSsQozoXEKjy7QaJ7LzvJ5L99uK23Ou8KVz1d75GYtFFNQHebGSR9/FD6c
	DAnr0h5rIX1JjqKF8IRVWZdkKbp3gnSnSwRYPxQ3VpnUxPby9zx5jiVKd3FKDrqb+i9Semuv4+b
	JmA2yp/TTmilOMXLWGBCvQSyreSWWDV25Yf5wB0iJ4OeUbohDo8srKfK5+wvBXafMRrK+miqDKd
	l4i1pKyLPP8YnX4iASu3f79oOtqpI+/K+15zUW2b4PZii0opPce+JsAkZhCoqBOOKudA4YGYXXg
	Zxw3px1fDCXT9VCO9BKigve8ze5k+a33JQbbyM71WzBeyrkzTAtmKi7MaKOQeb/36/2+lJR55/l
	Lc239JoAK8VHM3
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694122e0c.1.1788873004880;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694023e0c.1.1788873004277;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705f37f0sm34623661fa.41.2026.09.08.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:10:03 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:10:01 +0300
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
Message-ID: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa0092e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5Eng7BWHuIvqA__06hIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX5Vtc49aQHBK4
 AdjaQwFaEo1Jc42j4t/jLZnEt26u8Yq2NmEvObL9VexP51ofl6dwofAk8VViSI0npQnlTqEVfZC
 EJgL0LNCdACfg837agPKGst19JJ0DTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX1TGx387Dekqb
 O9OlRlsqlQkcVfe1exENQJzQf6x4WaznuBBxN9E9S0qkCuv5SM6YXqDXQxXIsOlgmOcfDoHyUzy
 yF1Z/FfljzYCzLXEuW65dexKTO5SeLSpiwNlGuxJO3V9276pknf9/hRfynXS8zz6/T8asr1xjoY
 xeuxkQBPLwDyCc+ixpJPDLjlQDaQFg7suGeL0DiYM8klOP6pNlMFbrJy9a8xUNh4oyhOrA2y4mV
 tPIhKo6E5YRFP/Ws68XLWnrSo4AScE7X1lVn3OdIjDamcCeh964Rl4ORwIZ2IfjXMjBMEyonvjX
 PBYSKUo992ECt+lZ1HIDY0+rDxJDPGwbh4gqFWfDE6+4fTsYIQ7z2Day1Qx0j18oKHNuvAAWpSA
 WFsBlOIO46atUoKQiYoUPKz/DJwGV+BfmwWdVxz6fcErU50HNva05mfxBEqB2g5f/IpWjOv9WPq
 KZfsKYKzqKkm850VYkw==
X-Proofpoint-ORIG-GUID: 95evpk9qsr_KJhX1x0Gn6fGUeSRht_Fn
X-Proofpoint-GUID: 95evpk9qsr_KJhX1x0Gn6fGUeSRht_Fn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_061007_776693_1C0F737F 
X-CRM114-Status: GOOD (  59.87  )
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

On Mon, Aug 24, 2026 at 11:15:44AM +0800, Yongxing Mou wrote:
> 
> 
> On 8/21/2026 3:20 PM, Yongxing Mou wrote:
> > 
> > 
> > On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
> > > On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> > > > 
> > > > 
> > > > On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > > > > The bridge connector framework currently invokes all bridge
> > > > > > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > > > > > event afterwards.
> > > > > > 
> > > > > > However, not every HPD notification requires a userspace
> > > > > > hotplug event.
> > > > > > 
> > > > > > In particular, DP MST bridges may use hpd_notify() to
> > > > > > propagate HPD and
> > > > > > IRQ notifications through the bridge chain while the actual hotplug
> > > > > > handling is performed by the DRM DP MST core. Connector creation,
> > > > > > removal and userspace hotplug events are already managed by the MST
> > > > > > topology framework.
> > > > > > 
> > > > > > Allow hpd_notify() implementations to suppress the bridge connector
> > > > > > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > > > > > can clear this flag when HPD processing should not result in a
> > > > > > connector hotplug notification.
> > > > > 
> > > > > Why? Worst case the kernel receives another hotplug notification which
> > > > > gets ignored by the driver.
> > > > > 
> > > > Hi, thanks for reviwing those patches.
> > > > Let me try to explain the motivation.
> > > > 
> > > > Semantically, IRQ_HPD is just an IRQ notification, not a
> > > > connection state
> > > > transition, and shouldn't be turned into a userspace hotplug in
> > > > the first
> > > > place. However, drm_bridge_connector_handle_hpd() currently calls
> > > > drm_kms_helper_connector_hotplug_event() unconditionally after
> > > > processing
> > > > the event, so every IRQ_HPD ends up reported as a hotplug.
> > > 
> > > What if the IRQ_HPD is delivered together with the first HPD event (for
> > > example because of the TCPM processing those events)? See the mechanism
> > > in the displayport.c AltMode driver.
> > > 
> > The DRM API should simply pass both long HPD IRQs and short HPD IRQs to
> > the driver as they are, and let the driver decide how to handle them.
> > Based on my review of the implementations from all three vendors, when
> > long and short HPD IRQs occur simultaneously, the long HPD IRQ is always
> > handled first, followed by the short HPD IRQ.
> > 
> > I have another thought regarding the current DRM API. Could we have the
> > DRM layer pass only the HPD event information (long IRQ and/or short
> > IRQ) instead of connector status, and leave all handling decisions to
> > the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and
> > each driver could decide how to process the event. This seems like a
> > pattern that could be shared across different drivers.
> > 
> > This is just my current understanding. Please let me know if I've missed
> > anything or got something wrong. Thanks.
> Sorry, after thinking about it again, this idea is not fundamentally
> different from your current approach. In the end, we still need to handle
> HPD state transitions in the driver. It seems my previous suggestion does
> not really simplify the problem, so I apologize if it has caused any
> confusion or misled the discussion.

No worries.

I'm currently stuck between two ideas: continue pursuing the current
"single API for both events" or implement new "two API for two events".
I think that the second might sound more plausible, but in the end it
would complicate drivers much more, because now they'd need to handle
synchronisation issues on their own.

If we start from the DP AltMode, we have a single state word which
specifies exactly, 'HPD pin status' and 'was the IRQ_HPD captured'. Our
DP controller also has about the same status word: the connected status
and the IRQ_HPD pulse. Which (for me) points out that the single API is
a correct way to handle the HPD/IRQ_HPD.

Now, coming to the drivers/userspace side. Let's leave the MST story
aside for a moment. For the DP branch devices connected to the USB-C the
AltMode will always report 'connected', but the DP's detect callback
would rightfully report 'disconnected' if there is no actual monitor.
The kernel should do it's best in this case and report that the
connector is disconnected without any interim states. I think we do it
already. The compositor should do it's job and skip full scene
evaluation of the disconnected connector gets disconnected again.

Event filtering. Historically, drm_bridge_connector was trying to filter
HPD event. We had to remove it because for the DP prefiltering doesn't
work. This might have left the gap, which now needs to be filled. The
bridge_connector uses drm_kms_helper_connector_hotplug_event() which
just reports the even to the userspace. Consider reworking
drm_bridge_connector_handle_hpd() to behave more like
drm_connector_helper_hpd_irq_event(). Execute hpd_notify under the same
mutex lock, capture if the status has actually changed afterwards and
report it to userspace only if there was a change.

> > > > Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
> > > > cleared, the IRQ keeps firing repeatedly, and MST bring-up (link
> > > > training
> > > > / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
> > > > not about "one extra hotplug", but about a burst of them within a short
> > > > window.
> > > 
> > > Ok, if it is level-sticky, it should be handled as such.
> > > 
> > > > 
> > > > Every one of those hotplugs is delivered to userspace via udev and
> > > > prompts the compositor to re-probe the connector. In the window before
> > > > mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
> > > > and performs aux/DPCD accesses, racing with the MST enable flow.
> > > 
> > > If there is a race, the path needs to have a lock, preventing concurrent
> > > access. Otherwise, you are just shortening the window instead of solving
> > > the problem.
> > > 
> > > > 
> > > > The amplification also isn't limited to a single connector: on Hamoa
> > > > there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
> > > > any one connector causes the compositor to re-query all 4. So this burst
> > > 
> > > Please fix the compositor, it should not need to query all 4 connectors
> > > if the HPD event came from the single one.
> > > 
> > > > of spurious IRQ_HPDs during MST enable ends up amplified across the
> > > > whole card.
> > > 
> > > How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
> > > the HPD event to the userspace?
> > > 
> > The driver revalidates the actual connector state, and a hotplug event
> > is triggered only when an actual connector state change or a link status
> > change is detected.
> > > > > > A NULL pointer indicates that hotplug suppression is not supported by
> > > > > > the caller, such as the connector detect polling path.
> > > > > 
> > > > > And nothing in this patch makes any use of it. I'd say, it's
> > > > > questionable addition. Let me check other patches...
> > > > > 
> > > > You are right, I will reorganize the patches in next patchset.
> > > > > > 
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
> > > > > >    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
> > > > > >    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
> > > > > >    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
> > > > > >    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
> > > > > >    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
> > > > > >    include/drm/drm_bridge.h                       |  3 ++-
> > > > > >    7 files changed, 21 insertions(+), 12 deletions(-)
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

