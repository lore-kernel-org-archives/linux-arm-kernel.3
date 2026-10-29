Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mwtMHtX6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7pDxVqD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VpzgAXcP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Cm5Hj6AX2bOx9FeJjSt60AwCDFLiBSACiP27rlh8gU=; b=mwtMHtX6LmNeeS+i3ptR3zoz2U
	G4uZgIaqwrTN0asocoTMLw6xRpsS25axuThDUBb0RVy6JvtsPDuyHr2c6mpxCeBaNhkB0nVryOvHZ
	QWmQhGc0pO5aXThLcm+zR8te3sziyNBdggfi4D4HPJlermWO4GOwiyXfrlbGS71upci91qbJ3Tkiu
	sCSH8S3Kdl69FdROEwC4G/FjnX5D2i32fikFanAkdlQZfha3/6c2DLEF0ddE9F+x2q9fHxAxCs/AJ
	zw/baPL8Shb/6PzSdbhcgwSEkHW3pi7y2aCzwGpUZwlJM+8RF0sH3urIalrmVtoI4BrFhAy4Qqv2C
	EbDvtUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNSd-00000008zHM-0xbs;
	Thu, 29 Oct 2026 10:34:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNSZ-00000008zGk-3HLH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:34:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TAJukj875569
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Cm5Hj6AX2bOx9FeJjSt60
	AwCDFLiBSACiP27rlh8gU=; b=C7pDxVqDghSsiAGhH18CBuMUsJyLL5u85Q2NLM
	YTvcT2ppmA83duhNwjGakLyIfjFHfcM9D4QYNl+bfsxLQDzlY/GHdJpa8gYQ0IQ3
	OcTDb6NtFGQngG+LB5TocJsW9ieCiqMNAn39+QGrJ1qP5X5odHlrBxToUd960RTs
	D/+7XT10OJVaDxqwqvsdTU9jcNQ7oE06J7zUJBoPWTDuJLxgXtWmioZNDeAJ4XEo
	SGmWzdYAJY9v0Hv5GKQGN4Bif0Jg3MRIEHRn7Be8ppwjgwyrUoWd5Nwv+P7nqnrA
	/BKfSYTCXT7+SNrDPPT3CH9JRzh4vG64Lrf580vf1dev+kIA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a201kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:34:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so516730e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793270053; x=1793874853; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Cm5Hj6AX2bOx9FeJjSt60AwCDFLiBSACiP27rlh8gU=;
        b=VpzgAXcPaGkdbfGXXlaK/6VJdbvYDV8xCd0e6DdRq7JBS5I7DYyVpK7tYD4MMvKNk4
         69+pAGt5aoQHOrWfH7a6ZtY1LINa5C77R1CbUnpZqHQTL8jKjdz7TE02vpQBESiYuqHe
         hFU9VvVoOJrBR0Ewp9tCBfuWDaXXHrffEhD6a/uN3vU4DEtL9fJKs5lclAaSgyO39N/6
         0Nfu3h5jAjzAKCbff0kU1vkSKK9Yrws6Pq5vTNTEuUQqSspu7fffRInI8tkYjWZ9y7tV
         v9YaYkmpEdSJ/EzK8ymdMmhsAkKOkEEmwJgT6ZfRmhbojVW46mUOQDfNa9Hyh49DcsPY
         eDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270053; x=1793874853;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Cm5Hj6AX2bOx9FeJjSt60AwCDFLiBSACiP27rlh8gU=;
        b=vsKLWY96VHptfKhK1X7I8b9WjZlrqfS4TJBqCQh2serJTncabPbS2Iofj740BLDpB0
         DiW+5daQ/msoORKMChTjHx4dbq9EQHhbUL+79ZZldtkDpjMciJJibM8QBq3FzCf6vWVk
         nnhOBbXmjCpIAbO2xvq/0CR6APtruDp4BT8LBDxHCYjqiJHqY6fUix7qGZN/gv2DevdU
         cZBgy4jfyMKt4WVlnn2ps7/2fGDqJX9YgwzkjAdR5IBPT/b5tw6jAwIvUTr6i4Jn8EcL
         6hrt8clxzGaYovew8Wn7hy9f5/nD3MZdzhYdsPgY610SD6VbVaILokaNjgJBHQavLhJB
         9nyw==
X-Forwarded-Encrypted: i=1; AKwUvByVZimTeZ4zwS7KMq0w83WJuxZXUmmigcEfRy5ySLh7mJgYtYrKgcIn6d/MKxvq/2kVu2/goSp6iIVx43wIV3Yr@lists.infradead.org
X-Gm-Message-State: AFq9FYLzNPEcJ9owfCyeOEBYlKfNG6xxPlNrGV17TXU3/GymMW0vsqY3
	Rqjkoi4X+d2JInj2Ax1LBLIgOo7LssFwZyuIBiydBh7taFOpKYqeT0dWYPLxpLIelhcDDN7WIO8
	RLvNyV/OvXvVq8mDBE8VphbpxvCFulUMbhbjrPPQ63QYKDLvNzqV7Mp3fXIWEBwLdy0c5vmmSmn
	zJMg==
