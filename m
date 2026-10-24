Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mcCA1ixO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kuuBgW6/;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTS1hJqX;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAAWh1wC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=mcCA1ixOltkJrz
	i7/8Ylc5FTpaEfTxhexzyTSJOaLJ6KD7JzCUMhKcu21ZOK9q+/qp56XCkrIgIn9f76LTLZ3+EXFab
	FLxBnmH+bYoxg8XmYN8OSKUls0MTr2fD913XYBZEp27yNUpr64+0nsTBOSTI8J3rACAkiyAO9wPhJ
	uv77KANwNuhT20SeXDjjhZ/m4WfHQZ+wP7B0D8e4/7uQ7+tJ5z4GLZB0uSeNPtUS47x1qrvpHliMy
	ZVaJCqggtFx0Ow+cR5k0Ajg1CxJrojd8vGERT4aJzWRuGOwuc2iZcr/o/0HkUkToHZecXqlAHIs/v
	6uURYdVLtB7M2iANyaDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjn-0000000HG4Y-3uyX;
	Sat, 24 Oct 2026 00:35:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjg-0000000HG0T-250f
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=kuuBgW6/09mydC4odX/fcLrnD5
	1W9HcREY5HLeZqayPglY83j3gyoCvwEYkrsYS6vXy8OCtOYLXIBl0WJ95bBielcDjod4RwF8kmUVh
	CycTlCtI5Zf9SKDwDo+JR/yT4r81ni1bEQNAYc7uCBm8KA3oU5w4x5UPy+FgWuRWdhinBCYbP1C9l
	OZnCoyFo9ZD+Ujon7au2WNKKBu34ta4KBRPZLIp9wMOGNTA5TlROWJ6fP1//GASkEsR/lWRkICMJs
	NzsPOwGRjCK6HPN1ST6ZnokpD2d3/dwxHg77o1hMG2aKmFLyerY7unq+0ZKpLL7oUIgRi+5CbcuUO
	WcJ900aQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjd-0000000AvIO-0TNd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuwP4885846
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=KTS1hJqX0JA+t+Xe
	BRgpxgNRIrxU1ob9bqwpQIrd7Heyp8U5wSPKQEwmhmPfxgaLe26ebU0vTRz8sAZF
	fA1fEDBwMfdQoYmPDhP/4ja/0AQDQasuKasWAnRBrulwRP4rRIzrn0P/6aKrMGKc
	fEIi3nbo4iNHHL3wOdNgEe/t2uEDJsTlBTruqoJqwHPuja2+luriq0F+hMsKOuUl
	ldem8LsDoRJfwY+I87BH20IRBUNyBd1/nmi0yQ8+3QIBXMoUTxy9GMLK7v8efp/D
	xyXriPRqx2ds5pteyrcBd2Hx2x4qA83hcpm+xJ/OxMBxgq1BTdEkcDMgEDq3L6yd
	85X00Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw2du1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso505344385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802141; x=1793406941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=eAAWh1wCe5xwg6qWs5zaHpxjWGHrwXC8yr78xQ46xO2tLPRvc/i0/y9FUFYcP3vg/N
         huGkCt1r9UBOcI49r7slrPdSppw+qYuaNv1aB1mU2wrpK0H9nMl6oKDD8dGOp/dGQXtT
         4uQVtXb5liEU2pV7W5D3qra7UBtk6j0tvNodcDoQRKCJjAjnklZSWN3Kj2G85q6FZjWf
         DSok4GNWgUPa6PkMUZbfWGTN1sYBiukzT0Q4mj0rm9EWRymrFGHw1zNZmoPAbs2R5hho
         S0nGMxrFl6M8WnP3xKM3kecRgW7u+0M9cOc2+CywKeGVJwQF1zD/l+jEyRZCBFOI+Vzs
         hu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802141; x=1793406941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=oA4BBZ+nCdCyLMObraLSJJvk2nqJlR9qdVUio7g0zkAZMMtPuvEfI0sLHvVtVRsAni
         IYVLJt5h+QFXjW50j/Rcyxm5zLNAxaqgMiso4TwvlruEiu9MgahE4yMOPzxENl88S4ZL
         J+yWWndYrxNoGp7afdOrcDnZcfxdaZYCnDnFkOjFjjaNceQmgGJxXh9QWnyvpM5dleYn
         5RIJFDAR4BNG98IZO0vEz2xrJm+dtKTIteyRnLjHLm9IlVCfBKNwoBask/KWnp5M5F+B
         iDJI7UG3JEwvt1p2oxkAS7SVUlpkskxGLCIRye41gjtzJySYfN5e6VbC9YFkPd1qahYi
         i2vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkfnaJSkS9/98z5qSWwM3JlmkdgtIA3LNdYHyvCwg7tn+mNz2T95m9CpiBdj1Rk+fDmkbLSdSgvoKafiPI/b14@lists.infradead.org
X-Gm-Message-State: AFq9FYLB6nQQjqBUVLgouUr6warfLcrBgmvh06+rPNTUMOimYTJI2Vmf
	1dDDgMKzseypMGVk5o3YNR4DV3eOnXCKfLcJjvRIjYzC7tEazcCwhpnar6edJKxv8eh1SNWDLVh
	6DAym0DCSO9pL6vQWGEoyNqX9hn9BoZ0AAhVGuw29uNHPy+wBnqRjvjhZuJ0gbDSUNXZnrRLnMz
	y2jw==
