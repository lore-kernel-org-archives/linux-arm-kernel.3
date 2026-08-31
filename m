Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2EAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 06:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tCbLbmKY4GcRljOMUqkVhVdQxtRWJPaJL1JlyTIkcdw=; b=V3cge/qrzGKliImgbrPNTAFK2U
	Ym6WjiOOhlcjxJusiWYoFb5o2GuLwMlcOEi0X7w+31NgpmyH2WAkeC26io/cbVqv4P8S0XbluNLGG
	kJLVNPM8oOWUP7andFKChqdw9/quWuEWCu1uraiYU4V0nVLeFdk/ouKarDwlaidzC+LUDp9EJZHT2
	LRpn+ayjx8YUr25bBCqrW3QwEF/4yPCy9i5kbFvnBXcXGUuoA9a/mlPqXky7tFi9t0Hbz15igbyMQ
	PzKvNnrlBvIfK7qgymSZqM/NwWWkw2BbjigkZlHO1GjDIEUGKYJju1CxRgP9gs74d8FTfFPEHnJ4z
	rPNpc8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vpV-00000008dwi-3ew7;
	Mon, 31 Aug 2026 06:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vpU-00000008dvs-34D5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 06:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=tCbLbmKY4GcRljOMUqkVhVdQxtRWJPaJL1JlyTIkcdw=; b=mCRkr/sEy/461b1xZHiar0uhi5
	bkyCqkmJUz4VHRn0oq/n8cCrvdC0ijEhR3l2grtHVk2MwRRI1kvrvyDY+jQmc51UvdDyBoA5cUl5H
	+FzyzZFUgFEfQfSjNslPQnKeT7a5X20HbTry1V/4+0cQfIruB2t8qC+0JP19bzdjGCtDHAoHmER3z
	uCMVNCp/YGo3nztCjLH+wOxHaOUJaV4uzqKjgcacvDVD1n5ZvfPX1Ml0m23d2b+M1uG/I/T+PvjRM
	lCnpO8D/uHPtmLK4Q61yY+44F9SeSxQif7dVIHYbwP5GM5UXaoJJ/DQz7JEzaefukwP0OIanf0G8Z
	gb3PiKbw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x0vpB-00000009Zjo-41ke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 06:49:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52aPt2764504
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 06:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tCbLbmKY4GcRljOMUqkVhV
	dQxtRWJPaJL1JlyTIkcdw=; b=aV4zbXrozEosL8DrmQ+0jvVGDfuyw3jZCocJyt
	xb5GkfnOo1qP0SFrco8JS3ED7ZJzrI7462EfjEf72ccSKIONm41Q4BGAf1O+mga7
	p46gZjSFmZZ+tIaJfCPkmGm9t++UsBsk4Mhn7VNep+5mY66ud+hQdmP3eacCBIkq
	FLtyKfZZ8Z5CF1mtVd5B6j/2Odeis9YH1MlSRHLOt+gydWPpEcxJAU0t1l2JLHwX
	EEiKe2VVhxtIyndmdYnCGbU7qwlbE1LaEd2Fsv+v25ngkUy0yi67gMXMeTnezeHI
	M9Kd6Bq/RbuKB+H2psZ1X1NeqLobor52alvW56jhnxBXrAog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyn2b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 06:48:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390ca1a9abso454471585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 23:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788158933; x=1788763733; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tCbLbmKY4GcRljOMUqkVhVdQxtRWJPaJL1JlyTIkcdw=;
        b=W0Cg21jTwwBc2Cjz+rqTNoc8QDjluf76hnwvAi29GLQvEHUSNcZDloyd2wtpNGJPHY
         mlIP3cvXHkJC6GleB4RbizcC2kHDd8eTty1WDWXbyZtC4sPR10FLH1hn2MOgGIg4HQLh
         agoX1ZSfCjSNNhjEEshqjmUVTqjemqDmAZqhssSwmtXJz6vhJO8brNIhHI0w7VfAJGGH
         9b7GRkoU2pxsYa7VVjHx2B96MfjDQ1EV7+9wiH2CLPCl199XsgGyQqQGghfBkH+yqZpL
         fTm2/mB1z7X566p8lyF9UrdCfflYyV3EORSRaFvilEfC0JGUxCeWP4FkLsyHHZumAgc7
         Lo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158933; x=1788763733;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tCbLbmKY4GcRljOMUqkVhVdQxtRWJPaJL1JlyTIkcdw=;
        b=EVnMTNe9prWKw4XBMT0C72YxwGRXMroEcA6Wax23nL4qhWoBnDxhcEjkeQ+eFgEggp
         P8jnkmzcuR25MkTL801N6gK/HFx5bpDVLIel+pkEfHgV7r8dMbMwC8oWZQhNH8nvI3i6
         STgSy/8QZsiZhWxZ1Z1fAYS3gbrlkLsL9lrSlIZe7Y2gNab3M43nCVW9Zo1g24MKfHOp
         g0Yq2mKdH0wWq0ZUH/oU2rjGwSUBpwt3Wvd9Lu2BDcRT6Nd0NrKnyg/i+UMnqO9uQcjc
         S7r1X2GGbV0fjD5SkdWGIpOIW1RZSXvJQ9pTecOepAPMYMY61d4GmPYFAlwT2MvlSyqv
         kWhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiHRjAwmWL1eefGESPSJJyukr1k0+yzaqCQ4kI02XWY9ZOCwut21ZhNV5MJDz5zf8XJW9bGzrSk6Lss5nSLTNw@lists.infradead.org
