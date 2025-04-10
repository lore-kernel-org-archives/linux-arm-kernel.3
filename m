Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B91EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5wCdgkj1tLGVgRC6kEKRulIXxRtilUymkai9Lqmc7k=; b=EVVmLJSzTJhYiEWY6rcdkOBElf
	TCXSa9HyzJOB7gpsGMHn9Rtdo7SC5rx+1lEnIPTBfF254Rj1TMxye2EE/Gh4uZrllHHha2BIwoXIp
	nTANSJPEPq7o3vYpQwxL3Bgnm/ArovrOuXTYI8Zv0Pz7O4Y9PC0iVAChP2D0z4kZw2aFtUoNgqQlC
	5PFd+lpzCLbjd2mwRilkfrTBInMzRASJBNV7E1y+SalyaAUvjgtkXVUSWTXYngn1En5ZMhOEcsMhk
	UW67n57/DSaQbYnh4Ja9W6EWD09blCOTiZ9mRIV/z2ybipf46vRWRlKBTDJzzFEiMACA/b2obai01
	aQiBYcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vyF-0000000BQds-2LWF;
	Thu, 10 Apr 2025 17:45:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2unt-0000000BCo3-0N1N;
	Thu, 10 Apr 2025 16:31:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3995ff6b066so540018f8f.3;
        Thu, 10 Apr 2025 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744302659; x=1744907459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5wCdgkj1tLGVgRC6kEKRulIXxRtilUymkai9Lqmc7k=;
        b=IsKYKTvPxu1bX4CjCsM6R0ESNCa0HbhSmt6AwwzPHxUsBCLaHjH5hc77kGhQjorHxv
         8L1/FrG1omLNWt+N5rVYEny59wIohzD3SpddHILPKzXX3/WacBfK2hPaJWPmM+xEJEvg
         4U9H+lc/czd6jXzbUC49VeGvWeA9O6Zuo0j6BKRy4oUHn7BKEmcF0tFCjd5JMPByyG9Y
         f4/s/zf2VabQk8ThAwxWzQfYHpRv1B5QbGd6/GSJ/JqQj7QnsxIiHuzZ3VmgzPkbC9Kj
         64+ddbPmcXgo0oEDKge7KSAjoi1SuwQMot8AzROXCvAqkB7elBk7vEpsdYLaK0EO5dRY
         yTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302659; x=1744907459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5wCdgkj1tLGVgRC6kEKRulIXxRtilUymkai9Lqmc7k=;
        b=OgmB6QPuoxx/4QDctlGgnR+bprQ8oik0JzGorv75Uy7gFJUCOFsB327NHAMrpUD50Z
         tkpgm2od6EPJbSbBfvMGpRK0AihBhmvh2T6qRjptPd7Wt6YEvJW9ef7KK0piyUfYvimJ
         gEfYl0ct6/5T6gtxa6FSxvY80decygSi2khZuMt0pQ0Z5CVc+YBdAEqzZXUSxDN+JRIj
         DQngIRTdpdxUBXtj6DovflsQ8tqPItDoObmWmQLsfz63tw1xKzFu/caMAFr/fQ3yUA8c
         RyQIctltkGGXUNWwOUV+rqxbB3ZM7aUF5AMFOgyAWD0mtLTPC1JcPatwtBzfjFM2axLI
         64JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlptxLrFUEwDkTpWgX9eEPOBlatatWrlo8jUs6ymKwR0VdMo5rZlwVNAltj3HbnDzfNFvcnKUVVgH29EHbDB30@lists.infradead.org, AJvYcCXr4esJnorhO0uSOQ00CgvMHH2B6geSnNxa1ginrXRnLxzuqXFckKFVYAWFc1LqCMvaonukUe1MqFq3OReQhgk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUBhuIU7x1zx/pIMuF/RnDIJvk2AI289yYsftPsQEVCSljchNu
	SKolg5IiO60IytjmJStVy7+T6kAIR51tkZ6Q/68WveOMjDueKiwF
X-Gm-Gg: ASbGncsP6j3ZO5hY7T2ipG06vkJidJEpSlv9bWxKkexnMCltfgrYsHOPjxvY80GpigP
	hu2GkYKFfeYbEFYKMd3nwP31Yc87yZ0KsNt848yxihBZP9SsaenYn6D94eyNkHJ9k1Wp9N8nX+J
	t6LZgiG7g9BVrxvTEchiKCMmN4bMqLJ3IvSOlrN7SSYbILevfkK60K2YT8mMaqG5+r2ocH8pSwV
	jCDHkdKv3vwtb3PDMNHCNX8O81P/w5/mwSFNSCEpv207DljWzzzKri0L3yWC79i8/7XJdR5HZe6
	pDxYJfh80l8kYrbRxQCEBKVNoEB9d3r90/5nDIeFn1Xc7ngO24z1nwIALWUEmU4kvx4gpHWRqFz
	JXMf82iyhkw==
X-Google-Smtp-Source: AGHT+IFWV+rbSMlqhfkoULEzkNSZq5SXSEPgsO8dHqya+MOqyfnGDk6SISRU5Fy2AR50TnIhmQMcUg==
X-Received: by 2002:a5d:64cd:0:b0:390:fc83:a070 with SMTP id ffacd0b85a97d-39d8f2254d1mr2958848f8f.0.1744302659288;
        Thu, 10 Apr 2025 09:30:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d893f0a75sm5374033f8f.62.2025.04.10.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:58 -0700 (PDT)
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
Subject: [net-next PATCH 5/6] net: dsa: mt7530: move remaining MIB counter to define
Date: Thu, 10 Apr 2025 18:30:13 +0200
Message-ID: <20250410163022.3695-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_093101_138523_9D9AE1F9 
X-CRM114-Status: GOOD (  12.55  )
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

