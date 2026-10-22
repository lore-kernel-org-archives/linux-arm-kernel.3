Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150E60A380A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SlTJG0t3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZY5crMLc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yb3sn5EC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=SlTJG0t34fU8mM
	npk6tqzTdFHUi3OxeYfjwaf8uLuOJNHxj+K4K/K3dHSKMJ+iCzWuPBeyGdPgjFrclKqt0j45eFRPV
	AMv0H1WISSVQOuCrKr5GhD4CHon2taCXGH3+lzNAGJPFgmVgQP77uFrdhzyYtXaqnKwvnssy8wEzp
	0Do8yT4bl15ySJzTtZhQKyQPALqXtMqsbxX360gGL3G7xuw+/EM7CfI6RLl6KhSwOa59kMDVoJ++3
	E1nIf6iyRUD9wFScH5duovG5ZmYRKihcK0IAcNUm0pCXXOf0OxP9PlzcpFvmA95OQW+8HNbP7tTnu
	w2fjiXzzYHYXNU5VwOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqS-0000000EBXn-49Jf;
	Thu, 22 Oct 2026 13:28:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqM-0000000EBOs-2LuP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCFxmo3784008
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=ZY5crMLc0RdN6Ac0
	w70ny/ZHfSFENHrnhAnoLhyPJXR8HSTKXy/3IX56AZAfRAf+MJDejryHc5gI1Nsi
	Wqhm66LCtcz5o8JIZ2Dr8xC8yXQtWPSxkAWsk55N5saZoHQFWjlo7XXebJCY69Qp
	qFBUjnulQkMYcSYfU8KUOOS+f0Oa8R0ppgQ1Zyj5WXuhVyLYITU6VRWUdXXwkV+U
	tnzMsSf/Uvz2cuLGArchUxG8nvr4nyfRIrRNAKGy0Z77syXsYFaFD5irD/JsMKts
	69unpf9U+b+3dzSEO4oAB4/jMlutYtjGcYkRNu3fW37GG6fRcGple8NqNdspo+Bh
	4qOFuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auqm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so415444685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675709; x=1793280509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=Yb3sn5ECJWE/vYkJ+DqLQI4RaUuKfPRUYX4IFmELw2hI6zNxUjcwE/PKAGvx+PQVQi
         oT3our7Js+fGCjNFSqTMp/nsX6Jbd1t0lM3T8sfrm+d3KyhS8BhfxmHJgZ+FmxnGGWLx
         23cYJWM3SXr4OCRZCzQoGRCkmRU71BW9GiYG3/XX1Q9Hr9Z/Gf0oXFtTn9r8XUFBIDok
         kFqlGlFgh/LFeH/RguxixS3GLFXcNS8zUvZ9bfsnVXMcXYUUuqcakJIm3afkV2mRvkyg
         bizIni1i6PXE+SkPXu8p9GVquAk/L8HArj4qFn/da1Kd4CmmSFhl9ymTUBfNy9q0MyGb
         /1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675709; x=1793280509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=A70RcEDnuxR0b0Ys6w/woFRpSQEgrYul3o83Gc35KAIWCft22MwK06Q+ZmU7WB1Q18
         MmMSq9oUXGRj0fWILfYT38uA+w8jl0iYbzgwgq9GVMnTb33wvaF+efcGoEYB/Bf72Kjv
         vEOTOPrxgwX4VgeIF+mrMtc37aQwDcy/stRZ848HDb2uRKU78BSXA0SRkxdQHJqRBgya
         lFnK3lS3XvHNmSSeiAhEalsmKkCjn1rKs2xBqGGwIX9p9YddJyodJm/9bJInD57nLho4
         Pehk9JofxYTx7cH6KnYjCq13cnQ5ewTpIgvM7B9xtf0tOLxoMNVJiXdZeknt+WzlLZSX
         MZ+A==
X-Forwarded-Encrypted: i=1; AKwUvBzCn1ASC6YznOFr/IaowmGFDDYf0xWiAL8sg2tUgNseI7OCvTcPD7Zukf7shJgpujnjZO5/9YsL2Je52YIWfxPM@lists.infradead.org
X-Gm-Message-State: AFq9FYKBsxmLSlfh43zcw//cbKatHKZYOxqxYkXPHqMoYCgLxX8+HgUL
	ZQpsSSzyOrCQBNqpfpA44YJKXEgu4qYl+uNdG1zVt07jHNGdrNaDx01N9k41T86apsehZQ6MwVz
	WY/nSylanndLQbMbq+Mcsd2QSBqqmXwPdw+j9/eJbXHTHsbK9MQkiGhv/vtpzO3k0KhqPmVHSN0
	XfxQ==
