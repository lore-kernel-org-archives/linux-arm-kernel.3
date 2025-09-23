Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427E1CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMb7C2zDppeQTKGSH4djX/sY8FExMuELVy1N+D87Fjg=; b=yMIOZuGCrANMroSIr+DXvLz64H
	ODVQ1Zq+DvmwGHAPOFaR/7MDQKeDEdxDisonZpELBBprV54AQ0DJ7Qe9cMJAITARK6ags9XOnf6PH
	FimsjIvUNKRL6HWVhCVNFqisqderxU7RuJx1gifsYCFHQ0MbNlkl2lK/LuK14StGlh7gudyEc3/IG
	wDwXYlnk1tg7gL0kqKgbOUWAHM/EyaGhBE2iC7kLaUwGLU0l3i16NQA5CNqZ5COtLhM4X/4K0kgX2
	iLvFUYVxl3u6a1OlEKx8Xk4oMcoOBCy2Xqpu2B18w0a+mboile7D18ZJ7QCj6zJ6X9lZ6cZfZovyv
	8veeCf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tWq-0000000CDI1-18xd;
	Tue, 23 Sep 2025 03:17:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tWo-0000000CDH5-2qQz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 03:17:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MIKIcX024049
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 03:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMb7C2zDppeQTKGSH4djX/sY8FExMuELVy1N+D87Fjg=; b=XHGnxezEa/2Uh3/5
	AlxnmfeU39uhBRTepsSKDOYGtjOv65Batzfrkr5rmyt64pqUM8zQ0v7jXcgUDnEW
	wdfpN6ICL/zvfPpPg7+UBoPUXeuvVpWime1N7Q7zbvD2/PN9JFNg9fimXQ1Y1erK
	2DxwsfMFlQNsdSseVlu8JduF1Ir67zt3vRoejAPo5UCmAfmcp5RniBb5ci9PxE8d
	mr1yz7bSUjfZYsaTjrW3eqLFq16DnEHnEQeFN1dTSPOw+0ukSVH/irHkqNc0NoNZ
	OICwCifD1C2LCAXl9vlgNMz48sO8ULSNl9geCp54SMI8jQ6O03h6LDXHxZnGONrd
	uhmynA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyard4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 03:17:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-726a649957dso98960196d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 20:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758597437; x=1759202237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMb7C2zDppeQTKGSH4djX/sY8FExMuELVy1N+D87Fjg=;
        b=fhgd2SeIqKxfyX9dTrnTtD9QO5dCKtys2n99MPdXYAI8qWM91KKDqb3QGEmIb8SD1w
         6jz4dX3AXJxucVA+H2KgNtPBG7f/gcqEGQvXbxf/HeDZV2VXMFuYIiCcNsv8IqCeDANl
         YXmnJUAplEvRsD3wyqOsnADq2Amwn9ZqGrK3pgK7Y20kUb2x6gzDvNTHhrpznwDn3Mtn
         AT3Qk49rlQngT3GtDhBsUWGPTBmwuPmuRlb8BEWsmi051RF4FjCLx5Y5lwx0YZcLhwbf
         BtrDjj0aoNHapihEEZl3SSD3zdRBWv5e6LowQ1H5KHNXRXrl5ee83hkd2xJwn52Gzz46
         vpAw==
X-Forwarded-Encrypted: i=1; AJvYcCXWTCVCvwDjmlbMmDWA5j48C1VboTh3nI2jbdmvOKfZmdsNnxiuA4xcNsQbmxBpxKNx9cA4kTZBpeMgCJFEwiNM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/0rs5FbDCFmMPyIAPiBdUvaetsQ2UgBj90h7/4jqzn2QcV66F
	MSnWXru8cpFi1qq2HkHug9DWUBJg+Z2hUgd0giv2cZegSxC5dBEUEBOFVyXuNNjo4Y08dcM3t9v
	8O8am4I+6PLvahuft1T/d4OzQRwdPwSrszR6WBxJ2Iv85FNbiVDn+YWF9oIhzePXKPrDwhW4vP5
	mlPg==
X-Gm-Gg: ASbGncu+AroSe7YoTU6xqp/mKgvMv4SmqSgbRkRAc6rr5Hb3rdpXa+4PXV4M8KRIuFH
	q5DKhmlcGSkwPQDPZrB5tA1c/+vV9cbkPiFXf8aBtjwxgSPoKcv1h0JTjk3Mg63BauEMcM50+OH
	CzdU3NFLgi6ahqPLyISDuHm4XAFPbC5HzNxxVH+L6ougcut9prXLaDUc0uHhS8n8PpUBDx95B15
	Su1qmyq1mzCaSnISlePSstign67Hj/RUI0LwAVlNn9aM4RCXcbg2HGQN7/xsxcGf9/vwkxxC0Cc
	rbJshX66e+5fHW05Nv57axAVKys2JVtFB4HygMBUQlD5rkSq0Q+Gabb0VeAf2y56RzATwm85ej9
	MfmIy7/hFnwwG3Xy//CUv6wb2u5ErHz76k/aozfncmNagFh0enRup
