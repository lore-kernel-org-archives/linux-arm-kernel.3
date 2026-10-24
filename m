Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C77606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u/t8IsWA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rJXIjrMo;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSvT0cdV;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAPCNdWd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=; b=u/t8IsWAhlz7T9
	AU6ryXv7PZy56XilJJW30vb7XFD8HF1vtfqNSDBuBu5KMIUeVjz1sItMKpZqsePQx+5UBhjF8HZBs
	PH47nhP4PriC6JHpRkxN1rjiee43u7NM3BMdnqiGSOYJuClsiSDMXln29+L0n5I1rmG80hLvz7DOt
	d2YkMTWKUuwGYQXkByWZfvZLWNraQ9Ash0m/UXTamaNn72l/AhDs2BfDqjeDdloeJ1R7eFUrbzsAU
	oRiZP4F0gmRd6Yv9/MTBtXnEkQbAlIq2eK8rs7/M3KZbG6xoETD/JE4XqQBgc0guynGB6g7xrSWza
	tTUfVfni5GbRBOzKgtKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk4-0000000HGJ0-2bCk;
	Sat, 24 Oct 2026 00:36:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjs-0000000HG9P-1iYP
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=; b=rJXIjrMoKmv4Fo1ebB39swS1yu
	ZYAp9K7N/ddqoYtva2qmiVVBtWsKpWfAwLQORMncqrY6RnW/1VICBjkCa4gr80t2uD3Z1j2wz0K9U
	p0vM0PwHJCD3oJyzd8HH3HW8njlxx9JQm16duGY3KM1PTEGnrKYPel2xOQz9smSMHPR6P8oC3HtpT
	Ebg5La347LFvXJaca2+Soc7ZRm/vFKtQ1JjJK96VQo2yYyFB2qJN1XvGfPO0jg2nh8SfltVgBAdTL
	asXSIQ2Pb43DMlnuIGp5Oe3YPI4yYy9J1bqcvMAcRdzTldOEdwqy/NUv7ItZUiO87lQ7Kstxmo3gt
	fYmDRVPw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjm-0000000AvJG-1jPW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvUe73684536
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=; b=iSvT0cdVgJ0EsrL3
	VeUXDYlR1oe5zbT2nm0wBC4FnO8cxqsNKwrwDhJmAvn9i5lSih2nc5iErX0a+Gtq
	roodXLvWOdppJmPElzGeOnCQjpDETl5gVeLhlfLW6qTCKqh7FYr6Un9Ie4R6i1en
	ls/82xYkae/pNdhQ08MGuYtbltS9LJFdjhEqtuCte+ZEKzudj1kxIWYc54coJZyL
	Z76e/G6Kw/js6zM/zMJplDPRmv2FwKk1DAt+Mo/E5NoN7jKYVgNkBSBsmpL9q8fq
	Bs7VnL+R9stFWJhrI1Wa/UP95RCplurVhAX07Iu+ZwjBfLUvaemJpEA6LyttJ7En
	Yr0Txw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sg5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso178722985a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802152; x=1793406952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=SAPCNdWdvFmZg3swLRFT/yUsUSGQTDhbCG9rVJMjGIozxTEJm/embpEhl2BGAeLDEz
         Odo59YJuXrsfEJ0HXMV7h+Q6fY6YSA9sxMBmz3Z9CxDUeAHgXZMFa2W3C7BWgcDvBmu2
         srpKm/oBtR40LnTVbwqT5pjJQhYy/jYTT4K9J3pbg07GxYJjZjtUkpievODcuDOnZ0Fs
         vqWvgUILR69sArGNY8pT/VGuHejvrVLN+VRpGYSlqkPFkbO9kCgcx8OoJBC6DXastRpr
         6/C/qytl5O+LeNipyhhUVDwEn/oeJbIisgYrAtvJeKps6GYVN3/nWWcf71+kyHcujX28
         arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802152; x=1793406952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=inS4zjS69tJYjFmF4sxPyDOnnAXHlCybV4Co6ouaFs0j9mzTNPZ/oYCRxsRnLq+HmP
         CxR5ZGlcBbbLuZoFmtQiM97sZePJpZVZhFF8x0GNzRTp0QDlruZgOVZxlMYtKvXUrhop
         dujEd8Fct0UEFarSuG35BE3iqkkn+OHEVzddISfAgymSk9vGvPmMcAt6w9YiBexzhkg0
         9idUOMqSNfoO4I0H/DE9r8Ba1NpVwGbiYaMqTOAPyYKlatF/2ejzkclFWJOx0ndvmzLN
         Vmr39KuwYKkc4Jz9e3/BhvfaROExKs9WmGXeeOTUSVZFzLX4Xo0U66JJUjppY+lazGVi
         VDiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzee95jCbxy4vn0pZjwarLOb2YI26rlcUVWBsA3qbOtvMUlV2leqHCbYmhGdAtrMWE8ZwiBwByRd7QwY82DC8/A@lists.infradead.org