X-Gm-Message-State: AFuF++kRxU0DJrkC33t+tyPAoRyC419hB5/ElLJcQ7rRVRONtrcQ8fnS
	UvkId0AhNhpoL6gnklpr/Lz1+Tb0/PO47ifSRM54ITjL1vfpQYT2EVIHTqaOwqLqI7QGlzCXbbC
	MeA8SZqHeiJSbQihoAt7qZeUAXXCYnXv3Wb/bYyJHEMHEbix+/dWH3izvCsggg7z42tgbAgIb81
	1yfQ==
X-Gm-Gg: AR+sD10F5a1nuSTwbBb0zru6H0JNiSQjW3+dHv1CkOpOw9JPnbzd3h3YsPAVXloK061
	N6onwKSc69mJIBWa2pd681WemnT8ERYJei2GfJ58LWF5a+SoawCJ9OGuZeXQAo6yWfS91XvIaCt
	jO40mR5ez8NL/wYM6KswRN1envhWusM80NKeL07kHtC4htszOy3lLnC0VgcG6K8spEAiJnkYcjj
	ESYYOtrBib5TKPUrosha1BroaGnx63O3GcnhkrUdKcduug6uin0fYse3efM22Px9gI10j3VErAx
	Vbb31vF29STsrg3lLezoLo7kGo4Uw1IOJiV+MgyRGcUnxV5AamoLtvvZCLwsibl5rz77Zt8kDjY
	4c0VwMyrh0Cgf2A==
X-Received: by 2002:a05:620a:318a:b0:936:9f46:cec8 with SMTP id af79cd13be357-939139040fbmr2328089085a.20.1788158933395;
        Sun, 30 Aug 2026 23:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:318a:b0:936:9f46:cec8 with SMTP id af79cd13be357-939139040fbmr2328086085a.20.1788158932910;
        Sun, 30 Aug 2026 23:48:52 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c52fdbsm200870475e9.0.2026.08.30.23.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:48:52 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 08:48:33 +0200
Subject: [PATCH net-next v3] net: stmmac: drop the queue-0 pinning for GSO
 frames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQqDMBAF0KtI1o3EqRrbVe9RisQ4rQFNqhPFI
 t69IasuSulm4M+H9zdGOBkkdk42NuFiyDgbwvGQMN0p+0Bu2pAZCChFJSQnPwxK14Q9al+PM87
 IPTl+NysXpdZFVba5AGBBeE4Y3lG/MoueW1w9u4WmM+Td9IqzSxb7vxaWjGc817msZKNaAc3FE
 aXjrHrthiENJ/ILfJLVbxICWcpMFg2cpAT8Qu77/gbmu+z0KgEAAA==
