Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F70606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OUQiukdE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7PdC8nF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Px0S92S2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F7HsIGgAX4kJ2vdSLJyB0ReVskjk1f4s2+YTG04Qsws=; b=OUQiukdEI6OXQf
	QlLXEjM15Yb6wg4xvMhMPfsMWIpXTAdsKhRk8NwUg5baOXtVVoK1L5SOGWgeTyhnw3eor8NceU8Ca
	UjUUyzlxyXaWU3gp7iKdde+tvGKBzAQr0lXIx3ssNe5A/trFf30q5ftyKSiVO1pFZ1cYK7riJbYGm
	hURE9+3cfZMBwfvXPdboRvwZ1LZrx9xKSDIXPDBm1/x4/FWtA/ZsX1O6qOQGtziPlfu41786eFsyG
	ygI53Hs3/SrteZ5PmlZqQrjh0fVOKig8zM+c5C+UGu/3oHOWcCYOTPtyCLu+HfpgyWDD1IetRyyo/
	BHjeb0ILeVJes1/HC0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzk-00000002w2u-2Exp;
	Mon, 26 Oct 2026 16:56:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzh-00000002w1d-3XAc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:56:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwE6K3075124
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7HsIGgAX4kJ2vdSLJyB0ReVskjk1f4s2+YTG04Qsws=; b=Y7PdC8nFYb84EkT8
	53Jiip9p9MA4fsuiX6aA5hG2XK5Rf7ZO4wcX+oMtG1DKKKPXKkCV5Ea0zxH5Ayq2
	7Q568PHjxn0ElgtDNLmIVaseMOHzcNqEnGtCR0PGocGUUEUsELZGqv9wpMmtZuHc
	pMaVB9FYVe7hjheSTNPS2fSrMZ5L3R627798gyzLM3VdbIP52SBb4WPyOHLOZZGi
	QRVfehpBV5ZZrblHjoaw3/VEjfhtqh32J934pbRS3V8tRxcjdXX8BwANJNvJ8VaD
	QSxcs5Y1s5nEcCjwDuNEmurVQQevDmte5Eklk5Ir8X6ETSRPiIpTseesofStoVkL
	1Fn1gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdbfar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so677004085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793033780; x=1793638580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7HsIGgAX4kJ2vdSLJyB0ReVskjk1f4s2+YTG04Qsws=;
        b=Px0S92S2FIZoGhszKRp6oCJlCBq7pEmiTb46toEPILlOGGOPMLk30QwT8Xp43CUIpZ
         FGSeyhDiAKAfLq1ovtpwnmuvCPhO0ws0gFTgcWQxCHwwIBhowK7lZHsT/8cYrsxJZDa5
         Lrl3h9zZeiG2wyipsXbiXQ9ucVfAGF3IXqYj5c4nXlUt4obrxxy523YJ7y/1NDhKxazC
         eg3fXTJeGT2ap5XrzTz73chltzm9DS4gMTDMImaCN9leNxWMWizoy4/3R0ORCdKpVOUw
         v9EDfhZVnbpOr4XixdxRfuyd22OYyRFKwOvxTKaBWU+Ge4/YHbkNvJ//Ur2EkQYVAX82
         gX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033780; x=1793638580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7HsIGgAX4kJ2vdSLJyB0ReVskjk1f4s2+YTG04Qsws=;
        b=xOPsXqCoRrDZFmdNAJCJ1muEQF60HWRV/mm5ymVzSzTEK3zn1/i9yjwXwCjoBg+Wdq
         O4zkPPjGd8Y27sol8Vyt+Fcp815NTPz5pT0sxjMSeuGSk/UAEADna9fk1ZY7XfEv70Y7
         RXAzI0HJxEsVhQOIwidVJsX9GrA3WdEMzkUMoMHm2JIRnDZgJZr6jXXSaS9MIKRWTZIy
         Gq7N+qMWnkT6qGuyZ0yUg+MOfTuohQmGqkfaZiAWrHkU+1RoDEfXRI6XHDUN6iUIOaCV
         U/q6KEEpK6fXvorBjA6aekbs23AYItVLlqILdk+uI7qZRCTQ1wE6LtmzUWnSyR7WvOyD
         lY0A==
X-Forwarded-Encrypted: i=1; AKwUvBx9j+TRzjKnB+wnUGPujZmqlJ0Luuc4c1RmVHlOHd7xrGJp5eYVUsp+BCepUDhhtHP/B0VOtLXLDELgULtQ21cL@lists.infradead.org
X-Gm-Message-State: AFq9FYIeSGq330rv5V5iyj0uEIxz5zpa67rQeo8H6cyUSGV3SYfB30Ez
	8ILDG9h4u37S02JkCOERTjjr018gmPvJ3eCCPbyv8DkFvYspJVOkFMgK7zmy28k61ho1pmw6zpP
	2OHHNnueuTpLxiQXw8DvuoTj/TOWNLK6ociY0+3ubaKgsJiNrfmtIN50aTAxWoWLTxW8Sqe8p1i
	n4xw==