X-Gm-Message-State: AFq9FYLIxmDw82vB7SKnqmRuKTfM2sUCfBvxus9FxbfSTmcCDvgv3HmJ
	BbPI7LGgxXscpc6TNRaZnULwNpwE9fQwC09+7GM4Ih2CyvSJ+QWdlHqjXJUYb4PMF4eZNtgLZU7
	Z4z01FN3042HLbAVebovYpS6RKm57eUV0rL/qE3A5wm/2nkn/nu6ZQoovYCCUYO3n7KnUAJDZvr
	pFPg==
X-Gm-Gg: AYBFou3EuUyL47qxPDxAO5YxG1SK3o/18znngkWQMC+UtGsWSJGh1/7SFj93F3ISPr8
	0EYVTU23Ri2iJHDRymGpqxqYtAPS8mCWffDKS/4fifKPQOmcjr2XVnj0D4iYY3avt6UHrKhmQ2f
	qw35iOLKmW3bVWehI9AIgLQpSo12NJe3ZgCls46dVjOC3a4t7ACfxmAlC+tONz81bOSoPtDqM7h
	p1yGMLPyJ4+TPRxnT6mzWzpfHbBzEOGzdw7QDma0cl4EVpBaul/oaDPCxLDkw4lvV25Ebqgp1pq
	gF8VzNX1iReEaCvjHVmV5GfJpU1FPnP1dBeDqUfkfQtyoIvnIsbBi3RJ30UTUE65hLZpcSR0K16
	5lu7WbkdJsvvQ/ypcQ3d0xzPeqmtl+FlTLM7YDvyzkzX66CVFNBTagUnW7rYV/mFtQO3vUeLRn9
	+h+mn4EA40JpYE
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112225685a.25.1792802151701;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112220485a.25.1792802151133;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:19 +0300
Subject: [PATCH v8 3/9] drm/bridge: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cbl9yZWv2wcwZMEJm5DgazWObDlawl+w/YpgLor6f/M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Q5qq94RDFJmqbrbH7//o5wMxn1txHfn78s
 w49BIQASi2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1YYQB/4gOy8ZDd8HxSiS0ermuGBCe/hOc4/eCJhGWEwmzSzxuGvDIciQZHmqatS3ReVi/3StJvU
 dENoSV2zGwvHZbVEK9yPEFib63ePlwc1i7cPZX6HPCVQrHd6Rvt1g3wi93xkccFMUAB/UVKqRue
 F+JA0xVmUayRO2ZgrXX19jyiXe4PvtTcRqKj39KHj/eiPb5tSnL7HvlFBeX0X53be9aycR81pt7
 MR9fdS8Pw5smA9t3HMU14UDhj3PAWAH9VrtqZ2vBYeoDM+EewOEhEpgSnop27oIv+UXDHEaY5R1
 RHAazD8SmCrw7qew6GgxaS9/2xv7WvNkSnfWeWfwgp3Wc/xu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXz9zzJp13mSRV
 XvjKsF57nOGFYP3PQKqH9Ltckdi0Zj3iYEf5707p5DSjsxw9XLLvXVdWquHKx0ziVDqXlUZ886e
 vHCDdxVaNbA+8c5tpZZOs0OPYHYoZShPCPOGzXGzul/kQdflJItZdJn4+R+VV5qITah0TckaWK8
 MJN2wvth2IER0On5Q9/j+fqT3z50zi0oZCKEJmCdhsd34Iz+SCqhig8wFNiAdH231w3AmqkoEQp
 MeKJU1Lfw3VhLUXiWU6AhYZhstPGW3lDVtbD4/b4LBoxg7AeDZFbxP78v0xGACBfNLzdossZHgw
 AsrmIpR4WSfi92hfnSccdEe7+Ue9Ff9gtVi7fr473gqWqM8pDeUG1D9dfW0IwcU9qbI/AwUg9ge
 vNDIrJjmKDRhJDuMWywwqYZWE6ndOrdHu7qmgU7Vkz21fGpQh7Q3cLj8xoHjIQ+7wqKcYAwbGxL
 BtSYX3Qa01Lz6dxdhHw==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbfd68 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: uh8TUGlYLryXp1aCDau46lo_MTiy1oel
X-Proofpoint-ORIG-GUID: uh8TUGlYLryXp1aCDau46lo_MTiy1oel
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX+JqZ6RxLaS8d
 2szRTQrX5+xCvJsaZ/GUYB1CIkVLI6L5mBjydESZeGm77v1/iGbm865ybxNPVC0vRK7xEJkbyku
 NlKUakSJqVBT8vZ3NveoazxgFqToND4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013554_962231_AC029AB3 
X-CRM114-Status: GOOD (  17.79  )
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
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 8 files changed, 15 insertions(+), 8 deletions(-)

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
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
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


