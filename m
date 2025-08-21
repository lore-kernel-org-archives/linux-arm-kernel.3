Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E385DCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbeAkF9lKsJH/3PwbzKREqKnFWKzw18FGY4jC2/s3Xk=; b=4b1pBZCZpBYzu1gg2H1yYt1HWm
	G9miEGW0BLlzxSXAdt39nv1rlteR00Tp7EsoyKi0jL4izc5coHUOtquou0a6P+WVXOvPEnBjkN8+p
	pDeCiESlSatcLEYLTyjhymbqt8J/LBKOdX0UP2OcFxx/GTWV3Gxu2xLoH4uaStoaug+htmn5F2ddW
	Y075Taq2zWdNpa4qGicHIiEh7BpmRvFAlq+aSFxOmd9/++BNVW8ZeDlizKtCbmY2rm8MTvmN8kr+p
	GMA7w6/agOuyjDnVT/A2Gv/hIwmqV6+JXTA2ByzWTpkHPpPhjod9j5L1glrtQzUd9llVNB7RXL7f1
	Joc44j+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5I7-0000000H2xk-3nur;
	Thu, 21 Aug 2025 13:25:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2ot-0000000Gehb-2vI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:47:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bEAE014844
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 10:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbeAkF9lKsJH/3PwbzKREqKnFWKzw18FGY4jC2/s3Xk=; b=TvIOL4X+mzB2gk/t
	ElgOJe1OlODT6w6gJwoKK8s8QnHxjYZc3F8uxWFbELvMOHYMqkTlxf0novdKLncb
	UvBYIYghcFSq5JnPBrWGziUllfoF47zeOD9hZcr170rYNLbYk0sydsEvYQkMls7I
	ujITzUExS7xGKi4dhmRVUGHVkZ3I3LvyKcKLlNzjn+3YVUo0jLCyqV3S7rZX9VEh
	qJH1+G4j1EIAaYWOM1mYtMRwvdbV92a1PoGWqEOoQaanb9xWxc5SslMLFrda/el8
	CtOdVHqOwBcOR9dUNrkc/R9qppV8lQCiO01rSYS4jTP75yROPhKIcwIgaF+G2Va8
	OBo0Jw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w2fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 10:46:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88d99c1cso18926346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 03:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773218; x=1756378018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbeAkF9lKsJH/3PwbzKREqKnFWKzw18FGY4jC2/s3Xk=;
        b=Z+uXrKj6uieahWZRx2Dq0lqvzvd64dGLGIWTL7E2E95UeqhuG4iEzI3ybFGQlzM08t
         awXxO0ZWxkpmZzL5KMTsJwUVNUb5nPBjmQPBm1s0mxOgqzk3kbvicx0Sdit2d76NN8oA
         xvX9cDThTIE8I4haWSDFU8guubMaBnnX3/d6j6Fjh2vtyiEA5d/ovRlOvmTEh/KrTxya
         PO1G8Akm1bbASmlMfciKhCDpY1xgei9av4sHUq4UtsIHSg6qONeWDTAgkpoDb/S/Kpbb
         5g/W1tZYv16tb12TPLMcrqqzTN/8dqZEmIDN1NVe3JSVqQdQoXceP33b81F+DINW+RQD
         GuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU88DMEoJLc8C0q+pG+w0z6eyEXBHe479NZigxMIzTDGZW9x+lA1bZipBa/p9ZsGlcnL1Qm5VJbQO8oj23GcH/J@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7NKaEEsHS9ANkiLOuV72O3YskhFIbFZHMdDkc9fH9x3TRnO9T
	U9rSbmYpZQVHC/CYqiVF5F0GrP3/WubZzm5z2wXFEzUQAnT1+OsXIxUxg6OW3N9M6V3RjcK1P4P
	HjuMtdTvLj/5JQn/i6L6kgqdcqKJai0lT5GuInSw4c9PEF3RBasFpPmW5yyCsbTpMWIS7q+Bg6w
	TVkA==
X-Gm-Gg: ASbGncuyaqjoj0c+AEW3/P9pgkKX9NkOSTRnpTy7CtL0tMwljeKW370cGC6IXTm8jTu
	gfQWPTp3KYoT1Y2K9w3APzkahcmH44KSHf8w0jkZ5kOvRn7jFad2JsouFfscyBRKBgYwcOa287B
	FIz73LTcLPcbfF2j3hsFJy3GH+uyM6SsocJ6Gruq6Er93dW3x6h2RvThSzS9N/biTNnwjhJIJj3
	EjaCo2lkD6GfXkjBdrlWdl07jRUqJruTpWA0iRwVQEMmAAHzh3R7WixUqLYRZUeo/KaNodml88C
	VMbhFLRCETEWcgwC3OAPCapEz3iEyFqF9ppEuZ9Urp4SJzcG0+V4fscrppYXhqQJm5KRRtKNYRy
	hoqWVnPtmeRmJXdnQvC9Kw6a/Ybwl2PmX/BseYsCkyhLFShN7fdBS
