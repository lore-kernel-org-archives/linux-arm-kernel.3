Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lAEKLA4H;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kd4olU1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=; b=lAEKLA4H18jztuftQ0YY/k9mmq
	qAPpiPHfVbDmhHcz70Rowy1gd8z8uQ+BqQfH/U4UscrbFtN9myTZSY0pX5CP6U7QEjRK4cfzxVL/F
	hpSrYPl+N152O4KRM7jamkzwU+OZp4HDpMxMkNb/eELxy3ZKtl3pUV241COKdBji0sADe8llAFbuJ
	PbYDoSfxPTwpCFvq+qW3qmRgOQN22sLC3M2o7z9Ez8dxaKMGkqzoIxumTZ2jvLKhv9iONfdvp+c9i
	xo3koZzoKRv0XKZaj6Mc/ZdYIrXkoeg/JajcuQ071g+KLjWGwMh4Pw0OdTHqOqnvPxtyWplyKnABa
	2Q1o82Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxcW-000000099dR-14Xi;
	Thu, 05 Nov 2026 13:35:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxcT-000000099cH-3I0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:35:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tKUN4084474
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
	7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
	Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
	TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
	E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
	HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
	aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkrvw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so344275085a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=Kd4olU1hKDi8pfANBH91POsv/q7lYn/HXWg5t16VhVJWfouOcQFYMtXF1H0yfkLiXJ
         Vn9kLZDXeAzXbNuTm4GLCW50NNQFX7F4V8oubnBu+cGu4RFoDdqryOGfikAfO8UDKiBh
         c3bbHwOi5YlHXDrFfNtiZFHkPuxHGlcGirOQ044s52+wlC/EgbeaHsI069LJpq9GcdbQ
         Tp2X6noC4NsFd7oGoKMDw6PCRV3cbIMZJVgRocmHGCWTdijQH0bqjl9zUix3Fvjj/b3C
         0JBKsZcWp9ZQGL+BgOOsIYeNTF5alPtvbtcyhrW6CRQlppSxJCEIfrLjaTvhQHe0qeB0
         bxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885708; x=1794490508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=NJZrfIR/Hgzq1Q/7oQ0E8R1Y/MaFRMDXfd7I92ayBb6h8VV3gKTN/GY5DjJYL9K97S
         2BwVAQUZjLTRxNfeguwGjUp/GcCoVlLe7m/QoyoKht8g8vHUcqr9mcRNLocXaxLlV5PC
         baoG83Xqqj4IQgDjljcItEEDb/DrhWT/MPzGpgHpN4rJP6Co0USB81MKNe67uc4k511d
         +ID2eoW5bLSvBCJdDPwnM7Zs+PNqiUMJalKRvaRHrr6HVQIzwQIlomIwFlKjNq/l4qKt
         t/X6zc6ZmQBtNRqNtYfT/Z6aajelCxLbuJS1PZGGSUpPwvfe39oqm4RhW10k3kHE0UC1
         E1eg==
X-Forwarded-Encrypted: i=1; AKwUvBzyGQXWFtXfyiFbAre+Xcb+q82zjFY/7lqBR/p9Srfd0nT2cMGl1KAeWJv8b+W2ztGQRYzUX9k06jbO54nh2pMx@lists.infradead.org
X-Gm-Message-State: APuU4Z/+jlMbZIZc0c4cpD+aJoulD9P6VP0xn6GYUl+zyZCCab9qrN0A
	kCPqZHs1CDp1Z/JRFk3Au/v3gVo/M4YIYruzxYK1fDEw4lApau8alqzoGQWRguFfEVuBYf4NkLg
	k+9JnAiNrv3tocltWFGGQEvQBhvOgrzQ2+KNP5uh7i5nbiGU4nkuQQB0IPNOuq1G0pDReos3KUk
	CFgg==
X-Gm-Gg: AYBFou06Xk9rWa+cKfs/qvZWWHuI5LFOLwzYyw+ID6YGpehBgCc558BGkjPYh43h3hh
	4a2iWIQIgp6ujnq8lerX9BOFegF1MLOR8jA6mE47o8HkPHvuCOaIJ4y2os+3PepzFm2C4Fx5O/i
	Lph0uwu4QGm/G5mI+dqZMmZmt/oaKpcNimLZl9VdbeKnhDcA1nmMOALUCgUb1hgqcs/cy0i3WSw
	jBK/9OJDKEi8rliMqZn4ThsZ51v/Mp8B0BhfP7MMhXnGXmsacfxWJH08nZLkTCAfdRoYFdB30IA
	UY1ymv8UFUup0/Tva9DYRofnF2x+3yHhoFdLTr10/3uAaSRXd4qxpT+3h7EVHHpvpavPjHGa9cK
	3a5fu8qJ2aqiAdb0hmFeI6RWbbRRI/HXo8fMVuufGb2yfZIIQbl/ow7KWJWAooUY6VbB7Ag8q/r
	ICJWxukmzmwXchYCrxDQfmA+TcT2iP6/eFA/TIfqFX9DgQDOOSRD/s4WLKE6LO
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578452085a.20.1793885707707;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX81Of2ACp5bql
 yK/bFo/6Yz6hgdfNyJDvxpnIA+Olk1q09FGS/0RVdo8J1v/2C6ePOQf4c9UktIVXa+msoM3SmjP
 Ra2XUHK2g48+jOMvPxsERiBlmD6C9xykFIqiDP9IMC2ou76zh2Q9KpwgHGpZeZlGDDmHvna4eBm
 bTFnONVz+e/Rbg29l22PNTnLIbv4YkerT0fFpAEWLAiD9lx2D4eWPQEvRrB55889s18mps7k3o6
 dquRdKDE66NsRb8Cf/ydF0IsLW/fDRo8FZEJov1otvu5RPTR6Cy00eSi0Ev/I+dMncpsbTkviwP
 DSz2Vr3npsWZSlGHaxjsllS69o5maUjPzBQOs+ZW9anPXVZtlRB5iYzK5NKexeX856SlJ2C8N+B
 0pmmpVWt3mzLKsXj8H3vOGfn5YMUyYTV33Gs50VDZnnxWqGZg0192R++g75yBItCeL/NWHNDPMw
 Z6EBV1m4sUK84qst/nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX4sz3/uq0l4qY
 65LdK/QohZCb3ynwyq8RsfGm+Xv7iqMhLrIueWLNxZiE6KM24GloXhFIVm0W2CboGnxoQ/qrQ4w
 zCQr1YWnqNRG/cbz8panUdrobTKGarI=
X-Proofpoint-ORIG-GUID: 7EVf17bU--88SeqZHfth2uuVfegG7FZq
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec860c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 7EVf17bU--88SeqZHfth2uuVfegG7FZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053509_830559_5FF7A71F 
X-CRM114-Status: GOOD (  21.36  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry

