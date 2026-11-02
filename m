Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD660A2602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w4rMCH2o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ka7cIuLd;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSPJ4yQJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=; b=w4rMCH2oP9iWs8
	/bemy1KMmRLPmmiO47h/XYmosapl8NPcp7po1MA3moeRPa8Ibm0T64OClfNfub4EkorTWrlIg8LBk
	T2AyaDoT+3j+BmYo6t5/wUEzVP12cANycHMaVZp+3idk953O9RzNRHTc0wsCZiLB0iIvMPgryg1eL
	BeGwRnD/WvXB3GlCrCFVBD/KZyueS5H175TxzAEeGK9HxmMZ+N7Mr1lYiuIAfbJ8NoPB44CPKD5kv
	0OIEbi5Gs6BeeKVrJJvX8PjKTY3EP5/sEvXVfGr7p2riojdMN0/eHy+MW08hAHx3dM4H/aM1XvOHu
	wANL1WUi8bl8064nSQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXP-0000000GOAk-2R7H;
	Mon, 02 Nov 2026 11:49:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXN-0000000GO9p-2jPj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 11:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=; b=Ka7cIuLd79ZuSk5Lb2JeNwDqDl
	yNeXORrn7UnjygYT8onu0UGDQUlDgE4lYpmlYmuyB8KGi0RkdoONzCH9Q/Df1Bxt6Y/jopAu4cKC3
	YENKNfJXkNyoEG+pR6+X+mMS3wZfWZHQopP5LQFKua37uFAXbtZmDVHiRjGjMUgOqdtmr/x+GdCIF
	zcpQ+x8SAO5L0g7MjzWZKwAWNboAFrs/RfGtKMNwb4eReFWpV3gMPieM+bel3asEhX9z94yExSqSi
	Uubu3RAv4F/vfcrrJHiIAsfitp5v3QI9IlVGaXIC5Pl2PozOLZJ6+GZfo++hZhx9dUCgWdY14xW3w
	llBL8h1Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXH-00000002Ss2-0u65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:49:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4MKI2616191
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=; b=M+LxwsAKftmbCDgt
	MMYasS/rNqZr4DJEH/TR6oFS86p0asQzK3QUECCQyn5da8o1q0bNg7uvsWTSlBsd
	7jxX0VAjNSveNXJEPxbYM2v8CSxptrmLGwY+doGxR8Sa2A01N8xNyaTNtjGwO9AM
	kFGM12CRGAAbLZRYPgYMrKV2sRKvPj4FnUoizGBKjR5t6eMIEdj6OiGrgIMeBXJd
	1hB0umMpcd4j6yYt1sz0Jz5C8kUwnpvAMY6OBRRsUjJ8fFAZjIKyjKIvy7nq8xcP
	jNPMz0SJwZo0R127gYQrm1+pmMOQGwXMRPX7O8XSAMBEaIUXvN2Z8RR0xE4WkJA5
	cHlXdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg4y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:49:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9441113670dso684482985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620147; x=1794224947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=MSPJ4yQJULGr7sFWc7zuif6kDw2Ga5qvIdLNHZSYhEjbuBAKdq+oQiwA60Vx1rrSrt
         6lqw/KhG/FqRLyrIWw6L4xpXL6sXKC0h/d5IiA+/XgEU5g2BIoIpjH+E12Trk+eooXy3
         ARaOrnDSavQ1mNf9PSas6lqBGHP5VRqtncxyA7A7A8dqsbyvPFFgyfv7M3ZONhdDp38y
         m1t19YVfpBs1Jzps9pWgDu7oGJR61aXjlyTz9LfO1Ko6b/TEhf7ZFYDpDKMM4Qk8lLgB
         gk45GjCNmkigAJcBgI3uynB8gF8ONyZlCkOVKdD9vd8ECg0BPre8Mlh0C1weAxkcRbW2
         WqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620147; x=1794224947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=gSZRMDvBvSovUeVg/lMD7nXgKIr+7djkQ0Himbg78WsQISOQ8sWLsCT+zVglv8ObxG
         0kc3vp2LkA7QETn3dznBhKW+ZHqrMoGSKjwbESWtEDgLpyvrips9zUXBhAyR5/2P/vKB
         JFKqWsczWO0SGwUOyUtdzh7ymqSesiRaYgH5tfHG3V9P7yE+keSIqBuMX4pAi2LnWI0h
         JsSz9hu8o2wrlu/zbjU8BcaqansxALy6WJpsK6m15eILTOMd8E7hzfgsCI8JDARGGiOf
         URWz4JAJPzO9+gnPwDv602oJDCD4D6zm5HWTeigZ7O7U3HV7EOxuJBCxZbJkaU35NbJE
         0sfg==
X-Forwarded-Encrypted: i=1; AKwUvBzYw0X4iSO0NE1Zm2/eoZu7TLr4JqAoiiAV7d7G0opHEF7DP5nc+d9cwH0LRlIgnaWdm3hpo9VKkzQQYwhcV+6k@lists.infradead.org
X-Gm-Message-State: AFq9FYKsN5cafc7pUs/O7EgkPosPFge8IymKNhdu3+LDbxV2J7nzMqPo
	Cq0trBS9gBrGAEhusAVP6TuVJsiQ0WJZOdoOXgGKQ3BHYgkJNRsRrOjJRLrxndcegq8zzOLt1mM
	KZuFS1+wBsvVKzryEmLAa6LVkBlGoL67pjU03BXG9/YnYzBn1OF0GZ7lC/PeOufhPTPXZH0q74k
	KDLA==
X-Gm-Gg: AYBFou1knApF2ATrZWy7U7ofXM+QdxF5VAAfpwPcN1H6FJBVyKi2kCdz5YDGqjdxbaB
	H/KHP665GifG1v66yXewAvqnsLTvZzuIUmFXPY6K4Pivz9bwvpMgEG99iiLVSKW0uBCUNwUDcWb
	/qcXrONTQqlKZBv3j0Q/M/43ClKu8wKfjxmQnOHkjFoC9Me+fSknKVCy1lIhmfwT0UMIWgdDc5F
	hXm5xy9C2+9BCy8Vuc98+H2r+JVKaDiVtEoUXTxNmJIzsCL64DKrde+Yf78EbT8m/hrwgTTdmQT
	7TXgCMMvQGjS9Av5eQXqapZmTglQek0UubS8aeFJKFAAn14McEFiZ2DHeolUJtj5O29rSMmqJOj
	RadFr9/VbmR+F+iy4Gnb5XDSUl+/sViMmppX1ZV6gpWKt5sj4Nh38Vtsuyg==
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505387885a.62.1793620147427;
        Mon, 02 Nov 2026 03:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505383685a.62.1793620146775;
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:51 +0200
Subject: [PATCH 3/3] clk: imx: imx8qxp-lpcg: Return an error if the parent
 names cannot be read
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-3-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2uPBsKkTO9u8MCGSda/38zqhRD7AFxl26y3ujADk3+8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HiqqN4XJosCAMvkcauXt+bMtOzQ17SPXFOX0
 6cQ/pXmdCGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qgAKCRAbX0TJAJUV
 VsHLEACmDvcbVJdkVpIlT+OZGgqy2hYn09SA3vioW2L1kBakvGxPfl9NjLAnwChWcC9Bv33IIkh
 95VCogjvOrGTj1FdqY+5TAD7LGjqWC9Igznipko3jsFBzF2kijDRe48YiabcbKptsuYY9ZNmwQz
 aWTHHhNVwUqBRiTw50TAS+4Ub5QoLOC+oYQjFJTMILKnxn5rxBPFAO7nOjWtmBa1IYDTbR4r/Gl
 iXNeHn7xMSDIEZriXFQ4xh2XqG/pIveaOHcVJFJotHelNEk9H5G02wmxSb9ITz9YeFipBJ5DzJG
 fc+KTkU/iDdiNu9evpAbFbi1mJo1KVFs4CiXUAzUNAfqQkTbJsqqZfctHL7QIKVnQGZu4uibWL9
 FyE9PqsYgsyUsdNUDMswrfxqMGD0AlF/GfGcjL2cduQ/gfFaa9Pdx3mqnK9Dbbwp6+MFyf8Udyt
 ATJ8jEphUlHJ8s469efSVk2I8mdjNs6+M18BoWAwyrhYULSvDUJnSmi+Fd3kt0gIeGTVc9s680R
 XDmgpw4k0EBvp8ofJ2xXnb+CfiEilzUBY5r6F/O2hSmiUnjVDFBS4GhEcQR+6hoY+IARJdw/2iF
 SoHZH1Ssld8sjQi7vY+0HskfhWLt/O+loZbPpOdQYlpjXjDpMzzX/NjAG6jQ1wke/2EknoASr8s
 UpdTSlJt4iskH8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX4KfNz5ugaaiX
 NmkrjLVDBBk5SbMBj0NGEtLZ3Xe1XjZrSyXaW3HtsbW1fvPfEnUGKjlU2UjZ8JL7EiK9ZhsY4Ll
 JQ4SubS9rn4zWwP0eJh0MGi2Qw+J8KtK2m7QjUTcN2ZLtIoyTZvYKCJp+f10/rlDx4hw9//j3bN
 5pjRdDLVC/KVu3Py4+9FH/phsqkmpU39Tmj3ERQWmMeuLWCOcBrgrSXF09mnIiGEJ5cly7ZFmWa
 gQ8qNaOoozTLUAQ6OPps3+x5uOqZUDEBGvwZklOwdW8I2e3YguKQ55RmIooBuUt+sBd0OmnUIox
 HCVzZhCZF5y4H3v8YuBovs9uBvi9WQ0EO0/igbI+gxsbMA/moFJCZDIM14LiWnxxOXY7qQ+0Z2w
 7+Y0q0RyVsN3wB0tyWL+kmJyCVyVnWGe+vN6QHOWJxXpP1MIFSNHM+n1Mg4HZR26rIYmWaRQcv1
 fGzGktKvuj7apW6Pl4g==