X-Gm-Gg: AYBFou2CjrHP3Do1TpXaD/w1sfv1V/p6CbuV8RjgT/sEhU2A3zv0HvvhLJZf309YKo+
	1HK8/lAEX5OUVvskJkbEKUgzLOPg3I+pcMeNxSvIjXIePTXNp15mZaHNuBHD77tbk6Jin8mjko3
	gNwKQuK4oTzAUI3G7zSkbV1klU7eH933RpxziXkJDAwupFMjcnKguhTn9iHZzoIPE/aVNotw04z
	tXi0ny2H9T47G7Nr4WYuIS7OQaIK5tOrfDV6xFilYwxOs4TotW5n43RBkLiGi0EDscLevRTmA2D
	X+3i1oVDVTK0YJLnv0okWucOAuyzYAt/SgCo/Jt9W08Rw9jHw46GGM02pM+G+l0npNFNzlgIw3x
	azSMAm7TtH3hca+qZNm332D6s3vlkvHaVcF6FxYBesoLMjbEJqZqZstz50Yu8UbXqNDJEXvfZhj
	x1FLNVR7CCbgc4
X-Received: by 2002:a05:620a:640e:b0:93f:4498:603a with SMTP id af79cd13be357-940ef9c6529mr87941785a.35.1792802141249;
        Fri, 23 Oct 2026 17:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:640e:b0:93f:4498:603a with SMTP id af79cd13be357-940ef9c6529mr87936385a.35.1792802140729;
        Fri, 23 Oct 2026 17:35:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:17 +0300
Subject: [PATCH v8 1/9] drm/connector: report out-of-band IRQ_HPD events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=saKTuWGNmEwpJovWRzupqEzCaC/rm4ThXYLAzUmpGxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1OZLtxTLAZE9k4mLMRNIgX161lmxb4HdRk0
 KcJoRJVqumJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9TgAKCRCLPIo+Aiko
 1QfdCACr3U9nCjMaq7hUKcOJFW/lwp+QSFlq+SJzJzYEC0uF+7jmehgYxVVCZD0duk0mql8OUOX
 LEGEF21qooKYJ/ETJrLR8Ri8OqLRF5V6MD2geevo0idGhk8fqsh4rFCv2r9gTycRlFHIrA801XI
 1FViiDW0PEet36tSpbgNjsyvrBrRd4KGtMixDGBl+IWnsOHtjKqaF90KcXAfBzQAdMS4Y42bVDa
 ixdEW+I1ZmP0dGWunCuRWLcCMm3WJKiiS4plIQNIeTdoBvsXjNXQ5/jUu8GgxAf+gjCwpxWOzdf
 0gNslwwifuonvwbCN0OAdBOePzurGxT1myve6bhIuaze/Uta
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KD7sLo1N4IbQ8h07ZWM-jfF5idLnWtR6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX3OKQ3Fsvx3dJ
 EuH6EmHtR1IUJMZ0yvk6qxsNPZZ6pnauzF8ndj4sHpHl24/G7SwaHB1iM0GqtamswfCSCL441Nv
 7nTuGvxRNyVKJy0YHSBRdJ1w2ekMnm8=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adbfd5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KD7sLo1N4IbQ8h07ZWM-jfF5idLnWtR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXzQRBcTiXO0Du
 2tQbGHb5/HelXZPc9vabYB3wvwu+b4Mk2hop5ddNIrIiGXbruNbgt7Y8rWqhkOZt/Rcv2HBpJOQ
 4HTtTxMgtSb2GI3MT4g6YDPRSMEfyt2U+HpecMVMJoWJYCqNBkAkmwtTFUUcExV6FUYfyw9QGjZ
 UWBS5uB8A8Zp18ieZolFm/s6av2yOhqRYTVToCYY1ovrvW+ZWBpQEki55zmuRMxcJjUhBNO4Ehx
 DyTXnGRYbuZ/FE2SE/9L4H1MJ6/4l71Lko37HS4mzzJvllToHyaoo/bmFpZ0bBt/DlnBOjalKmR
 +KI3cP75uUh239KhatMmbXOyFzHbnvFQ2/RvvSQiJ+Zvce9lghP6271M2dmnKiZMNDzn8184dTh
 ywHBFp7V7V8TReBppRBZDyle29RUO+2EChgoMI2/hMQRmIFcXsUqCgtBQhb3rrR6wKps49D4Cv3
 CQmC+eOjw9lB2Frskuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013545_792463_D27C7803 
X-CRM114-Status: GOOD (  24.91  )
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

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 25 ++++++++++++++++---------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..e3c8181df6bd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3821,20 +3821,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @event: additional event reported by the sink without changing the HPD state
+ * (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector;
 
@@ -3847,7 +3851,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..2106074417d6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    hpd ? connector_status_connected :
+						  connector_status_disconnected,
+					    (hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+							       DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+							    connector_status_disconnected,
+							    DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_disconnected,
+					    DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..4f65c97a89ae 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -92,6 +92,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_dp_event - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_dp_event {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2848,8 +2864,9 @@ drm_connector_hdmi_scrambler_supported(const struct drm_connector *connector)
 		connector->hdmi.funcs->supported_hdmi_ver >= HDMI_VERSION_2_0;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
 enum drm_connector_color_format
 drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);

-- 
2.47.3


