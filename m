Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C22CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdpmDsm62brobuQjUJYWRZMW8nEvkBWHHBR4Kl+p9ck=; b=Ptu8Pv/b2sxqe6paYL366uIMCK
	dgA6ANytNrDtmOSvSdnsa/t8wg+xVdJKe/WSydx42EbUSZx1VA3zu2/Cp7RKp89vv+3cUt1CL5AxX
	GhmZeCf+1VnU1I//zCV2x6cFoJ/SFCrNJYMSqFy+BGVlLOfIQTW/T16SWJv3w0X56yEE+n6sxwgxK
	w6dTMWpKnwD9Lxu8DLppypb9x4rgj7/BTwM8/4TW7vbVh+TqTmTh+GeXqE7d/QZzftCliBIHW4Tnx
	qN+nQGOmV2dFSLIJYwpaN5YR8lJkPrRf2jGxdqbpxw2IwFMq9gKXP7FH1sNh+CkXRRmKc4WmyheVu
	/AQf8hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNw-00000002Slt-0qQ6;
	Thu, 28 Aug 2025 17:26:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcB1-00000001dVl-0q48
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:56:28 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S61VNk027480
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OdpmDsm62brobuQjUJYWRZMW
	8nEvkBWHHBR4Kl+p9ck=; b=MLOYBOfxkPhySalZJmsNJxpH0XwqD7DR0CWEmIoE
	JcPIo7+2i1H5T7AE7EZJvX2EoZ1HvOEe4bujMxMHnLO9cqpP/aZmCZHE/lpJ+Wad
	nMiRoSOAR26w87HyvVJfyK/ejhQvXNM0emS38P/Rf1sYjSeHE0YCCSpwHi9Lxcp4
	MkebjToxa5ES3MNmif0KwSWIsbMkp89IlMlhiIesEXfMn1PDKu1F7BkO/qZklzH2
	vV4iyTrApTG6NX7w2N+PJE3ecxd8zDeKaPqoFcgDle2jgmFUCBnTNDwYgZTLo9qj
	IaKTyP53y+09zoON9kvUXf311lp91+oLlw6RN1jywHAlUw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16y8fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:56:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70de6f22487so19791756d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385785; x=1756990585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdpmDsm62brobuQjUJYWRZMW8nEvkBWHHBR4Kl+p9ck=;
        b=sTNjo6yIwSZ8HqkUqzSv15GQnaYe7n2vt3PsIWso1FeZ+UBiQyeTES5AcPiYG3+Khn
         49JjAyKFF1MmWcXqYGbtXmTHMKKKPcdojtGQ24FQR4ZAkiQm7is7Spkihjye8YM/AMGr
         uaFnOhyUfuh6uds+p++JvJVmF3y714nXycq7+5IGLqzQVhnpD3flEyx/ymzsvFTpW61f
         DZ2FgvqNYcBDP6HU/DcfwkRLW39EZ7p5DBZrAIsiXCXWmnYaIGKlutRUPOix6Xj1EMgi
         U21SED99qeCY3uxF73J3fg1o+j3AqLNua6XKySHmA8a0ZdcGAzmxUjOnACi0pPfy70op
         J/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUgA0ECznF0XH+XbipCEm51lw/mzLs31EdGfdoZrc+/Rts7Lo++UohZRKWfAhbJqIkUG5idLm1IMpK9EaihRwX7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+myC+VEV8rHalxP1qWu/vYs2gHMiCZizJ9aoadD5Fj+EBpbHb
	3j6MKEz3ur8Z9d6uQJvfx/z4n7oGKJzNRIFnMR49/YUCdsxoTPX1KBTangdbPxMfSaNtVSyXoFR
	XlZjf/JsLTPKk0ybP4a5c+Y3vNQm3rawjFGTZ3ezU+Rm7AyGlXAcyC8ry0nqia7CzIoNje/9azo
	9ArQ==
X-Gm-Gg: ASbGncsCci+xY99RURQA6EjRNZ0TQyfS2fXfc9mMnAhBvUfyPDvElQlH26QbnoEmwsH
	v3Hkc81aOhrlTEWzoCkinPZMxcNs7zQ3CkLdsSuXb+ByWC51LlutBrLR1iR72JkSOWY3iEW0ew3
	VXVL3eWmuZ+fQabB8F8nDfH5AxxSB1J+XtjAQHjg/NV0tKpq50+RQaYOCXHKtpDp/TdRWmobiyl
	8oTFQyxmdAsC5QMeNz5uHiR5CsTSY+AWfIlxj+6orbc/dJObiAtY5Vu2ptuUPvhl+lQta7Z1FTK
	JgTiWsQjESEuygnLPKTa3LAMEYzU2RMhCtBPVCzzlZAB8q2smP/QHSxpvGhwQ5ngeIN3xQOjToM
	9LKBceJ5Eyel+Q2AikwDpygLzuwb16V5K6XThXYBsL7SsH/PZyni9
X-Received: by 2002:a05:6214:27c2:b0:70d:843f:6b8c with SMTP id 6a1803df08f44-70d971e4c73mr254210396d6.37.1756385785154;
        Thu, 28 Aug 2025 05:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERQ3f0eiZP6GMEYC5Py0gqB9whnbXB6IFHUtmBsYwWEJ7LR2k+sbTMwXECFTAuvR2F5ILzjw==