X-Proofpoint-GUID: yN0YI2OygbEhL0tIlIe7hcPUow6HwJeE
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae878b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=hWtwQ3EaNFkubv4X:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2Br6plB5rF9h3W9bKjcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX/Y0CPM062qqI
 YeGxFTSfNg2rjN3b9pPbzXVq+Z2kjSvme84/ADE5OCLi5zd3Q0cj8FyOGRSJI62c3Me0RV8nwHL
 oBOYlkVQ1UAxmF96uCiNUxcdEkuGV+U=
X-Proofpoint-ORIG-GUID: yN0YI2OygbEhL0tIlIe7hcPUow6HwJeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_114912_048832_8B6CF4AC 
X-CRM114-Status: GOOD (  18.54  )
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

When of_clk_parent_fill() does not fill in a parent name for every
clock, imx_lpcg_parse_clks_from_dt() returns the number of clocks
instead of an error code. The probe then falls back to the legacy
binding as it does on any error, but a positive value is not what the
function is meant to return on failure.

Return -EINVAL instead, like the other parsing errors do.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index ae8cb5408246..4070e06f9c7d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -231,7 +231,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	ret = of_clk_parent_fill(np, parent_names, count);
 	if (ret != count) {
 		dev_err(&pdev->dev, "failed to get clock parent names\n");
-		return count;
+		return -EINVAL;
 	}
 
 	ret = of_property_read_string_array(np, "clock-output-names",

-- 
2.54.0


