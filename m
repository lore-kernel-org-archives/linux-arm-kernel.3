Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F08F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cv2xlMde;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O9R9JZ2z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLDmVaKH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6ZgcBYpVxbMnsK6nHBTY3WX9f6ciMQ447QxCKtwKiOo=; b=Cv2xlMdekiP0dP
	lGQsOZwy6DAP6AwzpZPl0In9h9XzsjCnQT9LAqDJc5vLBNZruOL9OAw241/v+i4jtuC/FeUnIfw06
	V1jAWrYTdWYvRziLmNAjW4e8tu1f5bsxkWjTNzmwxBzIcSYKpLtbyrZXCM73VLdnxd3/fed/LzKuB
	FXM4b6uSKY0n9dDEl/y8CY16WtsfaSsC+tfV04IDZkLf+cg/TXmDkWTDEBZgSTa7z33qgVqo1t51R
	/fbeBNTEYCpJkIR8GbKTKewGwfyyXcF8Lp39n8cr8UTMxRNo7pECqB6uPblDK+SGqscoE47JhQ/1P
	54DV/0YBw4HaYT5gpwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNSj-00000008zIo-1NXl;
	Thu, 29 Oct 2026 10:34:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNSd-00000008zHN-0Als
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:34:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vSES2273523
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZgcBYpVxbMnsK6nHBTY3WX9f6ciMQ447QxCKtwKiOo=; b=O9R9JZ2z8+NfTTo3
	u6o0ybGnyy3CXUIWcZ7CCm9tvr5hGfB6qsjURK0qObJWJzlngf5KJe4F/AFmWBZ5
	Ec6DAhL+2TpQXq6y+4uJbr4Wm8OxRce3sk3kbgIO5gZVCWlXbFmq9bh7KssPnWsr
	DBQq6ZZTiIXByumDSGddIZ8VtT6a6mMtQEMjNGis3nMrEIvM+iTXX3LGiF8vb6bp
	E+83kg/WB+o9lTPSiEgDJqRQp+S+S8IimXkDesE+TjzAJsuwGdad296VyK33lMDI
	kDfP2rVoHJQMtRCNXqeN2rpzGhQ5kGuzzM5BXzNI+kf5h4Nj1Q3OIkNlRFjOo8xL
	6XdXrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0d35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:34:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so401895385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793270057; x=1793874857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZgcBYpVxbMnsK6nHBTY3WX9f6ciMQ447QxCKtwKiOo=;
        b=eLDmVaKHpM/iCA4GqUZXIwceie8fn0/0ZCb4f1LCAFKT3JLY13xLA7Wh9szVoyiWkQ
         wtiDGhod9DAzaW/hcJYxEmLEinZyZAoOx6UFvFlaszFKbD/Jk94LSbZ8PhEZUyubVsKC
         buvDfb5Irpjxw+t/Et+JqZWY/QBoycluC6CzbOpApp+uo6ufofc+AQ8IjQS4eHXNBgK1
         iZ7HXRcH0P1rB5bAz8koTTrw3EmJlXJcvdwHEkQdji3/BqVOorBWxMScBpG7bPyWTxpG
         t2A+vPFkMFyXBNRyjbXpC0fl3qPxo6uE6RMXYewyAvIfTXA9mP7IVPhjUJeTjS6z+udl
         e8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270057; x=1793874857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZgcBYpVxbMnsK6nHBTY3WX9f6ciMQ447QxCKtwKiOo=;
        b=OL1qpcQitWYvXNiqqW4z+O6psCcbtqDeVmgJ8yTl5PiANFZdlliXHWKGDKP8RfGiny
         YpyUwiLZEb6vfs4QGow9sNgZW+tQIOrkm3sQBFzCgMpRonzpJVu6I+EPRSJUJpG3FvRr
         8v5qwco04bxPAAw+ub08wnDspL7FVj1h+a9EUjmZ67bRJo8O8+0Efk8MmnTGr9kECut7
         xwf/XoRMWZjjjQN0ITbbkaVFLNRgwvDj7+P/+ab6xKIL8QZyLSUEHjCEfZQ0ZA0upOmL
         7sCdvWQ0hBfh8K5+HRR7KOkrX3vrUTa81anWE5P4Sshp9c9q8J2TuJNQkrQ/5q1gQGQV
         5RWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzguCK+Q3RDU73Ux7/DOMyWSq6WRJx1geg4KJciodpdfKmKNT5l0+K3OnNmwNIxhfzwdbCQjHJQRrOVBsTh10xK@lists.infradead.org