X-Gm-Gg: AYBFou0MrlTztF1lumv53G23J+6L7QZfI07V5oCJuWX1/IgNGZzNmJ+XLK6d6HIogGY
	C+3swvtszQKPO1j+kiF/VWIV4DSir2jG0X7WkaneWp4WZ20SHRqkm6PFEN9HuIgVkGUQlQqqjaf
	Q3iYknUX3ghanUsFqlW+Hyaplz3jIhqm3sg4EApuXGQVsifzjS/ycB2G8H+KBGRy1FcdordJqr7
	IZkiOmc82/b7JxhDoKdUFYQ7pf67kmaKe5BTOOvfI1e5Bohj2jh0904GfpmYbeOLzHy38OPqUDi
	ZxcuzMQuwdQvWSNWExvW5MZqgtgRrfA56wX75Qyd/NLXR8K1HqIKX8YFWpFN7ADPSHoNcmzFfTG
	xYZK6DZLUYla6YU9Q1AjAemMBvdpLDXC88GXBG+gCW1klyntHE/Olc3UlPNo/OADakdKRb8FUys
	hBriejE1bmxah5
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id af79cd13be357-93f57d6fe0amr961378585a.0.1792675709060;
        Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id af79cd13be357-93f57d6fe0amr961370785a.0.1792675708354;
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:01 +0300
Subject: [PATCH v6 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-6-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9mYaSuX40bR5awBoUJ+yVcQNZ86P8rY1ul9
 gx36R5zT7KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZgAKCRCLPIo+Aiko
 1b7VCACwuu0XJB0SDYYnJaMPkQQJp4epfFvL2A8BbhoeeUkJxhpxOVsnuymLALMdK9C5Zp+RGrT
 Q8yGJuTHbZI7/BlNrAHb4m9mYAyiPXPNVpLyMCrH4EMXs7axplxd3M7EKjQ6JFaodn/DBje5zAj
 z0TKPh/LAVBSLdkEHMBKS7r3xFwn8q5l9ktLyhrJW6u6JOEmW3xtka45Bs7qCgBHHkPqG/wGYEX
 BFb9KR4xW9M3ZEhiTatIIZofZV1DhBQqEa19haQvTXcaw0CRJrzm9fgsRGVTMdLYX0l9pAUBE3W
 jxJ3xlzvjy4cBPeL90Q4VfJZSVXoYFh+Ph2xeoq5YptpjfjC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXytZYgN08J2f2
 ousjbgBf499R42SN3pVtGPZ8mhvdXloD1fhqvWv2FfYufZdGlPx/VI6cgPL2ZdJm4q2oWv8Q1bU
 6Vulovoj2gEPopSMGS2yyZYiF6ke22CPIzHSHTAXGECg6tR2OGyxoCRyVmfaMCCjQQKazdfpvHA
 RMDtU1jW4cS7u68yyGWjMgNsx9H3yD/Lj2i5ZDPR0ytzbfXZcioYfucmFrTFI1MKBUzyis7eZv9
 aoyJi5vO6cSNRZ6LsA/WHWTjgWBkP8JIlzSgFiTI3XtrtBoMl+XfdsbW8rhAppTHY/fxDra0b/H
 hHDUDCm878/hKArC2+4U773nJJDCOIPo/8s6oXGQYnR52QtiAWz3tfjeNd4+CCCQ5s+Kma3kk9f
 sGZt+0Bmn3WlIRoqVyb/WuaPouyy5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX3669bFKxlXWf
 eSHDPx6VSu/I1udvAxRn1fPDkiTuMrZNeh0o0tIcyywNKZjPVppAlasuK8jDmPFYZypoJ5u5Js5
 aHlrqZ/AFmxdmo1a0RvTmrCfVu/ajmA=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada0f7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XPxy5NEfm0HKWjB4g0BsBdoG9mjLUIqF
X-Proofpoint-ORIG-GUID: XPxy5NEfm0HKWjB4g0BsBdoG9mjLUIqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_062830_730247_53E37001 
X-CRM114-Status: GOOD (  14.53  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


