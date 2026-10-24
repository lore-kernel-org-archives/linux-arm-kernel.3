Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FA2xY1yS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MiE92Ym0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMBaUzhb;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmFsYqpo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=FA2xY1ySIW6xge
	MOV/06O4xWvWhAQVgj03xbcabSJg1q5zsuRE0znEnUP8BnPQ0iO3DjhqSH6WY2/yjnH/+kKrCMsBV
	WRaIniiJ+uJfDWPv8dKD/zj4rJTkKtFm+aqodO0jgVMYjrAaVkJeCRv9f00Thq5M/0JHqjObeE61y
	egNoCkBDV6VbLCY/FnFL4YAmT43kMqOrBoPTkGp7uIRh6uORZYu5ihnguID7wn/TVcQqkFJEDTeGC
	s8O3gQP6vi331coTA+tjZ8tc1gDnlGk47q7Tae84O288Dpg87J86PtGyVbRPicia44b8cMRFWD+/t
	0IyTs1zdIbmv1XfUMCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkL-0000000HGXr-1d5H;
	Sat, 24 Oct 2026 00:36:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkF-0000000HGQo-12B3
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=MiE92Ym0PKxici8XwY5dxPrxyj
	tRGtncPCiW/RP37rE0QwsIkH8cWO3WT9dp6h2LMLsP/cm1wijdDI6gjoJ1i6+erGh8dUzqGLAcgWH
	glADp7UOMEH3+l3Uqd6iMP9fVwj/KOch+pRsyEEksiXOin12YdYOZXX/FMjy2eWmvhlrUPsUgEXhL
	NwdVyNeExL6a6AEichkb4knTlWtG/RB0u+Zgrq1ySe2XLA5wFL9cBcoRKIkR8iBbsEkMTTiTAhX8Y
	l7K4VZ1j9EclZKzMCOTgjiaGXO8p64GGsH358swsh0N/ycIP1PlfhTjM2Nk0+vzW6kxMgUjOA0Pz2
	wEu3KsbA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk9-0000000AvRg-0Ti6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvBbU371927
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=RMBaUzhb5M7n9n2K
	7qlHeN9QBrAgLOr2o1DamNJDY5OTVrTrOlMly9pzeu7ACQCd/0+QBst1zBlclz3s
	5zYQTOeJDoG0gFSXXqGes09udTYU8DDv054WQ8BY6HUcqj7cK+2aeUd6uHXwzmXN
	2AjILygpCk0uYvzUgSAhOsI43ghQYtDKUSf843zxc2J4Dj/Hxg0wtLVBABaKQ29Q
	ytlFTUr+GIGA88giMtUPP/UjHwfcb9+Xfs4QzjE+ep8TZdqduqdXHZDwHFWhMOal
	Up5oQZ3obou0HzFGXkPCg70IjHKcrXRLnX09W74ke3rH+nQLgqoIzwiLwjUnOA4R
	J4E3Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89ha2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:36:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso505404885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802175; x=1793406975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=CmFsYqpofnCunBqE+fAEAGeS7iU+wCktSMDz4kbEeJazP5GAkHVRaXDZXCHFFtnPCX
         jJ9lK93OcaT2tXQGxr+dcVm6p/BPs0hK2aQM1DTQcQ7np546xXprW2sNUEJojFOF4cwf
         PtodrGVdTzBBtnQIVP/pjglvx45OEyIZZlwkMU4sz+jlw8CWZoOp9sU6yEpsM3cRtHVw
         3yNnxmEwmo91VdZI4APrjASqpgkZ6uUnhONCiuYxvm0/N4/f0QsyO1Jp4ZcrKq0Jrpe2
         nGcOn4jy8XQOB5hffMB9PobGTyXzlEo0t+ifOXr67uhZuHeroORmXuQO8tWFeaH/aMZV
         7SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802175; x=1793406975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=SVCU7lFuW8H/LQwa7mZoPKajnmcqCI2c92J2BGb7gggiVGXYgr/jEwWs2/i2KN9fVY
         t7MlvfFR1/jkmJ97I/zXUFrSsNw8SyToSVv5t3o3nGYLdIeTtyan4o5AZIvgsDbfZpIe
         tCgnhVAU7gaRv1tzZw1zMXhEZ+HgUVT0cXF4nB/F3Wks1NgYZxrNlg3+gMWAPf1z42oY
         GbCKTRjxIvoPJeK+YzyMevvHdDqcg7GO0JPG/l+t9Y5HdX/yTngMbuvY1a0hCvhHdorL
         Zo+yty6bzVZ8fgfJJg6Mr7trh3dlXDxB6G/HgqwNiIRKXj6OkKxyny7cewZtiZZyOBGZ
         EWjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+2O3ei7W6UxJzTLGl43KcPL5HSGeVmyHrpyOj6XDfkhdcg/UeCAm0KL3Bi2OlGLakfNzYV1zB21TY2Q9qyIhU@lists.infradead.org
