Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A50606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v3yRzdIT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZV9+gwmO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1TaOtLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=v3yRzdIT/W3qIn
	5rGd5z3QGNd/laiP7xpmCTCJNlVtQVGRa1wta+P2t7kHBq+43h1X11V7zRXnhcRKnYxcN7sUk3fBi
	+TmEtFLZ1evWtnFVpghyVG2qzIcEtFSYUvScjGg6yfK/NnLYwlxgU2LhF7iX1Iy1tti8VOuDhDSNV
	kOpIQNNbaCSr1qu7lc8z8Mj4jTn7o0dlepNY2j7VVMJ4JLf5zKYTPIdklPkr2Ww5UG4piMWd0CQK6
	pQiXLGCQV/Bf4pFkxcFxWQczYDyyKHIOBJWcUmDAzFDbdQGGixdvwm0K6LcPcLZ8K8Sl6e6l6a9hO
	AzYLtF8c7xlpyOR3ytqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWK-0000000GPbO-1x7w;
	Fri, 23 Oct 2026 13:41:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVl-0000000GPGF-1ELb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=ZV9+gwmOV12f47P1Yg9Ik5+mlV
	QdO2yuUmVUonw9eaeprme/F7rOUA5ERAD1S7aerpw3sI0lDDlHrn1bHcrrzWWpy+1euh5jG44BIbQ
	n95s4sRsY4IN3EE1Mp/04G531bGLs5z4ztzugxDh1pcNNv96d2FBiWih5ZuwAEbWHz3URtKJMSX9p
	DLYc9r7P5PehoAQEjlzfxED3+sf+pFRFRUXqqR757V0NLy7rLkvMcv5/KrXurxAEU8GfvlTkt5nRw
	GC8thjQ8sPuhNziI/eRMF7iZBwWowy76pDqM5kU3gWi2GANqz2MLfvHqGLX4pYM0B2ykMmJyZItv+
	mVG/Yheg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVa-00000009j32-3o5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZIk2509093
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=poibAIZjMsIdwMDV
	XD0Nb6ZGIrSar5g+ftoe7oeKR4r/ureliRS+fwtmnawiJ124haBPlC8VnHayoU1N
	P+JeiFeN3xPm7y8+gcXnNENnHMJrr/xtUeyzGXMpTmEdMwTQhyr0d2aI3MmuXaAU
	NBtFKojVwK1FFS92X8KqitmvSbY2xcZfHPhMk16BrldUGmALTTXYs6HaPbP0d7en
	bPpD2ylFczswpJvRbbZv8s/LmSdSc+unVFBJbmR8A67mOlzTdIKgzne428Q+mtmJ
	1LAIpPPnbJm1Xq2ZRL0XDKy9G7vIYgbuRsZidUDN0PR4Pij8xI9FnjlwehYDDLcs
	gNs3Tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykban4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so178127985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762832; x=1793367632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=L1TaOtLwKz1MDqpp68CuTgSDA2qUmCd6V/BIHJ9o4P+KoRNhw6yuOytG5QqS9h3HU0
         09FnYMMEcaT/ixuy4Lh8GnWAiwto1nSos1JWSYB40Mr6pW+wy1n0xtuvPudBH/FnEPSW
         taQdHFbpnpva/XlAN12+er2t6DxbHHuR9F6bK4fsRoad06HoTi44kRQowi5jHfIOhUvR
         WzkqaaTZMfRgQpwCBJgr8js/faygsRgYGHSTuetPA85fAI1EZ2BQoljdlCIifLXWzney
         2p6/Tv4J5EDjIPrxlCgRB+jH0QryBudlhwZNP/WvItJwQmjDUgh9CESAqtyy5Lh5aRi0
         8bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762832; x=1793367632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=KZHHNrxzJ2OUZymBmZrTBESjVEQenXW+ayLquOmVPSXkwxof7KYtmq8RKh11xDKxfk
         O8qW1G99DzMbCEqmCBDSw1xzxwAdjWXZRe7TNR5OrCGAanUwiG/Q4Hlpa9furTFmzhxD
         l46k5X9l/4EaaY+4Z46/LLxhtV5gZq5zxS+KFFWMWHe3olVFU4IVtBpWlKHbJpNobFwv
         bv6Rwdt4KAO9WsB55VLxbqw/9btZdY1VvvL6xlGrM9fmmRVJM0t6HBOK8L9TKBg4EVAb
         eGZPYMofeAyFuQXznhGBEBpdMiNJPZy/b+XBzzZZjmZoFhtZxz+n+0ZKKU4e1F2OAzl3
         6d7A==