X-Gm-Message-State: AFq9FYJk83vz8tS3RkkHK40GGK7gRIsGIo1yvBlzstnj0bhhfZuRIklm
	TN+wttLxMxc1BH4Y1QT5r4Y4RnHm3fuQLE2S7JvI+Uy9eIpiU1POAP5XT7Tx5PQvf+7g+TbvakO
	bP/aJBzKTBUB/ixDLxMRRBm8EBEwZNMOWfvAHwnpflaU3z4K+feVqMqgue5oKY/0i1wyqzazfC8
	/0lQ==
X-Gm-Gg: AYBFou0Dqfir+HosMD5g3Q2kQ0TDHpwRtjE7Qegq/+/GBWw4F7085PIO0sYb8S3tr4Y
	z7hKu68D5PQQ17yqDMGJzvWJwm7DBVuMH9b37nH8a6oPNvIFdns34pxBJ6kiXEdhNfYwH2jVyD6
	XEwX7DRn0JVXvt2GXGhk2f7mKI7ZKvY/50kAi7VVrAahofP980vlknOS7BcsZVUav8KNLh9eoeB
	I3ZVGvkuTsscBKOgs5UZj190zZnYsqHO58R5QApReHNVImHGanXdgU3frJjk+mo1039EXl161oF
	BwSPyNlfA782ihVreXMQrS/y0+CqpxlI0BkGS8NA+0gpdHSbOSq1wXCXZt08VcVGq0uWCFuwNly
	Abdq9P7Ey23kwOifnuPiTBV7smN1+ke3vHkaqvvYNPVTLKt9RfqCHwpvIDjZTKwMRpblA6ARgC8
	ibHkxis4HOt82+40xQjIR2WA==
X-Received: by 2002:a05:620a:a40c:20b0:944:941:c060 with SMTP id af79cd13be357-9440941c610mr516893385a.15.1793270057175;
        Thu, 29 Oct 2026 03:34:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a40c:20b0:944:941:c060 with SMTP id af79cd13be357-9440941c610mr516889085a.15.1793270056548;
        Thu, 29 Oct 2026 03:34:16 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm19352255e9.15.2026.10.29.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:34:14 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:33:55 +0100
Subject: [PATCH net v5 1/3] net: stmmac: initialize est_lock at probe time
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-stmmac-est-fixes-v5-1-85b830a795a9@oss.qualcomm.com>
References: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
In-Reply-To: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX49kqh2SqcjCY
 8/C8pFciYbjfAvZb53aA2Z2xJNZrvGOPi4Xp5O5oRHXbEWwrygcQ/mBPoA1qE8p/elsC/GvJhc2
 ipRrpE4w9GYrxoXe95zu1wcc9j0f/to=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX7ngz18QyZMa+
 NDNMfZHk7I0z/iC2zwXDDCLDtIFL3iasO7WuxxddQzwez1kn3BnhDlCrMhrYofoqEgK1I+mfJvq
 gYmlQTVBMkXype5cPetGLAlgxhMItZN23H5lCVu64HzLGHs16UTMfb1JkDIyq7HVq2KB3mjo16Z
 0fdojpJxeuqB+DWgtlAy/Jqw+rEhdYOhM8hwsTDpRuUdtcyOMiZ+uvgADWMFrF/idT23OuOLAo2
 7n5df4BBMqPrweFcXA7zxO/nwoE3ZkSXDI32h/BsQ+Pd5LB8AOQYAldayMWDSeVCn3k37FKu3r7
 4JShy+D/wmqq1NXfcln0sde4MGJkYTHAXx+vHwTrppfwjjRDdIkEJN9joVB65AG4JK3DTi5/t/u
 YrT4cWEWyIuQu4TFtnonFvgt7hZ1EDXJEue/Iva6Esu87rzob8s0yeM2EGXqB5jKDj+a1+5xC3i
 Xql3Jx2Eu2xrGMYgnjA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae3212a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=122XcF769uAcj9t3WpgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 0GyFsl33tP5WYmU4T0-OsIOpQyIttRkV
X-Proofpoint-ORIG-GUID: 0GyFsl33tP5WYmU4T0-OsIOpQyIttRkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_033419_089436_7AF632C3 
X-CRM114-Status: GOOD (  16.14  )
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

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9ded31150fbe..2163e79fea9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8213,6 +8213,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
+	mutex_init(&priv->est_lock);
 	rwlock_init(&priv->ptp_lock);
 
 	stmmac_fpe_init(priv);
@@ -8346,6 +8347,7 @@ void stmmac_dvr_remove(struct device *dev)
 
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


