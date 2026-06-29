Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECD4C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=; b=uBuZQs2XWKCj6dLGYxxNojikGU
	9r0zNOz+6n8rvMpcEy4sf5kqt9RqXePIGClnbvKBLxuhJxTqacyWi43Hi2IkBISK44vQBpMUjscmb
	3WqpcZ8rM7iNAJhd7TceSa7f3tsOJFGbnL2AeOtKQms/+MPALf3+L6nR1A+UtDrfw2Pwg4WHe0k7d
	EMjzeMkAhaG9gyYJokzAV/oorb7D/6e16MWYd6w0lu6nkVJLmogob05/99YjidZATww+LSGNT7xNZ
	RgUsB9A5RNZnpnQP09M529yFGCnqPMFitJJwaFOj1yEUzuaqbK9BbpA2/xKaKD2P4TeK+lwfYEcjh
	ukPU/muQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDIS-0000000Ewkw-3cC4;
	Mon, 29 Jun 2026 14:49:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDII-0000000EwaG-39dl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=; b=XpM9pyuzBTP5Tk0qlKee8NSYBH
	zRsywrboVVHPBMZQWsgjEqp9nyOSP/B4w6MJmClI3546vyKlX6xAzX2qjF53MQF24JYEnZ14esy2B
	fzo5OFOOzPsouiKXr9dptT8vabdIZ0xa07uh20xs7Krgez8jCir9Q5kKSo4QQTLmU57qQpyZpgIAM
	iUE+WfVh1d+G9t+j//ZHyqghEQV15oFthupxxsdd2IvmqWoz1U/PwKM+1b/0g6TiWtv1ZCauZuOkl
	FOpQwoovt4uIy0fMp7tewpS9jDCsG3VsnSevYAmkADrVGrzzMHC6mvDWXnUbBZC26H5OIG5eRBj+f
	520tMzkQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weDID-000000018UY-3BxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:49:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4Xh2646955
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=; b=H6uAJrPmvSmWcB34
	usS88T/Q0eKB2k3PInmaPfU+i976qDNDwSNegVEB/60KEP5HjppOioy6UcEkSYhb
	f+/FvJAmwJILDWyIo4ZnkAAT9SaFqV4um6CB8Gmccpbh169rzoVUKy/9OFZTVR0P
	uDBzEsbvQuFwrt5bW0ccq7TCCIuj6uFyDS26wKop6NhSZzIB/b0sfi8xPeZkj7Ya
	MTZDsq7ZH+Ml+w84VwNKdB3CcmLbwnPJeBLmTaG4qX3RSMSbxlkkPxuZCvFuIoXZ
	Y9TkuMtsO1YV7rO+OVTN8aexMO0hfC0kj35n6g4lWbeSY+YeaeSaaFUsDaGG/ikR
	4xFdlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsu88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:48:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so562244585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744536; x=1783349336; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=;
        b=g4tnzGhLbgL9C9UCApLxHNKINg7u03H4GhKsY+lsXjdPfPnCcjyKJg6Lz4oUxRVvIy
         WhvzbIura9wJ/Z8q6+RxQ+XxWkUkqbQVrqnDovmhzGn6yDhWlwpZ+F/hdXBBcWwlO5sV
         aJ4H8NSUTb9U8/wPM5YhS5dbxJB2qc+awiiV0JN22fS3GkNfxmdNXH/f+TKnJojpyegt
         NumsGT0xVOrVBdFt3gxZSmQ9MPeAu2DRbSQyLF1ecZCSd/8rKNY38UOwMspkUN58Hj3Q
         cpgiHVc9QfmtoG4GRPSqNShYE7OHAaeHFKhI7Q5VWZey3SNVeHJEEIXg1myHKmVyg/Ad
         Y0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744536; x=1783349336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxUOAz6v2DLB3pQ+3w7XXOipI1QUqCU4OXtQP9bfoow=;
        b=KHsnjgoAZk+xoiLp8sumBHOwB7JRQuHmdxu8YhHiR/HBDCq+E+aKaNhf73uCpCIQ1m
         D5v/fsGzraI3+E92iATw9BJV74uu3tnTjcOtZvpzMfTkuLHmiaCiErWp/zEUbHeQa7MG
         9w8GssxYd86za6lVMwM+e1I7pbRgnJO7y3gE+Nln2uZO3dWrxIDq/GeQXaFizqahp1s/
         gYVB1udjfks0L5VMXwz/IZwaKF8/gl36jAVujKSrHYz00hkw4hbl6cP8EyGU1W8AijAs
         C8lc9agPEAU6nTL3JLFdeWOk8Rzt9rE4vUxLP+dPgYeUfiR2h0Nh9ic+kc1q95lW2uQP
         Tvjw==
X-Forwarded-Encrypted: i=1; AFNElJ8vU2r5HVJKKuAR6HO/ThOftTGpLNDJ49wtkGjZsH/xNujczy8Ce2uvvtexrR7bkAu/6Qm29gQYQokmEWBkfpqa@lists.infradead.org
X-Gm-Message-State: AOJu0YzQI9m9x98UscTUSEUKIOeysmEN40ry/jEvJPeNeYFk+vnT4Vil
	8tsWdnokDukjEmRQB0GE0ukvBXP1q8g4UJyfdIWbe3izo6z6i1sC+VP3LRw6zcj0wNUe4gMNtDj
	6olQpFmRBxZhII/IuyZiubhF+cUQzq0m2scvVyKk7HUHYUO2YTML565XOk2VaMLPXkV/BJ3NIHW
	iV3Q==
