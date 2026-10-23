Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD7606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7pRIGWQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SwM5DL7S;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZDQmjEo;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKe6lOOf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=H7pRIGWQdCBxEM
	GHe03CAnPHEo+YrPD68AbWCZDzCu92dtZ6YDUTRaI9ganKQFTrM1zNS8/xUOoWk7ekd0wPJpAztNp
	p7Nz7P8pVckTOIe7mym6mj3+uqjd+lWSOvFi9/Hi89vmUBC/i4feCzNjMfTpa0v7WVr3zplxtqul5
	hDfUABj8/L3oP/6n5dQA5URtcd1tQlI1pljSSTXMqHA/gWBdZtR911l3FCVNkkLgpHpiCSdd6Lz8A
	n2ImHYkk95P60lcSpQzLwBZ47+6yo5H5RKec27lPg8vfjn4hzTrlQMeIxIo/ICavdlBjrFQyFbkVj
	92XY70sIJOA2/iAI142Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWL-0000000GPe4-3B8O;
	Fri, 23 Oct 2026 13:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVl-0000000GPGG-1ewF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=SwM5DL7S1BiwTI1geJYOWZoQlO
	/DMw8VqzdPgeoSrnDUZLIDyrKxahXcLNZ7NIchZBuPk+fSnEf0z1oOm2T7iISa2TH3wha0aCa3+vR
	8HYfH5qDPLi6MnJB8mRZMVLahsDyLAx4bo8EcwdKXbTrNJKwPKbywdaN1JKsZGrdIiMLhRYBStLUZ
	VDSsSjKGeew2mW2dYJQDBR6QNTl2kh7GmYfsDp+Y8BHSNctCH3iMnaE5tBBaQEhXKEruN7SkIDwBa
	z5oFMoUcTEC4FaA940DODp+gNUB2rc7bWs9pecqLvitBXMIYccp4W45e71k7S5MLfTNs9Nb+QZ9Qf
	ZvOpK/fw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVc-00000009j4K-2E9V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAASDO2463085
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=NZDQmjEo3XEu43PU
	qrUt2Yrt5RNEiHBrhrMODLvo7dCNn7vAd+G9DrNpFcK3+vA1y4YExqlfev88biMw
	79PH/yAhbyjzkThwN7o1j9kuIJTRhI7K6EgmIxIjQ0rz33bMhHn5SSkf7hE4QgF9
	SGU8BlGv05gCsCjyKIC6KPwhiWTld2YdDRiuS1YvFppdx2MjXwouWB/MvwUhLfPo
	SdBhQ2zFD4QBatW9pJBcfxdzCt4pG3JQl82VixJB6m3wW0jxV04pueNbdyBUrYjG
	GvGHl0357Xvcf3xrKjxOK0WkSX0WYqe581JBMznG33H9raDKY37gxnLM2VWK1e6E
	0Z8UQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4cqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a2035a4so42545856d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762834; x=1793367634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=QKe6lOOfV41D7MGHpM3iUWrR67yTJKrf8/HBOUMtpAz2yH3VOo8dJV3eweJbLsVz5w
         vFVdXu+SY1rZjF+G4j/IUzmT557QrxMPNIRqs6xkq1U1I9wAylHg7nC2wJpkYls6YfgX
         q2n6i4MHpuUv88OZTAddE+qoq7B8LUqdyW3KGfmXsx66EP6d19BpX/57UgmGyixdoJbR
         6wAkfI2C1peAUcdNGVBHl2yAsJdCBMPSNFTISWjb1j6/kABertnihiank5UD35/pcnJb
         uv8ApnYohE8ciPHwYI4kT12muMCdFGb4wVUYWfdQZ2hcQHss8WQa5yHUlm2gFdk5RJIM
         5EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762834; x=1793367634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=Ol32RyNGwpgHrrWZQDu7RbSHsmpIFsSK3BPLXzYz/x3aXuZKYr7Y625Env/JgplZgE
         A/X8zQucJjZGSboQCRQZpjRS+3tB9ps+H/gaiQVWZUF4B5YE27MKw+oDxMMyg4GMd/LZ
         p7/PrH2mH3HmLHoQ1Q3eMHbc0xaHZLcT2qqDOuNhh4Y+/BDE3yqPM8nKyhUJqgbUT6Br
         CIK5hlhfGBE19Mq7UZMDLf44oRmlZwm+YxP+48dqw+1EaycBm9jY3hfjBZXoTILhCMDk
         Z3T/xlRtoxJaGxJn/Ktpl5zUqhY49SfCXuzKaEv3UAh09DI2meg9rRdB3lpE84WFEOmw
         auPg==