X-Received: by 2002:a05:6214:2a8f:b0:741:52cf:a104 with SMTP id 6a1803df08f44-7e70169a36amr13294486d6.5.1758597436489;
        Mon, 22 Sep 2025 20:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn0eBFPbnW3yR2CGZz8WEuSgYw6bETDind9f429+o4fUJgBVTohgVWJzPvbfpV811TCcIXOQ==
X-Received: by 2002:a05:6214:2a8f:b0:741:52cf:a104 with SMTP id 6a1803df08f44-7e70169a36amr13294086d6.5.1758597435854;
        Mon, 22 Sep 2025 20:17:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57a9a81f52asm2678963e87.124.2025.09.22.20.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:17:13 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:17:12 +0300
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
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Message-ID: <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d2113e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=uIhu009UdGQP6qFfJxgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5DGISLiGfg4DrbVt9xrvgH5oHgIf3XhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX325mRoOznc4R
 ccwvvi11Bl52Eka/zmj0ffea9pSC1l6rZ7IZyn/TyRBSoK4BGXwAo6y/jGrhMrwz+TWlg+V2QUE
 ITmFzRN1hyCYOZY8W0jnnGxTCi8559wh9zlaaDjxfkU9NIBfspigGzlgwdCTp51Qh/C4Z6mY2tS
 SteRV/oPYNtr/UmBYDcf6UyvqnSIcrQQUFpYlZzAZsRVDIz3smvkVB+d9zZ5TYTUmpd3MLJupp1
 xgH751WmyE7aW97hT4miqG7rZGx5UHwost23QkBmUu8+GVjLMCbam46gOuACvLrtNQmNXZuGvLF
 wAbvhv0RLCeutve43T6/ellMIrhIUOHOUD7WR9dZ4s166MtOVO7z+vfnSxsBWRNbx111BfKY4Bu
 4jgUeXfS
X-Proofpoint-ORIG-GUID: 5DGISLiGfg4DrbVt9xrvgH5oHgIf3XhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_201718_725742_BCAC25D8 
X-CRM114-Status: GOOD (  34.94  )
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

On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
> > On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> > > supports software-configurable pin mapping and DisplayPort lane
> > > assignment. These capabilities enable the PHY itself to handle both
> > > mode switching and orientation switching, based on the Type-C plug
> > > orientation and USB PD negotiation results.
> > > 
> > > While an external Type-C controller is still required to detect cable
> > > attachment and report USB PD events, the actual mode and orientation
> > > switching is performed internally by the PHY through software
> > > configuration. This allows the PHY to act as a Type-C multiplexer for
> > > both data role and DP altmode configuration.
> > > 
> > > To reflect this hardware design, this patch introduces a new
> > > "mode-switch" property for the dp-port node in the device tree bindings.
> > > This property indicates that the connected PHY is capable of handling
> > > Type-C mode switching itself.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > > 
> > > Changes in v4:
> > > - Remove "|" in description.
> > > 
> > > Changes in v3:
> > > - Add more descriptions to clarify the role of the PHY in switching.
> > > 
> > > Changes in v2:
> > > - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> > > 
> > >   .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > index 91c011f68cd0..83ebcde096ea 100644
> > > --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > @@ -51,6 +51,12 @@ properties:
> > >         '#phy-cells':
> > >           const: 0
> > > +      mode-switch:
> > Having the mode-switch here is a bit strange. I think the whole PHY
> > device should be an orientation-switch and mode-switch. Otherwise it
> > feels weird to me.
> 
> I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)

I couldn't find the comment on lore. Could you please point it out?

> 
> 
> 
> > 
> > > +        description:
> > > +          Indicates the PHY can handle altmode switching. In this case,
> > > +          requires an external USB Type-C controller to report USB PD message.
> > > +        type: boolean
> > > +
> > >         port:
> > >           $ref: /schemas/graph.yaml#/properties/port
> > >           description: Connection to USB Type-C connector
> > > -- 
> > > 2.49.0
> > > 
> -- 
> Best,
> Chaoyi
> 

-- 
With best wishes
Dmitry