X-Gm-Gg: AfdE7ck/hZ2OhsNboUs1FwZk6W8eJdKKM7ZEz8bRSneswiEF1LYISFDF4CP7k5/9IjC
	BcMywAOxWg00L6o1VIvJtQ4Wo1GDSrJnTdSjRsC9wxMnqj+VWV1fcWC1djpcMt0G3aP/HjkA1Sn
	ZMV/eVNf5zzkSC2WVv4vGufT1PK8ir6Z4HvycAK6SrIXaF8BODETgbUOievl4851HRrvhSvkl+p
	qXQ5LgkzpRtyYxgHaxiWgG5+wlkvvXwpdFBLuRQygQRu3uJvgbIinumdEltxv0ykTE9XjZ8qy8F
	W66NXY1rBjzdwkTnEiFrPTsJPbAMCYhjpV4c1iIcdC1M7sdJOH0sGDugSYFRTABA05N0MLY+uNd
	bIpJkKOjtiT5CdreyrG5zQQfxl7OYZGVOwRMCCNZwKiHFrx3AE0rSw9VRUAHnuIyHORW9rNNXgA
	==
X-Received: by 2002:a05:620a:454b:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e5a5c673bmr275403585a.73.1782744535384;
        Mon, 29 Jun 2026 07:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e5a5c673bmr275397685a.73.1782744534816;
        Mon, 29 Jun 2026 07:48:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:06 +0800
Subject: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only notification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=3483;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TY/Ycd0Pv0UYVXHobfUENPm0aoX/GRTId1HfFoGzN1Y=;
 b=AweWrHKC11A5BUtjWFtmRQjNIxUkW7uePMZ5PMNnbD77GSRS7TqPFahMkouslMZ1c+wEOjpym
 c2STxLMOEvRCcfMVC2RaEefZcMBHE71VDmHjWjqIJ+WHqFr7aOTLrQH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX/Z72CVooyomE
 jUiSh8q0vGMxK1zUERxsuNv/NJdUpCb6owBxZeAVCMOLFLoTIynGHWBS+VyeogI9VrmYgwcmprO
 Zpbz960GV/aIGbn/r9g442IZ5Mv57lYsXTfn4uXH9e7l4xV3dT5ns/mmhYcbww+7zYl+0+GQyDw
 +lAuBtFKUV2yiH0rx9nyY+eSYxoliddWFHgVzZL57wFH/P4Ml4bzG7GraGwWRWX86Lau+/c8m1N
 QvNJ1P/tjNAh/MyhSIGsMPSobf6FgqENzpCWrhl5CPhfIkNzXpViGMa+qAhI8ElzEp3QHRL1NHf
 6ace5uz4T4omvKLC28d4Gyky5EmNxMjOGCIprkhuirgFoicsp8Q6+HZ8TPl3Kww2IYISWrGmWYx
 uBsaWcYqzs0y4Rv0uabKufJrBNMiTEjljGefNpLjgnzRW7C8AF78kcjyHPeRqC98LF1f1/SXkeX
 +gbPNm5ET6rK14itE6w==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4285d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MqOh_s_JX8DWAqdrIDMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXxFMfKU1nyPlw
 mjBwiLoJlsZsE0eaJVfRsAnHyFWRBKSZd+jjm+n8lHXT5en7ulwEX5BSbAhxfqo1BF9xQElXmGL
 FsDUB4nlueJxjaDe094JXIUmkR68rGM=
X-Proofpoint-ORIG-GUID: KDZxVXdyWXl2I6_8qkIQ8cToSLY8h4BR
X-Proofpoint-GUID: KDZxVXdyWXl2I6_8qkIQ8cToSLY8h4BR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_154902_312510_41BAD00F 
X-CRM114-Status: GOOD (  16.43  )
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

MST reuses the SST connector bridge to propagate HPD IRQ events through
the bridge chain.

For IRQ_HPD notifications there is no connector state transition to
report. Use connector_status_unknown together with
DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
them as IRQ-only notifications and forwards them without modifying
connector state.

The DP driver handles IRQ_HPD events based on
DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
 drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc93b566fbca..4ee391cc7165 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-		if (dp->msm_dp_display.mst_active)
-			msm_dp_irq_hpd_handle(dp);
-		else
-			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-					      connector_status_connected);
-	}
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_unknown,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
-	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
-		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
-			msm_dp_irq_hpd_handle(dp);
-		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
+	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
+		msm_dp_irq_hpd_handle(dp);
+	} else if (status == connector_status_connected) {
+		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
 		} else {
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 946eb20b8f83..28ab8cbb5ef9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
-						conn_status,
-						alt_port->hpd_irq ?
-						DRM_CONNECTOR_DP_IRQ_HPD :
-						DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (alt_port->hpd_irq) {
+			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+							connector_status_unknown,
+							DRM_CONNECTOR_DP_IRQ_HPD);
+		} else {
+			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+							conn_status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
+		}
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.43.0


