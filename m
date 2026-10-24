Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83942606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ow6f/pdx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AWs++UhT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV1X7e8Y;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0woxbk6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=; b=Ow6f/pdxKjxz78t/qN8pG2sB9P
	LmZk/OGGHunapmI8YJY5+zgzzZkLao3jbB0I/IDSmK769XAaQrzxb5nCA3DTivCnIheJtVoVgmAjZ
	Sm4SblC6Ivjjcp8Oby4MCtmiOIUbHO6EElniYAsg3ayKWz+SmoB6mhKhTwOXN08tZf9xPtRXT+oHo
	BKa6kd+6Yj5aJYQB1lQUG0IQSm5jfK2KOGRzD2RzKcvFMMCduTxz4UB73iURxvRBZlMdsJbLHejx0
	SjLIqQ0TFl5NmAS9C+2S34qYM4nGoCTbyQ4dNsLMfjrHMbOz5bAGbFMqqTTf2vQZeSyyuDuEDP0a4
	s8cRLZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPji-0000000HG26-3Nqs;
	Sat, 24 Oct 2026 00:35:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjf-0000000HG0Q-30m4
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=; b=AWs++UhTng62oBWN98EPuHaFiv
	q58SRnqMejRc87fzKlTQzru7wHD60rOXiYSFnS/riF/xjUvhR0pcht4aQfxsRyk868MDmkdci42Zh
	PNh4dl9YZ0ieXRZqa4YznSlE+54BvybeuRrGsJHhv7jfNzjMyJ1/fTBCUYOJaUcI7EtpwLVYtAruV
	RZKnvtGYBD/vaUx+7mMijrOmrkgv46fv6q5ibAeYOXASTDAciep4/cZI5Vh4Krpxe/R+05qviKxLw
	XCoRlLr/1A8SvNU39mUSVmOnYg16i5pmYDNORrplwhQj3Ar/Rr6z78b+bvD2C6STxpTCCnXrG1Y1h
	Iej7vaiA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPja-0000000AvGw-0CaM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvPpJ2963989
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DUaa2wlIXAwdRHkconzS2i
	tK3kWYEvU9w8eNOhhQ0hM=; b=jV1X7e8YMqZw6ch/Q7ap8u9m0+lOjPsQuFvRm1
	A1S1qywx16QPYKZYOc+af1H9QxeS77iCr96cez5DeJ7fyL/04GeZCeaC0szSaT46
	ogdg81DsnOCiOTpVf3bvMG1g6G4JIQ3ee8uMBoAK2bLSO020pfWIYdeQ0CR30yBT
	cA92iaa4Cu0Uc3pTOl83edB6PCHlg3u4feE9yRxi6Wd8Q1Iu/6IXE6bi7YOEn6Jr
	BTdaLtAsEb4Tk5fNd222U4dLBfrSVOxQirYso6VQeoYqmbliK4+JaJ0XXcIlK7nG
	OdphzIBBWzo00DN8t2Cf+GJ3ZBwCi/aD40bIFNhA6WDKOzmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9hnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso279213885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802139; x=1793406939; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
        b=Y0woxbk60D8QeQ5HHoX5fGzykOfymiv7SFaaVL3D6J6fY73EuK7DM/xE0/M8UxfHoY
         35nEbUa7VcNH6/iPIXQ7hPYd697RfVzv04edYs26uBzMRA61yZLbKl2miXZZFiTm0bcM
         wg8qJZJpnSfkVffPBxIzMM80vyGNL5Jx2n/vpRhF4J+65qX+pktihVRoE7xcxXqfK+XL
         vgFKos/HrwjwNRNQIsujA6O1Ys5q7w+r/JkWvOPmliMZj1ezF1J833tiAEEY/Czz2z+7
         mdQDbsHnjac90/r7CVxbS9HsM4lsml4H1suYPO+qgYQH1d6L4gyLav18RmacJBTAFzdK
         zECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802139; x=1793406939;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
        b=yo2iSyHnJ3Xn4leQPaTKj2vpB7bTSru+dHizWkhMvuYXciiKgQ+3+P8oP2kjHiQpcG
         MV1VNj8KOXGS1JLUKopDKtc1P29xO34MF4WRAZe94QK69Z7GZ9BFGCsPKJLE2kOAvbk5
         wi6ZMd/4GxAhsdjP4ECRTxbiHRoMCQ/rYRWdfFDFzR9/GPOCwVLg/vP63noUND9UsgOF
         8fQVjsnyQkqnMuuak+QAMxuHQ/QZnCC/z6oaUGPBPIcSBHF9m1U5VoPCDwZ1/DweMq88
         8dixM+M07p8rtNcpaMyu/nUQhCzEiGpc/SNIdx4MMAQ+cESNhOunpbLvMz0HB8T5JSMV
         mDiA==
