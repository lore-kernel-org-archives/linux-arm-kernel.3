Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktcbp+Pd2XS6MSuzMxTirzvVqbEMHXkXNOon6j2cdWg=; b=0TOTMq533RN3Q87+aI4V1YCkhd
	1FBRLQWV32QftVr3+woafoOvmSoUQ1rLgzyRAWzKUhTfpxwLImEaGoRq0DaUS4mOryseoqI308mLK
	AtGgBpWmkIK2IgiV5kVmzgpePc8Q6uPNvLTokEWlq0bm5LEV8/LTiLLqEl4OiJZ/FA/EkINw1rJLh
	soLEzQ7KqV72UVqHsuIP3U0+pts3EYjPkWs2I4rcoTwBbk3WbRij4VJ176BV7a0StA16E72+/YZYO
	vZ19U5EXE6eiQ7OAmxXIsUUHiuryAfzqrrOVryDbY5F/eKdubo8o1UQxu+ZaL+F3gg3TvoD9OFKT1
	AvDuHeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ig0-00000007auW-3wKq;
	Wed, 23 Sep 2026 08:50:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ifn-00000007aoV-0rF0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ktcbp+Pd2XS6MSuzMxTirzvVqbEMHXkXNOon6j2cdWg=; b=qiuFUF1h9pmVjwfsGGFC/ANFhK
	ZYQzef29+BxXJlnena9kGSIp1m3ZiQc2x8hHymS9aJzp+f2w2mQ8sAvWO9dDx5BWWWauwlR7G4cb5
	S5ItPN3YIKQLOSSNnfhsGAf6YrABxUYOVAZ2ejVa6pq8AyjVPTeFgzKyJqbZyOo+HqDGwovukDrML
	GTJRPO0Wq8SzR05K8Ozc0Q/SOSexuTB5DF9ifbSbkKZLRob9DlK9jfDW7a6vahF6/KnrmP4O5WHqE
	Hh1P4XXMVxO+TyPvNS0AKg7CDb1yWVOCXnXYxsjObS9yDyKnift8Fxpl66emHYleTOkZxJ0B8ZbG0
	OHRs9vgw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ifj-0000000EXlp-3tWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:49:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JXLk3853652;
	Wed, 23 Sep 2026 08:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ktcbp+Pd2XS
	6MSuzMxTirzvVqbEMHXkXNOon6j2cdWg=; b=V0VIiK05iX+cXAkGiB4emncZAAd
	Jtt27wXbqNJo20QxNnzM+vwixavGq+jVa60LvWRTpmFZCERwZ982m8/2YInIHmW7
	6aHf/t6lyt8OFFVIAvXG4g0tTFX/G33romrKh8HeCXWtK/SXiu5Dh96PA6RRuqOu
	h/dStjLRziWSSIIgKN+f6qmfoyI5X6rsDwqsnTlw7r4xJPpHDGEAvTovuUdA5KeR
	tZaGwWyriVqnHLkF6obOboX51fhjZe7QQWunT0GlxPSmwmlWBIRF7se/3JXxpp7+
	/nNEH9IWcCWgbq/N6Fp7s5MdGeSIgheQHuXP93MfqRRJB5mCBtXGC0TxhPQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3ets-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:49:29 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8nR6f687572;
	Wed, 23 Sep 2026 08:49:27 GMT
Received: from ap-kernel-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N8nRFQ687557
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:49:27 +0000 (GMT)
Received: from ap-kernel-sh03-lnx.qualcomm.com (localhost [127.0.0.1])
	by ap-kernel-sh03-lnx.qualcomm.com (Postfix) with ESMTP id 280FC41241;
	Wed, 23 Sep 2026 16:49:26 +0800 (CST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH 3/3] net: stmmac: fix 10/100 support and MDIO for DW25GMAC
