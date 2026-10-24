Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y03gFL7p;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IvoY5zMa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tD2feZvStARhEioc5t9JjRKN0PpC4uBKpPB9fxOPNPo=; b=y03gFL7pgiDtpQ
	8eVp0itZ7wxrl9ajmcn+xMK225V7a6EDRJuciphnTw/MD0aHpAMuU30lEDVuZDXpHN9p6Yb0tXDZj
	aXyfeN/Aeul0llSanC4GFAEpDlinuWWipeGwLxNs6JPv1RkgUaIm2nMn7nk2n+BrXgTrWn3HOqQov
	q5J7xLK9Qk8PKKL9KN1HW+dIp//foY+8O9ETklqvg6tACRN4QtySXPNJ/+dbPHu7ynEVOhjEC3y37
	AZWyDBpzlZrayJk3TOWxTe+KN0FNTGx9QVQM7iahkVU+xcaHzZ+gELRjQd0qfgxkFkIFMtSHxuJ3V
	mwIHtnsjj5gn2U6aE6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdt4-00000000KQM-28dX;
	Sat, 24 Oct 2026 15:42:26 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdt0-00000000KMj-0JFM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 15:42:23 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-35c76e9614aso2757185eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856541; x=1793461341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tD2feZvStARhEioc5t9JjRKN0PpC4uBKpPB9fxOPNPo=;
        b=IvoY5zMaxozTYtpO59DvqAkS9Fyl9faslB3n0eHpdE6q8WbsO/TFhaXAmBdNJvTYVm
         /Bdg0yJYmeczv/+LPcFoWxZEd5rrK8j+tipo6sHgBZGQ7XL4CVhDXWDJbH0T00MrRrvt
         Svd+UJadrLEgYjeo7SoDiNDb9VyTz0y9jw1EgKc4rQseo0mbCIAyead8BnGH3atvz7kj
         yp6RYLVTsu8VRDvcacWo0DpDGZvAJOrFQ4lzdeawevq4dyBKueuWD3088ipi/Yr6r+kh
         gcDA1JtzEDw0TcuXD2XppFXkxdtlPG8ntY3rFne2wrWZXC1Xr3hM7pf5ht/tJIIp97hg
         wp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856541; x=1793461341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tD2feZvStARhEioc5t9JjRKN0PpC4uBKpPB9fxOPNPo=;
        b=ikcGVdHAmpO54G7fprKXXl9JsL5Xzp8wK+me3vZo/UY1sAWvCktlZ4Xht1PqnsxXSf
         ly5rnI4UB79I9ctSmKFoAkiba3PlPYYoJ23jo9Jg6d9QcpsmmwZjLKDSJZau44F1T55P
         06JL+I3qsyjy/24qB/lyf8q4TdN1lmeFCvE8fy1WE9iuUKDhj+E7MsYveKiwRBTJZEha
         ikadHGgZCyVCpHuh/SiBZ15s7XTOJdrp4N3zunmsZqxQ8Emy/RILKcvYAlQlXeLr/a6Q
         uX6N2ihDIfPYz8hcH7bPYKF/bvzLcdBQlz6jIkZXM1IWNFXvumhtwq0YupgRFF9vwcF4
         y3Zg==
X-Forwarded-Encrypted: i=1; AKwUvByMOEIIrGo+1uyMXZG5BvBH+qbu7ZoLmA/eRGQSKBkQGs8/I+nSWFMvgcsXIURZWs3TAKiZzov2rdNbiLDwALCS@lists.infradead.org
X-Gm-Message-State: AFq9FYLXhfFRIbbTUsCmWL4/piGm/Kt8Hle/aWfwdlwcdeiRiFxT/OAK
	Zf2tsCha23K+EB0sFJNFvnMH4APr8H7G5b2VoNxRn/+2/f0X0IJxOaE9
X-Gm-Gg: AYBFou1jeCVm5wgjp6MpofUrHa+yCmQ0FvBdYTtAb32Pygu6NjwFklOrQzwAkFvkXYf
	NLmMpvG82X2e3STSQu7MNhCf5bhUDFesgojJiC75QX+rcThzzlk70+FwvA9Vu9RRBlCD53w0GNN
	JsyGINmDVT5EWfFvgUJz/Bf2qb8BFQjiIFY+sTAPRdQsFGSEXwqQHc9RsTeyWhlcdLYnKTE0Ec4
	7jMFrJYMiThObtro3y1uyQWZGlTGbuxDFSH7gTG0Owlhz1EJUpl2ulj+CFXoOu5k6Nvk2TC+sBk
	TqKXyiWve7UIJ4y3oR95vkr7tNPlYvCP8ayM7EsVqNdTCDi+JTgDwHdqa0pQ9W+0i3bFsn2ffpQ
	yXYlxO6I4PUznwJM6zk6PdFTeJdYFAOSrlipP+FZ86kEqZ+lYuWoYOAtfoPwh7sGWZCdoDFTpCN
	KDjudg3wSlgoBddmjHDhAmC9aorH4GKbztgfT3htU+S6tOBJqCwQYK6Ov7QTozYOiVZ7Eu6DFRi
	iHhjduaB86h8lD1p+xQDLkgzY/ow2ndHTkO5cdMFMmmB551nlDkxnCt8g==
