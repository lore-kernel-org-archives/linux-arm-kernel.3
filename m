Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27626606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2wuwbCr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Tye8kwt3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uo/c6Wxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=U2wuwbCrZif0aW
	o3b1mrgvL/qC6uro8Y1ipTAExtw2Mx+jQXecW8MwWRyTUaXBPz2uSMF6gkdUjXR3KRMyo1qORksHi
	8v82+lXYUEscNvH3jDE7UvqGpO3pFYudGA03o9Ka8FV7ZSozbL6w/0CaT+yFSS4PdSpt4kkSl7V0m
	CEL1Me+g5i5C0oXjz2NahgoZnyugwjVxy8OkUW+24h1LWXqRbciIMbUHf3CDCajTffczQ+k7Ge/9Y
	Dx9YV9SSc7Mcs1S+VFxRzFone7BetuTpYblXBaWGYZaRiC/p7nBYyzzBlO2jGQaB8IVq7d40G7cE+
	w9F+2DoJTto6qHGzXV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqg-0000000EBog-0Fpp;
	Thu, 22 Oct 2026 13:28:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqV-0000000EBaR-0hGz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=Tye8kwt34+z2CWo6lcISkpfr7q
	NrBQtWqEX/fGidwhI1LHGvtxnKLWWycGCEGdUXHqH53BsMrWHcfFJyHo/Rr0WylLaUGNwy82mbdh8
	NWGCqbEEbxZOEssf39oskUSb1Fja6sAJzgpDflBX6tPfpeXs1J32pUsw081KaF6LyoVAUeMVJonl2
	lbAxqRfHDWSbIAXNtQFnzKAn5auFjcG55rNCg8GjR3U0udbtmNgr2p0sphOUlJpvp2093Znhj4xGS
	imSyQYVzUPG/h7CviRC/Pua2UxhUVSqKYVd2bpKpuKqilldI811V+m/ksn4hS0oweRhjQrBb0SzPq
	ad5ol5Ug==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqQ-00000007Bit-394b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06Nq3115553
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=lDZZTSrsyHzIsGBU
	PNHByJxzu03sVuEFd7YCa9N4r/dTQMKGmX5g6LTrvGZKfxSVdSkvQnawX0Enj2Zs
	nW8hDHxxVDkC7W8oK0W1IHzhDvyLhFvjbe/s/UmIPaEd4W/t1M2uOgmhipw2JXJQ
	twptPeIl5am4ilbMTLfAM41gLjjifhlKDZadM8+uw/8xXnssNP9BAb+54fS+/KC1
	oem4zKn3O3B57IvTePSecSpKhSbe07Y9FAURIXt2xn0Qu16IASAjB6qBhOACCJ6k
	xqnKWxsW6B575ZHIaEg/r/xyVHw1NaOTQSGgi+OkzIbX3aXI9wYliFoMn7FIobxh
	nKHhCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so197577585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675713; x=1793280513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=Uo/c6Wxg9iRM3WErSdn1GJW7IZ4ZAU+w/X1bcc7uVRJDzT2ngjEiQD/rhkfhfFTO/H
         Fy1IYRHKXVQYGTaHpWEX9RK38K36i4CGSolRVdSp1yuhslL+BcC6i/LiFqIDTREACyXq
         /BN/3xfpryaw4MFBAbvfzjlJcQXob2a2G2wG1DdgBmnPyZ2lonYu0jeZ/QDCn/VPMO8a
         6fgvNtv8eNpOFGfZBKoq+6QUPvFZMRvOpOy3NaExHlSs6iT9Owx47xWu2C0yq0eRwlTJ
         8nRxG3h34GpY4dz2Esukv4EzD8GcQIpYuQOlexAUCn8WZIllYEfE+fBInO+zvUijgx/1
         OaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675713; x=1793280513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=Eee5lD7Ea73k6Hz6YGM9bXe+FU00VOw2GtvTccu9L8/o7Hsayq+ef69zKFX+0T/IVF
         cfaBP8ggbn8rOXe/88mYYYbJ0ZpLciRskkywYM9h+GpYRwMkcVXTC58ytiCbkbOcCgBI
         74wQH2jz1dOTzTrTJeF7PPVJjZcdTjuyVjH8xYGH/c5H4nSrpvK732F0NFKTp+r0/IfJ
         01gTCHiy+/lpUzr4M9xfs+t8gizBZ7J1MG8zr3tgfB11sgQ/C1tRDpW7oCLX0dph2OLX
         1qq4I7n/GV3oSaS/k14ZfUD2eshOAygY6XDRdN4u60WWJq9F2Zzsj6kjouhU3LjRjJ2g
         x9lQ==
