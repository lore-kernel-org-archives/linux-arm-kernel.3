Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91946606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2aUqABw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GNnzbcI6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofnf6ZU/;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8PYbXJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=; b=U2aUqABwEP5Dfv
	OQ3CtMXeALwlvYBENoYAoDY0j6NPVxwkPvnIVHPHC18SVSG/Q29TySOOWr/Ftr1Auafj3oySFno9S
	MTMUnar2Ad+IdifRE+U1Bzxern2JTxu638mk3EQvj3A/W6Odg3zKba5Tdv+9LcdQ5xntL1cV/2rBu
	8nIReTYE2/PMb7qe/mzKfMliQegHTnrZ/kR+SNY5Cwe2El13REfJvkxkhlAD8ON3Js73wq4dzFly3
	f+Xwdz6D629GgcO19kW7WmijKyd49NbUpIni00flBS40SSaT/P5lIe6P0wV9hWVCWB1SJygxWGo3g
	DaNBOXatCFNpf7aryKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqe-0000000EBlB-27nt;
	Thu, 22 Oct 2026 13:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqR-0000000EBUX-3nyz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=; b=GNnzbcI6HBys5hkKmI4JZSZNOF
	6C2cZua55g09SUA1RftzOsyMusD4oklgSLfupADbBhtfuW6p0A6+Kar07AsMqhlOxRF8CAY1FoHCX
	WWYYUqd7xE2AUdwfayE7XwPPzFj96zhPqfLkC4UcGCIqMUOyU8xUNvon2zUjDbFTD2i9h+o4c1Nu6
	BZjAv9+0Cek9g3N+xduyEubkl68NlxAfeyFFdX6r59pY23I+YJj/eLqmFcfFjVpoOLV8zy8lV8FwR
	+z06+1ooRirhIH8a4mEHEfHu0Ch9bapq8GEcG6aZoR2xr3ROT78ohKFd6YO41l8Lpg2Fbeak0t9Xj
	9d8W7/Ag==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqM-00000007Bhu-43vj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0BOT2396813
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=; b=ofnf6ZU/q+kO7QhM
	Y4uarySkWnJOT1Mqh3oJNhtOMdkKTrz+Rysgd/jHT0IQewcoEScmN+WIcMumic87
	xv1YbMdjPmXvjfNwjGfPw2WYo5kLyAvSN8/Vt/xa/bqk7Lj41mx9Vg4eEtI4KFxZ
	jsBKnXDzgCMGk8egcNXgwE91XT+GqKGhInf1TTvDyHsHrc46uD14KNIgt98rd0yk
	Sl3u8l3gOIJH8vsM+BbMWaJOljmiYdArFkdNkQfRbf43Zuhm/7N5u6LlX9TGpJAK
	zfmHxDvDrTudHXozSmGX0ekFdX/dczwAXi0nm5GtNY8w17YQiCqHT6446p6Z1xgk
	+SIoog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bur3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso32675766d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675708; x=1793280508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
        b=S8PYbXJulKosSylTS47dtIyVcLbS18TMqqb+gg8O8PH4tSLVhZVlKER1QvDODczmZv
         3K3+p+U9UElzE4JdqHLZGjnJtViA0mv9jmV7dY7g6Uzo2qmG+UPYsJl1pRwBuKEMekj4
         yKqCervgzLSO0gYTuPuXcIS3FQA7YZQC2AzPquXTZMOGMtQJVylfYXUTRYchJZGQ7ADc
         X2cLjo4mBVFjc+0MenAoht2yfZadr3gRFHWTgRsgnLhX9ygFnD3cOyqgP0YgX7v45gv4
         IvMdOvTYw29Kg6wsGw5LGf2ybIEzrwoy/o80UhiuwI6fYNfatlOgA2kWTz/bvwPy+y4G
         tQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675708; x=1793280508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
        b=r2aCxDZ6guuy3hjuu31iIqdpOvsqValJrboM7Ul7WNZP6epxGLU86LEuPUseTckCgZ
         MyYKavOAnzjlJGY6vEoGLPCxZeg779l58LnQs+0S6lwj0DJpEuV7uW3BeJxlgUhRJQjy
         YYwPp2KFHL+IKrtosWl5vGiMHZ/2AedpPXOs0Y+3X7U+6DMcvutioMPzE5o/uWpwaLbj
         j5WI9fxR1C/PqDZc13Zxe3+zCABmt0IgnxTV16sx/ATK7yvmJPK3ntZVbxo/vQWQCUsn
         IkaDfL7W3BGn5PqLErniKgeCggm2GCcYKxeyQfo+dmDQX5DPdS4U35Svykck+hARTbgL
         8aZw==
