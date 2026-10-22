Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9589D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uz/bwJ9g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AcdbpqMD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpYkHZTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=uz/bwJ9g8tT++9
	0JA0PQ/OwhUH55Hqx4NdNHQ6l0oDyMXryAl/7Ng/kn+5wI8DhMmqD+AuerqHFtmM4ghINSh79b5Js
	poO9iKn+rMFxSF+K6XEKnTE8JLwyMeVwM6LtiImYN7tKTHGR+ZAyZRtgliqFMM4RIXxrUJncRpAo3
	tlRLn7Pqwn0qRKgcffX9S/nnliOEiw4K+SqFhk6O6tmE4J6+WdV0QbCc+MRhYlDseTDXJVmIxWmiP
	VRYkIxJXnGcZZrsMQ6PN0c6UbqiQVKcP0PIscHMl5y1bW2kZTCrA4pogrZikLYP/YgAC30LECrhFM
	MP6hy5/DlsY7DYXDK5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqg-0000000EBqT-3DoD;
	Thu, 22 Oct 2026 13:28:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqW-0000000EBcG-0jev
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=AcdbpqMD1SCTzp4DrHowH14iVV
	Q1frPmVQ0il7T/1z41bWB/PcaLpLgnwyn/JqB5dFYItO0e1cdWogyh+ofWAIp6iBUHcwod7FGPnjY
	Yt8skDLr98s4i/7r/iujY2m+aFvwJXzQnerz82lhWmg7AyjR94un0MM9uK38rQbirQn9bxb/NdwWw
	AVATvX6Z+1CBXEY8RAnLfvNZ/N97Gs5rq152pRH1iJYmeuwlRndo0PRE7EKsIS7ohjWkspyQgTYR2
	MRb2zRPoBWOaHx4nx0q9zg1VGi/Ra8TW2f6NEHifRIJD6FMpOBhlCW5rEcKNgEXHi6Y9m9SugPqaY
	U9qv4ZJw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqS-00000007Bks-2rTj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06mo3115556
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=huq6+EdLHIG2IKh9
	fq+pBx8cZXxAlw6MNLQsBsBq/skklFtFTkH9mSCKnIther6jO1a/HCONVvYjnXN2
	QaDCt6zjurulTvzpcbiYaCRzfYZvR4c1oCAyDzlgxAPTxrJtmDUH2olZjhE0ztaT
	V6TNw4uaZ2X3NoG8Qp5GL6OFRwhDGX+7Z7cqCx/WnzXwzLURb4i7N2oPXwzAmGZg
	E4j7rsqN+RkR7XbGOp/uhX4utIY8PH1+EJ5AY8tegI2Q3Knpq+Leq6P/5u6+b1RX
	VdNA7E5J1CPiPvBlJK+4LT9ybakIaQavIzrJIYYj/wYjlKKRvoggcIiE3kj/agu4
	izt4BA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so298461385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675714; x=1793280514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=UpYkHZTFxfVRGQmHZSRuFJsoFnKFPI4fmPHzNM2MIcVuoaXjdREeLPASYH9yLfWT0+
         eb0VR2VM1ltD+9O1duMag4dX4tNvAd8Vwdym7wxG0crmADa0/HDqI/tVlK4qwmaJ0D/R
         f1lRI5AEqM+MMxYz0sC+inRFOdAPaEmWhDGgbvJptr4QL6rvhZ6TVRFOTlZOeUeXZOy8
         T8aJWTIQfkukTST2LRHSMOcK9mVkgAB4dI1JwBX/X44SHhEhLX7sxEveZUjGFqGC1LoX
         Ok1a4iAJkI66fkqN/QHEgoa4II9mFBfPWofZuoP+BkP7/g8fpcO4x0Be9QCTPClZ4xXt
         zQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675714; x=1793280514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=k3ywpGNDnA4aJmbrRdifjFUoNG3wWYE9jjAJTv8oQQk/KLpSz2iM40obdu8t8NWdwU
         LLOQdaHTgTO2nvYWIKPJDAyeB0hbBnxE5ItwACDefwP/X/Nl44iFx6vWEBNzted7Uo1d
         jLNLI3fzJw5bI5d7WnF9WG0AY63uaSWQyccI1B/N52wETxlFx99XWIvSFXUe2b22f76E
         t9k938+eEyLLE84FOywyf03xPFktvplcj8XuGTHRVXrjeN9nsFu9s1DBoc1U3CeHdO2R
         yfHR40eCDYXgxcXCcZB3zAUXL0/fdP563qrES7i1h2Jt9xMki4cvCjRKq3GJGsHyVN9m
         oI4g==
