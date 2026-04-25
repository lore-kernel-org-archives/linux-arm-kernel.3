Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7113FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 21:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=; b=cLDvSEAnPPXAuoZCbrz7Ue9XHH
	TiuOjAMIjdjgS7op22EL821yR+w0eyiXmEV4xEzJwPTPEtY+JNz5Ot5IcktysS5Ymx87WaMN5BxH8
	4ifbgXiM/ZRAfQ+65KiFbTCic27RaXtFDVa/dhXz/01l6zTl/IzfS5Lw+3hslh+rNpeslWdOkHnEg
	ODq7Z8oTPLVk4DZUuO7eTDHLrrl8A47CecVpbbzm+wD4x72sG7TvInU+M4no3YOqndh9yhJwHSqR8
	dBt1DZ4uPkE3GEKB4nB/GEKsW83rOhDOBUjbuLTXv/hRgKxZAF0+7l60LlYEsp0EME5/+5e75Zn5g
	416Mh/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkoG-0000000EqEa-2Zze;
	Sat, 25 Apr 2026 21:45:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkoD-0000000EqDd-2VcD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 21:45:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGO7Yd3317896
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 21:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=; b=HCc64IYQood0E5bQ
	AlFPx6OvkHkwa+Zof3Wz+yWMy1ecMhIpTttSv863tnJO2Db2vapgafoxrbmZjuUZ
	cwdDVCrC/Frfl93m9h4MUzmOfwvZC2qJTx6ym8tsyHw0/6C7yw8cTVlPL5bbfDc6
	vkzmdJgS0n7UaX7uYhdzTQ+szOdQ5oK/llQzHTIwzKZTv0ZgSOhNY7mp2OL1g1fg
	rTJ1U9wQVHHhZMh0SpHMwKBaeAy19RzUr3Y/5tT/TVwnxFcvLkmeXDU2sgOJxWh5
	IIjHZuSc5Msh9NOQkUH/T7Eed7QhvkYImpDZn7jyf2y5DRz7W3XOrK9QpNu2Yx+Y
	CKaa3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx9rn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 21:45:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso165981071cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777153504; x=1777758304; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=;
        b=Mipk+4tzvbkoNOnnPXpXyFWAhd68fHuOJMhRSo9vvo7K+T1HWMWr2ivBXy2n6enz5Q
         qUNb1emML/3BGUAEGInmNVXzd8J9QNbr49mzjOzvFuiQFt0O3yN87QCYWutizgs5sNBi
         tWKh1S1lGqcFKML12muk196F6t+077+Z6qSVRCB2Z5EHT/+W2QGY9kmRN5V/2+uBSl7m
         rQVvjlDzaBLsD2nUAvyYjPgJScwUrx4iQQ2HKUQDlReKIUOJtx9L4zGowB8ET5qMkYSd
         bF2KXyFaotjFU23MI9NWsA6nTmQOfEmUMNWrnDRMLNJ0YZwmDtgHaJ+/4ADXjTqKGgrw
         ogoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777153504; x=1777758304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=;
        b=RW9WsbPFM715mLJSQTi99/SDOUy6UHXap7Ph8/s7yv9zLEsOIeX+JcWpQt1yUyJ2EN
         Li7TIlqFn5Giqb9Wy0pveq/HMUv+seVXKORDOR0nbP2upUS18H7mLuWew5fOSQEqq6mU
         pwnWvEcmGVnMPW+SIZ7HU4IxYXpD7ViU+D2f8zLQoPggbjmA3btCGeeHS5R3WTeM1Vvu
         jnaC144xLRfBlNZKMg/xfabtn+v2ESoBVmFOkm2RucoqCHAC3l07TzJyBe9VEACI8fta
         7hZfi/sMKCmiKAYCNk3Ol2AnbDVSr++TrrczRrHHfdOgrCEyey0ymuewu6R3t9zDNBy/
         d5xQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xXV51imIHZpIahi6AHbZsUkWSRwiCeejX3u02umCsgY6+AQz4md55X3+I9U96JpMdsfii7Uj6/Ci90rv+PmVg@lists.infradead.org
X-Gm-Message-State: AOJu0YwZvrkLAaQv5xfi3IbqAbmQrpZwFtpUSUwQpxcc8GkMGNjlCAqO
	TPh5u8elzh8JWcqlTaV0ma33qeOacXJbmrwnVy94aNJw4Lv1c1zIfpkarxNPpMz5A+dhqsYB7MX
	vqzGcbOs496MHEJAOF6flvZW+1zk3h0lyq0SNED9OxrTZEPqCD9RiQF9R2YYk14oNmZoijkMWZ+
	TCew==
