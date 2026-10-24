Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gCzcH9z2;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y14TJ8rP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ7GVeSC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=gCzcH9z23kZ8nA
	xinsHtu5P7c7rwFpP+HhKWT6OuMX+A9tHKoUyQn9LBhMY3AuqFO/wT4GKCWoPdxABaAyzQSck9DO6
	2k6fSDNKoCek/m2XCGhCYy4ABSAKXhSxIEp7DIAA5/c3Op75bSJ1gQDwtsAhIER2ieAm8gp/DmihB
	7Cj8N+TEfGScZ2mQjkX53IS6TeQa/EuXM0sXZcTIN+ss4P6TbhrPisHpb1GDNwEGMAZs/EgaAReK5
	pxkULT2/taZElxqUqdARJR9vZ1BDjYXO1XdouOGCqRPl7rXBJacHEiIbbBW5EIchCDtIwAjURdfCM
	80Oz3ixR20jhnZRTqVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkK-0000000HGVN-1GeY;
	Sat, 24 Oct 2026 00:36:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk4-0000000HGIj-2YLK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvCXK3983329
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=Y14TJ8rPPToVsOWN
	sBACVXmoasoTJ1BEh5WlrsTucN8+1iRREOVjNrczmobmXxX5oiHYgEGzAQr1iMyM
	u5Nmjq7B2l7gEH3SnQGc/rouMMU5Q23+5/UE0ZDYEwq/XfSNGVYHXWOKX+fISFHO
	6W211gF2HF2lAK6Bq48wtp/cS0JAVlUuak8V7GJ2ouXGjS5/uyLvqZWVgdu3UfhZ
	a0uyVvXiWUfsftHz14XyjlthFB505NTFdrw0dmbMhYjclSTC9VC2Gkk/5RUisOde
	/VquLCadl8Ru2Bli0RFKlPMToXYWy2PjslbH4K3u9hm5C8dQrp7Lv9DEDD3Xhi1r
	oNfPaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1jgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so300404685a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802171; x=1793406971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=VZ7GVeSCU2xC7zjWuUOirGT2n4OQ0ZoY/+xTr1D9ScqlynB0Q3ctkCu+dfFmfwz4SZ
         gITzFdqiba3R2JiPHeyPXmoWfCzhqrbXiSsyG3Q4lsxqGEQvzAmQcfBPaUewb0YDUNc8
         Fpe8RnMV1WIspTzyJZAIBdRy/yOcUJNeJkfJtQMIrNNXJAHqZ+3FYM2X/8zHoHPJvObn
         NejY+vAbm6YuVx3JGbUAiPe3G6s028grZa82pNG6DoeOqdTF4mU7CKF3M4mlwk67HtPY
         eFe09jng2/NJPWhsFN12/L+faY8lZTVumAWwUuwal89AeXbiVAOJDofzQBTzXU7en1Nr
         chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802171; x=1793406971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=z+6lGbCdPpXTSGCNT0l7PEkHSJJpk+RYWYK9iwtnzAB2jE3odIUacrPayHWkfU8Kxg
         rheeLGFIVJGWT5az1z204Clwa9/RQf+2mIH9PWXZBfc7Kozc5QQxbcsB+xA6yxqYr8g2
         2l9FySJK5gq1K2XxugW8LstmWlyqq8NdNeRDXfb9G/JZ7DyVwldgWlzGeixFYssrqxQK
         dmfTglpiYUl1VbcfXEsw35fz1W9UZzQzLfas4gQ0I8+UzTVtdbzxlxaW+UxXUQHDk/26
         Dci1O0RrNd9YkkkutDNHedfAt6QeZQ7xeiE2NA9ao6VhItxSn/OYEbjEFrQGeeD79PqW
         grZA==
X-Forwarded-Encrypted: i=1; AKwUvByxjL4FYTBmX74KE9g8/QS2DVwTVxHFvYmmtgY+U7hqquisxYJAPCuA4FiT0AHl9dE/NhdQvw5ueS4M/86SJjLK@lists.infradead.org
X-Gm-Message-State: AFq9FYKeiti45UBoY6S6AOx36459oRwbiAD8SsBS7akLQU/OaC1gZEqY
	E/KWCVRCIvJil9F4xDY10PDL5rZDIAo7RdUEhMRwSyYJj79CVfQl9Rj9V3H/R9xcjZps00w4SrZ
	YtdtRFelk1MRy3UR3PrC4b0IhaqGqXpOkAaaJaowPVqVNkpS+h4/HY3YOeK/RaQ4aqnNfxw6Pae
	1jNQ==
