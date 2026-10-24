Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADBC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J/7065cy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fX4fkvgW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nitdk4fL;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KkUl9qV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=J/7065cyPhbrgD
	GngidASwik4RqPTH6DGl5ZXLnD3tm/YFBRgLOlK44U/mxgfgs+YIv4f3T79SyAvjL2s9BQEuivkJj
	qyUAdDFEBcasRXEXzGXNeoWTIgGhhpCgswL/3+hoV5m33V4ZIUPCDgUNUk55Uar5DNSpgWk3/bJmo
	CapOe56DyazEbRfbDdUKq6oGGuS8IB4ol0Sl+/SzlpSm51HajbWMnmDQgslBGT+obmVLT8q+5vGEB
	ArTsqRb1CaPJ+EB6+hWqwPW/A9+EtZZZFuRaAjzXv1w9KANiu2NVITEM6ivyDUJ/sWfVG3MzSeahW
	4EMiRBfrcesxDZQqn/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkH-0000000HGTN-1goP;
	Sat, 24 Oct 2026 00:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjx-0000000HGDz-2RhU
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=fX4fkvgWYqYPvpzUzqdKosqKCc
	82Dk5TyazZR0cpxiOclhbvgKI4dXBvboJH6NqRCRHzdXoEDJTu8zXPIX2GkW3NtK557P4ikG9Xq04
	T9bIWTLOyLcafhNpsEA9XNVH3Lx3DoY68Nb5jKsCCoN+B3DBJPGpaECAmkG0+2V8Ti/dmZYzlTG4J
	T+Y1gqzZrlYMQnB2WHmjRKw5UaPyVEygh5KwtS6Y+GhZmShVyNJQb5MANmqW0/BqDkDvyjcwG8CLR
	KSDqlbQ0Dw4kX0QetckVJd0DBAtJ03BaQNMr5EO9jYy/0ePTAm3nsixPYp1n4Xd+4PHRn74+5gGzx
	uvNXXBeg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPju-0000000AvL2-2KMR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuqoj877067
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=Nitdk4fLxCYglS5v
	lpNE3xcYM0PqcPyymcS/VsKjtz9XRBd2fGGM+MttgQ23j4E3RvdXlud5yqSlf8pU
	p2DAz7X16VzLG4CZ/eflG8HzWlkYcaXYdZMYdZOqcPOE5e3JrQVm9A9FZ3YuNstc
	zEjksrxxleEr/nNnwQ2WvQC1T+MQ5thCConlrJlwoBa75i3NjcCHvEE3s/myQl+F
	AcL7XQ5TZg54z1WL3z52y2LhJd0vEJHF5BKNlnByZztXx4TETwsmhkmvXYRa8X01
	W++kkmvGBq/6VIhEQ9N9gXjl1cpDba65rBu+hrppGCwYlCAbDG5BIFyzJmbMG0/M
	I3fbTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr691jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso435756485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802159; x=1793406959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=KkUl9qV+4XxiD64RtIWAmy1VCaLnkm+lEJB+IY2ONd9ABLDCCwZIpSPs5qls5yn1cZ
         xtTPweG0OqYUJEsm2fGNK25LYGDZvXFTf4YNCWb3b7XIlKyt6t08g4WhdwiQ7CfHYiX3
         yDlYuwBUIahpJpF08LimCbYR+4DGUGIM64ULSFXCTT6RaGGnJ32cqtUDJh3eMk/KjXLl
         Im/ak1QgHweEN2KeCEQhgf30QPzxgDOsdLin1bAvhQWEooiXLG1dotjiZi1J4AwB8GLr
         Jvp8HbjRFF4eBJVRjX3wtl4ACiPGYhfF3NPnE2dk0GlGfOUBVzOW5qcQQrueLnSDmj2H
         DQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802159; x=1793406959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=FiUGMtCvr+KtwXq8eWpip9gwaQJtwXh3eL5vYS0vrAoG5LmtwPCdzzyylYu0XJ31J+
         rNzRuxHwQbwMqg5BHSDZBQlLO7eylBOMTIkaIunQn9dSjNStc8lzpqPWJLj0i2Y3D50r
         7YbM/qg1sZE1ugOzuu5X/XhVBtNJ5XJhO70o6tX1riGMAjyeajN6FvLopsHRWR3ccSl0
         hRVj+nV76r16LJBBSNvJOYKh8Ij3m2n01qVJTsWmsVaNQmwXGu8uklUReu7pjqN+Hz42
         yen/L8q7vzMx/7FyI1XhMXiKPO8ChobyyiffoD752ICU9pF6llujSg6ORCdkpm6rbbLm
         Idng==
X-Forwarded-Encrypted: i=1; AKwUvByhutzRU3y25e4emHDMQ43mcYLqeAM8UC7uzZ6qouT6EnqxRSuvsXoMmeh7Hx5NIKXHEZNwyVHPYXkPhDwG88Jr@lists.infradead.org
X-Gm-Message-State: AFq9FYIxHvR5HX38t1xhCL/g330Ctn/CgNfuINLkOJMhDYADIThFNV5I
	/ZGL9Jd8MEzg3QML4ELmsTKPSJWvEjfZtCwtEH9Dvt76vsYBT3OB9GPpGh3NI74MyNRRsTaHB8j
	qldQVEWx2AguTq6ig9XZUICjzQhHGRK7W9KFC0VFaZFCqu3kZ9KZS+zh4umZg0n27bFh7ZJYoQV
	G2Rw==