X-Gm-Gg: AeBDieubP8sZjxwXP1eRtBgoUsVl4+2zpWKAqKE9ykT8bLD2XkI6/a+BA9PqcK/qdx3
	37mJ8eHLgr4zx0Hv009JbaCXjf+FZ4nblvnCjo3WoRuxSN5WYonc0FSyhf2tEa44pDBYexmpeRe
	DLn2EjF2DY573M79efISaZ1gZ0XNRd8GiqmaRVtI1MSCQPpRSIq9r/k8E5Onyi9ZJ+XhCEUd5SD
	UIQkcwG26WWoe2zlSJO84ZRSwkYUzwaaqNxUGmTygBDpA83kny384tmMbINAir2+5x2e18pykFw
	Xnev03ObgkEODlArGcCRcL5dkqIe23OJRRxH1rC/aQJ4GyDz2wyFU6vBbet0PXe/0Gqs9FY4dMM
	n1yWE+eyTRqz8pMnffnazz3g+L6gASVmXP7Ak4gMlaBLtP6CcU8WAHnQnc2UoCMo090ml5uVFaj
	YnzD6dktq1OZWCgk3tRqNdNTjCOk/XrJawVJPprOIKdDwJrw==
X-Received: by 2002:a05:622a:1f0d:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50e36c56a1dmr524175461cf.48.1777153503571;
        Sat, 25 Apr 2026 14:45:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50e36c56a1dmr524174881cf.48.1777153502621;
        Sat, 25 Apr 2026 14:45:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0c5sm7017077e87.10.2026.04.25.14.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 14:45:01 -0700 (PDT)
Date: Sun, 26 Apr 2026 00:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <ur7mow4lw47ylxj3uigwwasrfywe6n42zb2to7ygeyjlkcgfkf@guzkembyy5hc>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com>
 <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
 <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
X-Proofpoint-GUID: OX6u6IiCVXZBqjv6HpLIsdeb6wqmFAIi
X-Proofpoint-ORIG-GUID: OX6u6IiCVXZBqjv6HpLIsdeb6wqmFAIi
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ed35e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=c7CpEUyHu0UMHcTobk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDIyNyBTYWx0ZWRfX3XtcIgCkffaE
 Zn9NI1PfcoLvtHUWQ5C7+MzuFheb6oGV5sWxJk7QY/uhvHdvTmLTkov+THCwjka7G5OJKZoQlP8
 4sZJhfDJuw6PG0rW9luAo5HXo6HsQwL/S54BlNdTMvgTDhaFNaL6iKgzaijw0+8a7kLJRApY5UG
 Y3XHQBReOZmSAbnpLO9WY/YKxxCNHBQDqBeYDsSpKrUB63Kcy0I6zr5SqbraWml2KMa3rfGJA8j
 GEbQfJXMIt7dnUtpZpMVi84mrKM/On2/iISUPFmOachTtyxTiEgEgGsGfiOUxVcF1p/doJ9qLCP
 jM02aC6SN9qFYCxUwSfnrFKOvlXK2p6SpTmsrQ00uvLHLwfO30bkRmvfeNx6hZRVeAWdufjsAfq
 aNyjRz036uQY2HdXcXi7IhtUadNTOScswniilzcfczk9mfSnSvYdfIEILUPFsVdCv4VoXbCzsy8
 6wCQ/SNjuWrh/obdArA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_06,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_144505_827057_D3229A82 
X-CRM114-Status: GOOD (  40.16  )
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

On Sat, Apr 25, 2026 at 01:10:02PM -0500, Dennis Gilmore wrote:
> On Sat, Apr 25, 2026 at 9:24 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> > > Hi Dennis,
> > >
> > > Thank you for the patch.
> > >
> > > On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > > > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > > > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > > > a DP1.4 source to an HDMI2.0 sink.
> > >
> > > As far as I can tell, the LT8711UXD has an I2C control interface.
> > > Shouldn't it be an I2C device ?
> >
> > From the datasheet:
> >
> > The device is capable of automatic operation which is
> > enabled by an integrated microprocessor that uses an
> > embedded SPI flash for firmware storage. System control
> > is also available through the use of a dedicated
> > configuration I2C slave interface.
> >
> > My guess was that it can either be an I2C device or it can function as a
> > simple platdev with no I2C controls. Please correct me if my
> > understanding was wrong.
> >
> > But now looking at the schematics, it seems to be connected to I2C6.
> > Which means that it should be desribed (and bound) as such.
> 
> Hi Dmitry and Laurent,
> 
> While the schematic shows that it can use I2C and has been wired up,
> it also shows that both MODE_SEL and I2C_ADDR have unpopulated 10k
> resistors; as a result, MODE_SEL is connected directly to GND, putting
> the bridge in autonomous mode. I confirmed this by running `i2cdetect
> -r -y 6`, with the only device on the bus being the HYM8563 RTC at
> 0x51. Without reworking the board, the device is not directly
> controllable and just runs autonomously.

I think it would be nice to mention:
- In the commit for the bindings, that the device can be running
  uncontrolled or it can be attached over I2C, bindings describe the
  uncontrolled mode.
- In this commit message, the same.
- In the commit message for the board DT mention your findings about the
  board, mention soldering R9 or R17 (which one?) and R27.
> 
> Dennis
> 
> > >
> > > > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > > > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
> > > >             .data = &(const struct simple_bridge_info) {
> > > >                     .connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > > >             },
> > > > +   }, {
> > > > +           .compatible = "lontium,lt8711uxd",
> > > > +           .data = &(const struct simple_bridge_info) {
> > > > +                   .connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > > > +           },
> > > >     }, {
> > > >             .compatible = "parade,ps185hdm",
> > > >             .data = &(const struct simple_bridge_info) {
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