X-Forwarded-Encrypted: i=1; AKwUvBz74DVHeXv+oWd9JiCscSHBrkoe3an7NlXyggng7zUAmOYeYzO6ksb5ZAmpLVy2Wp/Mk3hrsrOEAZNqAq8YBs5B@lists.infradead.org
X-Gm-Message-State: AFq9FYIbNLHr5mjc6+bmny9kGsfXfh99AYhkhcY33HLqmsSm8Ld3pnR/
	R/65ikxfUdNhSlDNb9ZT5zzM8wztGGpSvuaS/Tg0J3IdlYIuKrtZoVSLzq6WhcpZa+vOnTBJ9Li
	AZEKU05bostwG2dtpiMnALLvZuXSCPWuaEaL2n1T/4OdfO+4shdGd42VxdZVXvVliLJt35Qa+ny
	GWqg==
X-Gm-Gg: AYBFou1UTaAJE8wfKs8P88dwa96NTMoA6MueZU/ieBIdQ2nohAFmC8vqvxpSXa6cbmW
	m7jojAKX/tCgdaGKPPRRAZUv8NljaasuSPyg5Xqdw75cJUf5Jdcal5AFUFBD/30JwJudCW0gHkM
	i/VW5LJvCjT97mCtWp1J3v8F4n9qBKKpKmSkVtQtN2WOt49QvKSH55N7y3/gNDyam8yz7gber3J
	AT05SFerDmLkDRnftR2GAcRb0QHVGScZcudDTAdG/k1R/aIO4YR+6m4DYQJm+bYtfZjxBFbVmAe
	3p7X6hkMEN5xG87yt3P81qd47aMEplOriKmY7KXogYAbFDWTnOIlXmwIsX4AhNGQOOmx8ZujGCE
	lbEzbrda2hxlFjpdZ3w4uyTTypRYvzS8jVUO38TPQPZ9Bgl4Y7amY3708pYhG/sBZ/YgWcE0qKs
	xpe8jU6fl7S8rQ
X-Received: by 2002:a05:620a:470a:b0:93e:7944:b874 with SMTP id af79cd13be357-93f57f7a4ddmr850962985a.33.1792675708266;
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93e:7944:b874 with SMTP id af79cd13be357-93f57f7a4ddmr850923585a.33.1792675703003;
        Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:58 +0300
Subject: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yTxN63iE5sDPxbwfRJoSoPuKPuQmAYz4uarpJlGhNeo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9l4JDgs3YT7fQflKbBludBM/COk1KjL1Nyw
 46WbgfsPRGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZQAKCRCLPIo+Aiko
 1Qx4B/9t2GhDJJTG+ELCwLIBsJRfXXRrdykplLp0v3ucrwWGUnxGvJldg80uKgm/+dha3ocW2yw
 QuCaNpwKhNVZpuIlfZqHWU0hAMkBFVxCme4I4kAh7GVsYrfoT6NhSm3K/MHE6pHwuc3+U/Tn44y
 bw9t+GVAqiVcJHy5dEntyJrwXFcjaqSeXbZckhqOE0UChjsMt5mH1pjH9huvrQ7McXEMnfsgyeh
 cJHIyJ9E0QX4rb+uXdhFUG60Qluqd8k7voEkbUf76YoZ5YYme+jrjVHBHHiB5PkoQPTh5p6RuYf
 4lmnxB2WsHIX13NJrfEf8Z4mdwaLlWvITclM+uzWN1TNa5ZH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mKY9ZHp2G4f6G2yLEWiw8vsODeaqa7Ib
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX11FWZ/zSa3eB
 xBGNrlrCkaAqIwUCR8ADz67ZCTxXMv8CiXwG8nfLz5+IJnFx1wtrC6Uo0Yb5g9RUxFDZZSXB+S5
 /+oSs7tiisirj1imgzKo+5JCM0aFnwc=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada0f7d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mKY9ZHp2G4f6G2yLEWiw8vsODeaqa7Ib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX3uJwc4NZ3mio
 tbfWbOh+U+zzoyk90jfPx5wntoJkmjYo/S9rJgD+bbPXMpD4JGpmPjAqrxd4OZxjgiRgnAXHoyI
 BCykdTxHRivtFZxJriMJcG+WZ4flf04bW8Vuv52TU6WJMFKNkRAug3JHKaFgPxc9nhlqwHyk+iM
 bDe19b4JdNw9MwqVBjupHvWjHMRHNw7+ngpJrAzk9yy8wiVP0gGUVs5Vj/XfcLCk4bXw/X2JbxP
 oq9jfDwvEZOayJx+UKDPclo7CpvfHozHKfjb3bqNS10qyTqlrY0gLRu8s7KXHmGNTHnydnv52mH
 3CWAeWK+HMMXO0naAddXaxc7Qx8YlqG1XzIA6PtrS9CSEGX/nTY00hIxirgr81v/Tn2KU1whoXh
 zIxP4wT9FxLhtrZTjZn1Zoq1XxZBZX9pqbSzd4CpPdQvu3bNbsToXUcuAVHuhN2PFxny2pIQAiC
 TIdOOp8gy7l6NgeTPAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142831_450235_910A2866 
X-CRM114-Status: GOOD (  18.75  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 898273f60cf6..1b0a1a00d8eb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..fa8942922b53 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..72972a6fe989 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..6382ef5f1ea2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3


