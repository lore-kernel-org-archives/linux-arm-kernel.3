Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4D2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aBBZ4GDQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDJWPxkA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+ZpP7yY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=; b=aBBZ4GDQvceYC1
	begqh28tym44roN4aSrp/yIVmJGZc/6dXkAc5Lzn+hymg48b6popQq9kHVepTAfFIkVe+F1IEdj2z
	euuZJw6Gam8ZN67Moq8X1Sp0Mq4NFPAja5GNH4HZOV8LUBLv7KbYKkBy3BPKCGmFhh71zb196ccva
	VtYGhM0Fp4Qj3dX4bi0IfRERCW8y/nLLt6AVF/z6sX2gC8o7VQIVM8jJeDJPrhEf78QI1ICCV9pN4
	MX2uacVPTy7OS2FXvsP25z9VIDGbkPgXwa1fW/NT1OLzJBPO/U2SfFd9Xpj7vcOCmvmDZv1Ua+rYg
	ifRCoHP7NNCBscDDF6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVf-0000000GPBu-1PgV;
	Fri, 23 Oct 2026 13:40:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVM-0000000GOtS-4BBM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAvtb3823142
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=; b=hDJWPxkAKoIKlgAA
	SusW8uZE+xFL1P2FouiMwWxolVkIozu/GnoEgzBRpmbo6Ef0/cZx/32qBVjLkvCf
	26brYVJxMwDSTEAL3+TYnvgkQ/u+8hVCLYlIf8f60kpaiFVthfSVcWb9UjxJHaoG
	5Ccx7EpYaRdoJ4Psrtg/Wcke+AUfXNf4RjDbec49A9yBcJQzYJi923liHwrXtSkf
	2Dc2HcDIfd3DfjZCJcTA71jRGELd8gNpRoiAc6/sjwU03MNCmgWznSu8lEEcSCPF
	LQ7YnC5ZWc//ABmd8p+JWGXIZtUphaGL8b8dCB1/Kh4R0Px0reae5cm8FwtSu/yM
	d1qkzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw09xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so195124985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762819; x=1793367619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
        b=e+ZpP7yYmHpSKuO3R9zEoaSbtqi2u0K7ekyewPwGuuwlTy5XdAvipoIzAXicq+2LD4
         IHeITcw0QbdtJSf8wudLZx8sWo5aksXTaJfE5MzpV4xgXHcHLT9sXRpAzsN+7X7DZ7J0
         +BxgCThPILrGam7Ww0jfsIVGNUsRN4+RyKDZfTycXKxUATWSWzJyrQuve3/2ql0Vap7T
         JNF6KL1APzX9BCGFeHkf8urEJKS1mgGUlyOxknQyp8WhFtA27VQd22INawFOU8bT0rfu
         bNj2zQ7vJh7sHNqXirwyx45RSYgxKS6t2K+P3msgiqxEHlQNPAQ4kDu12QGetccGvQuk
         JhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762819; x=1793367619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ld7/NDhxBfD4wQ0h8W5EU7EeR2jFzqpd0RH9i43qSw=;
        b=NOVPiNhWdBLzPVJ/Ixacf16gcYLo2gubkWf16jDFIIbMk9+bvKT2R0q92Vc97sI0DT
         fwpRgy61iCUZ9H9jGynX3G2wzYCcPoIyUpgJunDY74BqnGijCeCQSTiIXoR/ujivS3zg
         HJZurzOlB1AKTm08jUYVbzSTemNEHYYAK801oJoFlKddDbzX7xkwZYg9E9OhQzrXi+oV
         99HKBY7EslZT+RAxAjMvfGJwrRopNxU+34I6R2tHS0+VD4ONjjsldSWGtYlcrKqDa4oM
         rpgQD052y3e/JSQbOcSCoVnx9rsEphi3cAsa3mnMtFsEavw5VdLJ6hYpyB/fXAERexbO
         VIqA==
X-Forwarded-Encrypted: i=1; AKwUvBx1SYO6d2y02sC6QidLQcJG40l9H8jAPcPGmQ5nAwRN+9JHWtWQIH8cv5LCKn/ErddOstMe4gfL7takvpHRlXC0@lists.infradead.org
X-Gm-Message-State: AFq9FYLI48OkcI2SV23PW/GvmbJjhsEh7AJmceV0jrwkH0FncUJoH8od
	arOgM+WAewcye5lSrOcnjMfqipfbvPIL4HTggMVl3m7XUnUnbZRVmmH7NrQbgCBbe2n4A+4YRAI
	ULvgZIkKDH2277/D6tg1U+Z8kbNo6yoPvvDogJfjXnh0WnX0Ujp0IavF7oxIWzpvKfhcU28dVkL
	aV5A==