X-Received: by 2002:a05:7022:5f06:b0:151:2e62:fe8a with SMTP id a92af1059eb24-199379c8064mr3258864c88.40.1792856540859;
        Sat, 24 Oct 2026 08:42:20 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:20 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 3/3] net: airoha: npu: use coherent memory for mailbox messages
Date: Sun, 25 Oct 2026 01:41:50 +1000
Message-ID: <20261024154150.45733-4-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_084222_131679_C0897861 
X-CRM114-Status: GOOD (  23.81  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel Pawlik <pawlik.dan@gmail.com>

airoha_npu_send_msg() maps the caller's kzalloc() buffer with
DMA_BIDIRECTIONAL. These buffers are small and not cacheline aligned,
so on arm64 the mapping bounces through swiotlb. On a 2 GiB EN7581
board the default swiotlb pool sits above 0xc0000000 (0xff6cf000 on
W1700K), outside the 0x80000000-0xbfffffff window the NPU can address;
higher addresses alias the lower 1 GiB. On W1700K + MT7996 this makes
WLAN_FUNC_GET_WAIT_NPU_VERSION read back 0.0 and mt76 does not bind
NPU offload.

Allocate one coherent buffer per NPU core at probe and reuse it under
the per-core mailbox lock. With the previous patch it comes from the
NPU DMA pool, inside the window. airoha_npu_send_msg() is also called
from PPE foe_commit under spin_lock_bh(), which rules out a per-message
GFP_ATOMIC coherent allocation.

Add __airoha_npu_send_msg() with an optional reply buffer so GET
callers copy only the trailing response payload; airoha_npu_send_msg()
keeps copying the whole buffer back, like the bidirectional mapping.

The original version of this patch was written with Cursor (composer-2);
it was rebased onto net-next and its commit message rewritten with
Claude (Anthropic).

Link: https://lore.kernel.org/r/20260809152813.585797-1-pawlik.dan@gmail.com
Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c  | 65 +++++++++++++++++------
 include/linux/soc/airoha/airoha_offload.h |  3 ++
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 069fd60680..3d1aa63dd5 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -24,6 +24,12 @@
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
+/*
+ * Mailbox DMA payload size. Covers sizeof(struct ppe_mbox_data) (28) and
+ * WLAN TLV messages (header + payload); largest in-tree WLAN payload today
+ * is 16 bytes (INODE_TXRX_REG_ADDR). Keep headroom for future commands.
+ */
+#define AIROHA_NPU_MBOX_SIZE			256
 
 #define REG_NPU_LOCAL_SRAM		0x0
 
@@ -161,23 +167,32 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
-static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
-			       void *p, int size)
+static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+				 const void *data, int len, void *reply,
+				 u16 reply_len)
 {
-	u16 core = 0; /* FIXME */
-	u32 val, offset = core << 4;
-	dma_addr_t dma_addr;
+	struct airoha_npu_core *core = &npu->cores[0]; /* FIXME: core */
+	u32 val, offset = 0;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (len > AIROHA_NPU_MBOX_SIZE)
+		return -EINVAL;
+
+	if (reply && reply_len > len)
+		return -EINVAL;
+
+	/*
+	 * The NPU only reaches DRAM at 0x80000000-0xbfffffff; a streaming
+	 * mapping of the caller buffer may bounce through swiotlb outside
+	 * that window. Use the probe-time coherent buffer, which comes from
+	 * the NPU DMA pool when one is declared.
+	 */
+	spin_lock_bh(&core->lock);
 
-	spin_lock_bh(&npu->cores[core].lock);
+	memcpy(core->buf, data, len);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, core->addr);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
 	val = FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
@@ -190,13 +205,21 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	/* Copy the trailing reply_len bytes of the response. */
+	if (!ret && reply)
+		memcpy(reply, core->buf + len - reply_len, reply_len);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&core->lock);
 
 	return ret;
 }
 
+static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+			       void *data, int len)
+{
+	return __airoha_npu_send_msg(npu, func_id, data, len, data, len);
+}
+
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 				    const char *fw_name, int fw_max_size)
 {
@@ -500,9 +523,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				    data, data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -794,6 +816,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
+		struct airoha_npu_core *core = &npu->cores[i];
+
+		core->buf = dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
+						&core->addr, GFP_KERNEL);
+		if (!core->buf)
+			return -ENOMEM;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return err;
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfee..16a988ad74 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -173,6 +173,9 @@ struct airoha_npu {
 		/* protect concurrent npu memory accesses */
 		spinlock_t lock;
 		struct work_struct wdt_work;
+		/* Coherent bounce buffer for mailbox cmd/rsp */
+		void *buf;
+		dma_addr_t addr;
 	} cores[NPU_NUM_CORES];
 
 	int irqs[NPU_NUM_IRQ];
-- 
2.53.0


