Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AC5C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WJMNPG24bL7OgNWtK9rQxRkMlEdnd9ti330EJ7N3bMQ=; b=ob+9Amm7kPT06aj+IIZd6ukdqx
	Z6jq309v0gxkd9yFwiWLAkQPQ4ZyTDlGaa6M9o9Dd14Cx+lqmwFRrlXj+ajDeBb2wmhZNbkIIIhbZ
	YaerjKvjXJC7ZOZ6dJ0VGnoJPCfj2PxNK4km3s8F6Jcj5vtOPTNJOdn/FxIztCCXGzOz6xwJ3sI4s
	Pg+OFrukkRmjSbBDZLClDpildMT6E/Waam+QaGvXHAAPizKDyJL+oR6jJ9wbm2YDMkCWZIBooEc/K
	m8phvpeqVmJ5aTcuBeTym34p4axDN8myFrIcVM10xyXqBVrvrDCdarr/7p4biqZRE5kAVJXEY5fJV
	27WC/Amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgHa-0000000B0i2-0u6M;
	Mon, 05 Jan 2026 08:49:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgHY-0000000B0hZ-1aYt;
	Mon, 05 Jan 2026 08:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96F7A4019F;
	Mon,  5 Jan 2026 08:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4B2C116D0;
	Mon,  5 Jan 2026 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767602983;
	bh=ee5soaoyKiBuasxn1iD+tDCH2itJaaLVbfJQApUgCBo=;
	h=From:Date:Subject:To:Cc:From;
	b=GhRVS73LqH4Ylz6MPvKYhUeLXT7nfBkPdJ3s0Ocf5uXrLiH+7CFJAluoEigDkdL5M
	 vnTkunG8UQAvQIGXWzr7QN3bx1HMwBB4c7Q4oYaOHt/DxjI+xXgqnxXhByjZTBrZoJ
	 6q/084ljYKHTpTcZ93jPrGxfZ64wqYPb8rISTvAFdQdw6TWH7RfTTHXF5kRnt7Ydhl
	 6rF73wYk3RpmEO3UTx77er34OGtTx0We0w7fFthjJBCAFzkHgZIMMM1705NpwH+4VU
	 WJvXYmQfik8OqzIbiK54qD3u+C29/+D9FYW4ZtdKfEV4+EjdpVT+TJ2Lpzrc0UcDQq
	 ewOlp0qlUm4HQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 05 Jan 2026 09:49:16 +0100
Subject: [PATCH net-next] net: airoha: npu: Dump fw version during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-airoha-npu-dump-fw-v1-1-36d8326975f8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgMakapXEYdWU81gLS3+QPHuF
 sdveC9B5CAcYSgSBL4kyuEy6rKAedNuZZQlG6iitiZqUEs4No3On7icu0d7Y9tbpUxH1ugGcug
 DW3n+6Ti97wf+4UJ4ZAAAAA==
X-Change-ID: 20251223-airoha-npu-dump-fw-59f77b82fba3
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_004944_449358_5E4BBE7B 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

Dump firmware version running on the npu during module probe.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 68b7f9684dc7f3912493876ae937207f55b81330..22f72c146065998d5450477f664ed308b1569aa3 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -657,6 +657,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	struct resource res;
 	void __iomem *base;
 	int i, irq, err;
+	u32 val;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -750,6 +751,11 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 
+	if (!airoha_npu_wlan_msg_get(npu, 0, WLAN_FUNC_GET_WAIT_NPU_VERSION,
+				     &val, sizeof(val), GFP_KERNEL))
+		dev_info(dev, "NPU fw version: %0d.%d\n",
+			 (val >> 16) & 0xffff, val & 0xffff);
+
 	platform_set_drvdata(pdev, npu);
 
 	return 0;

---
base-commit: c303e8b86d9dbd6868f5216272973292f7f3b7f1
change-id: 20251223-airoha-npu-dump-fw-59f77b82fba3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


