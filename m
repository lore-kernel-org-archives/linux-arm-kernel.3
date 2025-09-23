Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A1DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 04:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ysyyR+HSBxqCI8FuQWOZHxXbhAf2dscJgNWIhtU+ys=; b=Chob8Fx7KwfAkDpOYcrdgLSXIU
	inrq4UAnIAZf6ymeIifUa/R4PIDuZt2S2+9JVDFFUgajiaMY+f3eEqfSfPfbwSEXy84TpSwB5J9Jf
	8x8CTL8I0VfN0V70zPr+UuHAV0y+xPDatAqSn2CKsituTYPnB4BidDv/51tU7jseLa2ydiJWQQXgO
	XrykIDhb+7iYyLpppDcEQgGWjFko6MEA4f4ob/i2zGEfckkuDsuszBk0UXYMFnbnlrY5t2OZJNaYt
	cuAruH7k5w6nZsiA7DTMqjhQ3ML8kluPit2QVWQYfOue1I6gasdsim/zgYn0zbrmBiohOB1Ijq2Ym
	6YS0f9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0v0Z-0000000CMJF-0xx5;
	Tue, 23 Sep 2025 04:52:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0v0U-0000000CMHd-1eHD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 04:52:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N4W0S3017159
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 04:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ysyyR+HSBxqCI8FuQWOZHxXbhAf2dscJgNWIhtU+ys=; b=Bl+LV8UHw8nBOeNg
	NQIkWQ/9ghyTSiJpE5s3ltpVJJsx54k2D57hFQg0RSns3glajhRuY9DHDsdHNr7z
	8/Iun4mHhE1YK7M8Y743Mh9rZilV7wAynsNrbt/ATzPy0BNYMzi0plv+VFySLZl0
	YDo+hK6a/y7hmmRc+2AuKr8RmiPAME+hyuztfZbtK6us+/K4HW+XfwSqRqAS8F+h
	+pqyfOw1pcveSMNnazD3JxfhKfPmeutiJFyK6UCOOa040okTLj6ULcvLTiuWqd69
	41Iome+o+KiZfvuPyASZP5AkD/ztoycFxi+7hmuWQpFYAvFedC2EB9xxeFbVMbAH
	8+zQLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98f6fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 04:52:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-84b9c23b8aeso343452485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 21:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758603120; x=1759207920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ysyyR+HSBxqCI8FuQWOZHxXbhAf2dscJgNWIhtU+ys=;
        b=UTQ3AJeB3OOe0jhGCF/FSPUu0WZHWbGrmCaU+3v0D4okei4M7mt7b8XfLgns4sIlg7
         lc3tQ+TD1a7nhpSPZVSt5bnIYiqZMlNnfyMIqIvXhUtwWs0xu6NWNF9cPRfPilYShsvL
         9Hn6hrB5/mp+OxfWAnYyBXIwwOrdmIRd4bI+LYn35hy0y7DcgJy4X5xxJTSQy/y2EXGZ
         LinugR3eJLBABiWSEdnNN8W00yaIBS3vT7V6ju4g/XQhzPJVHeIk7TLBxANM1TysAatN
         Zgco/MES0Kpx4HER8QG9gM0D3tEGeiFBA/xZqVZHqoDXGSKXa7H36h84XjjBb0zQxOdi
         TUKw==
X-Forwarded-Encrypted: i=1; AJvYcCVxXC3WcbUF7r2k/a/JOg0Lyoqm7Eq6vpSaNL9SWuaJVooq+OIi0Dh0R1fFpWxMfEc8aRJdqLgmTwvzBIHufbPK@lists.infradead.org
X-Gm-Message-State: AOJu0YxoCqbYhhRuZvlkICtQY2ckNBHRsNzqjk6nn7119GaAB/3OYPlV
	72/S1P7L8N1SYIaa4/09Xq6eRsCoXIxMEwaVmLBvi25fkoL++3E5iDKFCoDlqo+BmVVGQ4vE5VN
	BQaFsNhiG4EiDVsTSEitI/AVsuDI0zEcR378KMY84TEnHKFsEFv5/rV+dalgUoaJqgQ/pmmqLoG
	1oRQ==
X-Gm-Gg: ASbGncsDcvvgCpdNvJ/FsbVT59yQEzfRLr7f+LynNkUxLHWKzcITHpnucLkOa73Z+/L
	5lLLZ/leAFs3YuVeeiQq0QTtd1n6qA0Q+PYsemPj2pf3YygAJZu9pRSH/kDlijPyuqvUPJ0tij6
	QX4BpIWBubspZcEK1FA+cGQcQidV+j4KlEVjNoL2qZp+4IFixYZ47jMUTlZuxOCl9hz7D7kmfBJ
	oNY5gdyqpSUjj9jZpXj7eE9nHVE6Y/UgXl63TuHsGZaeqeFRMbs5j04mgc9NXgkYKpGTy1BvCt+
	ye8zCNwUmfH+/p648aV7VuPI+k+/aLZ59NQl+s21j6FqNCzndMBQjQM1Qp1qrRMmY30qHWopijJ
	9XfpCeEIJq8tm3Adog9zOfYX4l2v678Gaz8t23tnqoA8r2KM/ALbn
