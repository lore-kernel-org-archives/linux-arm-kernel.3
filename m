Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65E60A6F4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EYr2+Pup;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TxMJRzQF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEVxVOK5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=; b=EYr2+PupBl+nlb/UojDkk0p2ti
	kds0KLhScKFDbDLZyX/Bgbx/1tDXvwqAvpUhgp7/ji5vwTxvF3RIV1GWc1XnXyzMV9ofc8jNHunCy
	QK3H+SbWmoL1IF6rR4FQ/ldn7t0sW4avyH9rBgHb237/xSZuKXf6VVO2PXQRvSP0ve8G5Z6Jzwn9g
	QfEqsQH9bYaZup0+XC9eXq6NgDTTcbrv6fyE/+EpyLo552YQEuJjJ69iRNOkHAYNCf5UlSFnTfh9j
	AlQsK/Fr/GD8JQhW9VTEW/f1j58jViOlj64G2KyNNdg3I+FLCao3reRhgxnuuIOu+7PcPC1Rep9b1
	3VMY+yFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVN-0000000GOua-41W2;
	Fri, 23 Oct 2026 13:40:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFV8-0000000GOo7-22h4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZof1948486
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OZyxso0AaOeFf5p2y8usJ5
	/jhDO/hkU7VHpqvGOj+GY=; b=TxMJRzQFENnrmyB7Yhrx6phI9seAwH/ZWkk/zL
	m3JhXHMBTBuHKWQCFqQ1XwuYZPl/aa8Y+DUfshW5F/4x6zs81QYipC47HPnOnLro
	+k1/Usl1eM7AqiOajLBIzdK6PL1yEOg/TAcxkJd/CW/+Ub4zmjwdi1ILDInOtAfy
	OZ4e5aN/sDqO2nBuwNNQaHXFUfteZa+gentyUGltaWOQ72I2KFYQyrgfWxk+JiSI
	QVNhMYXo73yJJfX5wxQL8Hro7y8/algrrlMcC+18zijhH+Rl5djaRYzvLGX52Ct0
	bDjrYmKbjPE6QyfFNym9APk/WWS6M1jns74rWqd00WDqWJIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtuwuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b7e90fef1so39742586d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762804; x=1793367604; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
        b=TEVxVOK5OrEJF7byVeavOaqRBOWF6oQ6WruzXSMOXfMa/oGGMZUnh00KkwbZF+y79z
         NAzGPDTRAiA5Vb8gP23s3RP3fa8+j/ql+xbQmdJtbjv85V5RphfsVDw73+iUchUkn/D3
         vTJsbYXcmUMw+XEYQM+p2qW5pzVU8nuosNsCapGaqTKfgNF9xjXr6XaRyWqt/QFCDNPc
         bMdIknkSQvY2xeWgdCefFT+WlHIxpjk1RKPUrXymfy74rkEZ2i1uI4dBsabyzPrlYa2N
         vEwoS38iQKXMRDgvq2ZuzWZULSWxW8TOccRNm5Zkq7+8wmgm6/Tc7YFf1uV8xcHnhoCR
         9uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762804; x=1793367604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
        b=cGvBEWlRP7vHF5GT7XwLjVZhZIBVnq0420JgDnlLrwXtCQx0jITORQIwZLpjFyxM4j
         SFamIQb3pQdKmUWB+0zipcUWhV5baHThYa2+E21jvoRjGjKBNJe7fHcBcc54Ekly8yB1
         bgnNTrGdNd4fBbZ0J/UO1u1mWHBWCzj51C/bpYGX9kxh7yRf+NV53rnNtR7hIzGEcqHK
         SK/roGald6CV9H7gnKqY4e5WpmagUrJtUjQtidUJhYgKQZalsWlVYFfplRsm2kN/ug/U
         VBdUqxODNz9IBvfYrUkH8JPD+GgP2qkT9aNWvNJASW/49YHQUeJZR+tyZbg3XXaBNkin
         iYdQ==
X-Forwarded-Encrypted: i=1; AKwUvByeIIYWJmWIa1mGOEbVmwCw+G4vYzOIb7PvB/DEijxMRk9B214aTCcoEQxL6SxCzK/n75FA7oknZq8OE/WYR+uk@lists.infradead.org
X-Gm-Message-State: AFq9FYLCsd2c2G3eeBv28yY3bcAdUDNR0QJKNII3P5AG/hZdMryDUqkX
	i6Ix8V5R590vnMOOxZr3sSrC/QpF5CAb0wSlfg7FHnkqJIONUgJENxz/9x6vOXAM5VEaDUXbA9S
	30Z8tjZD8DWgNG9QUxbOAc4oeJn+cErcuwPihY4DUlD6Eg1phvpBLE6lrUX+alEz+HArDWLV1fn
	4uUA==
