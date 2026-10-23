Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E81606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFZqNzxu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ktqAMAjl;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsNOjnzh;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgYoijCQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=PFZqNzxu4LnH1t
	Mh6vg5/1g7SMqzPpOzo+bPVQBw2CFCVzo9Q5ry+W4OlOD/q+rnD7EARIFGCuIvJxTacYQyPwreASc
	s7f9tRja0LueoBt6BgH6Mn1BrAppNFjLFnzbx+BdgTn7PH6ISwGHw1j+VYtLf2LTqkpCRA8N7z1h8
	2tCFhZSOY6jYoMzDkUU7tLhStgf2BIB6ll0gVz+TL5syrfiywrBq2LC76lNkf2HYuwlt7OLV2PeON
	svm3uhzcLE1pJQFNu0Njy650mrAF4lFQHvshLNDsjGL/6pBVY8hX4SiMisud9cbrZmaB1vCk/6vOF
	zfu44it0z6lPHCa/juwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVo-0000000GPMM-1cCg;
	Fri, 23 Oct 2026 13:40:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVd-0000000GP90-2TCP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=ktqAMAjlIVgdXv9TqckzFvD+Qs
	PbSxzIw0DOOKLa9iPHNhBQbAvblldq8zpwDWOhq3Ye+FIVMqZCo3ldBbTdEH+nt9wlOn2Ha02WMzo
	4XTHS1kWKH7Gowz0wwdByjoRdJ7Fq31CTw3Dtml8RiblUcbYIf2v6HAGduY7bR1+CuifhbX7W6VjL
	vAX6WzsYuKESKbw8eaFBUQK2O2XPC4ECPwG9xHnWmBW1B374CwAqJ6MAGR6Hn27jXGWwF1aqP53E7
	fXm05qNIZLQse0TeAS+yf/iqsd+4VU27HeHf38z7f7TbAir5kwa4u0jddb3SJGN/emI3FJlrq1Ohy
	7RGRSDcQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVY-00000009j1h-3Ucv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAR8b3550440
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=LsNOjnzhHmpI0HxE
	nmFuUTzkJLu/98q00u4qb23HjKq+tKafv2HeEDd1K0DYwl5bhWcLfJ5XLnDt+l69
	g36ow5iMAVN6JSCM3ois7y3ThM7GeLbEYuGtLrZzDokC3OeTTRmoeM9CnZVtFV5E
	x/NvEawygVOAv1Hn/4V5VS6TZsopR6z037hKPZ8mk0EWE+1KHScNTEe4JZNeX4Za
	1kE7cmnzFYzTWlYJ967gGvwK73SxrNCmIKAG2EJDmdXVlB/DyW60RPwhvglM+ehd
	/FKzjh01J+Hekscbspq3FMPyhJhEvQczy3xHyDfAiLfEc1bVCkKOpPTl6OBEGyQt
	Z9NXbg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbvvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so151487185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762830; x=1793367630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=KgYoijCQ7QYz8yBufpzKeuZWmWcXsfy9rPSh5YbKBfJUvx6HlOotxdqLSJlMH3juTo
         M0OMEYKRDVb3GCyZY3kLyRusdP4/j+f+lt51rGHs8IYrfix0PAeuGszuFu9fNXrwWn1z
         uuJq+I7e31t3InnkX2SJkWpMU1Kp8xvTDDLDN/1msSjNDCl9lCf3J2pEzrgUuhC42820
         uoD2c+i8EIF99+Xfi6F6BB10tXubPBNJNjc1K5adjxycDfwsbafTaMduY41A9oqiB5R9
         q3fJfWwJJcwWrgbKQS1RNGKOuFUCHQinuDF1lZl2U4Y3nXI/u0Qk3MD++V/lXemubhzp
         jdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762830; x=1793367630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=fGaKpzWI1KAK+9gYyO1Vtb5wq43C9UsIXSo6K1yvc2k/GvL0qILQ64lxllXUkH9Z9Z
         Lr49OmTNhaNi35PIzNTNRcX1seV+Kt3AjiqEl82kd17Ezi0s0ZGCwlv3TrGaU6mejDcc
         2KYqAqAZ0TO99e+Dmu7qD7qnTC266fRo0rWIvAtDmOkg0k+SbleXRRMGJIw9I66+pk8v
         +1fKkN09HDxSsGtdDFjZ6JDfLDCKqUpFi5rNHX2NO2v5g/1NQ/UeWrOeybjtj0RuQh1p
         ghnEJF0DITyiB4S75y6Cdxgk0x4/dSIY2gWR2HqqllS9ECSMr2DUTDpd+ezGUOWrBVv8
         6NNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz80jTcFKmorMFAF0/m/QNUbtqqPPDJ1XJzQZ8uPZkHBP6JQEgsjejEGyXIUgtKkzRzdsAorZ8WkzQJJY07JhVE@lists.infradead.org
