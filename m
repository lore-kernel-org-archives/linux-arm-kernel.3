Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585A0C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvfdmXPJ30DEketzEq5aXVKBwOS7ewPYMj6rBpY0hhM=; b=au0lfLaeyYZWtioa8pIBb1wXhd
	WHulE9jDpMvFdbuKlg8O2aC2Ze6bs+NDxO03mSmnGYF2DIKm0iVWat0R6AvLDvgbuIBWzMW7RviFd
	Ji9m3/VWSq60P8/b/fNyBtwisvWpHyvP87+M6xjzV6Dgae/p6wk3tV0oz9WB/cTEcJMzNfcTtjEdo
	1Umv+SJ1OpaCrJBqiRD02vH3HkLa9Y+q4HZJWwyJxIq2z31dKBCtQFjyyTUonpaDyXYBA8+d+cvPJ
	fl0TKN7xH0uBG+9dqWUs6j2WoDEXsz76hBl0VnpQXThhEO3FjpLRXh2IOFj7SQkqcyPeD8TF9VaNo
	MMWiPPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHV-00000002tkb-0akM;
	Mon, 21 Sep 2026 16:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHQ-00000002tiF-3F5v
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 16:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tvfdmXPJ30DEketzEq5aXVKBwOS7ewPYMj6rBpY0hhM=; b=YrBJgDgDAfoXc/JipppL3b6hgu
	/LJ32JWubUfvWC0tW55iQ7UmwpzvJ2aljmpIY25Wf5a9kWr9zsWmgOG5xtckIRb2s0Eo4zvByZdNW
	yhFvURbgDfgIYeMmJ6YSrjSfNaa3ayhTInCAiG3aQwVz2jB83nSsAEVNbc0cz20GY8B81WWJ18hp0
	q7QhY+t5G4qH80kcV/fN3bXVNpWXgpUr19RJjjVRtbLNUpvQ4sNdS+ojQ3C/1dvMUEnSWyQiQOR34
	FclaDI3ewo/Ak3NYurkzd/BaLg+sN3ohERrjQSM4MPonpxcZllfUYuk0xYHrcPFepo/QXY5fHkYRF
	cBXWzNFQ==;
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8hHN-0000000CaZM-3RIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:54:11 +0000
Received: by mail-oi2-x10.google.com with SMTP id 46e09a7af769-7f4f0dd550aso834889a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009648; x=1790614448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvfdmXPJ30DEketzEq5aXVKBwOS7ewPYMj6rBpY0hhM=;
        b=H3K000EBCHUzhqFsPHWB6RXOerrPjRwgX4lMN4rmBlvUOF+5RsGwSV9CQVPJ+gW+b/
         3U1Td9ib8Ybh5JEYW7wDKjSbhpkc9/qApFlqj6079Twz3tA/qzAtVcgcHs05DRpgDgP5
         QiZ0KUAvujNu/NvDg/aA+tOMs6s5GEi3Mr2Ldw96azNUo2wv+svBUUntjx4qpR6bhzS7
         gkLkPIyVKar3od4zHUgBWuYVKkGmdhCVU7J510YEGHN8PN5gqnUPxL69EWYLRASlfJN5
         Tphxl4/WYFXK1/SvcCg/yhwS9skzg88JSX2LCU4W63ws+fmJgQ0xDleOqnq0f4iDMCDj
         BWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009648; x=1790614448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvfdmXPJ30DEketzEq5aXVKBwOS7ewPYMj6rBpY0hhM=;
        b=rkTz9vG6Yv7y8oTn5E2R4pRJptsS/7H6BUoRj2J06MfqOK0WXZ1KhvgA5tAQ5Y2HaP
         rjOHLI4YPOBHzINBxc/S6dOPf/PEOTkPTux89bW4NRfiQXZMDiDkf88TWprt3A5iFzWc
         dybhkOOH1yUUI7fNVrAq3EZjUFalZoZUVENWA+gHIbhuZhCylKPWQosnVpxkjKe8HolK
         fTql89PuETE2o4OyKe7RirqLqlaFVRit9E3POae04KCMzhMeT2+ewvf9u/B0a8fBjYk9
         u0RlQuClGd2QaDTFFB/+wxb5ov5kPsGliB6TTLlGa+Px6dVNSlNd1IagowS5BjUlUDXb
         Iikw==
X-Forwarded-Encrypted: i=1; AKwUvBzw61wr4rrjyyiySgV/FYNOtSRSW19ILijuHtEXcDezPw9znp+UMC4GW/ZEF3j194wuIrRLqp9dkYc11YHteb10@lists.infradead.org
X-Gm-Message-State: AFuF++nu3UGlH7m6nrnj1smmFikj1DQMzXleNpBHFfyTWbVdIDyvazfb
	r4q87O4b9izZx3Z7TlssTt2bt794BOabuT02CVZ2zVqa4KEYip1eMBQm