X-Gm-Gg: AYBFou0P5AGFRGA1mmSIELfdaA5F5J9O9xwgi27RwvwdE+wtUV1LjkK+E+29AXzDomY
	LEDYIukviKruG5ReYcGu9umx5OK/YdHI6tfVEZ+VSoeP6vQg296NW2a4/700Q/oYk+miPh5CMQH
	5mfjZdQNxbpnjJf+Nr18R/zhRsIo2bTaZv8m2OmET2Wk37liyHfqKn9iUGk/FXBn3TtR0Qnbzs4
	YRZwSqwjN6+3DHCb2isP4JfO6AO+9zMi53nAiah/suT4xk71NlvSAGgLwC0UkZTtIUKpFZwx7zJ
	VmiKrkm+t1qaQeAu26Til5sMQVPwrjWvhhrfv/u+A9tOWpIFucYoXRhdT33uQGlBGS+sbOtRORh
	JVtcCDo5/6SsRfM35+42IJ3FD3kiQNP3ffLlFTj+oBF+eCQz1
X-Received: by 2002:a05:620a:2b4a:b0:93e:3824:4123 with SMTP id af79cd13be357-940ef9a6b9cmr1108919285a.65.1793033780156;
        Mon, 26 Oct 2026 09:56:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4a:b0:93e:3824:4123 with SMTP id af79cd13be357-940ef9a6b9cmr1108914085a.65.1793033779685;
        Mon, 26 Oct 2026 09:56:19 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a56992dsm195870245e9.6.2026.10.26.09.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:56:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:55:56 +0100
Subject: [PATCH net v4 1/3] net: stmmac: initialize est_lock at probe time
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-stmmac-est-fixes-v4-1-999dac4de44f@oss.qualcomm.com>
References: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
In-Reply-To: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: nHY6ceAvZASpDZq541v8XEJDdwiI-ulF
X-Proofpoint-GUID: nHY6ceAvZASpDZq541v8XEJDdwiI-ulF
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf8635 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=122XcF769uAcj9t3WpgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX+U6T+qy8GBhY
 GOQCHGNP3Bg52FbioEZD9HKPR3MUIp+P5MFVirunJoHCOqdmHa1UV1nI8jFVTm+gdm0ij9VmFtH
 kYshznbr+ksb+8xpWKEz/62hh4gOawg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX01t7cuEWqmas
 2qEVWHKWPeodr4/VhezImzFuaMrnuCKZ6nDpVUjlhf+dLHu1oiDK3jlLnl3vHiIqpt/SIa0YWEN
 UwsF3hN+v/tmV5JM5kTAZYRviii91/nr95WvQadV8vd8dHV5ljemWKUcIx6dZ4HstjXqUaGSyXV
 99G4pbX8AGGToP7GRAbfhakFpoDFx+dfwQHhHTfAq7hCLKsTdSZzArnQ5+nQSMyJ4CVx7Ao6v9l
 GvvaJvDTmOW+zveqiW4IsOFeCpDJoY5ir8XX5/nx3oykmGFT76Mpz8Cxwvfoq8QB8Vc52/psQgk
 RwG1IADOc9eXm5XuwI7ZGuZycKFOzerEGL066xyMcDqVXnBvPx2uuqUq6w3TKlhVfUL3/ZY75qC
 nWwvB1PDPqcTLE2SqIFahsmDCNvCCRpFxbASOg2V9bqufOrjStmYi4XMta2WRxKClY4SLeBXQGL
 zekJU6gzedcPmANVeNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095621_898132_1F8753D0 
X-CRM114-Status: GOOD (  16.83  )
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

priv->est is allocated with devm_kzalloc() on the first TAPRIO REPLACE
and priv->est_lock is initialized in the same place, which ties the
validity of the lock to whether TAPRIO has ever been configured. The
lock is also never destroyed.

Initialize priv->est_lock in __stmmac_dvr_probe() next to priv->lock
and destroy it in stmmac_dvr_remove(). This keeps the lock valid for
the entire lifetime of the device, independent of the TAPRIO state,
and removes the lazy initialization from the TAPRIO configuration
path.

No functional change intended.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b20e5038eead..9e09e11cc35e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8204,6 +8204,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
+	mutex_init(&priv->est_lock);
 	rwlock_init(&priv->ptp_lock);
 
 	stmmac_fpe_init(priv);
@@ -8337,6 +8338,7 @@ void stmmac_dvr_remove(struct device *dev)
 
 	destroy_workqueue(priv->wq);
 	mutex_destroy(&priv->lock);
+	mutex_destroy(&priv->est_lock);
 	bitmap_free(priv->af_xdp_zc_qps);
 
 	pm_runtime_disable(dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index e137fb9012d4..aea235a69105 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1028,8 +1028,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 					 GFP_KERNEL);
 		if (!priv->est)
 			return -ENOMEM;
-
-		mutex_init(&priv->est_lock);
 	} else {
 		mutex_lock(&priv->est_lock);
 		memset(priv->est, 0, sizeof(*priv->est));

-- 
2.56.0


