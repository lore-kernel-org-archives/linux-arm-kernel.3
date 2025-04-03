Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB17C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLykAhXWunHI8kSEy4WPYTUfhVytF9OGgggs8oTBDs0=; b=1rpE3agQp3Yf07vIWzsHXNLAS6
	/UeOH/ncdOfWTdWveESUcL0HGvv1JTEC1DhmG1wyPiL+CAA7fRjXFd70jebvG1apLOCoOhW28bDHP
	rlIuT2M6giOZR6IfKa6AsQWlLRj8T+dp04S7TsHjXG7rwI51SEk7c1XxKcMWzNX+0SR4bcyqwKzT+
	BDh7bGyHzve/yUmTVS7jjkBpqgPMk2nlrLonW5981JqiPwNT4UdFn9eU5tiQMtTycQIn/sjWtIG/Q
	Hm7/TqUeIVSGxAfxZ4HP9FNKpQsg6Ib0GM1XPaQ+S1Qfq389UoVoEL2F9oYKAlWnNDxh2kikKe4K/
	dhnLKOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JUZ-00000008nju-3mmb;
	Thu, 03 Apr 2025 12:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JSm-00000008nSv-1aam
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Apr 2025 12:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dLykAhXWunHI8kSEy4WPYTUfhVytF9OGgggs8oTBDs0=; b=WU0BZ+owMvD/9stQte28HbIsfg
	VGN6x2AZXzGkogoQ0uj0cI+4xFurdLRMaemLIA69h35LUaTSPEevEIH5a8uaVTLdAqPx26+53en7/
	teC29zsohSl9n3qKGgz8S77V6ICIZaWD4IM/aRNVEFMeW+XHwJ14hbIUq5krvTrm4dcZruvb5zA7a
	GCaQA9Z/ROEuATA/vafwXZMh1glKwHEigZ2Ch39T2GyYS/qU17lazl8yT9GVlri2nzj+zqhcrovvU
	uBFoxyE+Jeo0IEs+jCTxcjgXfzpM87+DHGQQyGqF6d+7jCjUb+scIfVw7SK7Ir5FGy6Qjqpd+4tWw
	acaRddcQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JSi-00000007BOm-4B9z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:14:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339ruh1021440
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dLykAhXWunHI8kSEy4WPYTUf
	hVytF9OGgggs8oTBDs0=; b=Fv64jfy4d7VRv6OsrA0sxh9Ku25e6unlukHU6c8p
	8wQRIVptsYgJVqd4mxFejsLZQnguSeTRwvPFTYtvOfNMLE8+o1xkA8yzM1wwWX17
	prCeJ45gxLCpz281i9Zx8jhwFPi45eQrnO2je3DMhgdPaFhJj5GlTsQvAnErxwUu
	1XWG+1JkZ2GKOrbDR95XS8ecyAmk8rLhItrK0frTlP/J7nsK8ooiW1ihsf1wW26f
	+K/8K+vwERjvObuiVkQqAmMG29cif/nhfrpSqm9hcHZbBpBEG9ZeGphNmLww1rkW
	/NFr51LzS1VWyJDoBuHowhLSC6T20TBssRh5KzZ0aLcizg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sbxy21pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 12:14:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ba3b91b1so169275085a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682458; x=1744287258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLykAhXWunHI8kSEy4WPYTUfhVytF9OGgggs8oTBDs0=;
        b=kkujDe2sn6ai1/nIg4ridIORgpUwiPoDbaI1VxkqfSKEOIOrLKpo2M9ndc8xU4jqpv
         UXaQhq80sDokLCy++jeM1IFi1DG5TMRSiF7W+tLvqux/r4dMHnSZGxD2LM7fjLRB3nKu
         iaBkdGrIPCxEQ09ow6UJvj0rlMHcaJzY9lsh1x3dJ8wtI1G0no90fT3kIVP6WQBVdfnW
         1iD5HqJ+9ixjWJiO/EUUF0sfGuV+P8iIVO3CjpRzRDADaelZZ4CZ7E5vm8DB362f9COY
         LRAiU02tOs8VE9d7vGrpXRryAxGDZhI0ToAM9Q48UdabZV/KENTHcn54ZCiJBzngwJy2
         SWxA==
X-Forwarded-Encrypted: i=1; AJvYcCXDfdvL8OS2wz1piBi5h8e4ID7W5U+zKPHREyChUO41BFIktp/R6+sqmaufdD6akxa+y7+q9FMiZ3eLVLAgu8/n@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4HZQ2Hwzbjp9NXveBXcEWK3V5b+9PWiHEuIqfLfc0PQJVTmmG
	Vwo5st0oEUMhVJUIO+vjRAODymIG+OkxbfBRokqwrNk58dkTM3T64MWvyR46rzgUb9SgZICxLMm
	Jh5KKt/Pc9R4VrKhQg1v8qqskSX8KP+tmnLE7acrobKLi98e6+MmObn1frnqxjj+0izQg1SmTfw
	==
X-Gm-Gg: ASbGncsCjv4i/hycy9WwBUDL5Dj7TqpOCloMlZzozsN0hx94N1zcrRKIjzPqqbAg4pr
	S9j2TfZl7XEYXa7wha9nXhwI6DiYKN2+sf9h7QSgfHl2J+eCeI7zbwUBHJ+eZ5FIO3VubvIuk6p
	4SW0GW9dhDKckHOy85VazVAKmD0Xt265nGsAWjL0i5d3LhrZ7Wn/arZzmA1swPY76iXEqwZ5UwH
	DPQx2FSNUqL6vbIJJR7KDzlwf/g3tx0FqS0CS82fMYr8gVUlAyiaFXzVjEfn0n9D7PXnSmaMlEF
	v6y10hYieuVpJXGxxEy6/cmEyNwMAeF/5aBI1mMLo7WdQhFRi6/54P/xhr4oOpZ675V/Tv5zrUQ
	kpXo=
X-Received: by 2002:a05:620a:2910:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c76c98f7dbmr511677885a.15.1743682457786;
        Thu, 03 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQP5HNZ7qkcK4qHlBcQj9o3SAvJ8aXKNFHMdgvICYbDg+OhKlKPefSoRKfg6pRpmiRTZ1ysw==
X-Received: by 2002:a05:620a:2910:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c76c98f7dbmr511673185a.15.1743682457414;
        Thu, 03 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5cc52csm138973e87.105.2025.04.03.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:14:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:14:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 5/9] drm/birdge: simple-bridge: Add support for radxa
 ra620
Message-ID: <mp6dgybevy5uercnqam3ok4rorpmo7a7ok5jcgadmxypl7ueaf@yl64do47jnp3>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-6-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-6-andyshrk@163.com>
X-Proofpoint-GUID: BenfIpeJp2RB7r-JOmrSutq2GJe9oDP3
X-Proofpoint-ORIG-GUID: BenfIpeJp2RB7r-JOmrSutq2GJe9oDP3
X-Authority-Analysis: v=2.4 cv=PNAP+eqC c=1 sm=1 tr=0 ts=67ee7b9b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=mpY5dVvo0S6m34Ll3HoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=971 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_131425_438807_7563AE89 
X-CRM114-Status: GOOD (  18.22  )
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

On Thu, Apr 03, 2025 at 11:37:33AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RA620 is an active DP to HDMI converter chip, basically
> no software is involved to drive it.
> 
> Add it to simple bridge to make it can be find by the drm bridge chain.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First introduced in this version.
> 
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