X-Received: by 2002:ad4:5d66:0:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70d88e7ceddmr19991116d6.16.1755773217892;
        Thu, 21 Aug 2025 03:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPCh8MTppXOux5rMJyRB2XP2aYfSeODTQkbnpzCGbsdnnzgmSsU7ZBWn1Dz+HjgvczWm/5uA==
X-Received: by 2002:ad4:5d66:0:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70d88e7ceddmr19990796d6.16.1755773217301;
        Thu, 21 Aug 2025 03:46:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef434334sm2999872e87.149.2025.08.21.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:46:56 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:46:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <a0512644@ti.com>
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
        Harikrishna Shenoy <h-shenoy@ti.com>, neil.armstrong@linaro.org,
        jessica.zhang@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, nm@ti.com, kristo@kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, s-jain1@ti.com, devarsht@ti.com,
        u-kumar1@ti.com
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
Message-ID: <k5llnrrvc72stluvlbvzireqn6jq3h6dan7valuim4rty77mfg@gfv7drdyms2q>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
 <8a31d1c5-4233-4696-bf8c-58f5db68d41f@ti.com>
 <fe6f848e-d7bf-477d-bad0-0c8a860f3ae6@ti.com>
 <c1edadf5-538c-43f6-aea4-8fa9f9c5aa13@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1edadf5-538c-43f6-aea4-8fa9f9c5aa13@ti.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a6f922 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=RF00TdSWAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=Ne0C-CsPbgjNxdNBSCgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-GUID: qp-qqkdymQdHmlowDJYcr97HdQvBgeZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy2ZjtL9VoDWY
 XHldOl/Jdnv56FQbgVXK68A1EzMw28gA36kk/IXV0NV7MqNQRluAzX2E08ol7CuHsS938IoP07N
 WONZYwGU0/QNIdsy1BBNTAu6FIhAUplXUuQbX8564K1ryB+i54gYQ+btBMw7HtGBFQpVaEoVX/N
 B85Ctw+Kh4EeqNz4vrsbU2oAP+Ro+zZiXO7kVGd/mLLV4Xv9bWIToZfGfdhDhcNMAkqV/6wJpSI
 +Kqjc+PLhtn86c9QcbbxTYmvI6nFEYQrKvohJEkQyNRT0f+ThutVXE92Hf+TghSkLd7h8t9eSLv
 NGF99vwhVa8i/E62lPW+bQM7D7vz1tBLchnifQq6dyCihynRo9iCRXCb5BypHbIiPeMe9bimSdE
 nNn+gB1DlVVJv2kxJ43yx+hapc3c+w==
X-Proofpoint-ORIG-GUID: qp-qqkdymQdHmlowDJYcr97HdQvBgeZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_034659_864088_599182FF 
X-CRM114-Status: GOOD (  23.40  )
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

On Thu, Aug 21, 2025 at 10:33:43AM +0530, Harikrishna Shenoy wrote:
> 
> On 8/20/25 15:34, Raghavendra, Vignesh wrote:
> > 
> > On 8/20/2025 11:06 AM, Harikrishna Shenoy wrote:
> > > On 8/19/25 06:54, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
> > > > > Add RPi DSI panel[0] as a valid compatible for simple-panel.
> > > > > 
> > > > > [0]:https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> > > > > 
> > > > > Signed-off-by: Harikrishna Shenoy<h-shenoy@ti.com>
> > > > > ---
> > > > >    .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
> > > > >    1 file changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > > > > simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
> > > > > simple.yaml
> > > > > index 1ac1f0219079..65f486f2bc9d 100644
> > > > > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > > @@ -268,6 +268,8 @@ properties:
> > > > >          - rocktech,rk070er9427
> > > > >            # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
> > > > >          - rocktech,rk043fn48h
> > > > > +        # Raspberry, 7" dsi panel
> > > > > +      - rpi,7inch-dsi
> > > > It's powertip,ph800480t013-idf02
> > > Could you please point to any documentation for this?
> > Git log would point you to it:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=051e95ee7ec10050154e4c8f48be4d99ac83f8fc
> 
> Timing patterns we use differ from powertip,ph800480t013-idf02.
> 
> Link:
> 
> https://github.com/raspberrypi/linux/commit/8648a8c9442b45e85b73423be1b469d10234b4e2
> 
> https://github.com/beagleboard/linux/commit/bde1b4c52cc5a79a2108076b8706e23d5844afa9
> 
> So I think, separate compatible needs to be added.

Then please identify the panel that is actually being used. RaspberryPi
isn't a panel vendor.

> 
> > > > >            # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
> > > > >          - samsung,ltl101al01
> > > > >            # Samsung Electronics 10.1" WSVGA TFT LCD panel
> > > > > -- 
> > > > > 2.34.1
> > > > > 

-- 
With best wishes
Dmitry