X-Gm-Message-State: AFq9FYIyt330LDozDj3S9xtBwquPfZ9HXF0v1p8zdz6TuiqMoAdd3U3K
	8gSUUfPbxbgKz+/UU1TYVUHCmiIFSDjA6eXohT7hsuK0qBlYUDFe+Zkk+D8x1OqQUSCswAT7V6/
	Tj4FNg0154noapw9uwvzrArzpAgbtJjyFE3MMe2ofKfLmgobQQR0gnjm7OlVBi6cCm+rRN1MLln
	BHrA==
X-Gm-Gg: AYBFou3Mr9jscFRjIjX8o8kzuIvYqFKskRtJ5y0ksHquZJHeSK8Vrdd0kPX7Nk5ChHK
	XuKpCLCEYB9KwBDJ2rMOjwfoW1OMNl2RYGxgESmwxhtIfdNJmrBW0m7XauCMLvJRe5RrqC4aaau
	hMm+nolHRRwfORN4Nr9TuHRDRb8NJpEd8jLTSvKb3e5xWRNY7vDmGgjYYthRGcsqvCL09vHevNT
	SCdVVu7sxT5vkTUYSJJrE66MX6LI0mJ/6GndmkoFz/NzwMrOCXqvQfwD3cHcOX3MUW55SSqcr4Z
	2cXfvKGjjnMffrGO5gfQfG9pssehdj3pc8bkGKJBBM1B40uRM1jYGpXc6p+W8Tb1BgsoxK+PkJs
	U5wIN/RuplbygyAGoQsX37dVHcotBlLlabb1TYZdcWYZA8gRlJRAAnR+2gZZ+w6ZusQzeo1oF4Y
	0FnhrTjiZ/Ha4N
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id af79cd13be357-940ef7d3e5fmr99111785a.6.1792802174937;
        Fri, 23 Oct 2026 17:36:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id af79cd13be357-940ef7d3e5fmr99105785a.6.1792802174363;
        Fri, 23 Oct 2026 17:36:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:25 +0300
Subject: [PATCH v8 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Vj92nG8f9DdF9Mj0lE9H9CWxc2QVarSsPq
 X/6E4ln16OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9VQAKCRCLPIo+Aiko
 1TdbB/9kUbzi0zBSP8iFmpiyHhq+5vd7f0SgWlQeOKEdcvbh41d2YGLywyh3Ghui5TxWHyxZnE+
 qJaN+BvDuOrgUtJvLgrIiuLGIBwhIKMltwQ0hYeX38KBCNn7xvHTRkCDkTjMZECnH/UCPa+CFjd
 gaBfsUhoeSzFrqvXZvV+QjziPNwL0DPRqSueHeq0zJe2ElLryzBxpxof8xrrU70pxA2uNUY6PSu
 8Gouxh+OkVkupdZGTkRkVy6HWlyj7npO2Do7rrfZIXrc8TChTH229Ry4k1ayA1xdKmTKohgC7le
 UU9+PxeK3381gpDvQH9EfWfpWGE1MH2LK3SsoJDK9f5dSP63
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX6GPC8e/3meD1
 sJNGCuMxVfe6jLcH1GOK7n+FbzLT/9Rz+cafwfTYwPGJb1/ueN5JtAma0964Q7EYFs4SOhaBh58
 7erLPIjwIZ0d75vtoHeobb8PCMT2O6E=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbfd7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX63RwLiBQBwMH
 AAmfvigWNiTnlHjxFW9aLlx3acpu4d2U7pQipoQYIfre0TL87GOPt40Cels0bSkg5egVt2r5uKy
 Bw5I4uubzprIzl3c7pKhoKuS6IL+EGsuBjYmalINBPge+wIduiCXl8St3AYK6y+eZyMLxAFWE1M
 SE4CD9kyMUeKO5y1PTu5Y0JGgYGvwJERKdFVmxZ+MBcM8/1WLr6jkZUVmRHDlh71HsmRBrvmDFd
 PPOfeNysagI7+P+EXiJqhdYDkftept7TiNQC/9T9VYtl58KjvwxhP01QNvnN6b4W+heJliW40Se
 MvVhge6hlsghY1HA7wgSKR5aqKifvI4wo/izBQHD6YR1453j3dgoSYxdhU9bMqSCGnyHd4IZ2Uc
 ECNBjFF1550xog77PlBMongi2/wlyvWNGq2sPJBhFKWAGZR/8jNWeH1C04mnLQWUI8Q/TifqGil
 2QnjiEq7EsDjlJ+E1Vg==
X-Proofpoint-GUID: gBApcbdQFUXCmdzgEvhYexh0m9qcXnvc
X-Proofpoint-ORIG-GUID: gBApcbdQFUXCmdzgEvhYexh0m9qcXnvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013617_606081_14B4AA88 
X-CRM114-Status: GOOD (  14.28  )
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


