Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20AF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZ8sPwW0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CrJaCLkU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UE5vMAOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=iZ8sPwW0qZsa5W
	2MbAUTGXGbIlli7PzYVY7cNEDywXRU5GJrXNTa2C9V2DZi4DT991kgjnRdRDr+51CvH+0xLEasqUx
	vPzyyZhFQSP7x4tvlThQ8kTZHkUvZgGduEQH3geR+I0EyCdG56jQpJMOSJPSXxE25qwsCjgoFksYp
	LHk40882nCjQeCEQO9ZJ8TmkjdaY0RhOyXGki1Q7l03LxDCSU9X1mpdHRy55TxYfzEwdqNu66DqNa
	WLRAYt7YcQcz/6uabJ2fpPeFYsMx5TSamMjqXgyNOy/vnLOKb3Gx/5vxPbgKz4lVzE0BpIkTYiBQp
	bD45xHAA/CEWud/zXiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkK-0000000HGUr-0XH0;
	Sat, 24 Oct 2026 00:36:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk0-0000000HGEH-1zNa
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=CrJaCLkUM2DGmrDKkeYbxssV+W
	uYBrSsVB6YMl9rqhqNI+n3nwBElNMvJX7l4lBKgtq3naA2AajjzBWWFR5Em84ifpJoabUJ1p+E33+
	HqFIFO79D16+BRwUFNOwAU+EGli7szheEWfitpUoOTXsDjjfKUcRMiMyvE+l614jey9vpAHhKzFcH
	8yxcOagW5bi1GCJKEu45CguyM51x64xQe7ElcpA6EWii9MbyELcZ+nYDUZMOfakhRMo+V7nkrKxmN
	fYAxN6SX0uyK2alLhmvY8KcQsIIn7A72HVjcz2j02qgbTWTO9Sj8UKkweGVGEOfenwffpRxrpGsyg
	yFTZqjmQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjx-0000000AvMY-1JDN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O0JxxT106788
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=X5PXkxMLShfVuQpn
	RNM1czD4Xr9K5BPvqE5YMV5/fkXBKuCvX5kaFmCAc3N2KE/EOAGeT0pjYdZXlZX/
	4YbST8blcDp5A2NDlKMgOJkd4VcJZ6fwWHJwHWUXU8zRTVJqrdIM8RjHeWrhU5uP
	SfOj/cTcskr9F+dxhn7Pf7EAKjRjMmkRo1x2CU2ILKMvwptPdA2kn8Xy7hQ0dnxN
	lZbDddUSi7av9O8I6waKW5oZZA861JtZbsDQrJqS6lv+G87HkfOEZ1meQvOSAb7j
	AmbSPuhLRvG5atn5Qaj0U8mv+QzkdHMce5ud9yuUevdmMhtU8wQEMHgIQxa66Wbn
	Z0+ibA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1p8147-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so258138485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802163; x=1793406963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=UE5vMAOczpm9E7t5qSirBZ9RcsvMoRvfs4Q4CodNrsZU/GLVu83rOcLYAZQOZjxdwQ
         HIzZWXNZXpDHF6nwvswws1m7MRxxHmi3CmY+PKgSbS5/Nq8kEYE7nTQcO0Cjk/ei4EAw
         IVsDwG+UJizibdwfTjmKXaHBgz88shSMoPfmKGy9tmgZrZJ8bg1IjOxl1RDiHybX+tJ+
         9jwAuSgzhwzn3lUdoPNMcbbATJWCZelVQ0mR5ephWMnmdl71csASlfWJuFyLUtLyMvOy
         zfhfovAoL1+DEms1b1DeP57boZzXxlKg/nD40ufIm2ci2VPlRvIhaGvhIrX6vky0ZfA6
         C5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802163; x=1793406963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=KWT6i9P7MC2fyX7PauSne+vSyAeBLY+PJ2PiWbJpQ9sWPtbtvYWsvoLplRpc6LqGtQ
         KJAq5IyrMzBJmIImAZYQtzZOVu9JyZO8BNl+c3Ub8zKPszjw/Q39XlTjkSAfKm7KEqLK
         DSp5vEI8zxnphENM1enc4JtcbAsN8xgkh8mOXinv8fofJBXWAdjyh4XNDLYa6H9AM8OZ
         4AkhGSUo0Dx9vqtOa285lDDCfRdcNr4toXB/FTpPaSvxOetgAIMbpsRG7D80YXnp+DVK
         jU0TeK2ZoCeaeZRZAuq2Oz+v+huU1+CBxls6Kaaz2yHkMxiipXmm6R53O3UvlfmDGgM2
         rQXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL6todnEvvG8uTUu7t9CLynwCKOp2AyltBvPLqxC/MQ3Asc0jsKsGcjxcQ65eM2nh6xakqS2lxCWJE2UnDQE94@lists.infradead.org
