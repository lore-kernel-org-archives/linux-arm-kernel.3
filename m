Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BEC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hl2A7uIb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmQTxuyH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=; b=hl2A7uIbTm3tcv
	/h/qv9yeFaVrcubJa4bE+wJZyZpJYuBB/DyoUYwITt7rlCUMBz3g8ASr3gqqip71Jy04Dryt5KB5C
	UUvDuT6s4pImAPMUyylfAt31EyUS8BFLB6axVmbYpi5JGZinpt6QHppEKLTxgf1zNaeec1ihleuVJ
	frV0aycDO0tTmxf+kcGpa+MakqZFk1OSMTzxF81YQZnUcWo6o4z5jVw68IloMiv+2ULTjGYFco+bH
	lafOaRkhgfEYx/g7Rqow9AsfzE2w8whKrC7UzDlPvl24mRp5jKft9Oyg0IWO1PatUrlmqchrzeRiX
	67AOhm2K3KAuSQJ7cX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoPQ-0000000G1kM-0xvt;
	Mon, 02 Nov 2026 09:32:56 +0000
Received: from mail-ed2-x0b.google.com ([2a00:1450:4864:33::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoPO-0000000G1iQ-25qW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:32:55 +0000
Received: by mail-ed2-x0b.google.com with SMTP id 4fb4d7f45d1cf-6a5d790cce1so2088186a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611972; x=1794216772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=MmQTxuyH6Aa4JLGnllHenkXdstJvWRSdSaSoYFrK4pRbcREaD8AGHRUcwrcTevNLJs
         ejJLJB7ycrPibTuN5oNMiK7DSqiZu1sl3cJ9tGDQBdHUPcbMx5vRU+eyexBSHO7XSJI7
         1gMlzOdiTOAwyYjMFKuC/i+VZ+jUZ0E1NCz+2nwF/YTJDwBYUWzE9pydvLOt93OreqKQ
         ZrBNgyl1fSmFKq2ntZoLpvdPBEI+2nCLKZ6cxGLKKkHfj4ICUuQj3tg6G5+OxS9b9qzK
         URoXEbkKTs9h6zUE5VWRBp4X2wzZ/39GeFvuE3wBr2AUc5gQG1w2koIDzMxvhXio998e
         exXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611972; x=1794216772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=oq/dMLhAEWvw6dIiFGgQlx4KLjev0ISM0H5JgtY6f24YxEVDOBxkITT6RTPQCmwVHj
         103TC90QEHDpPuG3gFSBuV7vVtocM8hxNpZ/P7hBedt3bcYdREDH9ZMo0nw95mvbrhxd
         I6/CsSJDnIvjG+EzsEoWhkGA0QzwNh5e1E3VnS84pjKiCYl/nFjhvOm+bLNPDz5Jkg1f
         G2weGHjWPbXbkotQySGrTdfDt8iDY/ucy01fpCoVCTbSygU3a+CAk8QtbLnNCgD7wZ98
         79WsJMPNXOA/9Yixz6fwq3O3UZ4jPAo40CKT2Vq0Bd6QySqNsCL1t36P/sQShHjDzQp3
         RfvQ==
X-Gm-Message-State: APuU4Z9bD0+DJcABrXp0k7j/uPEQJcPmS6zleMkb7f0GvHkLUpLoN0XX
	LU6byzPHpanpD+4vWuTf2rf+nnZiSqfmpJPfeF5g2vC7e7SwqF3oMvbh
X-Gm-Gg: AYBFou1ze8LHQ9tF7cWnKtFBOd5tDtvXXEG11mQVvxWrB2LCWK9lkXvEsQw08iWRv6v
	DMl+L+Rg4DpMUej/N7c5/Sp6ZYvX9kIJsrMCEgNVnDdevDR1BJpA5+DLeaw5iNKV298IglI4YPR
	83eg5WB1rXuI2N6XH6q39Gab5C7fc3KYZlciHcaOUW+TY9NoU+cH0/LSDH4R2vuHv+gD1E7wC7Z
	7oYj1oGgjEfwcMeG4GNCWcQ3tKs7lTFFSNynGZeBXrt3LFjcyVQqiV3rVwmDMwZfqzO35YUHluf
	yTPdKsQonHObJfw7dO0asZBqcgBV8SEsgIXvvVxiYky1yjZSodNRxWgyCBCSSBm3kXTA7va7dmU
	e/HUNngrXUCjKWXfJdOgpML293xxUQWOJEUoLYTffsI3cRC1akAgjix6zJRCI09LRttbb4wMt97
	5/s3U8dKrcxszDJXsCQCTLVQgIemvkZnBfs62GYxx1FA+iuwEjJtvoUMn4wGFEwPy3sUIjRibh2
	kWT6GesxLiKgEA6sQ5EuQrMPfTDidZn2lYn+jQYdCctYNzE5NC/zmjjhN7ZQ03Da975w7PPO62B
	RLgytDd6UCeUhTwidad6muQYpfNAxafeKzc+OtS46vEmBr2NTPtJn37JZd/nGZqYIJE6GO1RNNU
	i9/B89NtVkoyQ+ssyi3pqZKxdUtaCqf9f+TDMW4J0/n4LwqcWV6g9PRTG
X-Received: by 2002:a05:6402:b26:b0:6b1:ca87:c588 with SMTP id 4fb4d7f45d1cf-6b4d4d74c9bmr4790145a12.37.1793611972469;
        Mon, 02 Nov 2026 01:32:52 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm3214273a12.25.2026.11.02.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:51 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Mon,  2 Nov 2026 10:32:28 +0100
Message-ID: <20261102093228.2751576-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
References: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_013254_552774_8B490F55 
X-CRM114-Status: GOOD (  14.11  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index e68e17bdf0ba..6bb8d66e8969 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -237,6 +237,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
+/* timeout waiting for the controller to respond in micro seconds */
+#define XIIC_I2C_TIMEOUT_US	1000000
 /* timeout waiting for the controller finish transfers */
 #define XIIC_XFER_TIMEOUT	(msecs_to_jiffies(10000))
 /* timeout waiting for the controller finish transfers in micro seconds */
@@ -359,16 +361,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
 	xiic_irq_en(i2c, mask);
 }

+static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
+{
+	if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
+	    XIIC_SR_RX_FIFO_EMPTY_MASK)
+		return 1;
+
+	xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	return 0;
+}
+
 static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 {
-	u8 sr;
+	int rx_empty;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_poll_rx_empty,
+				rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT_US,
+				0, i2c);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
-	for (sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
-		!(sr & XIIC_SR_RX_FIFO_EMPTY_MASK);
-		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET)) {
-		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	while (!xiic_poll_rx_empty(i2c)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(i2c->dev, "Failed to clear rx fifo\n");
 			return -ETIMEDOUT;
@@ -383,6 +397,12 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	u8 isr;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_getreg32, isr,
+				isr & XIIC_INTR_TX_EMPTY_MASK, 10,
+				XIIC_I2C_TIMEOUT_US, 0, i2c,
+				XIIC_IISR_OFFSET);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 		!(isr & XIIC_INTR_TX_EMPTY_MASK);
--
2.43.0