X-Gm-Message-State: AFq9FYLEHiPb0wzT4bLEkmtjmzatw3dfKwLFi9V9G3+fNh5mLS4o3aYh
	KkCfI91kLDXmeQgIbD7SesAzse4UPsU3z1cuzJczg50VXFSkW4SyvVC3nuhLxwsEOvud9ppdtld
	IACT3WYh5DNCnrMNTgEtqji9vDfFOnR5myft0AghKt8eVN+/Vxv5lOvPY0EccqvdsT8Rnfo/tSw
	QPFA==
X-Gm-Gg: AYBFou2POuVOBoQwfX+XnTL0J1FfXQfWRGdlxaxK80KZjb2zBRNHl99pQNxrAqXh/Yo
	aY5iMsms5kIqnhrHKbpLIGLDr5gguijJO4dsOuvfERG5YqSm4Wr4ltZDSQFcvioPrn4VCCYbEI9
	mtLszwYeIWp5BFbjCmltPPYHubbCEiZMBhRBgKjlS5duqPo41zM4w6GzFDlChEoo83vTfuYCtQ2
	zFMqtrcy9vScgciotlx/ceNOB0ZHFIW37I4v6AlzFjaL07jVOlJsKrkp3/SUHWQEp0+NzZ5eR/Q
	Fz2W6N1OHJXFJYV7fWBXm8Os3OtfqbnPrswBKIeJiPl9WT1xCaL3IYluHOUFdjl71MB751AAiHD
	yjggtnLlf0vEbGFEETlMApLFzgTIT2yRSUxQBaITFzSjMXDjG/3MjeHOBlri+YztCRs5IO7tCeQ
	psmFxLKrimoFKP
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421697285a.23.1792762829644;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421689885a.23.1792762829034;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:47 +0300
Subject: [PATCH v7 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-7-57a3aea3f09e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OrDd0EyJ1jWpTktyh/YviRqeZnCe3IPoq/M
 O+YMt54/c6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqwAKCRCLPIo+Aiko
 1WJYB/40Z6evC5Ipq89yGzct7EekA+0duvkUZtm+g1ylN/ggbSzRNf3+1Vp1XjESsa7DpGJXjuQ
 1TE1gkvjp/LWB7CdZVfNXQ4VJwKQO7S3AMHr4xZ2n2jz26QfE1hWqucZwG/W/hmjd9ONC3cAxNf
 RGqMtZxdKdoG3Wgh5qr2rwYcetHNF3gAlKltgufERllw2nCIHO4M8ozozvoAR3wUHvqxyrk7r9D
 L+d/94J20rCRatmubWZkT85Lvjcn3o/DjkXGgBtxEaK+0RGRy0vSEaPZtJ9iJ6PLKtwHzDQy1mt
 2uo3JmQCl+lhoF7eF4BhjoxoqqIqJ8kLhgE/1jN4110PGmDH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TZnji7nqN_5ubfxDPg20Duwr2N79m2wH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyPTajuG7Znj8
 cg9aSJz4vI9itwRNF9Ov1RjTNLNnKMspTtfRiT+CI7ntxO+5hHAhJ947RykIMRwRCi1At+PwPBB
 EPAxsll5Csc5Iqkgybnaq1BcpQyDY/Q=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb63ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXzVEsuqHAOncT
 B/jVRmF3MERbDXr54RywmTGgv7OMb5ZER2oavo2tjxcm9RDVwB/WIMoNe3rKqsUe0CJmi793YLD
 jUCILnAEXtF7nM6G4Y0K6OCCDTzSQNR6OTpn5pIxKP4bVO5KszDdab7y55NhX1s27c28EAJ07+N
 BvjOOf+gohBNd7Q1/WDr71TXVeWZXQ653U8jLojZyWCM8jn0ZN6pLN2zkxjjqzxJbSOVv0wDpzf
 yXe9p41ZPLfjn/NBLRziizQ0KvbOdRCitHBPglZy6OvavXJJuKsemeSzDkq8lcc/Raj3Z8F+mE3
 +Bs7dwTLBXUCO9NlkAJiVuretyKNTvkoELA/OXKxKgFuWJpP7Ise5nVmG7CvFYRUFo9xCcclj0F
 RpwkNU8zyArF/8SqfeaSjrQ54cuDUxJNgQWZfLqe60x321g/mAx/UQTJPRDMLF8Qw2P1IDU1Flo
 4aarfTaWf0ae/5BOrkA==
X-Proofpoint-ORIG-GUID: TZnji7nqN_5ubfxDPg20Duwr2N79m2wH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144033_358008_F1175343 
X-CRM114-Status: GOOD (  16.57  )
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


