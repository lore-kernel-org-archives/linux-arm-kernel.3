Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B60606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qd7snwqJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gIznYCzz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+YPz7wc;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcmLruQG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=qd7snwqJZN529f
	jEMaNF4LTjp6B6dxStWCTWbq+xlhjUmxha5+RDWZATZjyLYQCTr6JDkc6UnMesUHZ9i4WQrBxxeGJ
	rkxL/AMhmgDMbRDwK0/yXB/YNcLhzI7q6M49twidx9zGE6tsKqiPXu0czDVNYBPNDY06eizypDanF
	A50aZPuvD20bFy573OODsJpGc6giL0fHeiRc4WdlPZoZu8Kk7WkJGnVxyed6Asn0CSYB4JBxuheun
	pUZkVDeOB0HLpkThIEHvsFD/8bzSG985OQZEkpdfS/vu9IDlfBzkIzMASfBj1tJYTZP06q3pLucrz
	xTBhTqBiFIIqaUKBLrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkK-0000000HGWV-3N3h;
	Sat, 24 Oct 2026 00:36:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk8-0000000HGMi-1ysm
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=gIznYCzzkDq5XLe9dPqFKPZDjB
	YbEIJGr2HZ4vINB9JsY/crLO2PE7/HB8SVAg4YMdS1wyST4NGHP8DCN18IN8KPM8Tjj0WTeg140Tp
	kU3RyiA0C2zkESpssSFF90HgWIZJmzX9UgqTxSDbGkunM2EZsvkyObZIYMpgZfReHRJXznqIl9hX4
	xPjrS0s9Y/QfdlLVuCyFZadCtuOmuW56AVwReJ0ZDO26yZ+esjZBExbKdlUrT6dIoPLBxTOCjXo6Z
	lU8wetvehIiqAf5nPmnbdlgKynkNV3IlwMTGiqy1APliuPSmuAag6Uq/jkw7l6HlZ8CEMjj5/AzwZ
	koR2p7Fg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk1-0000000AvNO-0hAu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvEiK297199
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=J+YPz7wc/wXRkN2O
	/qWs+ZbaVilBwmcQTJyrbtXOAeMqeThtKiRXpi4A/NpM8tAXAc1U6YA24zFappTG
	bKsKyvIkjuaE1Gq6B/vMTXO/NEk0pHqrpsBKxIYGEyYk9RVRD4HIy6p0CWdtHCK6
	H2STkgeyyPB0upr3Si9ydSXMkI/dXDeh4B3IUEWh5bCCMJ58fNxx7BhZ10zn3WN1
	K1Gvsm21yU02e4FWnNrxnU0rQWO/05YbtIAhZqAwLCGHCJXdzi6c9yl+eXZJJlNE
	tr54sLbbaRhNODu2ut6tn/EVi7L4FyqYVs3/TqK8bHUMqkMVeqzgTTGMoAcTdbLf
	c7youA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhhah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so287815285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802167; x=1793406967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=BcmLruQGn+3LObRj2Ooz5gW5s3ZoPMYJkgdgXxGoZCXPEFsjUXyjA1EusN+KpPD8N2
         4PuPB6xAqlDn0BC3XFPHJKbk/MvtiQo23IWuXPSnG5iatRif2trHN+/AqiA2sxwOV52W
         T31YMqkcNLfTcpHt74eKwO8k7Jh1CWcwHZ4riEnBwnfif2++TIVvLupBhPjWX1ogCPxm
         gtWWNptqo8SVWn1+tO7UaBHxI5g05tZhOXQxf9hCUMkmrwO08lL/rnLZprZwDuVzADGf
         EQbNQrc4pHCZtlQIvetRItTtj4YG0Gvg6oGdnuph4h2vJmeSJXqzE2Bvum932xyV/wzB
         tK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802167; x=1793406967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=ATWPCM73m5nd69pwvi59a6q7unmHDvFH57cBZcNrgK+TRjC8CARVwylMQ2lBVDZ44q
         gL7f9diKt/XrbnBaeEEBe8O5tmkbTLv1xEyb09iDS/Vou9rdCG3cCAWPGifQdK8x2Wk9
         96IqDntEtGI/ty40Zthn4zFbyGXzTXX0pvdrDYV7tYt3PmvfcN9jX7lPj27a6HqQasGe
         MboGYEti+yMp65krxwUdwHKfXZgmn6ffNzcJCz2W48GAWgxAgYUsN0tYoZBeNUqo02AX
         5F5UiKDHaMp9NAhMjtaVtsnKoiJvDVdnQZJ30UuE2Xur+LioZUQXSnIovYUp6iJgGtxT
         57oA==