X-Forwarded-Encrypted: i=1; AKwUvBzcvfspfXDYNNoO0pXUsG/o0r848fr9EJBvP4aJtPrPwz4F2vXF3Iycnmvvf6g4Ohsf4z6znWzS4HCT2CmxNVvU@lists.infradead.org
X-Gm-Message-State: AFq9FYISOgQCs0ah02WX5lHLZJkyuSfueMPEZgY07ntF803QMz2EF2yb
	b1xlUddw7mHVEIkG5JKVn8tohg+jB5Gzg2AZ4p9rtTmfRymD/xE5unqlNTh/VzfxYmzEwUgj8bJ
	Ho8mB6ABwjnTt0q7LsAFRBdrNXT+A1AuNLps/ZH55T3ag/KptagoXSJzk1vOuHdYvak6ndSWfCD
	Z1VQ==
X-Gm-Gg: AYBFou172xUs7e0GFeSg9cqvZqrTYFKj1Tf6Ta2xyXVfH/qvxdnGcqoyK6/6vhbJaor
	om9i/FvdR4F1UFDURm0tO6nZkIN1aunNN4XJt4iDjKIkO1r06YkwTYrinqCLzHppZ+61fEBnjbd
	jrynTvNdzzuSzXWR6PQpI9+mKVNstbWxUDJSF5Hx+hBeG2h/USZmoM69LG9hP9IT9M8Oi6iqyof
	54c3B5vDyBLB7SHo7ehAUx62bGvFvL5VNF0IszBkOcvy9tJY/brQu0DUU29GHjkP2urbQ0A/Xjn
	pOZZnJ/ohrehgd2Fnz+zhsWpjTlBSpJBHBz2ThSxVGcjFoE4dUw0/8StimkfK0kQOofeXBJCJmn
	8b1wtRwv9SEpHNSzrIPy6G8C/cllxSHOBX2weWkuH/UWCIaPXEJaNkqMkaqevGGdecfZA+AoUWP
	HG6hSqQpVJST8H
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426446085a.35.1792762831959;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426438285a.35.1792762831367;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:48 +0300
Subject: [PATCH v7 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OscK9ARrM0xnQy9PIe02PuQJWITjFRTOxcw
 EIXvBeXIeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrAAKCRCLPIo+Aiko
 1SVnB/9eqhMlFfXEGL7sx5uXnIsBFG4ztodN0vHA/44YV7W7G1OooLgbsvOvIpeBP0kk5e5Xhco
 j1tEinkSJoggU0cxwS2Xc9lfcqEmcMxaUo+LdMPd6j4UyQPiOiKsO5lJfHqCDXACMtfwP3c5K77
 YVat0zINwIdZaWq981pjrXiShkMmW7ZQGmd8rt3No0CePmXgOdV+xTS/b79D3wsbb6tiSGUOg/3
 A9g26pbXGiiAGGY1vEM01YKIFcpTtym6NCRX66BMn4aN7mb99cUWHM4OWQDs4doSiyeDmJrMeKF
 MVvCWf8Tx3Bz7WNIMfMzZpHZlXLooV/h/qxj6hCGoxZBslSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXwuQGw2RIXPq/
 rIzTIY+sChHQ8NV3WN0x+15IjW3OCPyJ8Pf+Rer6iLzIE7iHM/q9bgn5LBTwAdH31iLztiPEwbe
 ZWIEnZePMIxbT+CU5i0hsOWZ61VqBGSa4ir1ywlKJNZc8k2TnkZsIcoEkBxNJxobW4CiRm1arwB
 +1oXcxCRw78Z6P+yGnCJjAZ2e92K6lZoFVzygiB1C5d+TnGcX0mtNd0U3DfFApQqwictlrxn6Ox
 6gGPBI+SEG1mqEXJJHtB5wIBzdd07E3Fu4FrghtmG6cC1zR84hRJOZ9egfNERVnCeehgN+SEVHU
 xfm3mcIrpLKhJfwAxSzFu0BhPTkM0ZdMCdjnQlkmhtsWBvdysCNXgfz81AEU7T7bOGzBShRZCq4
 Qa9rrZJ/jDwNElI+1+ZO2S01TOiaft3GN6pDSa90sijZuJ3GojZjGA+JWBU7A43MXCZuKXqkofH
 Xbqc2rmlKWuWNkGkoFg==
X-Proofpoint-ORIG-GUID: yjjHhU9GUT8DgVjq9VeQI8I2_wM2nxkM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyUR7/MKXYoBk
 dAM8keCmGwqbeHkB3Uk9M/tJHICReZB7s+tBPa5DNDyA/u3j6C7sb2AdwwLEeokzGvQ2neMoC/1
 UUXU2lMqNnzaiH7aKG/ug1QvfRGBpOs=
X-Proofpoint-GUID: yjjHhU9GUT8DgVjq9VeQI8I2_wM2nxkM
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb63d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144035_348446_0BE77934 
X-CRM114-Status: GOOD (  15.48  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


