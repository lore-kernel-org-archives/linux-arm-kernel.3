Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59917CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=; b=kj0Qlk3M6Y6LSjGqiu4R7ZUNYX
	tR2FjHofRS4/O4trvcKTEfNMjQudi724UzIddZMvjVMME/BV6pDNcyJ2G22UV5VvurMkfuufGc3Ha
	Sx763oSrTadfIcis2ybOOxNSgMQ9Jo5VZzKTl2dLLVSdrfm6uEjiunIxwkcqaBR485YJzl41mSGk8
	P7mqh75DKG8bslg2qvRdawwnoeWgwiQk7TdQv6j6ZmUqfud8M+FwiblSRK1F01Gp6FR+4eufQIp32
	530DRo1wcQYAhmX95ZQu9r3S8sBFvCSkA8urnD8LMbDfIGLP+9pz53Ah/eWsseFaE4q9Xt00pnqcK
	myconE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mia-0000000EJLh-2Xme;
	Sun, 28 Sep 2025 08:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2miP-0000000EJBG-2rOp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:25:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNawP3008082
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=; b=LxJ3zEoXn4xTjN3G
	SQH4Vtq2q0AsIs+qTuvPQ+dRa/vm1wAOkFOy8SYuUba1RRiZu53ndc4LUm2AVtdv
	n4qwjBfmAWnaOEZN0QmdmGgfjDOvAPbwJXkZRM7yyVZp/fionxLbgmuJI9AXSQSM
	o/vfLBOWBuovDrfa8f2CA0yGZ6Wu7fu6kekGx+SivxQa/3gvF92NWMT58OoWFzdD
	AQIx1nnwrYx9VaZiLJxv76sowzdWM3G+W3i9sGI8TMizpb+YlIeMld32g0picEUu
	hOskKdtredV8Cij2Aax/PMmfy96lqLYQAt8o5CRSSF57u63xnU3u08xZfmwen3KO
	h4xrnQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5tcpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 08:25:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4bf1e8c996eso78434811cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 01:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047902; x=1759652702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=;
        b=oG9PJt/L9VBJm+N1cDvnvyhZdm3ymBOm1mHFaSvY7y1SUL80/OvOdegbaIbPp4P3ND
         vJtgABwDKrgVmMaI0BfbNl+0rHgnDScPfiuG7cq8VuvfPRmYeZhw42LGNjCxvxlKy2yX
         RyicykHRNV5So71oAyZSBaC+p85NACV5+ePwNX+3nAzGegltCrO6owU16HT3wcsfppWo
         91YrBXzkQfB6C5C6qwxQ1oPtfgr14oT/jtpyj/SX5db5+ghen5l66/+NEZmrPigNp8Ky
         gppquSQpmu4V/N28Woc25/51s4yrFa56P4prb5COBmkJiDcG6RzXoV4AnHpQWvlDTl/I
         4zfg==
X-Forwarded-Encrypted: i=1; AJvYcCWs/1xUti814OqArefgJxZV4NL95A7dbGG4JhXuNTZhWoRqjEk4AtWAx+Y4/ezbbB2GVunfiOiIZY/uPQusW9gL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5NiBzbhCYLdOB1OnWIZaIBEZSKv6jjO1/GLT798pxID1lcq79
	ExuJtlq4Uef6TDmksgVYIzT8F8usc3ojBiV7o0dqn8u8IUTTIHv/uCpuhfT2PKb6w9ASHDmtQur
	xQLR218wk3CHkJGQLZscBXpxaYkqUI9vVaEzOvhdzN7UzQ+352xT4ql91ZpgvJzpX8lraSDego3
	H1aQ==
