Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647E1C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xP5HKMU4Cr0Wg2B5uZWRhwyFTU2Cp05IOS2+VcVHgI=; b=BhZgt95/CXLL8oB6G0EOuCpCLk
	ij+ZZNtxyyRGTH5COXyPNSsXVOV3XpgUJjATQ5Ox3LkAsrNGcg1/GJRUR+g3UIFQfPoK21PpeWdX+
	ISlfOcN7buhHdeyJt5OOM0AoIISNmOJBGDjii5BB5ONzz+UTNmiw/q2PqKhqsylLpwYqzE32fW1Iw
	evcearWjl5jqlEWJlxa7moe8YnghuuxKLw29Uqm/T4r+VWivG1Aka5WJoeEgxAqDWZpfMNabs+yA1
	aW/lIgAP2qejpmn7w2hNQJSNuwiw9LUubiQbSiifcHDqudcoaxipzcvm1RPlzsIbHO6YrXsgzNBFf
	9SRrr2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2w00-0000000BQyR-2YcP;
	Thu, 10 Apr 2025 17:47:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2unu-0000000BCom-24ph;
	Thu, 10 Apr 2025 16:31:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3914a5def6bso582145f8f.1;
        Thu, 10 Apr 2025 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302661; x=1744907461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xP5HKMU4Cr0Wg2B5uZWRhwyFTU2Cp05IOS2+VcVHgI=;
        b=cUNPitiZww3J3nqacro6ekbiciaF9Q8z3tKec+QsetktJsPJ36gqupnUlLOWvHmkMH
         iIOSjMt9d1JK4ABddKkliO/vtpxrnFbzgtGByb+VsWrTTISbfIDg2gSTL/qQ/QM/lAqF
         Yrsg2YO79dZAACl/MmzVV4+MhVHoYJy2T9if0nytNdlrxN6i3BmiJuCByvKr1CxUz9Xs
         Bt+aGiF/sYDUDzByXDy3mNnf2VtXOXydMitMzorJkAEWa9fYg0cW2RR+VA57K5G8/DUt
         20PKTRTk3FegfWCPhx672klAU6ON7lEm2LY2Y0O/dkxoSv9CO8ka5MjbLNueEG+vW7Tx
         A2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302661; x=1744907461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xP5HKMU4Cr0Wg2B5uZWRhwyFTU2Cp05IOS2+VcVHgI=;
        b=I/kylnHIeyPdM3dITjO+Egt1sUuNdLfsnZIcFHQOeQ5F/At/UxdM0Q1YdMlwXuv1FW
         udn/3maQowCylBvLVKhCb46CTPO3eXRWZGTJLgMZQ91F8fGkpE47hdgBV3QDphiFdXJ8
         gIITPy/B4C4BhwK+XIayK7RzRdx2SUMhAAae6Av8eCX0CBotDNyHc65z0eMKAwC0l/ZA
         Dsjh+9yANpmGrGZ0Gi8PsLnTi5DYObG3ylEwc5B2poI31MRzdMcObSgkjDOrSkHmja2L
         4iBisllbrR487ZiL37Zg619wk5e5ARXrdEDK6Y85PuYia2iStlGDxHManiJNfIV4c/SJ
         JTMg==
X-Forwarded-Encrypted: i=1; AJvYcCUlcwlDHDLZYH1SQE7CdHqWJV3qdhqmFvHKR78FLh6xCepHyRRotpKo2QDEn8HtNlW7bIzkvPdLU8fkgu9DOoE=@lists.infradead.org, AJvYcCXDBCIS05Khq/nJV092CZJoHK7y/lo4RKZo+1H9aTTj8SDqPiP1CExg3EuoAmNWAvpQ7IDOoOBAFAFU33FvVVMD@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZXvMjRepeBzkhibEQzPmtjKLUl2ydt92NDFrm3cnsd+oaA7T
	fvmFAnzkZQ/20zDw9tqlYFxNvi3UFlmx25cOfn9/2YHt23Icg6wv