X-Forwarded-Encrypted: i=1; AKwUvBw086VJbk1r61sKp5njXjdGN8DocB4FMSCNkds6kDGfju3UDM4+BSsawVLkAWtd5FWndbFJpUWWupY2sjsVrl/+@lists.infradead.org
X-Gm-Message-State: AFq9FYJgRUY+MYIf21p1e6UhQXtsVSEAYhFRCMSvYsEdTruDOVTxVgER
	SA8kBL+Mju/snWXHp5Pk1QCKT5jBijXSg0MOp/rMzNV1IYSH8N+XxIvKt2JHFV28nFqYjezmBM/
	Gc8ST94p+REfTZUyOmh42CDkmDc4ccLRHC4dLtSoiSS7D/tO27FSzKs+m85YCzFUVY25de2FTe/
	w72A==
X-Gm-Gg: AYBFou0pQFcsJoKDqkIFJ4+CCMfQV9VummjRFQ60UZs9w3wZWL09jqv/HAFZeUfAHNp
	ZviuFubWCdvTN6uE6c/nc2xz+se1ojzx7ThfRJ5Jy2ZzLUzs9D4Q4t3s66YA7wvdc9Cy8vrjFoY
	49R/oAF7hHj1zV8tmRerzqqTyO7gvd4M+xHJcyb0lsWWAYcdir7grbmYChZzhPohNgFm6TSPB4h
	OjjDV8BjP/TeswwNVMNC6ZJJHmbBaolmghpdp4ZpxuE7vBcr1WiNWxGvgH76JRjxDcUOWRhZnae
	WKJPHG8WTxl1GKjs+54bdEPv7fEYCrSQ4NMqLRsFJnGVnLrvpgfDFJT6ELaHO5nj22QNEBtRUcu
	bu/qTF9GW3881eTYTB91tlauwGofAlZU/eEFlI7c55XBTgWfaGVUdpmIx8muMgesKoFdh5iiRF9
	SOtz0J0u0orHb2
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856690285a.13.1792762834317;
        Fri, 23 Oct 2026 06:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856686185a.13.1792762833809;
        Fri, 23 Oct 2026 06:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:49 +0300
Subject: [PATCH v7 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-9-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OtA5kQaJAzu3uDsBpPRilZ5f2hkyP8+qPHe
 NeTG5AI00KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrQAKCRCLPIo+Aiko
 1RI2CACg5pQDUEeajZzHEEghd4rfxKwDm4JgwgS9OSplIDBiAHrg2w/55A4G94IWULDp5wDxMxc
 jlgkqR47eCTeNzA2l6yZUkkMMvkCVWKhBM8U09/ys0hiHXYUW036cBiTAsb0Dj58VFU9dRl/R8+
 abZrn9cWVIKIHzllDpGW+CiM838Koz2EgVRrFKk76B1j/Rwx3fzwTPICryRsDzdbAzliuRvqaXV
 O8Vvtzbw/1Z+5I7/WE9Ic24Yk8xBHdCBSoATwKaz16mXwtSI8XwYvM0MQqwwSSiJ98d9mY7UwAo
 LfRTAJ62c1+UgsjyAEfClwnjIwik4AOmFfFZQCmJ4l6CZhuc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KN4NFiJTpoal_2ohdVnulxyB6Y_zCTwb
X-Proofpoint-ORIG-GUID: KN4NFiJTpoal_2ohdVnulxyB6Y_zCTwb
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb63d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX/nJ2nK2PImwp
 DstWbuxRw8diwHU+BPyHGIF0vIp75KBY/8JwedN8Qp4fRKUkMfuNtN/+737uThVQcD+fagGQB//
 0zZS3QHHQZ+MuF+VxSFMzXDfiYN7Ma8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX+TO1WW57H+21
 caN+rX0bo580QSP/ZM+L3qjFTGzHo6VUwMAp2Gu0T/fz/xQD2K1/OLt9Gr4HTx2gsXs1wv+cSzl
 9aj4cVj3lBqqy2opoKA44sz4OFNT8REEoIAk5U7Q9+US9js6mml7TIfYcnlDg/nptZoMz1YSk1b
 9dUvyjPQ6rKC1ydI9OkDTF2po9NVmul6v84/W5P3lmb49VhVXnc+JBc56z/7DA+zA3L5AALe8dm
 4ruwKiR3OD0m/TNR0MF6pNMOIZH7IKgY5zyutk6KmHIia/SUHYU1qjOOseS2MvHV6VXihkCaYIL
 s1A7urQySVQZeY3RBWCSSY7S10AsnrFzsW2Rt647g9RAvz8cZJSnywzUMYzg2y1lLI7XLFEuoQi
 3voPbrq6l2Jf0YN1indw0GTdEbRl/ekS6DcPrtYJSrxRGpZ+OcSFVj4rOPu/QlPgZ+Bu2e/ZHKY
 /Aj/fJtMrnqHJPlZbSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144036_849236_8B15C943 
X-CRM114-Status: GOOD (  13.98  )
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

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


