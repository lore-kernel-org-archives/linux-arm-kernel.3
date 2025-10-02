Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F38CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 05:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdABpfF7OkNfgDykEBK+TNid8dXX225sHpffd9eNLq8=; b=L7Tm0bOdoq42VsmmWNYW3/dGDX
	EkIKsuFpvu3LzhG/z8zOD/rMYd2272TfJGXyGK02kGWxt/sp0bW0g9TOqkVCfAOIOT8sJZk1ARHPo
	7r5krPPzEPy75tyTMSHfda3koWoo65IIYKawtnIOJQCyGxyIo0U/aF0rC5x2q446BB/RtgeRKnY3V
	YyGTEiEuujSA1/m27C2T86QTkNi8+IHcnQvjpEvuDfrjg/4hMpcFsDygNIgdmWGFsyWtXinkPJH/L
	xqx3C6VZ8113RLTypp3KorPMJkgNxTtcyN6v25/y/OE4HJO/hphgMgsXLXB6P6GkDI0HtK/mdubgu
	Mj6R19qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CEd-00000009fYh-1HCY;
	Thu, 02 Oct 2025 05:52:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CEa-00000009fY5-39p4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 05:52:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic4gs012318
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Oct 2025 05:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WdABpfF7OkNfgDykEBK+TNid
	8dXX225sHpffd9eNLq8=; b=WIwqQBCokKCgNxQ3pI5lNTJaNOkRiWOC0T7idosG
	3A8ZMrvk6RGRfkgz9a7z/v4r+H5jnsw8rcvfQH12372nqpQ6xiIWJjUhA7vi0Cfn
	h9vWM8jyIbUJYLuUlpUnMtXWW0ebSXuCeawqSBqNaES8gCIPb/t4sqZgWDS2POYl
	gRLnD04bkekDvgGv/ZbU8W0yDfYg22BJoga+CZ0f8AA8iiAvGAijgbKtPP+UjzEw
	MiMUGWWsH4fNPIvjYwQcyrD+ZAjAam8ZpdAcYOgYbbwbsmWhRy0UHSFbMCuzw8aB
	HbK6H//2ubOI2fS1z7EobRVKS/PoJ9ol/j5Omai3Uhd+Iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80ty0m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:52:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de801c1446so16613391cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 22:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759384326; x=1759989126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdABpfF7OkNfgDykEBK+TNid8dXX225sHpffd9eNLq8=;
        b=B3f9Aiko0WACdQEkzrUm56RNkV3KVGobybiILAAZ7tDvT63WY+Qp8G/djf8VH2+nnF
         6+t+EYqKd2PhBecEs79aYWV2j/loPz/qKgibdMU3qmgT8T3zR4BgsEjR+4Tf7l4Lwc8t
         rghwKyWKc2DWKnza1vFpRYMUMat9lJenCwNNp60woiw65zM9qCz257dKFSklnHbZKACL
         TSNHE+3OQyecnf2UWweiHZk2NsKiJ/gzJfgDJSmerGrLdoywU6KUyNcKhc2BzqYSlhi5
         tmf8I5nGFD06XzRRvdFsyNwLY9EZ/NCR2gMUKHUmiMSoloiGCrXtSIm1TZ1sufyHJBiP
         ORzA==
X-Forwarded-Encrypted: i=1; AJvYcCWWVetUlO1NSs7EgZvuSKuqTBmWF2WXjofHFGfeEUndirleLPRty+Rgfbs+4IPvT4iKoV3zUnL9uwvvroT2GI88@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5uHjfF/xgCw0V5h+MnuEMvpgBOim9MNgIcvLJtNKLD9Lv6j+F
	wZWxSudkCkPBXnOHYU0PBiVCUQADBi+y3hPl8pFd7VBURk4mJeG/BZip1kunL0vmlOwgeTt2OlQ
	G8xVYFDwafrocAogzrWQf+oCfojgGu5bDKKs+5w+mi3fjT0ivoCfK6pyLevPSOYojLwFlUuTxLX
	6kKg==