X-Forwarded-Encrypted: i=1; AKwUvBxMPYs9MrWg/HVTU5AjrqJn51AuUWwmEhuFnzQcll1I0TuaeimUQRzpEkmJTOty2fOswWqSinqSyWU8c7az+q+h@lists.infradead.org
X-Gm-Message-State: AFq9FYK/RpXU+2CMOMa9oZQ7nSTYWIzUMfyRmj2cNSgnjhoj76/1r4Gk
	ImRaUnFkJ1sTYYFrR6Diq/Cqk5mjYb3D9ZMOpakQrMTHkgPmtkYQsmarBIjDGzg2uznK0W5eSq+
	PVLcwNpQVIVX5PkfVIihMUeqpAotrpd6dNXJM89VaUHAeaT8NGEKCcIStq5NvCiN08vPQ77s1n5
	Plhw==
X-Gm-Gg: AYBFou0idKn7keETpZSiHlrFQPucRqrH2HrAM7h7ut09T8rKJu/ZQUDwTyUrBr1YbDs
	PcJU0DpNS8ngCzP+IV+zny8eyUppr3a9TFW0NNmLsJb6AXnTRrCTYT2RXmVTpSuE3WU1WWttr6S
	z/VJOiKNJQmfXbBNeoP9N+Yov9X4B5XytgrMuZn+4FTU70XxyxHzrb7ZMkPVHkBkCsJPOjFhHIN
	yLvk+VhazmB91i3DOOArVS7c/bz/uuriLzIZlIOOLPNqjNGEOI9DPxHJc9ghTAeOIxEZx5mTvFU
	9viEipCx/ogCaPFuIaFr6QOAa9/xw1IpiPmJ15H2i0YDAxWzHvvJM3tBLOCYp/f3kfcC6uBRHsm
	w3xQyxi9aOHyF/S9fTNoAy+IIrt4pSD6rjLCuJNCLlTgvFCYfFVeYusqrbCyNQZl/45LceE+tBx
	XSHhb0nZnnctvy
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860582485a.4.1792675714421;
        Thu, 22 Oct 2026 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860577785a.4.1792675713861;
        Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:04 +0300
Subject: [PATCH v6 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9oUOGyoZ/Lo9msFFhzc2wcKn57bx/TRaPi0
 NP7H+uDIseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPaAAKCRCLPIo+Aiko
 1Qn/CACG1K4eJynq5qB7lVOT6butQGOdb0Uhg1y7eGfXBUIIGj1DRv6ecFzKRRK0bqqp6pcC5ci
 EIrQitRmOJrdtYWSEpurrdG1g8G+KPLJUhVNQEysupJKk1UtdeTjjfLKzFo0433HZaIXhfDpj3N
 K3momphg+N2wrPSqKOypSco4Z/DK1vaIXXYy+0UWhUxrrYMXstFcdV6IsFrEXkcVoNcdL9pxLls
 IJxAjrrVY16uL/yTOwggUx66Zvog/fgGXfehXKJwmzjWKCAkhWW369L1wPJ5HGNAbqCPvQESo/X
 5Wj+blNVgBLSYe62VO2WdSqoGusXFkACUWYMezRkF7KbPzw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX+/+cOef8Y+cG
 TwiClRv0JP/2qQCpZxpGHYu77rBvz3tTjeZr1EtG9fy0Lpa4cYe5G3clr6qAWVsvGRy9AbT6rEw
 Osek47Zud8xWwTm+aWlk6aie1GXQOGo=
X-Proofpoint-GUID: rQNw-ghGY8_yKPAoCosFi24KUkrwfbnM
X-Proofpoint-ORIG-GUID: rQNw-ghGY8_yKPAoCosFi24KUkrwfbnM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX061Xn+V/9zHU
 JmEJnBKZ5GApNPLG35+M4Yn463TSP403/mPouf8TQ56jiyT+1L+kCtcVfg5XKjSKZQF+Ew6aKlZ
 XelowNDbTu5dJClDKul6fuIwL+6sgpPtw/0Pz6S1muza9os6et3V4SgB44PBplDWgUmuRMVyhMK
 KitrjLVK/uf0xSP2mWIIczq6s7zQEcrCRnhIxdRQyVhG6u3QEVR43bjyG6MqqnDL2DWLhmNxYve
 1IKOot73yWgGudP8FvvXOqjrdMyyycDXiYZQFukFE0HmDUexQc3UpI9RMPemx3SbQeEgvGCtfxc
 cs7cCY9IIuK/8/0BwqviWthg2Ou4osY0fSVVrW0J6fKZ82f001SWY5dx4frjSg+jsCgDzGR57/K
 5uF8/Cg/hTvA2g5Xorjg38NNXPZNdQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142836_994048_58F9A9F8 
X-CRM114-Status: GOOD (  14.91  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