X-Gm-Gg: ASbGncuej9x0ymKChstBGU6VBshTsq2wU70u7AcfYBc73fqOxrAuqRW6KVBQVdDF/62
	a43N31aisbsLZdUnUCDUSKyNOaqVX9STUbozsM6wP0HW1DdsPWApaxZydPYIByrFEp7dSblHamP
	uuRX5lmOGqLVJio0lqc2Pepiz9NLmknHirYNSt3t9LNM6mlAk6+d2teDxruBvAfVv66fsFLclYq
	F4nMnoD7XqJDIGxllPAb6sBVJxpYkw0YnLXjwqCaLG/KByXUVn6SpkMq52SqpiAUfU11x30Rl7h
	tmIphzT+dwV1dIRgypHdVMaY/o1mEtnZ69smaH54EmQjX8JGghh35dba3O8Y8P9MvSiPZYIntwZ
	VkaqESS2p6g==
X-Google-Smtp-Source: AGHT+IFLZORQGygpuGXuuMnpMFaA0HiTdtnbUlTXBQlP9aBu0HOw17B9WhsebA8iQM8vk0MLY/KEUg==
X-Received: by 2002:a05:6000:248a:b0:39d:724f:a8cd with SMTP id ffacd0b85a97d-39d8f4993d5mr3238673f8f.35.1744302660529;
        Thu, 10 Apr 2025 09:31:00 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:31:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 6/6] net: dsa: mt7530: implement .get_stats64
Date: Thu, 10 Apr 2025 18:30:14 +0200
Message-ID: <20250410163022.3695-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093102_536523_38F1F2A2 
X-CRM114-Status: GOOD (  12.32  )
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

It was reported that the internally calculated counter might differ from
the real one from the Switch MIB. This can happen if the switch directly
forward packets between the ports or offload small packets like ARP
request. In such case, the kernel counter will desync compared to the
real one transmitted and received by the Switch.

To correctly provide the real info to the kernel, implement .get_stats64
that will directly read the current MIB counter from the switch
register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530.c | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fdceefb2083c..0a33ca1dd7ca 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -906,6 +906,51 @@ static void mt7530_get_rmon_stats(struct dsa_switch *ds, int port,
 	*ranges = mt7530_rmon_ranges;
 }
 
+static void mt7530_get_stats64(struct dsa_switch *ds, int port,
+			       struct rtnl_link_stats64 *storage)
+{
+	struct mt7530_priv *priv = ds->priv;
+	uint64_t data;
+
+	/* MIB counter doesn't provide a FramesTransmittedOK but instead
+	 * provide stats for Unicast, Broadcast and Multicast frames separately.
+	 * To simulate a global frame counter, read Unicast and addition Multicast
+	 * and Broadcast later
+	 */
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_UNICAST, 1,
+			       &storage->rx_packets);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_MULTICAST, 1,
+			       &storage->multicast);
+	storage->rx_packets += storage->multicast;
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_BROADCAST, 1,
+			       &data);
+	storage->rx_packets += data;
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_UNICAST, 1,
+			       &storage->tx_packets);
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_MULTICAST, 1,
+			       &data);
+	storage->tx_packets += data;
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_BROADCAST, 1,
+			       &data);
+	storage->tx_packets += data;
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_BYTES, 2,
+			       &storage->rx_bytes);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_BYTES, 2,
+			       &storage->tx_bytes);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_DROP, 1,
+			       &storage->rx_dropped);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_DROP, 1,
+			       &storage->tx_dropped);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_CRC_ERR, 1,
+			       &storage->rx_crc_errors);
+}
+
 static void mt7530_get_eth_ctrl_stats(struct dsa_switch *ds, int port,
 				      struct ethtool_eth_ctrl_stats *ctrl_stats)
 {
@@ -3207,6 +3252,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_eth_mac_stats	= mt7530_get_eth_mac_stats,
 	.get_rmon_stats		= mt7530_get_rmon_stats,
 	.get_eth_ctrl_stats	= mt7530_get_eth_ctrl_stats,
+	.get_stats64		= mt7530_get_stats64,
 	.set_ageing_time	= mt7530_set_ageing_time,
 	.port_enable		= mt7530_port_enable,
 	.port_disable		= mt7530_port_disable,
-- 
2.48.1


