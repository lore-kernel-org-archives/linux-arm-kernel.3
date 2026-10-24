Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999D606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sJDlHNYi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J6SazRBE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ReuGjFdv;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8WmHgeb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=sJDlHNYigjYjqT
	ZdcbKtyEWsrfzoRGt8vR8kWrpJFHPwDB1aCQ9jroGJSjJLnaFMQkS/yeYiRoPsrhgjwprVP4EaaGv
	L2D9GccIwEJe8puiuI6Oye05C9ng2WTYkRxPVF7FPPX1dDP6hgB/xJzqkYNSxoTohZnWPWMWk/VjF
	SQ2veCgeFIRklyGXCxGgUpi3y5j+p99po0xU3NowktmQPKeSWNnRFGe/KuP3vXBYGfncFBFXMtXX9
	bLGuQQG10LudAd8VwNms6rXrMbQso82IUwzWiE7txwOFT+Yh9N2/yc8Qa80D5up6SDsMHKhK6XilM
	PZYy9wgEgrVgzaRwf1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjo-0000000HG5B-0ady;
	Sat, 24 Oct 2026 00:35:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjm-0000000HG3V-0NlT
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=J6SazRBEMrnI5ybbv7eUPt78if
	LebBotQd+ZLSAsC8Ldn2uQgoTZMCMhg8msS36OMe1ZfxB8S6o7Jdx1LmcDGF/PTX/zZH6PlIeSuoS
	Dcut2zyPjORl7JDeHKKs2+YKfpNbCYjGk138lKqfK5TW7zUbNHM30DSK9v0VXMD/LMwjsTeDEfuHD
	BFy1hweyuGxzfdIn53M92OP8KOsf5Z1MZ2zH45dU4fif3LOEWRRLBvHnwG7yBU3rpwtR89kzho/6o
	mgon60RAKFiZL8iiSLK8HOcc76EHwf8z5PHEeWJmvubZNQpYgcSa4FyaexKrJ0l9z+AVBtMtMleeP
	k2ZN19og==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPji-0000000AvIr-35Uy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvAM12495824
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=ReuGjFdv0Hrpztut
	yxC1lHP6EzBYxoEDj8WxTxhKWi+GZQjDs06NSw7K8JyweibefUBuDm/kbdLLeMOM
	/Qi5I0jb3oFjHjtwpk9gme+XP17dfzNDGFJQ/dzY733W513O0iszC8wtJ0ihy53X
	MeOyOsbjtRTzEfnIERh/1WFU9ytPZ8dwrc88Bw85XCFj/yYqpxVL8rytc/oqHIFr
	M61gUjpgss2No/7pmZxU7qp0U+EP27TXYeJiVvwur3c9+IErKX0L3IiIntbSA/R0
	qjGK/Yvaa4zMTK44b/hc+iie1TUHquIk9MYBZwy7MjLwFnaa1LoWCLp0s33yuuWb
	pAkUmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr091xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:35:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so265303485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802148; x=1793406948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=D8WmHgebcGIOdaaYMCpJOrHkLxP/YDD5z1fvtkhKQrJjVzJUv+ZPQUopbxEH1/EA3i
         y8RZzvbbx06WlprtXjNGdYkYQ93mDxmDGDQw/cDYW0+g1PYaFR82NZyT1agWR3RCWedS
         IqqFFO+WxD38azRA+zzHgme9Xy3WPxU2B2usKrXHJtr6+ITStNMcwKWfycwBXte/Dh/K
         Ju92qYOtLgMY2A+NMeofbFdTGskWzJ1Vy4OIrlQtYYOsL7iw4cROGIhBZ5vZ6wr9lac3
         Ek3SHGKCsCT5v0TtYWFA8CfATsfPYo/bbqf2NYUU19GXqypE1ygx5qgo53ADeCsFBkSx
         q97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802148; x=1793406948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=rt/1vj8X0qDPuGIWn2oprQjtfKZ/7O00pkgqGzzGOoXxJi1yJJwItF0m61NCXfHJs4
         peoAU8YDeblCJX86esUyRcQ/lAPSfMjJzzyy/MHO0gxXFyOq7/AuOgLtxfqfjBIgyisp
         8vhpsSallrz7GhJvtHlSKPm+uu68b1w3iA/mW/XDuBtABwdrLAcxlDsnLt8ADFhjjSzG
         rn+bYIh/Nc1JpXf224Bvh+GKY0DXrprsDCgXbYNh0bf4fnEBeECfkQ2WItOMgdMPE7qI
         59TCGkQmIA8a+PnmtjRktJE5yw8u7ZwL/9KdIJo+F4Zm7pJvk57u5d+Gf9cEfK4T0f+x
         1t0w==
