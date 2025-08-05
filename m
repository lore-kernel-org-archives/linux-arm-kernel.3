Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF50C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQj3FZoctR5ZS2xg/dOfzXuT0Dr0fvmcc9XZPTdXy0Y=; b=qbBUfz8rlJ0BeAy5pUMTkIza2D
	xVPVuE0JSHeUtjv6vxDT4R1OEkA3w6bFUmF/mPOdeFKTmoJQlCGNDBlpXUXm6uz5zXOmZYTRObGvx
	9qthAe0DDYOmwsJdnuiXU/VQ2zVimHDq+gQ7gZkVvPpvjo6CEHxW2AofZC3N3YjOTJ21lv8gpoS/H
	kRc3kwB5t44K1uU/0J2pgDP6/yW/wCj+eYKy5RjwyyBe/SnJj1Ra8eyWNwxQYeToYWDZXygShr6ZC
	1zSnrf43HM01g6JhLx78nDFxQ6MH7e02Fofu9DmaJlTpGanLwD9/3BQ7Rdth9FWbfQIooV8t7vAcF
	0/7++pXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFSP-0000000CYgI-3BwV;
	Tue, 05 Aug 2025 11:03:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujF9u-0000000CWRN-1g8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:44:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AJHCd016093
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 Aug 2025 10:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQj3FZoctR5ZS2xg/dOfzXuT0Dr0fvmcc9XZPTdXy0Y=; b=D0/F8yS6/OcIy9ah
	7YaYrsXNvAazegfh/GMt3/QvEy/j3/9zjhmhDdSZN5eOoxX0//gOc93vmKCwwaio
	tuQrFNy8O1HrQHG+Ye3CNeQqk2LaLBk00aHITaNjZm9dy6BCLlC2vhe614Pgqm/H
	IsBydYHwgenHTj0I2Ffgd36qePbfRXGL34H7NhfPxok74Q5WUhg7qpasftnYSMPG
	dmQJO7tUjBd5FtDTP8CcORgTyjhKfOpWBJWxLmrxA5oNclvJjLAvJCoJPE7U8Md1
	iKB+ndNvnLf99f4CTyG4cDWhe9YRVij8SDgNTVpAkEC/M9eY1nlKQzoUc2CpNKqW
	JMxy1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv4e3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 10:44:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073140087aso94713236d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 03:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754390680; x=1754995480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQj3FZoctR5ZS2xg/dOfzXuT0Dr0fvmcc9XZPTdXy0Y=;
        b=radOrZepiJAbrAxSw4jYwx7ZFs35tQeyRC0AfSz6iG1uhu9GxTaw9Pki+ghh2/WClA
         8NiFeyJpysgZyZlXmp7fEdgrPG3i+qtcnK9VvBM4Wn8eMllzm3w5z+lTNmqszaeDipAh
         NPPit9Bgm+T0RvXZ3LcaJvLuBV77wyNnsSm0l/qXiFmnLoqfnRUzICWEgeyyhuNoFfpc
         FjWb13kq3x4l4T9vEfnj1n3WUXqc4jK72vJe0wLyRdalhzHFt4FTFbCaRgi+elFaPeHp
         UwS1AUQo5GzNJsYZHdyUxdKOATXsEj06HDIUGt4brkWyrQ4ktCHUSZGACRWDdEnJN5qo
         s++A==
X-Forwarded-Encrypted: i=1; AJvYcCVzVx87cdVcfbvNZEwtNJIGRwyz83kAQAL3rAzE93opIrfUuvrE0VOfmx0lRUy5RHc4KPlajyMNtuKf3e9h0M9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+y8lFgA0krmAS87bPUEi+DHok24M2Fsx1Ucta4jVJ1U5xHKhY
	pg/6ldZk+EsnMaE+5rSYF78M8uqABpcKcVzutFSooMQL1YelU9UpOzqZRmCv6Vp4SIAA1jiwU8L
	Ps3Le1xVt9ZgldEFRyGRSSfhNCe93VOf9RJbaptOasoynt+9nerVZcV1kfKgwcJXYWb2xgqAPei
	dJEQ==
X-Gm-Gg: ASbGncsdBwsKRBRm9dXdGpaQwHI/d/ZpMdjw2a9WTd6rZJF41gPtGDxPRMKE0QC350M
	EaDtEcjOHKfly1pBU7qUA6NsWbxwBGq48chVVeuLnCjzqOX05IYtwwa7ycszwHBDb651J/W/BpI
	75cSGOXEJC02QzYkLYX4duthChb/fKOha0YJ+SfSumT0HH1tQpByJiZw0+m3EaaTPgbJNK4IJ5d
	GovoK9QozxyreQD0PN+gZ/FJeSYVAiyGjHhzVza/qarGZy0XLnYWmFyqp+62059slfvDrLXfKzc
	GXi9eWdxRPpvFDtnarzLJFOQe6o2DXvrYe7G52WJBac52SfXsR68zZ7sfnP+3nUxqOHMVszmi6Y
	MWr7flIHzghwes+bB9j9sf4TDIjl5qRr1nNqC841jnvYci3eH0smi
X-Received: by 2002:a05:6214:5001:b0:707:6425:23fc with SMTP id 6a1803df08f44-709362430abmr166448926d6.26.1754390680315;
        Tue, 05 Aug 2025 03:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+lMiAsbHz8RoaMN5eHDsdtapu2Nr4qMF3fZ3qhDMKzwzlcVX/R3oTueoOHY1lwn3LqnbIIg==
