Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9181D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=euWFU1Ne;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zg3PiU9q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfXSu+//
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=euWFU1Nez/JRZF
	u+5hgJvAgRIW5i9L3tWWVjq2q0d320Pmfu1YAP6scNqxKwS4ZAHuTBns9SLMmCBxweGhvyAc/7rfF
	HmOcA5MFJ/jV+KHpGj6EcG92sjdi1WXIWQwGMYYd83QdF4FPiFmNdSyvp/mqp8mcsd+oeydHmX7sL
	mV+RhUcgBLiugRIinCsRi6ZOzB3OyyhuiTtYR4xYtPALCpdnjXIoFk0o5wl3yNPooP5zLiD+98+fE
	R9pDGpxoQ1cLq8H4v/xUOI5UcS4hWEfEPs4LRHRj2EiTVcjrdbjOPS5pGIuWbdiD9ag8eDihhPUSx
	HHSi4iG/ZJ0HsLzLrCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVO-0000000GOuo-0RsK;
	Fri, 23 Oct 2026 13:40:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVK-0000000GOrO-0X2n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAHY71597391
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=Zg3PiU9qK0tppPun
	NsspjomwNbA7Q3M2FEW8bViXiyhEwTBhewpJU1QOtdz/9Vq6N/xGDk179SBHhGYd
	z2b7OXKyxKFr9eY6lud2eagqwV7Pyq0x8dsik6CzOszsefGpWji4GLyWZgKJRJV+
	KisIhC+SwX63a/RXDx8Y2wdc06OSUXRopsrK5KdjEjtMBXIcojsdDwayUhphPCj1
	7Rp/YEUHPVgMXRxH/HoXb/RnRewYY31lJnnoUm7N6C2n3evmS+7VZ+K0BORCjalS
	VLG+hirHdGSM7O56TQcyyk7zdj6WSM0NLNPJ0qkux8AYn6kGpQZVVS+ZNvyJPext
	rUYD4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so195112085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762816; x=1793367616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=NfXSu+//+m2LH/6oWtfuVLKkCD/Ufz7SFZZqO+lIxyqDD4XnHGpDkraV3QX9koTxES
         qVWt0F7txQNAYDGz9neh7COYLYYG3JgEaQ7ExCVCqK/GElYoEZMhivGhrWQHyQZb621g
         0Ra4ok/cXb8bj4qIZz4XezxPOyB72yraTy3TIvQqWlXfCnBav/xakq8QZOFtqAoYS1WS
         k4V9oXHDEoH37cvAwBNn+vO2LYc1rdhXBbLPD263nfP+iqKwtpCA4KtH0pRfP9mHum/K
         8Ju2eTRJdq1rxvbKI7zFsCAnyaZ/lIBdeI6k9FF55byvCxbudw2Vq46bVPKiby5+Iuvo
         KTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762816; x=1793367616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=1zMSHx3SKQ4S5ZL/Hs6F0RDg11SEpwYULm1PciXtQsVaenwPszN6uscSpup+wyrl8/
         DUtprOlEkzp+CqcU/IzCNmSq8FA/8W/ETCfhBE6T9juYIvW3aMc0lXm7YwY4xgwIdfDX
         lhWIyuNDXWJeoYVdB1hKuUauejAb/5HeF7KSnhKhwtxiHly/nScIbC1loXBdtcpU6aEf
         L3vFUage2/iFQdUseX/jLA+K5XBFLww20QiM4ZnQdo0dufKfgQTmm8hTZ4/MPRPZVaTv
         9IyPi+mn4OCGajD+mvRuwTvpdWL6Ee1FZuCAOTMk/IE0RqGfCmd2A0t5ZExxDEbe3Rmj
         K5mw==
X-Forwarded-Encrypted: i=1; AKwUvByX96lJYjUWVCPtrh/z6FmYz1oQj06qaMx0ce7sOS2f8LJIF1ZIPrqEB7UoKZzw6U7AHSL9JkXrlzUzgkz93oDN@lists.infradead.org
X-Gm-Message-State: AFq9FYJps/sN6Rg8xcsQMVGn9tLwybOLzyMVpEZ9qbFkICC1lxSF9EUp
	N4M/2qk8i1BCFibZ4P+lb7DDmNWmgILPw4kpr06G84Ff7aGKObCGU0fB3KTMmcrYKqq3rJ7mGcC
	5YDPRGpoZvC1WdsfV8aFFNFzU7RBAmDSx+Q1UWSvwN+voGMfP0PGhdYWOTrt4rp3TYblleH95mi
	RIrw==