X-Gm-Gg: AYBFou1OIZKULRYIbGoV57UPcfIlFqwEiN0upAEpx0xODKbQHa9UwP5tQmVpS1TGfJ9
	wUR9TLn20cN4uf1vES1rO3rTMA0wSWgYMiuuZij8raR4G0XJZ7bAivT4/HlnUNPg3UsdW72VCaJ
	nMU7xOQMb4v6skzWGo9hhTNAQ0A/7SYaaZxddTxIMv0m1mSstMO/sx7RWUH02mWyCHGQJm4zPSm
	e7P/AGthoXxzxBcEEdnXZLBkg10M/1XP9stUDLcRc9vjq3YUr98tJW4b2T9QXzNblI2IWE0AVLH
	HRmHJJOeqVlGNOW+1lgCmf3nwxtmmzOgqfmH5xJhFSPW/MG464CTIN3PksJ4QtlNgL2QP3vOeuU
	ZwKJiQ4t/a71YMGKLwt2/cYTPZq/3Lnn0JeKhFQEAyPMc1bcEp3W41t4rLaprh+m9H1gfp2ixDM
	BOmfaLUJFURvakjj5juAWE7VGe6EBvxfj1IHn3ORKhTblE2kpsg/fveo+f/BVtHf1+nfcY3SoAP
	7o/j3ZzSc3rWrATZ4mxiR6kU4qEehIScNcmCZ7vuzihkuOC/xDy6gjay7EdLXlXlHL34XIsjw+I
	vyyX6gfXWdF0/tTGzBLWBquIsNJW++tPCgNLNvLngKy/Ipib0NbiGJey5Jyub6r0NTJGmI/lcun
	3M8oLiMTg18gUQKFYuIPB+g==
X-Received: by 2002:a05:6820:f00b:b0:6bd:760a:a8ce with SMTP id 006d021491bc7-6ca9d451e13mr9761450eaf.62.1790009648212;
        Mon, 21 Sep 2026 09:54:08 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d145bc40e6sm510481eaf.5.2026.09.21.09.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:54:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 10:54:04 -0600
Subject: [PATCH net 3/3] net: stmmac: close the interface after failed
 hardware resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-stmmac-reset-fixes-v1-v1-3-87a4e431ee00@gmail.com>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_175410_097112_A908B832 
X-CRM114-Status: GOOD (  16.43  )
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

System suspend disables NAPI and suspends phylink but retains the IRQs
and DMA resources. If hardware setup fails during resume, the interface
remains administratively up with NAPI still disabled. Closing it later
calls napi_disable() a second time and can hang indefinitely.

On hardware-setup failure, stop DMA and disable the MAC, then release the
suspended data path without repeating NAPI disable. Stop phylink directly
from its suspended state rather than restarting the link on hardware
which failed to resume. Drop the driver mutex before teardown, retaining
RTNL across cleanup and network-core close.

Close the netdev to detach the PHY, release its runtime-PM reference and
clear its administrative state. Reattach the now-down netdev so a later
open can allocate new resources and retry. Preserve the original resume
error and leave successful resume unchanged.

Fixes: 6896c2449a18 ("net: stmmac: Check stmmac_hw_setup() in stmmac_resume()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 29 ++++++++++++++++-------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 44b59d0f56b5..87cb0978ed6a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4245,7 +4245,7 @@ static int stmmac_open(struct net_device *dev)
 	return ret;
 }
 
-static void __stmmac_release(struct net_device *dev)
+static void __stmmac_release(struct net_device *dev, bool napi_disabled)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
@@ -4258,7 +4258,9 @@ static void __stmmac_release(struct net_device *dev)
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
-	stmmac_disable_all_queues(priv);
+	/* Suspend has already disabled NAPI when hardware resume fails. */
+	if (!napi_disabled)
+		stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
@@ -4297,7 +4299,7 @@ static int stmmac_release(struct net_device *dev)
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
 
-	__stmmac_release(dev);
+	__stmmac_release(dev, false);
 
 	stmmac_legacy_serdes_power_down(priv);
 	phylink_disconnect_phy(priv->phylink);
@@ -6174,7 +6176,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 			return PTR_ERR(dma_conf);
 		}
 
-		__stmmac_release(dev);
+		__stmmac_release(dev, false);
 
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
@@ -8356,10 +8358,7 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		stmmac_legacy_serdes_power_down(priv);
-		mutex_unlock(&priv->lock);
-		rtnl_unlock();
-		return ret;
+		goto error_stop_dma;
 	}
 
 	stmmac_init_timestamping(priv);
@@ -8386,6 +8385,20 @@ int stmmac_resume(struct device *dev)
 	netif_device_attach(ndev);
 
 	return 0;
+
+error_stop_dma:
+	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
+	mutex_unlock(&priv->lock);
+	/* Release the suspended data path before ndo_stop(), which must not
+	 * disable NAPI or free these resources a second time.
+	 */
+	__stmmac_release(ndev, true);
+	netif_close(ndev);
+	netif_device_attach(ndev);
+	rtnl_unlock();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 

-- 
2.53.0


