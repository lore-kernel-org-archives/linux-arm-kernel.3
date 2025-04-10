Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F97C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViHFmfH38BAXSZxC5pAxZ33XZ4lXrW0Sii8iMmrd1Zo=; b=Y/LUh2faJkglbX2WLPIzQjwoiS
	cmovosHuxQfLAAd5eEERjncd5YbDtDjed84DWO50COzWrBttOyPuY2+V8naCglSDuRG7ut8J6BMs4
	WxclxSkl7ufn6FlQ+qsRjGu2q3kiFYSJunTEdeF1WBtduQxKknqvrJ+3DYzz/oOX+fGDn7nFM0JSB
	9VixgbPTfAQXlJPSIssxBYLliqDV9Q4UigWiue3HCEgKSq4KceWkSm57zfwGwMs74ABUto7g2QBt6
	Y5Tt6Qjft3ShaclSBnKPnnar27FsaUTs3Uvgp3kHMSY5jKpiaOFWEPXiNf+mmtiTKAlMWscGSR9KB
	GgZJRt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vuk-0000000BPva-1HPS;
	Thu, 10 Apr 2025 17:42:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2unq-0000000BCmy-2Nol;
	Thu, 10 Apr 2025 16:30:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39ac9aea656so948302f8f.3;
        Thu, 10 Apr 2025 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302657; x=1744907457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViHFmfH38BAXSZxC5pAxZ33XZ4lXrW0Sii8iMmrd1Zo=;
        b=YQIS80ssC/BeI36PtZs9IYQ2H7p1sBVJ3UBDxC1Fshh7r8JmOBc02qyYhcpbecBkxr
         oc144hH5wB++ornVNln5UbGMQlGmXXORVY99yU+TeKXQ3nRXQG7Te6De4as4PrttzCSj
         Y7Uua2417AJQNEGoN2xEw6efnSmb9z0hj8mRYuI5l9q8Niut//RjKwKu7TyRynFGl1Tb
         aE4zxDTNzKrf9bt1SUQqruBoA88tdLFgQbi9avNjTrNun7NYIrLzC5LtmKt9wcS++eRm
         iMsm2DLiFj7p/xzTywA5rt2L9vcQFxGSUZV9nLlmG8iV+1/6mpxZ5xxLE8dMimJM6TZ7
         mkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302657; x=1744907457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViHFmfH38BAXSZxC5pAxZ33XZ4lXrW0Sii8iMmrd1Zo=;
        b=XYsfuVBe/v1gYjJ0g9C7R24685VwPVcLqymY2D0QuGce6mUNF/FZOYz6a2UksFjgIq
         yo6LJiC9HeRIGm5ClyeKyyEIsG1GKl02b7khAt2SCeJNeIWiwu+iww9lLloqyp1qxTLN
         aEjUHnglPeDYJmgx5kKZHEcuknuAYoIR7mKXK2FHt3b/Rmhv/pZC4/IKBySqrYlYVEJ3
         AVDErAXGW+rKBBB8tWjv2dpWDICNIoMMvzp122jmJrmRECcecTv1jjGSQDGVGv7MisQn
         h0wOc73mTfhsUcScjbFQv8tHlCtSFKNwj77bsRUK6SscJle1BUXksVyNdBT7m8KBSjWP
         1TQg==
X-Forwarded-Encrypted: i=1; AJvYcCVv2PuEfEeianVrrXae8TXj6ocmK2vkk843O25160RmbCv/RHU464OPEjjVf14sSlFd2Xeao19XzNZ2FhRXCTM=@lists.infradead.org, AJvYcCW7bysYPUx52YglynPUWJ+8S5yycye9T31LzifS5zPlVMzvH2TZHvCI9HGNL9yFzDRruSmS6F6FjuiLJb2i5i2U@lists.infradead.org
X-Gm-Message-State: AOJu0YyTfyK/c76VaGcZOFBPdAXmm3BepuOh8NNjKRdLLfGxdJv227S4
	8EsAzgTdDl5uQGs3rqWNIrcgcvyILCob9Tz3wWOHP+iVzeeO0E/6
X-Gm-Gg: ASbGncsuceXXnIDM1UEX28C/Q8dQ1Ksf3ulndHrPSy9lK6yirlNGNRKNvBAYjLbHWiL
	JwjLnEHE3Mi9cVZc3gBi79ydWN7+dxsMHCiIMJ/UjJz+Slj5t9z0IPcBrpvT77ADqSxnyrRbyDK
	1urLitV0eg6CwR08elEDQl1F5L/Y2e+TL5jzCGs6UBQxFw4DRgf+bCg+ZYPaRFLpv4TmBku0KVD
	l7ISJHwVdi3e51/rJUIiiYIC21h9h9zj28kR40J7yjFBnxu2jSykgLD9IEIHFhbjH6k++5Z3lhP
	/qm4pEx2hnFVXoLuccpGkbvvaDZMdte7rqCcAGGb70TRoC5NE8w6UU6yHu5Q0QxP9K63FsiNXI1
	tGyByNlUJfA==