X-Gm-Gg: AYBFou1k9LOZmIuB86BqICAJbt69ta86JrCaGGle3OFi0x5r2dXJBLOw4xMRivWpOvh
	TZjNNo4RlF35P0mJxiwfEUFV4qbYYeYsHi6ae/pJBTwWj7BRkzob+TMgjWGEUsjJ/rWI5GpLgUa
	UrF2MeV7l6ZBJbDOrXue47kRRRtD6250lJcDQ1H7kLsV3ac0V7Hbn8R6Bx1YY0FNz4Evlryxw61
	VGUMpB0wMMRrewU8ZPNrj1CbCv8HPl37GMK1pgKsTa1rkdVWoDAL3qYcHMZoXvQj0JoYjjNeOah
	zI0o9G9tJku21T396Eud5zBs0VPEO4so/owz6V5mnD0n/o5a57VxQAl/q+6ZPTMqydgiv+QPExa
	PcYe0SWiTdR0JtOa5UcKa0J4Jiv2yjqEMROiEYC4yg5X3z3MCg4uHiwCvl8goA3G6kyuxRGk1hx
	FtH+bjuVhFLpqt
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f6f8151d0mr410841585a.45.1792762816436;
        Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f6f8151d0mr410834785a.45.1792762815720;
        Fri, 23 Oct 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:42 +0300
Subject: [PATCH v7 2/9] drm/connector: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-2-57a3aea3f09e@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Om//UNyL0fPhmHrD6nuKbi2vX3GDx0s1bTr
 hXsC6vJjfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpgAKCRCLPIo+Aiko
 1ZdYCACfUyt4MtbHR6/ige4IwYp4trmZXbGoAwMtHMMD/UUH5j+5B7lEYrOMjoRsyPM/XHGlOKd
 KrJ66djgMsBcMB7IPANZGY3FqaAwnvTYLklmj7WnOPSgu3roa0DyVJDTf9hG0yTfv5GKiDbQ8Pl
 KmhArrUvjAOC6NlZmE37M1IGxwF02butanpr3L5qsTjcuO3s71a6a/npS6k80fLUVrGMEYea2QV
 NWGFdXw/NUM92MRh8HK3KyD860qCSA+GJ+WtCnFR6Hy2D4nls1AdzWrq+d9Ww6UPkZMgFO7FyA3
 3SVzSOu0HVBdTqlWc59ycZoxM9LHd/p4JO2Ovjobd6LGAZ3h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX40jzDzE+8Qun
 hplYkQFZ+3PFFrYeMLHT+kICK4MPf1bizSWjgqFJ/PlAwKNw+Ad4S9i9TYHtNI50T3tfkelHOg4
 pCSObE2M4uY9/QlV83uVveEwvOwIlY5S/ggGAeXouxf4vQJJntWz5CQ4j5g62UQ4dGLZ61yL/M7
 EWqt88/KOkdnyJBCChRsc5vnp45aErmkmjeN9AvEKrxX4P5apWWttxey5W+7XIaePU7HPFeZoYx
 BfXG9CigmY3rNgEdLnvyhc7KXi9J/1n9d5N/Y9CzTAl/AYPxVdG2YKeil2WxuPIs5LGM5oP2NxH
 4KAjt0Qlg//5RPMz0wOQcCXvOCPKeYLzjx907r/Z4ew0L0L3ew5kkc6rdOMtK1S96iYy65K2afT
 JH/P98rlR0qbfHXG4RrewMktnLmgUwN96qV5XG29ycUe5lC8WwJjzpxR4lMjs9/JsVVWE/AJqTi
 w3eo2MAm9RsRL/dWe7Q==
X-Proofpoint-GUID: xU6g0gVvGjBS_pCF8QBbmFo_S0WUiB6W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX+qtZDWhqJybW
 UXfjrqg8Z+5NO4p7Xo08EwKrYgdOyQQn9D7PQixrH+so+oR8O7YslKkVxKQkq4Apw8NgzUFCYpm
 PB9NkSMURkjy/4jAzzYcIDT/p4YsjLM=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xU6g0gVvGjBS_pCF8QBbmFo_S0WUiB6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064018_178400_9DDE864A 
X-CRM114-Status: GOOD (  18.09  )
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

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