X-Received: by 2002:a05:6214:5001:b0:707:6425:23fc with SMTP id 6a1803df08f44-709362430abmr166448516d6.26.1754390679809;
        Tue, 05 Aug 2025 03:44:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332389807eesm19601341fa.88.2025.08.05.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:44:38 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:44:37 +0300
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
Message-ID: <6nfmxwtwcvuyo2jaao7fele7jcgcykfpy7czbcbjmjxv7cs5sc@dmbtot73kw63>
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
 <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
 <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
 <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
 <f726862a-bd18-43ee-b307-8daef2451e6b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f726862a-bd18-43ee-b307-8daef2451e6b@rock-chips.com>
X-Proofpoint-GUID: 0qEdm2uMXpOQOW_MxxSXfkgEjalYzU6Y
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891e099 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=rd-FPC7Uua5lUePm5bYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0qEdm2uMXpOQOW_MxxSXfkgEjalYzU6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3NCBTYWx0ZWRfXziBrrqs/Wnq+
 6+GlaE0y+XmsbDORVbBALp8hDoP+Q94HouG+dwlKTdfhhX0SCeWR+TX3A1HFhw/g8KPOqcULkh3
 J5XxB61YJvEUiN7VOlS/clfK0wBr28LGi+UmOoDGcAv17r9NOM9Y2fE2DmqWZ75G3LUKtuvLLu1
 LKSJdOqJNNvwoLhgfsX+AcZ4ZM0xIcTLFJyHCLBoszrlQSh5dQELOhai5u/b7/ZWC5RHCJSxwAU
 rGRqNdAxkaBX169+P7YRG6WS2TrdMqBmUKiQz27z2K9zTSOq3htay315Ly3Avqr8JReKwzbHewj
 WNjzdTq9TCpXz2sQjRxn36jlSXa2kx4/MjiKOu0kl/22UZ6XXgayRtddzVf0z9Lp7UgZzE92t88
 0u+XEGABa6MTGdlE/Tto7jdR3Ij6L0jg0kQ0MRKHaAZHpPfd+HpMR8Rb9mfxzVVKWq0ontiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_034442_436829_7C0F749C 
X-CRM114-Status: GOOD (  49.96  )
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

On Tue, Aug 05, 2025 at 02:32:17PM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 8/5/2025 12:26 PM, Dmitry Baryshkov wrote:
> > On 05/08/2025 09:13, Chaoyi Chen wrote:
> > > Hi Dmitry,
> > > 
> > > On 8/2/2025 5:55 PM, Dmitry Baryshkov wrote:
> > > 
> > > [...]
> > > 
> > > 
> > > > > > > BTW, one of the important things to do is to implement extcon-like
> > > > > > > notifications. I found include/drm/bridge/aux-bridge.h , but if the
> > > > > > > aux-bridge is used, the bridge chain would look like this:
> > > > > > > 
> > > > > > > PHY0 aux-bridge ---+
> > > > > > >                      | ----> CDN-DP bridge
> > > > > > > PHY1 aux-bridge ---+
> > > > > > > 
> > > > > > > Oh, CDN-DP bridge has two previous aux-bridge!
> > > > > > > 
> > > > > > > Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
> > > > > > > state between PHY and CDN-DP controller.
> > > > > > Does it actually work? The OOB HPD event will be repoted
> > > > > > for the usb-c
> > > > > > connector's fwnode, but the DP controller isn't
> > > > > > connected to that node
> > > > > > anyhow. If I'm not mistaken, the HPD signal will not
> > > > > > reach DP driver in
> > > > > > this case.
> > > > > Yes.  What you mentioned is the case in
> > > > > drivers/usb/typec/altmodes/displayport.c . I have also added
> > > > > a new OOB event
> > > > > notify in the PHY driver in Patch 3, where the expected
> > > > > fwnode is used in
> > > > > the PHY. So now we have two OOB HPD events, one from
> > > > > altmodes/ displayport.c
> > > > > and the other from PHY. Only the HPD from PHY is eventually
> > > > > passed to the DP
> > > > > driver.
> > > > This way you will loose IRQ_HPD pulse events from the DP. They are used
> > > > by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
> > > > change on the DPRX side and the DPTX should reread link params
> > > > and maybe
> > > > retrain the link.
> > > 
> > > Sorry, I still don't quite understand your point. I think the entire
> > > notification path is as follows:
> > > 
> > > Type-C mux callback -> RK3399 USBDP PHY -> PHY calls
> > > drm_connector_oob_hotplug_event() -> DP driver
> > > 
> > > Are you concerned that the IRQ_HPD event is not being handled
> > > somewhere along the path? Is it that the Type-C mux callback didn't
> > > notify the PHY, or that after the PHY passed the event to the DP
> > > driver via the OOB event, the DP driver didn't handle it?
> > 
> > The IRQ_HPD is an event coming from DPRX, it is delivered as a part of
> > the attention VDM, see DP_STATUS_IRQ_HPD. It's being handled by the
> > altmode displayport.c driver and is then delivered as an OOB hotplug
> > call. However, it's not a mux event, so it is not (and it should not)
> > being broadcasted over the typec_mux devices.
> > 
> > The way we were handling that is by having a chain of drm_aux_bridges
> > for all interim devices, ending up with a drm_dp_hpd_bridge registered
> > by the TCPM. This way when the DPRX triggers the IRQ_HPD event, it is
> > being handled by the displayport.c and then delivered through that
> > bridge to the DP driver.
> 
> I think the issue goes back to the beginning. The key is to reuse the logic
> in displayport.c, and the previous approach of directly setting the fwnode
> has already been rejected. Is it a good idea to register the aux hpd bridge
> in displayport.c? In this way, we don't need to register it with a bunch of
> PD drivers (such as fusb302), which seems like a more generic solution.

displayport.c comes into play only when you actually attach a DP dongle,
which is too late for bringing up the display pipeline. But your point
is valid, it might be worth moving drm_dp_hpd registration to
typec_port_register_altmode().

-- 
With best wishes
Dmitry