X-Forwarded-Encrypted: i=1; AKwUvBxs0k2tKv9hmB9C6row89NrF/qgDSdgvjXpLH8HjcsNvOWb/Uthh3q4TFd/3z3MZOq8Lwx3JutZ3eBDOMXNd/Te@lists.infradead.org
X-Gm-Message-State: AFq9FYKYvQ4pjoYXpVO7H1J/IsnL8P4SIJsgWIzVF9pgatEpWH9BokgZ
	RQ9XiCX3yuDeT9HIV9zheZPTz+sB/5ulbH9JDeb13m17u9imyUslC6RoQQ7JKuzvTjdSObPFbHx
	aroC7a46K6kNEO2glz1bbEAv+e5ldLfCMnC31TXDrjaPA3ejNsLxEHS2upk6bPsR4NcfIKY5yz+
	SWjw==
X-Gm-Gg: AYBFou3ABtepmUSqpRP2vEQLRW2BzQSCT2hJW89Ws4/N+ljbrnwiDeLkkF94fqsUJhg
	9BO2I5gnvw5zZJUtwVBMHkHYKFO6CjE/CHwc6ACksTTSenW7aXYQBwlCiOeTokSbMi/9DJwP8SN
	YPauHXzwokUObaAr6nOHINmCkWArOMKgycMlmbmgxhByVQGqaxHEpRAzlMtzJT5S3EG0ehnHhpg
	NbvPNA3cVhgetH70FReuUHuWZPD+6W3M6hSPj+t48ih9bESR3cdPuBwhq51tFl0x2tRieLYKPYG
	KgvYxM8aXuGw/Ph2zG3tcEaqeeKAh7wxafDsX+4Ee3Dm0TvSg47e/v9oKuXmb+ELQinMqm72MD/
	9MpyLZ5w+V2bAwvgFjDp0V1slOaIfE6a7YncBGekQaP4NAOelU2gEVUPeCyQXM2zg5JzV2igm5A
	ez73sK54s7+jsi
X-Received: by 2002:a05:620a:370b:b0:93f:19fe:e6ca with SMTP id af79cd13be357-940ef939794mr102379885a.43.1792802147643;
        Fri, 23 Oct 2026 17:35:47 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93f:19fe:e6ca with SMTP id af79cd13be357-940ef939794mr102375885a.43.1792802147137;
        Fri, 23 Oct 2026 17:35:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:18 +0300
Subject: [PATCH v8 2/9] drm/connector: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-2-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1PEfQawOxcIPeQkTw3Ahbduv3n8MRID0UAN
 lY/P0w9/IGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9TwAKCRCLPIo+Aiko
 1YUHB/9tSxiaO49rIuYE1/it1nSy3oti+R7AeMvMDMfZiv9ikIhv8pNAkhXiSvwEmMMJW5yoa6e
 87vDylIusweUO7ajtlFct5rMYJSrD3u0Vnh6AuDNX3x4tGsdS2HThrv3QyLQtusxuYuxB2WjThM
 oYb4kRN6dAtPuCKl5vWij7/JN/dtpvYS3/ZBySxOrpLeiCKvS+cyMuR2OUSmpCpTEhobFS93XEx
 AWo/gjkuBAX0MzwDP/2sVdtWgioQaJpOTdngvcc7eva2QQuFTa9mdXj/LwgN0/GLBjbR/odeImX
 ZxMNtOaYpIkKbt/F6UWjooDUjgSW9nsHStYerCxrW8LV5yIj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yQvcVIh1_760YYl2GY_RkyHOEm-C4PeQ
X-Authority-Analysis: v=2.4 cv=FM6OVOos c=1 sm=1 tr=0 ts=6adbfd64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yQvcVIh1_760YYl2GY_RkyHOEm-C4PeQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXxAQLV3Ht57rl
 H/VOvhk6AKy79bXTpmU8TLhyih5kXmv4eTI5MG0NQTRkcP1PbocSinwSiwuNxu4ZvJVATy8+l+M
 hQL4zM7HYim3JDdz+Tq4VQbfjLnrulE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX1FpluzLOPZ25
 q8V6KiUB5ztRq8kVFA/5y9GmHOjj5XRxMV+N+DwRxnWQjuO9ugSWoBaJNU4YUxLfnccoodXZcIk
 pU/ICBRIPtjPcoERaO6753jhe1am1Rw6EbouSccmfSxm+en7GMy8GoEb4EDei61fIzAvknyJg8K
 CbrRNQOphaqBFO7wuN1iZH1J+ZmIU1+VNtDUWYu2Sjt/S0i1LHFt9BAHt5nHlYWeBY9wPi8o00G
 wYr4u5/BAbvHuhzbG0TNc9EZ3cVCH1F2xHiTNxoR7Y5nfxwH3wTLx/EiOSmF0W27lMVUMNGtdLr
 smq8PMaGi+EBd/50f+oS7Ivih4rrHqx6BRlupSg0hjJzZKT+yF7ik77npZFESzZeRugCKCsdlyN
 04SL5bhzT6KUoZayyzpu8ls43mhcVbX89+7LDblaxehQM64LdG2rGI1fuApFe60kJ1VjJyd2tk/
 ec+dASCWI5uVOJjV/QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013551_434672_1CB5D4C9 
X-CRM114-Status: GOOD (  18.91  )
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

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