X-Forwarded-Encrypted: i=1; AKwUvBzbPfpZYIv1jGm/4OKLOLe7rr3pzjHeWa7N3N57FJ8Bw5gOrXuqL50dSQdX+oPkyI+hGrWbLRLC8yk9xOYiI/38@lists.infradead.org
X-Gm-Message-State: AFq9FYKXmhHwPw1JgCw1zXjVBVe9ESX9m4AA9BOGqWCCBlkakcglcnu+
	FjCM7UFzkiUGDwmUzlNpCUywIoTuow79eyQ5zTXBqYpz6FEe3gOst6JsVbiNN+/jpyjdYT/lOKP
	J7LcLEvxHxHY5wLMGDVMM+I1+2DYQb2NbthfObSa1QhDVGWm8fGHtpOiORg3+sZ+nH0dhHwaXWt
	AfFg==
X-Gm-Gg: AYBFou2bTS9s5FkwKovuyKfIExO4xl+MuZyv7ma31bitsbOlbzj45ZXHvU8KMf+JOGW
	avnDjgS02Q7VJzGYULUVEPrh3JitTD1duk73w1MAIHPkiOtpGnPDCoyBOAqB+MMoKSasFeFUv3a
	4Or95mHqxSJcGoj7SdcrdIdiRM8acRTcbG/cyzYLgG6iYUQoyfnn74hzpDF/R9ds1eYPemL4gYs
	fFsOFYC2Qb2M0RhvFjR2dSAPnyEcKqXuwWuQLcDBZjfjcZUyY8WNGNicu+qJPZxLXJtnk+UBKk0
	jIvRm5a8O6MhhpNjnQFDbNLI+t44e0xD++Tih33ICJ0jXGfvHMbPApgGDOHdpU5NbiJn+zRoC0Q
	KVUK9wDsM7Iav/LuwL18yELD5heJctlCN2e4a/ToGAv2aUwr2fj85JL91NvUuvG0yvotsjuybwH
	dc2u8SCqnY5VZl
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id af79cd13be357-940ef8fcd84mr106706885a.13.1792802166964;
        Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id af79cd13be357-940ef8fcd84mr106702085a.13.1792802166482;
        Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:23 +0300
Subject: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrb/VOgyI5r3WOrGPADO8HFThBlFhdMoyLUc5IOFOCCd8lmb
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq2/1TAAoJEIs8ij4CKSjVSokIAImr
 d3EvdLukc5qeDThRl7OAYBd5sCyOGRgGJL6gPmPsMCQlaqA93SbRaQdlHe/asMr+X2+Ui1YaSsV
 p8LZ23dmV2u2mnN+losDIcIObjYElFx1HQ6t5jidjTnjJ/unIFs9t1Le2OpxFbVvMMQnLGwcIhF
 jjwaHFiOj0BjokPIcjsvIS6tvO4oQVhK5OVnfj6nydXw/yPBrEPzUPmIYjC6CFMhj/XTSPvuKxP
 6JMXu/3eauaK8fpauY4Zh6nm1kkX0hdR1EAo/6ma3QdCG+B7ADcQbuwzaK25hzzFs8wb/qCqrLQ
 VUYUwhy9q+KulXT735Z2FSv+NPcOe77FBV+4mBY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXwZEM/OjTYeJH
 ZVMvC2W83axQV+/wXaXtAe1FkurhOX/2TEw2htKpdsl1InQu5mpmadyq20FCWt+wmABzr1qG1gM
 hKZi1JHrLEB7DrzP/9uwsCE10ZQZz10=
X-Proofpoint-GUID: BWiP-aZchCrdzDJ2l-NWMl73MqYxX_Av
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbfd77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BWiP-aZchCrdzDJ2l-NWMl73MqYxX_Av
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXwCzbXXShmJlK
 LrZtpWqm2qMibpPjcL3zAwNIMHjNDOGInF4ip9hDH2fa/MA5St5Hpr/xc8HIDo7ZXuNa1NZjRub
 Omb0TmuzmLVLPG++EiJK2dcaXMgFUZt8vtegvRmvzSb31hBNV46WzmnwlyGHAcMX8jn3HCewDfV
 h6Cd82th/HQr1xhDXihZRlfFlAWolEt9hydCZTaXeLujRLuoSxia0YsKMi3vBADEtYp5Z3kGyLi
 opiM/v/Oi6ctp0yRj9pb7eGyRjURYGGNk3NJ2PoEIr2NLKS4UX7p2D70O4+XWUjG0Dwc+AkY/ws
 MOUpc6tVb99z7g+mPN+RQ/A7EjsTn5JJjIhHMNH8FN7ug3rUZaX35/nUAsuC6n7dEutRArxn1/G
 a/xFvLsC58ymtMkFGcQ/g3iP+IiAScG/L9r3IHSK46XKNeYks5oHCcUQ7PiX0uomfsNbS2OYQQ9
 4+ataYH1HxT9MfnWD6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013609_680228_6E39FA98 
X-CRM114-Status: GOOD (  15.97  )
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..771c8b0744ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD)
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3