X-Gm-Gg: AYBFou3pJUW75+UeiU6QRctf6aeFDY+hdSJJQywLXrurdeYSK53HdjwWWr4CwCpqBXc
	JQbNdfu9CzncHnNyGI3wro0nMDIxZeRxGQJD5EGbRoYUloZgdjrM7H/yXu9e+7Z41fMD8wG47P3
	emHPIWMfMh5maeSDWsoabpy1UL27sZYEev83vF1/C5ipr/BcdefC5LDu/n3bZ1e50kc6SoZ+xIo
	KyBnEgO6kbUmKFhGqPl3CeiIslFdZZf8Y7BEZKBWex/Si/jfnfOUQo3vElYuh9sEevpTiDyaDuB
	uE2bjJuF35qSjh+G/GLfBJqx35Zg9I1/Dm/RtY0KPp0TE2h72pdfp8Rt5bd/VL5nRdXYlsEkyLt
	oM4yaAUXyqXSDjryCJ2itcekCZFPyLii1CAaibmn/uovBO812ZaxHzzFlkdiXmWmJTYy3yHbCHt
	p+7ITQzg9wiByc
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id af79cd13be357-940ef92acd1mr116219985a.58.1792802170928;
        Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id af79cd13be357-940ef92acd1mr116214485a.58.1792802170444;
        Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:24 +0300
Subject: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9btvyFFnqxLn4beuyZo1X0kPkzxT7j+V+WX3wPT+pKeT
 63zd1PsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEMprY/zt1hWckG0xdONPL
 Z4HYo4JG+c0LTsazGwSXB27eVK1/9LVac+vheX7Tem0dWZwOtG+6t0xbSqdF6d2X1sKZ/Amhk8/
 0dJ+MtVES2CfvLHK4ZLXWvR97hDoFdjh75+zr6Xx7PKvhlZjVSa1jYtYf8t+cY+K7kJVi0GZo4/
 GyvP/hoZdb1nVNjXbazZJ4XWun5mYxn+4sxd1i207MkZ4uEGnY9zRlpWON3CNz1Tn2mub5kkIlA
 o43lQRXPf4kK18/OX7r2Tvz1Fo44l2aMs/t1rHi+jY7PC3KQOT4xIiNk1LqeTZYbo/iEkvxenuw
 9vZhBqnHvLdO8a1UV4h5WZP/IWeV5vHwc5dC7jRK5ewHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0+6AGjjRuz4+
 nETtBup+LGNd7AovaLv4ZYMyornzfR4Oj87wsH0u2b5dQ+ye0vVGbFrVF1WoDuQTx5zAijkOQGs
 KosukB/F4vCDvJldNvXWlh/fQt9XG5tXw3A5hZOvS9ssx6WedyLxmso8dqFMfYmqNhdZQOD++Ia
 WE6VYnhszeWfQYX3nLYfjIdhKBmxfOpHGhnjcvJRwB99p1odFM+52Y2T3p7aam654j0T32kHZC4
 uGXdURkufJH8NSuvbbID9oKdBVVUt24nng0RtD3bbSYWxS8T1qNVY7qB2gupI57Kip/1+RGl3rX
 eEElnWed9noY/MiYMOOW5FYjqHf0PE94kF0lYhipKmouXAh3/T7g1sQTKG+rxcvwyz26XwYKTb3
 Hwq5shRiMkR30TRd4keJ5ZK4S2yuKJe1Fsph0KhVYFGRCGT6NFtDp/Y0uBwHM3kKibZxwZX6RSe
 B3ho2vIWVvlzcqCr/4A==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbfd7b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXyaP/Xgvz8Lgx
 Ty77cXdZ7XOmpH4omHKfJOPg8M3hZJaad9nKns/BQEa02A+NEO5sFPBy3T9J9wBn3jdaKVQsvGW
 ZG0P67JgPs0HIeP0du/UnILpqrXu9G8=
X-Proofpoint-ORIG-GUID: T--JkWtng3pYSk0rpNbAKNS0WBcQ2PZk
X-Proofpoint-GUID: T--JkWtng3pYSk0rpNbAKNS0WBcQ2PZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_173613_336747_90B8853D 
X-CRM114-Status: GOOD (  13.45  )
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