X-Gm-Gg: ASbGncvN98/Hjuj+q0QKgtBmLdh3QmJy/K0d86eJSD5IM2GXZe6zttZnVTRZZH9H1VT
	+uAifYFwraKGZXqM528NsCwYM7cZFoOSJvuyouTvWtO5TLOeYSO51lKXirQuthFuBJcx8mX84Fo
	Gq8sEg/WyWbaxNVeJq+qXrYXssCMe6mY2nT4I4IUODIgmBd8iSKViBCJpnIybDBLABk9pteuPLd
	lrd713Jt8wzEhSTjFjxe1aCCv530rMCvy1SjBrzrvZ71JKGNVSAUhTV5FvUbQrS9a4MKxxHNIFU
	0VMScnmI4hzIodi4ZyUhySAJYoZIchvMiNkZYkASYzLVhwQFAYKYmjPdy32X0TU0XRHW1wN2k0P
	owngc20eaYSphjdx8Pm3+4d/JfdId7nbx5BaxvWbDWoX6tO+1ojVFfTKfJQ==
X-Received: by 2002:ac8:4750:0:b0:4d8:afdb:1266 with SMTP id d75a77b69052e-4e41e15df2dmr63014291cf.45.1759384325975;
        Wed, 01 Oct 2025 22:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7M3wajxRbMA9ybuJM3HAEueisvDG+vjhfv/Zrn+Q6Om5w1ydX1jy3VPsPX7ig1Lr6pViCDQ==
X-Received: by 2002:ac8:4750:0:b0:4d8:afdb:1266 with SMTP id d75a77b69052e-4e41e15df2dmr63014071cf.45.1759384325457;
        Wed, 01 Oct 2025 22:52:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01194e59sm523439e87.75.2025.10.01.22.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 22:52:04 -0700 (PDT)
Date: Thu, 2 Oct 2025 08:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
        Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v6 01/11] drm/fourcc: Add warning for bad bpp
Message-ID: <vj3budjobsehi3hl2mcmondt2f4giups6cxeiraeo2ensgw3du@smxivopyzfez>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
 <20251001-xilinx-formats-v6-1-014b076b542a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-xilinx-formats-v6-1-014b076b542a@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX8ihxFzh1OR/c
 fCdviSbeL8hVmyVwtoEc2rXFf/97nARrwmbxjGyfa44th2ymEaP9PrLCIdIBpgszptSgPbncCdt
 h21I8iezgoEx9xiIlfDpXpnHXT4P3fT7dd1MShEz4LiJjvpQPK15c+df1YjxQOp8ryjyWyKxZ/X
 ex5A8fwgsqdiGETT+xbmoCP2tUG/PIqDifNPSYiIq8u2vgYTvpkD3t/cVB54h3YtsH93mXU4wwz
 VwN+2gFQu06/5NrSlOhmtr7R7QrQeol7ONdgVBGI/NSWpgLdImsT6svnBbrTuKEocgEu5UWU1vs
 N58+o0Lui/c0WQRSjH3bLQf0SbKR4p5JmlQl5oNpG1LHMIjLF0iuPqevBVuXkmPYjECCwbowO/3
 vBSVL+6LG7JE2stkaoOWhk1RrF2blA==
X-Proofpoint-GUID: 6ujeOdOyeno3_ydtlEmsj_EFD3cIHPNa
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68de1306 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=iDPJBouE--3TGtnIlUQA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: 6ujeOdOyeno3_ydtlEmsj_EFD3cIHPNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_225208_912154_A567BC59 
X-CRM114-Status: GOOD (  19.38  )
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

On Wed, Oct 01, 2025 at 04:22:13PM +0300, Tomi Valkeinen wrote:
> drm_format_info_bpp() cannot be used for formats which do not have an
> integer bits-per-pixel in a pixel block.
> 
> E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
> pixels (Y components), and two padding bits, in a 4 byte block. That is
> 10.666... bits per pixel when considering the whole 4 byte block, which
> is what drm_format_info_bpp() does. Thus a driver that supports such
> formats cannot use drm_format_info_bpp(),
> 
> It is a driver bug if this happens, but so handle wrong calls by
> printing a warning and returning 0.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