X-Gm-Gg: AYBFou2KG+dO4jZxDZ8qyX+dIoeSjaUdBsBNChIaGTpLQzowCpYaKF7Du2gx18wpkW/
	UpIO5PczbSG8hw4bqrAKiOrFuCWNoCapeLwiVUC8hQIDJbGPNjxhHYPayylenmx0U2fatFRGFeq
	bThrcpR2w1Ll+3bprUm3YJyBPwkjJar9/0OEuYKeWB0SASOdIG6yjw9VsbhE5I0vTE36NoZhXO2
	PdfssXuMablU3Lkw/uOAAhn7BfAfwMXpyt7V5GNOSDb25o+XoArWEIccNq9GnMCGu+O/hDOIi+3
	phqSTYq0fub8LN/JC2hY6m5b+wm+BfWPY1wTakYMCTHnYw81+LiI7C/ImREE1hD1DHDPG5MzNd+
	04EjI3VtOiTsUfLOxiXSNwTxeQExx8jXclIRLpec5fGc52p9CGzsOEr1KrKW6tDY9DhNNl75gdz
	EOEs0N7PbBn6/9
X-Received: by 2002:a05:620a:4728:b0:93c:e83:6ba4 with SMTP id af79cd13be357-940ef8b10b5mr103662685a.25.1792802159292;
        Fri, 23 Oct 2026 17:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:93c:e83:6ba4 with SMTP id af79cd13be357-940ef8b10b5mr103661585a.25.1792802158887;
        Fri, 23 Oct 2026 17:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:21 +0300
Subject: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIcHzWfG5902z+M7u42M0vyUpcn4l5zulhIbCsx30p0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Rc1jx/WVBAxhw3KU26OrNO85SIxkJhkU7q
 NYdX6NMwxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UQAKCRCLPIo+Aiko
 1YRyB/9LbMVmJl7aI7tpQ3jFBUMEiNWDbwwRnlu62xPezLv+SehXjKyLlaYUYq036rwE5Vfn7fr
 fjO6IAXeOJobPd5Ps7ADXWTuF8TK4SEkPazkCfk3+c0JqmcwguNt+U06PIDbhMme9q5VezjPLra
 KP2vD/cNIA8QWyiywCqlwJCKmH8WevIVz1NOx+lxbvjX1QJpGxYVM3sXjkPNBOvimQHxjdbWpNY
 yeNR0ZAJMXAlQmPkYIepBREJkOnaUQm6YNANcZHlAKBfgxog5KDW4y9avHL52SAu/vxpuvUBpni
 T9nszAnpxs5dD5mJCT1ZSn++ImmOCpc1qsnP630ey/8TOX2b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbfd70 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX8mCp4YCw5olQ
 8SZAQcn1uVQ/inGmf/MYwKkhU7Tbpadse5qc15lia2e82TSP/ejt8sz8IP0QlmbPionYB6UqTG8
 Ohhjxa4zLwbJIp/SrhjhRKt23LcyJ6O6e78yXprojn+7Xdcux4zVm9BITRnM2oXJhL53q2+9i8T
 1NA2ed589JWL2+amI9DkaZzV2coEH+uMTF1jOOMk8bd2b4FTujLzsjc2lYZ8+mUyMGeBNJc4L4s
 9iW3Rq+dVYQL8mN7mFXCAUvfQVxrz1zcbHY4FMD43LgSqNTLUjlgUppVTn1CtVKACH2szGOGaNA
 UcvsR4llgqz2GW0kSmFb1ZAfSG7O3cAFFm1HVHIbgJlcGxBtX2y3yDTrazm+vpRqBbU0ZU3cMS2
 DWYWlh65IuEQLPEzTvZ/kPhr0ySOQI5GNYKrA8QwhF6FC5m/6r443UhRFTd7bc9x8/KfEKDFCMl
 M17DSc/8TUsqI1Kccqw==
X-Proofpoint-ORIG-GUID: o1NFyQ2IGP90nZWuIyMNl8G6qYvjJ5pq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0KntUNfd6+Wq
 f8JZcanAyljfrL25zuRcAS0dmQfib4vxR89/3sie04TedVZ5kBEKkFrhNEg3Lz+Dzi7fd4XYAhY
 CqHbTYigHefaL0PlVYYARQSa1uZ0TsM=
X-Proofpoint-GUID: o1NFyQ2IGP90nZWuIyMNl8G6qYvjJ5pq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013603_076207_321B184C 
X-CRM114-Status: GOOD (  19.71  )
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a2e525aa5788..930a03496ac5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -137,16 +137,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @event: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -154,9 +157,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, event);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..233ca885736f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif

-- 
2.47.3