X-Forwarded-Encrypted: i=1; AKwUvBztdM4N2UblwqShCNBxL7Jh9qjNWuQi/MRwB5aBYY+FKvpnWhEq5pJRrG3VLIr4+95Z2AVyrgeGD+D+ghBFhhiX@lists.infradead.org
X-Gm-Message-State: AFq9FYL92aFK+QU4iwMtfFNTj1B5aPNBIEwHZtp/Vti+UghuXeHBPZhb
	l5dPfimrNyHs37fPR+xZUkkgm7hOMeRaOJseBagkaw6DDomMeQG0KEAuuOmOChUTuOOLUtjEcWw
	3mgJoPaiMy3Yfs9B3hAaEmB9BA7c52kWkAr/hovYi9w5AILUZKAHKxI6s7jKdTByJfCvNgcwxpJ
	BijA==
X-Gm-Gg: AYBFou3fEC2P/tQ3mNjrAaZ0JUEZ+r9HxpigXzvR76r7D6Vf0Le32cXELaKOpBdCbcM
	odUN/TGkNDzCDOpanLHSeH+Z+J8b7kZIjLuFND2+DoRhF8d1WUOllNlsQWykZHElFY8Hnc+8zu2
	jwJ6tnSlcY/JYDOQu87zeiGoA4mugBDgg/rZlQTyHTaLBhf3wjjrDig5p1lZaelGSUQdrSLSWga
	LbU7NOhKKiWj0dkHMkqTsqtMYXCX3kOAOfVhSqxjmNaRv877mROak5VjeRWGYrXSUGxLQuc5ncs
	IbmYaH82Tcmdi8bxlca5SoskWKqcczj/WYvyQ/ZkKp26LGKxMIr2PThTYbNPnUVqSBPR2D9y74I
	8Pubf3NJ2P1xjMQpPOe+WprcwtMl0SkdZdu2LfJDIWzO4xcwKXM7pC/5m+lAJz1VyzLAdl8MPjy
	zbSvbFYLl5B1aP
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905867885a.25.1792675712669;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f57f0551dmr905861085a.25.1792675712171;
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:03 +0300
Subject: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9n9zhrOEK/rx5gX2YWvMmc8jjptMWLaOtO8
 lGcaMlPGN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZwAKCRCLPIo+Aiko
 1edwB/9YWfc2EM5dtSwi1Jbu3T4rlHmDDCXXx/nWp1kfXy0H2CCngN1eB6ZYMcxQtWmtadH7jVn
 o1ni7leB3t6qsyNfhfjzVK9bH5DxI8ykunhBwboni1mwzg//NnCAkchdPC0bT/n15WxKQCLyNcm
 Z/qS/EDw2gQ2yLhg3dHrpwM8RPmJ9kVwIvpF7K7Y2gbF5wAGLrBYa0LvtwCVS35/K/RvlHejThf
 6VdCYsYBJHHa9HS8h99g1E0vihe8vNmkSPwrHgdocyqB1rPFA1Xs2dD22Vyh1WLnDJ4N/9m0iag
 EISm7/cQe+/sZsMYSOeTi+FTCVIt+wn8wBzeI+jPBp4Kl2KP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX/ONlfm+nBr5j
 RhZg1tdv+6Wze1p4EdAvssBvbEjtn3KE/n2FNGaVsHXKQ2sch8WqfnrFAv7+uVIbsp51ZrDWj5w
 t00D0zbZvXGeyb3erbo/2o5NTrI8aJI=
X-Proofpoint-GUID: uWslF-xZE-gi1__ONR-7p9j6eRw-w3Oy
X-Proofpoint-ORIG-GUID: uWslF-xZE-gi1__ONR-7p9j6eRw-w3Oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX5b2Sk92lEhRG
 PgFQYNRHS7dOEzDi+vw7rhYQOcdoQMEmNomz4Ri8WQp4xCgKiFVcTtphGuTyl8N03wM1/YjFwmr
 Iam4DEyMaAl/R//04Ntm38mRffr0tVIksyX1m2sbvarrFdiOyNE+bNBM22aeho3145EYlQI/nMx
 jdB6DYnR8XM5Ajl1gUKzNSMF5KqLOwmTeHD2rMvnF+X9ooVP1v0QluqAgO21HxWOQ3O3lNLgvWQ
 FBqBDciqpb5xOd3FvQhUh3SkkcRc7kyHm+EaGIHWmtw7w6HMHsBngU2opfwfQPUVMsBRLmnPOYw
 RYuKp0P1yVG1cRmoEquVznD+hA8qUX+eMgRcjm4MMj4eGc071MG2G1bGBDeYwxcmrgSj1PubxyU
 RP1VuBVyyDpHmxc0j9jOxjesZgc8AQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142835_471787_0D63A8F2 
X-CRM114-Status: GOOD (  16.02  )
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

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