X-Received: by 2002:a05:6214:27c2:b0:70d:843f:6b8c with SMTP id 6a1803df08f44-70d971e4c73mr254209926d6.37.1756385784519;
        Thu, 28 Aug 2025 05:56:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bc94sm3337416e87.84.2025.08.28.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:56:23 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:56:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andyshrk@163.com>,
        heiko@sntech.de, hjc@rock-chips.com, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Message-ID: <n3scvjsx2aec2ijnr5wwevkmhtegkts5nb43yti7dkjujqaezq@shbcy7ftibzo>
References: <20250822063959.692098-1-andyshrk@163.com>
 <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
 <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
 <20250828-tangible-wakeful-coati-ec27d1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-tangible-wakeful-coati-ec27d1@houat>
X-Proofpoint-GUID: psJJB1dt9QfKH1bkL7Teql2meQhnU9X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX3MwsZ/plDSRI
 a8DGZDBB917j5QSpu01jLjVBPFpaR/JIX+83NhUxDk54qUqdJrQ/ym+/IFZIhfuns0H5aaCXk79
 3CP4agmIjYxKFesvLxBDm/9j/zQYejC5xn+CVlz4U/eWKBkAN4GGfcpAqd10vHjQxZNSpPw5D1O
 XxU4SzQNuNTJ4f4kLwi1WxJz82XaY9QazDAnTHSS1kwaaessgQuri6tbpjaAVej+7xlggCDLaxb
 ddbJoSY1MQeiKMMVKtxIDh9BBGygGUGCy1yVgrdTxGQTMr9Z9wUUgMXL4OrJS474mWmRdOWKy+2
 XWc/jWAL0NQ8+VTIre2m+pH7boHWkkypPAeLTlXMDGuY4pOOFJnUDVS/eA+++H2cWqfsYS55xhZ
 fnfCXvAH
X-Proofpoint-ORIG-GUID: psJJB1dt9QfKH1bkL7Teql2meQhnU9X8
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b051fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=tUpP_D99XMz3yPDlsHkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_055627_248327_7C304340 
X-CRM114-Status: GOOD (  40.02  )
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

On Thu, Aug 28, 2025 at 10:05:28AM +0200, Maxime Ripard wrote:
> On Thu, Aug 28, 2025 at 09:50:34AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 28.08.25 um 00:24 schrieb Dmitry Baryshkov:
> > > On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
> > > > From: Andy Yan <andy.yan@rock-chips.com>
> > > > 
> > > > 
> > > > There are two DW DPTX based DisplayPort Controller on rk3588 which
> > > > are compliant with the DisplayPort Specification Version 1.4 with
> > > > the following features:
> > > > 
> > > > * DisplayPort 1.4a
> > > > * Main Link: 1/2/4 lanes
> > > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > > * AUX channel 1Mbps
> > > > * Single Stream Transport(SST)
> > > > * Multistream Transport (MST)
> > > > * Type-C support (alternate mode)
> > > > * HDCP 2.2, HDCP 1.3
> > > > * Supports up to 8/10 bits per color component
> > > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > > * Pixel clock up to 594MHz
> > > > * I2S, SPDIF audio interface
> > > > 
> > > > The current version of this patch series only supports basic display outputs.
> > > > I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
> > > > mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.
> > > > HDCP and audio features remain unimplemented.
> > > > For RK3588, it's only support SST, while in the upcoming RK3576, it can support
> > > > MST output.
> > > > 
> > > [skipped changelog]
> > > 
> > > > Andy Yan (10):
> > > >    dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
> > > >    drm/bridge: synopsys: Add DW DPTX Controller support library
> > > >    drm/rockchip: Add RK3588 DPTX output support
> > > >    MAINTAINERS: Add entry for DW DPTX Controller bridge
> > > I tried pushing patches 1-4, but got the following error:
> > > 
> > > dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Controller bridge"): Mandatory Maintainer Acked-by missing., aborting
> > > 
> > > I'm not sure how to handle MAINTAINERS changes (or whether it's fine for
> > > me or not), so I will probably push patches 1-3 in a few days, if nobody
> > > beats me (or unless somebody points out a correct process for
> > > MAINTAINERS changes).
> > 
> > That warning has been added recently to make sure that patches do not get in
> > without sufficient review. It's overly pedantic, though.
> 
> It's not "overly pedantic", it follows the contribution rules. I'd argue
> that, if anything, we've been overly tolerant with that kind of
> practices.
> 
> We do have a bug with handling MAINTAINERS changes at the moment. But
> everything else shouldn't be ignored: either patch MAINTAINERS to
> reflect the actual contribution path, or get the maintainers Ack.

For me that points out that MAINTAINERS changes should be integrated
into the corresponding driver patch rather than being a separate patch.

> 
> > If you're confident that you have R-bs from enough relevant people,
> > push the patches with 'dim -f' to ignore the warning.
> 
> And let's not just advise that either.

-- 
With best wishes
Dmitry