X-Gm-Message-State: AFq9FYJX+hWgAei27gfwXAREtPcOmLauCNZScJWu+3cH8o/27ADyT2un
	9EwqGMJnzq3HRbcbuwe4cU2UGMtTvCt0GTTEekPfEC5Z4yd0HEgzcctEWwbnKmNJGj2ToqJVPut
	/LywvFqHw8jKAYXez29WBSivXCoYShFHIz+FobKCoEVBT+gbw4sw4dmm/9x98j5WWceDOe1tjFv
	+82Q==
X-Gm-Gg: AYBFou0ztHX+FUUSDsj69qI3WuRD6aqSbuC8+taIVrk6qG355FrSUVWKDMSSNY8x6yt
	rV4Ka1RoiadZR2w02svgsCaXTfYaW4bu0fKeV58gZp1/KtLjVAFHYoNK8lnpj0UPZHsW/fNjNAe
	wYJe1+UwyHQeCq2rVWb9wW9nnwxKhL2OEEYhlUjF9hypdozbhs9JnSIVvMw7oiZX+ofExjpfK/v
	+BxkF6b4gONtLiPs50USQaM1Hq3jgjNc1j7KE41NalGQ00eDuE8K0/F6c5U1AzHoEmEWgOlJF7N
	QZHhBv+J/h36dSn5y6hxSxs+43tyOCsSMTXgzErP9TN4eD9Fy+ewRCO14vvXxskJEgjK8zlIUdC
	gX8Hi3JXC6ZNjvbuXljBBnfXZ3dJlp8BNcW+D25s6bJg7rcxzUq63zweX5SZM8zheh9HPt0+d5S
	vR083P5MFe9Gba
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109939985a.46.1792802163155;
        Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109934285a.46.1792802162668;
        Fri, 23 Oct 2026 17:36:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:22 +0300
Subject: [PATCH v8 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1SgHKkiJWw2Q/RmkX21UPsNJT6d9sWxsWfN
 lGk1cDfUG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UgAKCRCLPIo+Aiko
 1abQCACx1C1gEiCjh/JA22nJY5oMv2sH85fmApV29ur3ZJHiuL544WoNV+08rQuI+2s1l7u0BfB
 pSH3B3HC6A7rQlqhDPIA2ruMLYYYjriz6QSC6lw/1JonyaVTNNm8xvMZ/VOSDO60jZpXprD143V
 EqlmhijNpaAWTY4Echcgkl1UjRZvVlWDS+tyd+BfNjvz5PIPoLfUR50gMU3moSgcfAV4eIbHFr3
 LQcvtn/0yLkoo4o5hAATZZOchduLmibkjvq2qCB7lkAlkqZMg6CummmnUdc3zBbEqljwccC3sPw
 wbS9DfpRqegDI381OagL0f5T4ASlv7jgolH3vPOzjKcXhbWk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfX5TAwzP465GVl
 fdBrb9SyW1n7LU+QapcG069SBbcv4B5lGgl/N00dEGklosHYDBSLUap6V/hxvDm08zT4xfHxC3Z
 IYS6tiuMHNHEpXBLslHs07kpde1U704=
X-Proofpoint-GUID: 03kuevqhJCdapFUtGANAKN526aRaAknw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfXycdMBV6yi/JW
 +p4vrEh6HOWJFBoQ0iLDhaswMgZdIgicUkUpD87Soy8HmTsbdV8e9GpLOp/1e1hwoQqHLfi4PD2
 P3M4PzA1JXgHFitLgCGJ2JtRFpoRwbBimtfsPJZ2ZHj87jU0r8vwzdNuURnJtqpYjhlW4/Cg0Zo
 e5QGvC5gJibph5BuLLL2KiGVdzaDDsfnIKDdzMI2dQ8t/svg2gFYv1wLKdw6BJ8xkah3CeCsATW
 Vx0J0vcs2YTrciT1Pzg3yYJ4m6MGOKAt5BkeA7LmhiR68q+zrlQncoUmgvV8RysKhhgh2IYJ7Pk
 m6nvjKU+8A3dAtMYS6OsD8qp8PpWNJV5X3d+/tIDLyVuOlrc2N7kopdSFEPWZwgh9cbiGXhueQO
 0qZMjtwpMUDMzZQKY295VJH4JXji3uHHbZHjvgAbAibyZ0B14B+OSv8iNtB2l/phCjL+A7c3oC4
 FJ23ayGFz0GWjaFaKcw==
X-Proofpoint-ORIG-GUID: 03kuevqhJCdapFUtGANAKN526aRaAknw
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6adbfd73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013605_616658_8D9F39D5 
X-CRM114-Status: GOOD (  14.66  )
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

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3