X-Gm-Gg: AYBFou3ZhCN4FGKEIGhewnCdT6AyYBvu4lIUxA6O5Cww+PNDEJeeaXgHFZldGewGPjB
	TXuWtZhJUHpVMVnJef8J1YgbFHLqd678wSaXadyFLneqp7fkwtX2JvyfFMMPybc9EOvd870XFtO
	gNvlcmXVaijEvZXU/4or5RbrvjQ0zmWNjnKdt5XhYIpQjaaBfC1JnmzcdMTMRTsVebN9GHNhvKV
	mihmvqQ1jx+LOfYPniDMw3v24ICBiJiOXG0pHLOIeSNTqi1DdrYK/x4DORi9G4qR9/OlmMrWhRi
	OK+SUoUY3gEZczgnN6qOkw2lXWz+VuTzxhWRsCSu2dRnQUyY6ADFiMZUy6+bHC2qPwSAYtAVPLk
	DIbQVhWPem4v0rvjPDG4ym6HYku+h6Qu9+hD9tWZE/9FbXn+ly8dV8uC0bU5FY/Q2bbIYmpoOfg
	RXNK20VO4q7y3E
X-Received: by 2002:a05:620a:711b:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f6f7e7050mr447538785a.43.1792762819158;
        Fri, 23 Oct 2026 06:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f6f7e7050mr447532385a.43.1792762818611;
        Fri, 23 Oct 2026 06:40:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:43 +0300
Subject: [PATCH v7 3/9] drm/bridge: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMVFy4RL34DmdlhxPX5tz7BpH8GKfVJsVv1QEc03rr4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Ondx3gq8X6yduxIREyCDV85YYpkIg3G2DLz
 s1gri8a0W6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpwAKCRCLPIo+Aiko
 1T+lB/9bA/2MncyaM38hRnnIf4AbnFXT/EXnYTkG2+JVmd8BpfAxBlQP17JAf9zGdkwA0pE890H
 AvogyzPKNNYjAaS8HXV6tkF8XY/fwx9SCziwRW2uM5bPBYtlV2QsCUJCYZ6fx6otzqXI3onW13e
 s+d6EThrjsDLr4hyuRYceEdkKfH5lpPfPlXoisHOi2Y26QjFfwJ5DDDFHmGOK5Qj+Bcs9cU+jAe
 WnGX6wFayiY1QqTrAnralEeCjIbTE3J/S2aT4y3IicatdzxoQjv6yky88cu0NBiqqyDFWDl/sau
 hm3FOA9WnlEpouexSGHNPLOZ+1F+MFK5BWPfYXIA1+48Pehl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: grLdP9j-96EiWRTEii2OI9JmHz6kTm6v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX11deCxZ1kj6Z
 RdHEUt/JqNZGW6e9KyMRvCnqyVvZi7Xza8ppbA1i/D7ZcnXL5eDnsL4eE1LF3ITfd+A2Yx+39lR
 nz/tS10fH+Xnbl4lGApPzIW7LzWLEpA=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb63c4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: grLdP9j-96EiWRTEii2OI9JmHz6kTm6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX5J3MF7JBrN9P
 N6Tbdbw82HZNpvROa691/YmO/fdkF3rwnff21rL5ttsM52CZrt6yCIAAfLJ2gyf882Ehddxnv2R
 sQOVxkAW6WjY8/jF7sB+gymc7gE9La15vehkxkMGzWhhTIY5knnyqBboct4x/tgisiQGzTQurIV
 XRHMyhTlb3FEQ/OHvokEyz3FaxuDJ8jC3hVSlVrNH6GnCapQpmMJ9c8dugYzHQK3+jhcPIHtveD
 wWbOBF8c7eFahK+QlqVIEMlAyKCjNdQB9r2sjlc0r9falm8D/G78hEBGZCiytBh93oRuLxr1eM2
 VEua9lfHGmob5CrxBVm06VCpoMgt1cPq9TjN2aVIY1bBNXuYURR055lV/PARrqrxllaXB6gYYgp
 K8cjMt9aqb8/qwriAo24C37/kwpJWc0YnYfO9bFB2y3u6PZqDjA1w7ngtifZ7QNRA+akwlSwl2a
 PkJMt7QRzwj4lQUHhcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064021_046844_12C14D98 
X-CRM114-Status: GOOD (  17.20  )
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
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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