X-Gm-Gg: ASbGncuzmh5DUK/S8fzdgPZaJr/aX5TsnIlptnbuBbu13EKfIIcLJLdTp6tX59eV4i3
	UY3OhOTwRPn0YPTLE/tChEyO+8y2R/COgL673oLn2B6XOwFo7W0DI0s0j08ou+CsD9pIND4eezu
	kI+WiVeGxaAOKILkaMkYUwOwgimffsKxkFPjuWTjB+K2njTwJIJOs4JZrajU2TlZVZbeKOChOPj
	Q6/GueSzyvSrpD0y49dThcnLaADuypS+eG2ErjWkY0Ro3bPE7BnvyxGCvvBSthHFKRP+pXjjnPp
	4nlTTnNvh7zEOCBNYpflgG5s4iVPaNP/GO1pnLTL8ctB7OYTf4zp/N6ebMy3eBTjbHpGaWv0MA4
	TWc1OJDJu7zZuGuglDrHsQ0Q1hZhOcXHfcXxGKBcdEOae8RY3kMua
X-Received: by 2002:ac8:5716:0:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4da4d220650mr149550041cf.62.1759047902101;
        Sun, 28 Sep 2025 01:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtFk8H4RKfXlQWtvvLw51nsL8yQliUuZJcfQS6snZsdM39Enms7DNwGsz+hvLT3ZcB+X6JPQ==
X-Received: by 2002:ac8:5716:0:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4da4d220650mr149549611cf.62.1759047901607;
        Sun, 28 Sep 2025 01:25:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:47 +0300
Subject: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSyQmL3DOBdLluC0mSQhrTNOeUIpwQM2CI/HP9Sdsjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTzUzaZJp29ycMmG2wiJQ8CQv6AiE3Huv86
 QOzLbdX9AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1bRHB/9ZjQ3i6ODCvlC8kHJqQmp+BMbnjHu7eHQ6dlWCRwTGbec8cJ8pUEOwXVArbsB/tXUek1Q
 HgczeUkd/5Yk6k1Fji2tKIa1Kvje94YIVlPsM0F3BO3kANjvD8z/jeiMrM7drR2iyWyKl+erXzy
 17ORLOpVUUbSI1WqursgSTSOWhhotsqgAbGiZWKjtxK+bhwA3yAFucPTQsInzOhaGtxfkxx1766
 o7UfybNWfhI1RVmA6KLPi84+IKf1vS+nsFU/vjt8C9bKTkS2pO8nDf6a+sLwRIuwjsWXd40lkWv
 kWFbjZS8V0oblNyrBSDE9iBEqUAdfJoQJu4ViT33wChiVcvX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d8f0e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QRFkIlw0yVgnavx0b2TCx3R_jg_i-IFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzUrdaNtVPJy6
 g92aKqcxO2c6Tl0NTZuXKt1uWcCTwlEq2QScTU7i1VBGgPU5p0paN8oaCM+/KjF85nLg9HLG646
 KwC+XUBT+L8ZvMKbPucaumPLWS3nvf/w+ZHIQaTagL+ElDVGyAgJ8iQQq58PEttdaXfysLqFVMs
 BrN1SRFof4rBD5r32AxFKj2dbN3Wqx70A5bJNxFXo79iwg9JdRY0uGjpOeNJ7TYqV5GQRBL4N4T
 SpgAl/QByk5do3qoJkvjCOlu0ge6tvmqCOJ5LoRhtcEZnCKeG2JbOBaV7t+RnCCBeOH8RoUGHET
 YRjv9T9sKLGFXwr31bJabgqu7IEjiTkCJ1gr0Zm2JV7Df+xEyREslewasskskjMyzG6ulpZ77jr
 NQtRLr9rJkA3L0eVZOHK+2iNefx4Vw==
X-Proofpoint-ORIG-GUID: QRFkIlw0yVgnavx0b2TCx3R_jg_i-IFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_012505_862779_E037F276 
X-CRM114-Status: GOOD (  15.34  )
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..241f02143f59322a814b4b277082637d59be7d5f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
 
+	.atomic_check = adv7511_bridge_atomic_check,
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
2.47.3