X-Gm-Gg: AYBFou0zRX3aEZ5dALSRBby1IXFWqeYDbR1FRYJd1gHCyUvq3vFeU9yIkGOtgP4cZJD
	zYEndVBUZPNWFJ2cvYXg32sXg/7G0QU3nu/5u0S1SrZd1uQSfKIlfUk7P8qXS2VTlxFi4DAJ0eU
	NtzYaCCnFeynZgW3qoyIyTQ0Ns1W/jb3CA3VTt7ScjZ+5YqZCkN/aUufB6sby00cAThEilrsaJr
	ETlvIYskNpORLXNtyadHFZRDV/bGZSZG2sv30ON+CN87+JKZnVVGXF+sZG8T0zxV7+gLChFt/2i
	Ldv/5xhVZXrwrqmVIJFnwZ2X08ymGKn7EwVWHT9909OcUDe34pmr8ej7B7CKD280sikgQUx4GkR
	EQ6xpPg8QOUt0mn4Lu/M9EhOInbHIBK1kRZyiUD0AkAsbpxIXpSrbCIjR+9UXjZeTVCRlV827eb
	jL1jUJg8P5pwxH
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr860057785a.0.1792762803659;
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr860049585a.0.1792762803079;
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/9] drm: handle IRQ_HPD events correctly
Date: Fri, 23 Oct 2026 16:39:40 +0300
Message-Id: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxj22oC/3XPTU7DMBAF4KtUXuNqPHbspivugVj4Z0yMaNLGa
 QSqcnecImhFmo2lJ42/eXNhmfpEme03F9bTmHLq2hLM04b5xrZvxFMomSGgBiUUb46Bp/7EaaR
 2yJwMOg9G2yoKVj4de4rp8wq+vP7kfHbv5IdZmSealIeu/7puHMU894vr//goOHBhnYjCR4cOn
 7uct6ez/fDd4bAtD5t3jHinICwULIoCjJHQUE31iiLvFbFQ5KyogC4qCNGvdVE3RcNuoaiiSHA
 anZSV2pkVpbop9YOLqqLEKAIB1ODNWhf9pwhAXCh67iINWRmCtfqRMk3TN7jY0hAjAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=niEm2MZMIIMV2XZngvo1nnwS1Exvi2T37RRlW6xT5ZE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bt5AU+fHH6Z+aKiHw/fPhrrVuZv3Nrj73RuuoW2e8Hl
 i6cz/ipk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+feDg6HjmNvhRUqsHt/l
 YgTX7Pd8kHr2/UfNWSnBPi1qa2OjlYVu57+3u180Mb3raryN7eM0nxMN1zuPHhHbpZax+l4+n4F
 i5MSo92+XH9ve452iUqPdm704Ryz+ds6dPfNUgqRkqiM9eiQT4u517zfeolTyoPAW64p79d8UDI
 LEPKqTOmKefptmHvFLyie6rvgxY9CNK8yh6032erD9u9P10dZB0sGH20eELXt5Y6/xu7dML7ytf
 GdO1D4lqOtvLijIXdCd9X5B7fkDPZGbl+6b39D7/H5+VoGG16N9vHnHuoSSJxyUt7EIiUmau7H7
 yONXt2dEeIhIT16V+r2u4l1Lw5OpLk+nXH4lOLs/9K4BAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb63b4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=uf6nnPeBmoxfmv3DkCAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: k7WZubgeKWUm99dcKpyDtBrWAJApVSye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX9LS2vFqMhV5J
 361hCGhwvEWYAURFbNtB3Xr2IO4xDtmAFYeKhGlc7OXePOD6fnpbSaiClTbTKvgzptOQcPQZ2Im
 uwQYZ0eKxty63afaL4opFJisdJmHp2Y9e8EgIW2lL78xWCHYxDyEKulqJqsN+3VqxP+OeiSVpl4
 sVAlrn+th4TRzwFBEC6h11UmesooLEpLbqFhkFld6yYE+AC0gfXjZMjB57rAbsR6crW2JQ9R5TM
 CtBAmnkKX3RK2auiOm4mD3hUVPbMyk4OAY2AlyGyZWpMBKrqmsZsCyOpalMRfJlnau1h44WY1EX
 G3rDnLTBUekcyR95eet1ApWCLilrbJ05r9OkJlU25EcPdp3R32k00/G0xKcMVnYbQ3NFgHUn6xB
 Req9oEWcDjlL4EP52iYq9T83MZddQkcFX+xq6hMWPZQUNQsD/bYX8YdjnL9LH82tfZIxRxSmV+w
 3ZMnrzPHw2XZ4UV+RJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX0kLUznWgd30A
 RJiWTsuLIgNl3Khrz5sPLzCWxiHA0ZHx99DeTe0f0o5OmdjAXeNjy1Jz9AsEYEBU23RJiw3neSa
 50EPuditcFeuJofw1uKWpI8q7nOIXlc=
X-Proofpoint-ORIG-GUID: k7WZubgeKWUm99dcKpyDtBrWAJApVSye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064006_571068_9B113B6D 
X-CRM114-Status: GOOD (  18.81  )
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