Date: Wed, 23 Sep 2026 16:49:21 +0800
Message-ID: <20260923084921.3942100-4-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX80vBIfE+dbF5
 8JDxdnkir0QrmzfHjr1foxz/L50wneK0VgWTii25nXAirNHf1IFCL5Q2wHcFHaG5rlb3qiNDDr2
 /HYl6Dhvm7rfsuSsLFHCgqNd67eFL5yFokQ95Grued5eh2/VTZAqpEUxViA1AEcBKRaY2sRW8mr
 yb6rGcQ0WBmQiZ12hHh9aP1F3EySYlyus4Et3XkiqaaH/J9KXSnI65zq0mHOAB0+8dEG2y3PLud
 /UXumnpp7NpBWc5Hmk6FMulYwBUcocijXL3Xl7OZynzz5ZMu6gs12wqtCHZcMXARK37tg5gioh3
 /jFoigpYamFou6qNOyu+akBm5XsJwkUCCDw2uPM4I2o8mrbFFMzJPP+3pMlMhGKQ/8GC+c2P0Fs
 ed+G+R7hnAusK2GdxcE+0o5ghVERdNc/J2xujKO5NM2GoLPVJzkqyI4D6N8j1eRsa3LljAYyY7e
 1Lmim+Zk+AeXFGk5acg==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab39299 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=AZWUV-QvOJebNs4wEXYA:9
X-Proofpoint-ORIG-GUID: YLCcAeYK7KFESdp1j8xNUvTit2KwreNq
X-Proofpoint-GUID: YLCcAeYK7KFESdp1j8xNUvTit2KwreNq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX7X4e3iGQZEqd
 KnwfNbho7qTUOdMHjsQnDwYXu4eNvaKU+7OcKqrjNH3vVUA+RmfxGCopl0pTzoAwsXwbPxdH+oL
 dSiOd7MHWxyiTX5GIYqDgXKgpco/aiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094948_511324_BD2B0EC3 
X-CRM114-Status: GOOD (  15.66  )
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

DW25GMAC currently advertises link modes starting at 1Gbps and does not
provide the MAC speed encodings for 10Mbps and 100Mbps. This leaves the
MAC speed field incorrectly configured when a USXGMII PHY negotiates a
legacy speed.

The MDIO setup also selects the XGMAC clock divider table and MDIO
accessors only for DWMAC_CORE_XGMAC. DW25GMAC uses the same MDIO
interface, so falling back to the generic path can cause PHY register
accesses to time out and prevent the PHY from probing.

Add the missing 10/100 capabilities and speed encodings, and handle
DWMAC_CORE_25GMAC through the XGMAC MDIO paths.

Fixes: 4975cb3b1b66 ("net: stmmac: Add DW25GMAC support in stmmac core driver")
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c   | 9 ++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 0b00d880fd305..65221b4becf51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1563,9 +1563,11 @@ int dw25gmac_setup(struct stmmac_priv *priv)
 	dwxgmac2_common_setup(priv, "DW25GMAC");
 
 	mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-			 MAC_1000FD | MAC_2500FD | MAC_5000FD |
-			 MAC_10000FD | MAC_25000FD;
+				 MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD | MAC_5000FD |
+				 MAC_10000FD | MAC_25000FD;
 	mac->link.duplex = 0;
+	mac->link.speed10 = XGMAC_CONFIG_SS_10_MII;
+	mac->link.speed100 = XGMAC_CONFIG_SS_100_MII;
 	mac->link.speed1000 = XGMAC_CONFIG_SS_1000_GMII;
 	mac->link.speed2500 = XGMAC_CONFIG_SS_2500_GMII;
 	mac->link.xgmii.speed2500 = XGMAC_CONFIG_SS_2500;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb0..f20a6e056781f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -552,7 +552,8 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	rates = stmmac_std_csr_to_mdc;
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
 		rates = stmmac_sun8i_csr_to_mdc;
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC ||
+	    priv->plat->core_type == DWMAC_CORE_25GMAC)
 		rates = stmmac_xgmac_csr_to_mdc;
 
 	for (i = 0; rates[i].rate; i++)
@@ -619,7 +620,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 	new_bus->name = "stmmac";
 
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC ||
+	    priv->plat->core_type == DWMAC_CORE_25GMAC) {
 		new_bus->read = &stmmac_xgmac2_mdio_read_c22;
 		new_bus->write = &stmmac_xgmac2_mdio_write_c22;
 		new_bus->read_c45 = &stmmac_xgmac2_mdio_read_c45;
@@ -663,7 +665,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	}
 
 	/* Looks like we need a dummy read for XGMAC only and C45 PHYs */
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC ||
+	    priv->plat->core_type == DWMAC_CORE_25GMAC)
 		stmmac_xgmac2_mdio_read_c45(new_bus, 0, 0, 0);
 
 	/* If fixed-link is set, skip PHY scanning */
-- 
2.43.0