X-Forwarded-Encrypted: i=1; AKwUvBzLqNc6p1AKTd/FNcHK7ua0f6pN32Xk2zDJqldqSJ9zORCYm2mbUwep3laMkS2sQRy4TizfkA/SFs3lzyZINWad@lists.infradead.org
X-Gm-Message-State: AFq9FYLMjffHF1o6n40QmWhicz9Yt/omwaBz5MjLJTJcj32d7o9q2Aty
	KJXHZ7HNbxvumQY2AdklnD/6ZEjYQ3F+eX4f/njO5g2r8+CQ+chYYcIh1nRM3WQ2k9uhNigtkYM
	qiYGWyThPsCCLLvZlMwJ4wXQx9+8wpqn2ECvsEqby8RsldbMYbdYYeZBIbo/EYr9+n0XieLH0sC
	dHaw==
X-Gm-Gg: AYBFou3zpLLMhoh0GziohMglm9Yfphfu+MeuV4zYxxoGXjyBlyxOgX5AolTEsSt5UcN
	JeYDbcsg83r20oj31tF/cwBzyH6NMqJtKdTnNsBgvr77nCg2eqd5Kb3L+LmCaPktLMz680oRLrz
	1HEu3GVwECxkTjqen0vQHhGpfEGYUWLe+uEEYS8X9tLJMYYAoKo7myFjpkBiTE4cYdSLmyqJGrm
	QEJvPzwiM0iKigNGtkdghR4GqZD0lk4sQxykX4rfstuIDFCqxETFrx/TlTqfPYpBGrgbWY7obkn
	JP+Lo693C8UOCAPosKixzM3Gv2PSPVmhX2YdFLPGPCbIsQ3Z5tEFfwAJ+NvDeV4D2IrLXlBt9Vg
	kdtBgPDS7XvGKNXiN/Ev4P5/ha6g3WAwIpahtRVUsPEWoQWg0C4h5LPQUFhK3nzk4MpyI8iHDKR
	cRslDBFx1xYjDS
X-Received: by 2002:a05:620a:8390:b0:93b:be6d:4f3e with SMTP id af79cd13be357-940ef913ca6mr127359585a.25.1792802138477;
        Fri, 23 Oct 2026 17:35:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8390:b0:93b:be6d:4f3e with SMTP id af79cd13be357-940ef913ca6mr127356585a.25.1792802137971;
        Fri, 23 Oct 2026 17:35:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 0/9] drm: handle IRQ_HPD events correctly