X-Change-ID: 20260807-stmmac_select_queue-tso-fix-06cc586d4022
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1NyBTYWx0ZWRfX4JJoC8GMtNkJ
 +X9wb98/S0UJiTzzwQC+Ah/Fo/hNNHj6lVRRkujoEZg7zccIn3V94WKLKnEqjkkQF8SVdRPG3vu
 ypXJWxuJZwnjz6Tdji5w0i38ey/mHHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1NyBTYWx0ZWRfX6psgGCey4Jqt
 4QdUVBYQrylbiejt9aSp4js9aLgAYEYEYgKiTPTmk0yRnNGtN0qOpa9gOn/b3KjlQvJqArv0I1p
 7uXFtkFlxSTDLY/bIsr3zx/rLx88GB+lNgwrLak9oIV1yZ/KwHGzmiMLnCTc+4jKp0b4/eoOGGz
 RwNUvIXexvOUh1UcgsM4Rbex7iU81I3AIW9kzOlmfcZjKImfbhEfz6QNU7SR3Q0V9xj9bd4dAAY
 Y6KaUpGDIqZoqMTNxxhWAQCquZTgMwB4oszQ1QvOETVYGjzJYMJV8xIHqd/CbshtGJ0hhfpzjyj
 ImZ6QETy2Kg81dTHa3xKtm64fRhBlOPMxbldc4KsiySKzqwde6AVk/GjOU/HnmxpnNZcspj6XkX
 4Uk9SALXvXbV/sq35kCVZ160IYph2Nky58e0+qX6KoYM8AVy5/kjITDBp3D7cdRNcivPD/5ZcqO
 tkNPHp/MvEQ9Ju2pUdg==
X-Proofpoint-ORIG-GUID: dtnOFBB3bs2rLf8GabluOX5cXv3QEqbi
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a9523d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3NDt2XGU82yDlc6fJAcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dtnOFBB3bs2rLf8GabluOX5cXv3QEqbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_074911_611748_FCB849BB 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

stmmac_select_queue() forces every GSO frame (TCPv4/TCPv6/UDP-L4) onto
TX queue 0, relying on the legacy assumption that at least queue 0 is
always TSO/USO capable. This is no longer needed since
stmmac_features_check() already validates each GSO frame against the
capabilities of the queue it is mapped to, clearing the checksum and GSO
features for queues that cannot perform TSO (e.g. TBS queues or queues
without TX checksum offload support).

Remove stmmac_select_queue() so GSO frames are selected through the
regular queue selection path (XPS, flow hashing and priority mapping)
and can be spread across all TX queues. This also fixes the case where
queue 0 is not TSO-capable while other queues are, which previously
forced all TSO traffic into software GSO. Non-GSO traffic is unaffected,
since the core already falls back to netdev_pick_tx() when ndo_select_queue
is not set.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v3:
- Drop ndo_select_queue() callback and rely on network stack to select
  the proper TX queue.
- Link to v2: https://lore.kernel.org/r/20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com

Changes in v2:
- Take into account when checksum offload is not supported.
- Link to v1: https://lore.kernel.org/r/20260807-stmmac_select_queue-tso-fix-v1-1-4c4787bad02b@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f2fc89176654..2eb1c42a7c27 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6426,24 +6426,6 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 	}
 }
 
-static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,
-			       struct net_device *sb_dev)
-{
-	int gso = skb_shinfo(skb)->gso_type;
-
-	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
-		/*
-		 * There is no way to determine the number of TSO/USO
-		 * capable Queues. Let's use always the Queue 0
-		 * because if TSO/USO is supported then at least this
-		 * one will be capable.
-		 */
-		return 0;
-	}
-
-	return netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
-}
-
 static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
@@ -7298,7 +7280,6 @@ static const struct net_device_ops stmmac_netdev_ops = {
 	.ndo_eth_ioctl = stmmac_ioctl,
 	.ndo_get_stats64 = stmmac_get_stats64,
 	.ndo_setup_tc = stmmac_setup_tc,
-	.ndo_select_queue = stmmac_select_queue,
 	.ndo_set_mac_address = stmmac_set_mac_address,
 	.ndo_vlan_rx_add_vid = stmmac_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid = stmmac_vlan_rx_kill_vid,

---
base-commit: c4a839e06d0036c9a4af756d24688e0d34a18ca2
change-id: 20260807-stmmac_select_queue-tso-fix-06cc586d4022

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