X-Received: by 2002:a05:620a:1923:b0:812:48b9:2eb0 with SMTP id af79cd13be357-8516a8202bamr136831185a.19.1758603120289;
        Mon, 22 Sep 2025 21:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKxvB+ebtnxiMgBizv494obsHW1ZlzjCI32T27z/Odi7Kl2wEkCUAGK1+a+EPj6Wq2e5gDkQ==
X-Received: by 2002:a05:620a:1923:b0:812:48b9:2eb0 with SMTP id af79cd13be357-8516a8202bamr136828685a.19.1758603119745;
        Mon, 22 Sep 2025 21:51:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-365694f1be4sm23536661fa.17.2025.09.22.21.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 21:51:58 -0700 (PDT)
Date: Tue, 23 Sep 2025 07:51:55 +0300
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
Message-ID: <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
 <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
 <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
X-Proofpoint-GUID: Of1s1SE2PlcFwRZMUJXMYsn6X4r2eT46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX0NpLP1F5e/NO
 uaVE2R3xj8OfTc8kMa2vIgP+Hoqd8x0pnJkHYmbcyk0tD9snGkdBTjT01v/VB/lqGMqW4sWMDoo
 EleXNFahLo4OvWOsUT4aYpZsatJnL38kKxYkyek4YSmf3qx0kvJPcOm8G0+x6rImmf6w5OOiX5C
 OdCXvXjpfb9DqeWl5xJxG1a52Hqp3yLQOcvRKLNwH7IISBBwanzfqZDQVnRts2ZDBUN1BwPs7JZ
 4+lTXQnV15eXuiKlNv46edaHkJkaMi6Jx6mibBEvqKzoz8lRc0i4FW3vhkt7icE0CFJ5ARa//tG
 C9MptQ9spZSfYlpff+3LvkW3Gvd8kaMiW6UnKduGkTqj+FJwJqp5cW2DMNXXC2Xnq/kxk1VbIjM
 GH7ymu1v
X-Proofpoint-ORIG-GUID: Of1s1SE2PlcFwRZMUJXMYsn6X4r2eT46
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d22771 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=JfrnYn6hAAAA:8
 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=SBpjGD6abgB5dFENKZUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uGDpjx9DKq9E8W49yboe:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_215202_549299_6753228A 
X-CRM114-Status: GOOD (  40.47  )
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

On Tue, Sep 23, 2025 at 11:40:33AM +0800, Chaoyi Chen wrote:
> On 9/23/2025 11:17 AM, Dmitry Baryshkov wrote:
> 
> > On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
> > > Hi Dmitry,
> > > 
> > > On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
> > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > 
> > > > > The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> > > > > supports software-configurable pin mapping and DisplayPort lane
> > > > > assignment. These capabilities enable the PHY itself to handle both
> > > > > mode switching and orientation switching, based on the Type-C plug
> > > > > orientation and USB PD negotiation results.
> > > > > 
> > > > > While an external Type-C controller is still required to detect cable
> > > > > attachment and report USB PD events, the actual mode and orientation
> > > > > switching is performed internally by the PHY through software
> > > > > configuration. This allows the PHY to act as a Type-C multiplexer for
> > > > > both data role and DP altmode configuration.
> > > > > 
> > > > > To reflect this hardware design, this patch introduces a new
> > > > > "mode-switch" property for the dp-port node in the device tree bindings.
> > > > > This property indicates that the connected PHY is capable of handling
> > > > > Type-C mode switching itself.
> > > > > 
> > > > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > 
> > > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > ---
> > > > > 
> > > > > Changes in v4:
> > > > > - Remove "|" in description.
> > > > > 
> > > > > Changes in v3:
> > > > > - Add more descriptions to clarify the role of the PHY in switching.
> > > > > 
> > > > > Changes in v2:
> > > > > - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> > > > > 
> > > > >    .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
> > > > >    1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > index 91c011f68cd0..83ebcde096ea 100644
> > > > > --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> > > > > @@ -51,6 +51,12 @@ properties:
> > > > >          '#phy-cells':
> > > > >            const: 0
> > > > > +      mode-switch:
> > > > Having the mode-switch here is a bit strange. I think the whole PHY
> > > > device should be an orientation-switch and mode-switch. Otherwise it
> > > > feels weird to me.
> > > I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)
> > I couldn't find the comment on lore. Could you please point it out?
> 
> Sorry, it is v1. I added an orientation-switch and a mode-switch in the top-level PHY [0]. Comment is here: [1]

My interpretation of [1] doesn't quite match yours. It doesn't say
anything about moving mode-switch to dp-port. It basically pointed out
that you already have two ports.

Also, I'm not sure how the current construction works: you register
switch and mux for the dev_fwnode(tcphy->dev), however the lookfup
functions should be looking for a device corresponding to the port OF
node (which doesn't exist).

> 
> 
> [0] https://lore.kernel.org/all/20250715112456.101-4-kernel@airkyi.com/
> 
> [1] https://lore.kernel.org/all/4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org/
> 
> 
> 
> > > 
> > > 
> > > > > +        description:
> > > > > +          Indicates the PHY can handle altmode switching. In this case,
> > > > > +          requires an external USB Type-C controller to report USB PD message.
> > > > > +        type: boolean
> > > > > +
> > > > >          port:
> > > > >            $ref: /schemas/graph.yaml#/properties/port
> > > > >            description: Connection to USB Type-C connector
> > > > > -- 
> > > > > 2.49.0
> > > > > 
> > > -- 
> > > Best,
> > > Chaoyi
> > > 
> -- 
> Best,
> Chaoyi
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