Date: Sat, 24 Oct 2026 03:35:16 +0300
Message-Id: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAET922oC/3XPTW7DIBAF4KtErEs0DBjirHqPqgt+hoaqsRPjW
 K2i3L2Qqk1UxxukJw3fvDmzTEOizLarMxtoSjn1XQmbpxXzO9u9EU+hZIaAGpRQfHcIPA1HThN
 1Y+Zk0Hkw2jZRsPLpMFBMn1fw5fUn55N7Jz9WpU7sUh774eu6cRJ17hfX//FJcODCOhGFjw4dP
 vc5r48n++H7/X5dHlZ3THinIMwULIoCjJHQUEvtgiLvFTFTZFVUQBcVhOiXuqibomEzU1RRJDi
 NTspGbcyC0tyU9sFFTVFiFIEAWvBmqYv+UwQgzhRdu0hDVoZgrV5SzL0iZ4opSmOstMWJ0NID5
 XK5fAP2By6daQIAAA==
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
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
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6437;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tc/V3kY1g/aFDuKXC2Rr02qE2Mq3jARnBUYzK+yIUBM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1HQty/fk/GhbBTh48kUr5wdSBht1C93PaEf
 7Jjh5065T2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9RwAKCRCLPIo+Aiko
 1WcFB/4yLkQEreXYZW3IpFJoRUXl9AKX9Bfugvanb0aEWQZqry3VNesZSHDkrzzQyLiL9h7fipD
 XhmBiAwfdiPRHrBIMZLAbL1lRIAJrMnG258DCXsYvgRJo4Jg+Qy8/BWS0/jzLIZYCFMH6NSnHmM
 QkxK1AIzh9aZOWyGavyIAnO7ZOym0xJCF4bXN5UQt/LX53w+eL39PV0EVk8g74r+nA/LGlZQSNl
 ikd7WflMdZi2IPsVHq/FZRBL26Uq+yIVpnUitgG9CrlokjeAAcnA5+A9ZmJQdNhjRfzlQ/lbquY
 NR5PUToFTZGy93DNBzsboDt+ujZaMTyi2bjaDYyB1Jq/uGD7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX9SQJFff5V73J
 DBYikJFW9sjnf5AyRPDqp6DSvHmbBSw/VAR8Uvz99UINgMWxEB2tCO+FUT/Jrx9jeHSIzb+RrtS
 jdNOfTF9xp1QlYnjDYenNsmvphU3RRy5tZG0ch7Y+rOLRDmmYplqf09O0Zy17ueccYPWDwka5ja
 jVxqeSnA6waUEepmGXLRMGTij+48s/82tjGK7bu3i5qzCW38v/2vYNOP3jS3g07T3ooS0ID+gri
 a+W0jQXds0zUUlrVoW0G2aSBSrsYn6EryNM7iCE9ZGsqxm7/npORX+FgURTX8X3VV8mSU/46mls
 bb2jjPhrKZkkmQ3NmkOT5vm64IN6ZGiVSqlL8VBr2aekN1IGo2R22CsUqC7QqXK3QuaTOtxe7zh
 BNlKbWB7zBR29t07Qiie7Mfll6H854g58OAafQaglZHIiBBUHbj9ZDjsXztW61ow6F/Hh0CPuil
 s9xtdVAa0XpKPIEkuKg==
X-Proofpoint-GUID: 9nknyP3UDGCy_afov7M2yfsBA-zkOwGU
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbfd5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=uf6nnPeBmoxfmv3DkCAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 9nknyP3UDGCy_afov7M2yfsBA-zkOwGU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX7585KF7Uhu4S
 XSbhqKpoGEV9QDyIBCwBGJ+NzuJC1nIeCAYgLKL759d1tY2yGYa0GS+K1vaVseu2LPfLhFaCXXa
 Zcn8jcWmGG577ZQScia6IRoecZiaaJM=
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
X-CRM114-CacheID: sfid-20261024_013542_577348_FF3A2174 
X-CRM114-Status: GOOD (  19.87  )
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

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v8:
- Moved the OMAP DSS HDMI5 chunk (Sashiko)
- Link to v7: https://patch.msgid.link/20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com

Changes in v7:
- Fix build error in drm/msm/dp, forgot to squash a patch
- Link to v6: https://patch.msgid.link/20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com

Changes in v6:
- Corrected indentation of args after the function rename (Chaoyi Chen)
- Reordered / rehashed patches to be more logical (Chaoyi Chen)
- Fixed build error in the OMAPDSS HDMI driver (Sashiko)
- Fixed IRQ_HPD vs PLUG interaction in drm/msm/dp (Sashiko)
- Link to v5: https://patch.msgid.link/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com

Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (9):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm/dp: don't take extra references on multiple plug events
      drm/msm/dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 12 +++++++---
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 25 +++++++++++++--------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 20 files changed, 158 insertions(+), 66 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


