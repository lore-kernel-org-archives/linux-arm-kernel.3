Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4AC606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y4iYpzMu;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KxFtGX2t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZZ0BzX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=; b=Y4iYpzMuQQkPRy
	aQuVyytbbyMwPJTRefxlNhe/9PHPH/KuXYdxeg3dWsMTkY9KHo6BxEVD2kVDtnKImPiERt12jSlVj
	px2hAd1r1xKCpL1m/XY607VLhZbKha6NUKXNlL6HZEuj5ER6zEbxFk8eKA/erptgF86CNrJdVIslv
	hZrBRjUbGpTuv+JVuRTj6ZBKV9t3zsFQL7/zmo7WUuQIg6mZnSrLtQ3x+s1Vs1hw0ygmkbarhcM3d
	pr5KZtfemlinwFQU/NEJHBTLieiiH1amz3h2LcmwpwyF7SZkP2hTHvK/S9H2oZVFWvM6ghxIUs6hZ
	XaSNBbJd0kv/bd9sI7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPju-0000000HGBm-1cWa;
	Sat, 24 Oct 2026 00:36:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjp-0000000HG6u-1euU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvJwR2963812
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=; b=KxFtGX2txNqcAgvt
	1G8J7te40dcLokdUz2l4aGylFpgWC6H+zgi4zNq59N58wsOY6ZBDcpa3224WozqE
	pLK3pirOwO+tVyQyu1yIYXj1Moo7i3sXx0guc4Ow0KzKEIKTpF0Z2M7XBVrmKzLD
	EExzQAPK2eYzhnmoK/OKhCO/iGjgiK+b6CyzFWKO4dkViza2euTtjdv7fouja2A1
	DWb35mGdYT0mC1ZzPVG/1cIZdPimAHjKVh/g71NSvLEPOhLde/EheYGTpsaeGM0W
	uoWz0FdUQGfICahavsboKykM6fu5mEAkVvVNcTuLKDL90ncZjEbo9dxzd6xjp2ad
	49UJmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9hq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso364932385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802156; x=1793406956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
        b=ZZZ0BzX5oZPBQ0sFXoPW8fGpyhtbTvTeD11cwifHChW4cEShjZIHlu5E7ZIIFCTRhn
         IYxhaUVClt7U1//RHYQFAcV3L9AXCrkbte3Db+vDYseuxXe0xLVQGTDduhzeYgCMJnze
         4DoI7o2uULQ1viRRT6e3qCRGmbS0/y+vNOb5MpBeAzFr0PbO7EQ6RquSK4KUW0DfTQLv
         bPxtHGWG3/4PiHDnToE+kWBJ+QnKJ8CitqBu5WrWk6zsTkmKU2wL8zYHYhghP0yN8a68
         9DI7UyBU+jD18GDRQvjAPAW02KciLjyWzfndhsp3csZMFGTlFXrYK/O0nREA1xl8h7Mx
         QIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802156; x=1793406956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
        b=sz79o9fURbsyuQxLgjiECwDCnH6kHDfbrZg3AUHF153reHvuLybkIlSAmd5dN/yVc8
         EZHpjgL1IGo/BJEfWiGRxMVaC0ftbRaVnOs9hJ3GF3i6TEUb8+PPzDMYRtppS/G2bwu9
         8Sjwzp58ahAoTGf+XuepDs5w6ROTwmNIhpBe/M/7v+9BO+g5UuqlUNcTY8pLaGX+O5K2
         XP5bTMqoGTjzAqpRk0UmCU546PSwqeeDjM2SXKyuWJyCdkXfnFGHIAkf8Botp0CKRxTP
         2U2QwLhBCgRsGkHUTRvAC+HBzEWptt2/IAS17e+iJ8FnH9BtLQG5Ps0YUGUgCgbxirBq
         nxxA==
X-Forwarded-Encrypted: i=1; AKwUvBwUDL/FH9PskM1isTmCg7I7JHpmF2kubKKiIc6bS8sM1CQUTrULpmL5wzsE+6quNUuClEaOho/OpiIN8svbzVXj@lists.infradead.org
X-Gm-Message-State: AFq9FYLaP2JuPOVhNGLasA8V+r72Y/O5fSvqBVfkY7Gk+5XD37A9iUWr
	AbrDeh9PfRnAZMgLe7v/LwBCTOljL5gUOxT2dkzJMei4i0soJvRQhg7No+Srx/8qrmW5DSaxzym
	tAI9LXu5ywA+qMnnNvQlwoBLhqiLA4kPQ1sPts1GHNKmba0FjzZTtFOoovMmuKgNlk4OWKfz/hV
	+aPw==