For consistency with the other MIB counter, move also the remaining MIB
counter to define and update the custom MIB table.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/mt7530.c | 18 +++++++++---------
 drivers/net/dsa/mt7530.h |  9 +++++++++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2202c657930e..fdceefb2083c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -32,15 +32,15 @@ static struct mt753x_pcs *pcs_to_mt753x_pcs(struct phylink_pcs *pcs)
 
 /* String, offset, and register size in bytes if different from 4 bytes */
 static const struct mt7530_mib_desc mt7530_mib[] = {
-	MIB_DESC(1, 0x00, "TxDrop"),
-	MIB_DESC(1, 0x04, "TxCrcErr"),
-	MIB_DESC(1, 0x14, "TxCollision"),
-	MIB_DESC(1, 0x60, "RxDrop"),
-	MIB_DESC(1, 0x64, "RxFiltering"),
-	MIB_DESC(1, 0x78, "RxCrcErr"),
-	MIB_DESC(1, 0xb0, "RxCtrlDrop"),
-	MIB_DESC(1, 0xb4, "RxIngressDrop"),
-	MIB_DESC(1, 0xb8, "RxArlDrop"),
+	MIB_DESC(1, MT7530_PORT_MIB_TX_DROP, "TxDrop"),
+	MIB_DESC(1, MT7530_PORT_MIB_TX_CRC_ERR, "TxCrcErr"),
+	MIB_DESC(1, MT7530_PORT_MIB_TX_COLLISION, "TxCollision"),
+	MIB_DESC(1, MT7530_PORT_MIB_RX_DROP, "RxDrop"),
+	MIB_DESC(1, MT7530_PORT_MIB_RX_FILTERING, "RxFiltering"),
+	MIB_DESC(1, MT7530_PORT_MIB_RX_CRC_ERR, "RxCrcErr"),
+	MIB_DESC(1, MT7530_PORT_MIB_RX_CTRL_DROP, "RxCtrlDrop"),
+	MIB_DESC(1, MT7530_PORT_MIB_RX_INGRESS_DROP, "RxIngressDrop"),
+	MIB_DESC(1, MT7530_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
 };
 
 static void
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 0cc999fa1380..d4b838a055ad 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -424,9 +424,12 @@ enum mt7530_vlan_port_acc_frm {
 /* Register for MIB */
 #define MT7530_PORT_MIB_COUNTER(x)	(0x4000 + (x) * 0x100)
 /* Each define is an offset of MT7530_PORT_MIB_COUNTER */
+#define   MT7530_PORT_MIB_TX_DROP	0x00
+#define   MT7530_PORT_MIB_TX_CRC_ERR	0x04
 #define   MT7530_PORT_MIB_TX_UNICAST	0x08
 #define   MT7530_PORT_MIB_TX_MULTICAST	0x0c
 #define   MT7530_PORT_MIB_TX_BROADCAST	0x10
+#define   MT7530_PORT_MIB_TX_COLLISION	0x14
 #define   MT7530_PORT_MIB_TX_SINGLE_COLLISION 0x18
 #define   MT7530_PORT_MIB_TX_MULTIPLE_COLLISION 0x1c
 #define   MT7530_PORT_MIB_TX_DEFERRED	0x20
@@ -440,10 +443,13 @@ enum mt7530_vlan_port_acc_frm {
 #define   MT7530_PORT_MIB_TX_PKT_SZ_512_TO_1023 0x40
 #define   MT7530_PORT_MIB_TX_PKT_SZ_1024_TO_MAX 0x44
 #define   MT7530_PORT_MIB_TX_BYTES	0x48 /* 64 bytes */
+#define   MT7530_PORT_MIB_RX_DROP	0x60
+#define   MT7530_PORT_MIB_RX_FILTERING	0x64
 #define   MT7530_PORT_MIB_RX_UNICAST	0x68
 #define   MT7530_PORT_MIB_RX_MULTICAST	0x6c
 #define   MT7530_PORT_MIB_RX_BROADCAST	0x70
 #define   MT7530_PORT_MIB_RX_ALIGN_ERR	0x74
+#define   MT7530_PORT_MIB_RX_CRC_ERR	0x78
 #define   MT7530_PORT_MIB_RX_UNDER_SIZE_ERR 0x7c
 #define   MT7530_PORT_MIB_RX_FRAG_ERR	0x80
 #define   MT7530_PORT_MIB_RX_OVER_SZ_ERR 0x84
@@ -456,6 +462,9 @@ enum mt7530_vlan_port_acc_frm {
 #define   MT7530_PORT_MIB_RX_PKT_SZ_512_TO_1023 0xa0
 #define   MT7530_PORT_MIB_RX_PKT_SZ_1024_TO_MAX 0xa4
 #define   MT7530_PORT_MIB_RX_BYTES	0xa8 /* 64 bytes */
+#define   MT7530_PORT_MIB_RX_CTRL_DROP	0xb0
+#define   MT7530_PORT_MIB_RX_INGRESS_DROP 0xb4
+#define   MT7530_PORT_MIB_RX_ARL_DROP	0xb8
 #define MT7530_MIB_CCR			0x4fe0
 #define  CCR_MIB_ENABLE			BIT(31)
 #define  CCR_RX_OCT_CNT_GOOD		BIT(7)
-- 
2.48.1