X-Gm-Gg: AYBFou18CUoqaAFKqmXYle3EunwqsT825+l9Jp4040D4QKjk6MrmeXTmdUEpZcspoAe
	pQDFmRLfXs/OpxBf3vfVikmH8n1gxrdCnljHu/hCkAXRRQioxLQF9AAMz2zuT9NlzK5D8Cfhwpj
	D4q2gn39aTKtCw8nZT5OazX/ODPUbz0dsHxXbA/6tOAE0wXZOLrK0d0t+Tdwoe6HoJprvaWDaeh
	fOHySWmunQU4PiSpX0IB+69ZqpouiM/Ykemb2R4cN717HM8v3MZRT5wtG7oqbk9OXBmZDAld+Cr
	Oj+xTsN9tkQ7QfLTlqDImqdU6k8mDCuomEbGpGqYRPC73qSZSwz3iPdzTwo7wHvBLLigjyUL59o
	Qp3qgbAipeGy0aZ39aoe53H6GSr5LWQD2n9/MZg0wMX5yZGumRk72PmuEjKeoTcObXP9edsO/aX
	Ibh1OBpUdUoI9anUk23ydwTw==
X-Received: by 2002:a05:6102:3e8e:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d03a56c4d8mr2223871137.18.1793270053133;
        Thu, 29 Oct 2026 03:34:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8e:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d03a56c4d8mr2223860137.18.1793270052618;
        Thu, 29 Oct 2026 03:34:12 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm31225069f8f.58.2026.10.29.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:34:10 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v5 0/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Date: Thu, 29 Oct 2026 11:33:54 +0100
Message-Id: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3VNMQ7CMBD7SnUzV7UlAcrEP1CHkFxpJNJALlSgK
 n/n1J3BlmzL9gpMyRPDuVoh0eLZx1mE3lVgJzPfCb0TDV3THVoBcg7BWCTOOPoPMbZ7rY/kTub
 WNSC1Z6ItkNYVZsowiDl5zjF9t5tFbdH/xUVhg33fO2OVI6XGS2SuX2/zsDGEWgiGUsoPOiR7w
 bwAAAA=
X-Change-ID: 20261026-stmmac-est-fixes-13557ed8ab20
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX9/A9Cka47+dN
 XWC0dE0EToxnuZSLu/kFAgyzEwQUN4vkeeb0vK6KmfvQ0cl4oPQEfO+eHLbrVw7mzhY8RUvf4mZ
 swHeYGSNH5dO5C5v99S8UdVePipaHC1/BMF+VNvetk2OKfB7+sbwQPJ+33KCndyI+/OZl/4wNLZ
 DPm/w9E7Nne7jIICu0p+X3tln/mOkteQrAs7kjDuhYLThTSLW9LKPrHetPwGfZj26k+6tjMMxyF
 dvApaj3d/ARugGoiFTz9BwtJNOLb4+RfD0+E9OeWWzHizWBwRtwi1zX8SCfEL3gPmavydWBqgIO
 sARNGHvFLog5an0ITP4A8CawqC8s97rMi1+dNVhjsil/zC1yHsqSJl6NoCbjL1uMou+sA9+BqOe
 tijBIDGOHMZQ3fGGI43UkVMFYfzoO1YNmu1nu7xO3b43aLGTErTbZ31uW890vibHXvdfs1vQv8r
 o3py9jCY8XaWhkJE49Q==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae32126 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZioezP_FgeoBEakR8UIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX+sR5MoDtyukv
 FOHs+O+SO/QiitrSGl+pHH+OG2JrpWNoIH2bYS/AgA1aS4r6hCIE9ErhAbyDbqksKTM4i7dXEm/
 K4GQo+QElnHmQzt2VjUov32T7EKlPn4=
X-Proofpoint-ORIG-GUID: Qi2WplXjo4YhS46b2cJNTb-0pF36Y4SJ
X-Proofpoint-GUID: Qi2WplXjo4YhS46b2cJNTb-0pF36Y4SJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_033415_873017_1F8DC5D9 
X-CRM114-Status: GOOD (  12.45  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reconfigure MTL_EST registers after sw reset in __stmmac_open().
Remove priv->est->enable dependency in est_configure().
Initialize est_lock at probe time.

Changes in v5:
- Reconfigure preemption_class in stmmac_setup_est().
- Bail out in stmmac_setup_est() if ptp is not enabled.
- Link to v4: https://lore.kernel.org/r/20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com

Changes in v4:
- Rebase on top of net main branch

Changes in v3:
- Guard priv->est.enable update using est_lock mutex.
- Embed stmmac_est in stmmac_priv struct.
- Rework locking in tc_taprio_configure().
- Fix possible divided by zero crash in tc_taprio_configure().
- Add missing reconfiguration during stmmac_resume().
- Honor ptp error code in __stmmac_open() and stmmac_resume().
- Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com

Changes in v2:
- Rename stmmac_est_reconfigure() in stmmac_setup_est().
- Rely on stmmac_setup_est() in tc_taprio_configure().
- Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com

---
Lorenzo Bianconi (3):
      net: stmmac: initialize est_lock at probe time
      net: stmmac: pass the desired EST enable state to est_configure()
      net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume()

 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 61 ++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  8 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 46 +++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 94 ++++++++++++++---------
 7 files changed, 148 insertions(+), 77 deletions(-)
---
base-commit: d2bfe74a8fe219a86b86c1f126e1d722a5001790
change-id: 20261026-stmmac-est-fixes-13557ed8ab20

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