X-Gm-Gg: AYBFou0/FOAIKxjLo+9eV8pgmQ0oTdjGyQ3uU1ohgvekoHSUge5/9RTNJTcG9X0ysZL
	01EbwqJ20qXGRHd+PccLftiyPwvEN/wQZTWBYIaPvoQxzhFKkk8kPBmmMPv6yvdAac/OC1Fgfup
	hq9cAPzt2FScqV0WUXIqhQaoohfS2XD2uNHgfwm5448icSmfNhHnpvUhIPicF1ZV5cgEROp8+tG
	UN1PJuUWJRI0Yrcbxt0jLhaZiV3Ni97OQGV4pDJwzd7OJN8gfzcCsclKaKwb9k16Q2exF0Q6u7F
	Td6EBfYas6qBiMZ/EJKbv6uxJYXFwHXHrL7k/AC/3FSCxtsOGfknoc3fCnJgjwcSsTtl4EArMaL
	FIZtcgqGFO6BsjIn5YbkwUDTqSvgc1G+YrnMrigJJa+6q/DYsv3RL9WZbwp+9Juoqqjsk4bKhjd
	CcVUi4hSZFbrk5
X-Received: by 2002:a05:620a:4556:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-940ef9a7ceemr108253585a.64.1792802155581;
        Fri, 23 Oct 2026 17:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-940ef9a7ceemr108248285a.64.1792802155059;
        Fri, 23 Oct 2026 17:35:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:20 +0300
Subject: [PATCH v8 4/9] drm/bridge: pass extra events to the HPD callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7777;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TPnvnv7OKu+5AobeMrUefT0VwzBWz9C4rL+GJ1Fgj3I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1QTA1GoNRKRIDZ+eKJO7nQL4+WziHskbhmB
 ZyxtOGps4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1RDFB/oD6bSL6OUG9X5TkiAe15ip5MWUFVLEw+FNoNsqT6gI5K1bULm5YhBekLTQswcesqmdacw
 JSZMMvtxtyQrzgMNAOIhwtz8DoTe+YkhE6BF0fiMKY79L1KB2/JMkVuTOAEAJ/6v0LC6sxlOyw7
 6Rl9B6ahLnWNtPZA2PAh5kQLWCCLARoqPq1j/8hrD62DumHAR8SY5Ss1FgqUss+HB23YUy96Djz
 T/PmTj67jtzA/fjl+otthz4T+z5uL0xr3SfBmqkkQJaWr99xUgPz62FYXkTZrErw201SB+PmgYH
 oqqdp/YPyocpaWOJxT8n511CTvNFWWskEgoRIQpWWb3njGQ+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXzsv3mLQPPugk
 ZhOxvbvvSJJaGf0xv5wMsOMIXn6zrNUxHapRAYNpj8+7j68H81hF6FscVPWu/8GXdknfvikL6RS
 BdkvSBhD2sqfksclzWnR5beV83l5YbJX4MrS3Yhd470hzymViOTLezFhDHDuKfq+fP5+qZz4fLj
 KBIn8ljPDX39G2MFDidUjcaOWp/wBVu8OHsyXrtgRb/FbxBHIEpKVaEtPPuk9VfgS0DunzV52U+
 xBg52CWk12r3sQm83DFsuRdyalyuFtZ4bSPnULVN5oX30krgeHtysakqhaj5NDAwe623d4Vjatv
 NlR5E3j7xX5OBD0YapEQy9dNfYAvExQy3M/foWWn/+yp8EFR8hS1soWC9aOSngCyYiXuTkB6rS0
 2Zi6zyHUDQm/1HQJe3OGWGN9Lno6VU4Vm46u04wTQIHkZKqDMHELFXtbxDUIsf3nwSIsJYIfi+m
 Jk+FxQPmZnRqgHORl8g==
X-Proofpoint-GUID: QgV52e0nrwZiHYPiyKv2wgs7ru-PsXaa
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbfd6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=UL_CVLMTin8KOx8HHrUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: QgV52e0nrwZiHYPiyKv2wgs7ru-PsXaa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0switmFiHQbh
 cfz6+JIBlXc4iAJqX4qQtmoaSmZK/AsPzUz9lnp+Os2oR3VUZgc0p+XRHWX6YB7PQqBu1g3VY3n
 GSA7Lg9DcDA5Yk6GRn0tsdg5O9Dq6sA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_173557_583567_4A0E5A46 
X-CRM114-Status: GOOD (  20.53  )
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

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 6 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3