X-Google-Smtp-Source: AGHT+IHPWlln/QzRNYimnmyb+Y3Gk2occy0aK6leRTpIX0XYqPpPMw7MZql9NWWJQQmfp/HL3MfMOQ==
X-Received: by 2002:a05:6000:2507:b0:39c:12ce:6a0 with SMTP id ffacd0b85a97d-39d8fd470a3mr3124611f8f.21.1744302656743;
        Thu, 10 Apr 2025 09:30:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:56 -0700 (PDT)
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
Subject: [net-next PATCH 3/6] net: dsa: mt7530: move pause MIB counter to eth_ctrl stats API
Date: Thu, 10 Apr 2025 18:30:11 +0200
Message-ID: <20250410163022.3695-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093058_605722_4ECBC985 
X-CRM114-Status: GOOD (  14.25  )
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

Drop custom handling of TX/RX pause frame MIB counter and handle
them in the standard .get_eth_ctrl_stats API

The MIB entry are dropped from the custom MIB table and converted to
a define providing only the MIB offset.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530.c | 15 +++++++++++++--
 drivers/net/dsa/mt7530.h |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 54a6ddc380e9..f183a604355e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -43,7 +43,6 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0x20, "TxDeferred"),
 	MIB_DESC(1, 0x24, "TxLateCollision"),
 	MIB_DESC(1, 0x28, "TxExcessiveCollistion"),
-	MIB_DESC(1, 0x2c, "TxPause"),
 	MIB_DESC(2, 0x48, "TxBytes"),
 	MIB_DESC(1, 0x60, "RxDrop"),
 	MIB_DESC(1, 0x64, "RxFiltering"),
@@ -52,7 +51,6 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0x70, "RxBroadcast"),
 	MIB_DESC(1, 0x74, "RxAlignErr"),
 	MIB_DESC(1, 0x78, "RxCrcErr"),
-	MIB_DESC(1, 0x8c, "RxPause"),
 	MIB_DESC(2, 0xa8, "RxBytes"),
 	MIB_DESC(1, 0xb0, "RxCtrlDrop"),
 	MIB_DESC(1, 0xb4, "RxIngressDrop"),
@@ -867,6 +865,18 @@ static void mt7530_get_rmon_stats(struct dsa_switch *ds, int port,
 	*ranges = mt7530_rmon_ranges;
 }
 
+static void mt7530_get_eth_ctrl_stats(struct dsa_switch *ds, int port,
+				      struct ethtool_eth_ctrl_stats *ctrl_stats)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_TX_PAUSE, 1,
+			       &ctrl_stats->MACControlFramesTransmitted);
+
+	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_PAUSE, 1,
+			       &ctrl_stats->MACControlFramesReceived);
+}
+
 static int
 mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 {
@@ -3154,6 +3164,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
 	.get_rmon_stats		= mt7530_get_rmon_stats,
+	.get_eth_ctrl_stats	= mt7530_get_eth_ctrl_stats,
 	.set_ageing_time	= mt7530_set_ageing_time,
 	.port_enable		= mt7530_port_enable,
 	.port_disable		= mt7530_port_disable,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 9bc90d1678f7..a651ad29b750 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -424,6 +424,7 @@ enum mt7530_vlan_port_acc_frm {
 /* Register for MIB */
 #define MT7530_PORT_MIB_COUNTER(x)	(0x4000 + (x) * 0x100)
 /* Each define is an offset of MT7530_PORT_MIB_COUNTER */
+#define   MT7530_PORT_MIB_TX_PAUSE	0x2c
 #define   MT7530_PORT_MIB_TX_PKT_SZ_64	0x30
 #define   MT7530_PORT_MIB_TX_PKT_SZ_65_TO_127 0x34
 #define   MT7530_PORT_MIB_TX_PKT_SZ_128_TO_255 0x38
@@ -434,6 +435,7 @@ enum mt7530_vlan_port_acc_frm {
 #define   MT7530_PORT_MIB_RX_FRAG_ERR	0x80
 #define   MT7530_PORT_MIB_RX_OVER_SZ_ERR 0x84
 #define   MT7530_PORT_MIB_RX_JABBER_ERR	0x88
+#define   MT7530_PORT_MIB_RX_PAUSE	0x8c
 #define   MT7530_PORT_MIB_RX_PKT_SZ_64	0x90
 #define   MT7530_PORT_MIB_RX_PKT_SZ_65_TO_127 0x94
 #define   MT7530_PORT_MIB_RX_PKT_SZ_128_TO_255 0x98
-- 
2.48.1


