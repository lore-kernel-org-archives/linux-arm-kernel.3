Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CHCxgt3Z;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIXx6qBv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=; b=CHCxgt3ZRldejE
	5BY2CJygIJC0wsDBAlw2XA4K9PhNDvkHf/8VuB/4J+ohuVGhx7ZhsBRaqiy7zU/+n1wGiiWYovTyj
	BE8MEGiFQ3u1wcWKwbFfMfcGNJSKpGtzoa2mpfc3HWAbNhk2FE9vjqWiapwp/iBNHDHX2ogFj6Jj6
	eYOL8LQCbCCjbdBCfDxLi21fhscGdQg9gGnwSbXRXwiR3xQP1irT9tsu0FWm5sgQH+2L/0BDrArZ0
	PM/yFudEfupU96sNwnSWYhQUEeGiD7m8+3N15pTkOTArrWy90IZrrMQsrdGQql9yt9bPM9SOYRhuF
	skt/ETRew7xk3No7USzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoPP-0000000G1jO-0ZAj;
	Mon, 02 Nov 2026 09:32:55 +0000
Received: from mail-ed2-x09.google.com ([2a00:1450:4864:33::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoPM-0000000G1hX-3HQ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:32:53 +0000
Received: by mail-ed2-x09.google.com with SMTP id 4fb4d7f45d1cf-6b4c466f6easo1948707a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611971; x=1794216771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=bIXx6qBv59FADxX3lIFd4NEhSNCEtlPREntWh2EoAl3KnDkTOKn9AsaHWIaBC3chAJ
         /7DP7dYD5cseHhdWr1DLJxE/Y7OtsMtyzIZa841+uV5V10NNYJBbnlkz9oHEYBaaZRLj
         JcfSHBahJl/YaCopNkk0+IKQuSLp+Ogn3yJu+EPqPDvX/OMWV3Tuuv3zaPHRz6ug1zER
         KJQlQXfrfzSnwYe6p3VdEziBlgARRd92xP5XbUb/QuwTw5oTJQ6qnUjqObFt3JOkt01d
         8rcsF1mv2AwJPRViQiUVMpKnAWQMqNgNh/AiLkFWumjgoS2tQUSLD3HPWKTcO64VpS6q
         mdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611971; x=1794216771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=aIwa/tRdTerZt5zx7FTcJB1q9gUZGB3x6wbas8WyT4Izmoq7Z9rC2fQDWK0IJKPzn0
         hvMDz0d/F/nW0Yb5LEBx+tZf9pWeRPmEIzmRu4ICxsF71/x4ZTcIi/QHfYBHIc6syWEQ
         QNXgcWkX5oxz6o+xkjFJU79sqeBvipKDJvqE1hy7cy0ECy94R4sp6avwDVW/LBQbI1xL
         CiVaY9IynRY4g3foWRYJ1kfrLYvPDMWS2E6Qiaitds/sx8OUC2yJ+HdIslxHDU2D1XHY
         w5hDRbHA2eFZL8FrrUu1d1yWTM68WJh1Ry9tN1j5MKc2dywsACN4feasvi+zMTuUKNR8
         +bZA==
X-Gm-Message-State: APuU4Z/eM669InGpKhD4j8TrlSFygmG1cwCLJjfaSXc5uUV9fQ5iH0P4
	kkIgHuyZxoe3YFCxQn5QNKtRZTsZWz97e4H8aHahH0yPBjm32A8lxTN+
X-Gm-Gg: AYBFou2a6+M4mZDySot77Ux4+4HMFGD5/qwiWTbM1Mcx+EPq0CwPLegCMuPtoUeGHeO
	Dv40g/zi5ICqhfa8NyKNhEuviJlNqynmlXBarfLRsZWWRoaehN5BEPTk6A2OM2q6aIZlOYs+/Rv
	rBJovGPNEPXT/Beb+ZWi2OIkzp56OKWI1BrcmogSkW+eGFdnv04B5J63dNYCFyr3sFktgE8VlcU
	tO7dDHJCetHPfJ5mtqBh44hxRwVY09ozxa0YlwfWtHvtf6wxzNINIwAMWtOIc8WJN6FbyLrFWm3
	GHxIIlkhbM+dRmbzpO0QQxElFjkyah7DCTga15nLf5umL2MHK4F0z23GK98teTBWsk3Wfn4a3wW
	H85VI8EJYkACpIXwQdqOgEmOHvJmneWvHWYCbKuwIrEVY5mNKidyRYnkUZqQc/Tjym5dFS9zfvd
	9ZvWl1HOBu3S3sDDyEVFr/dw5EVrhtycZO1b2nKzhKYDNuZDlcQJOZgDxqnzB8uXX5+S8YeCrfG
	trSuxMHEi61BzW8dlNt2rceJ5TbeUlne4CizrNPrTe/wirFjj0buz7a5kawUrRx5RVs2eosZynQ
	NRDQ1fuoHF9eDYxLudQw+XYOpgmCxrV7VqsZ8u6C8Svlycq2CclS6/Dogqtym7BDkOItteYOsU4
	YDcltaiZEgE7ugjOwZww9oHa2rx6pXwoUf7vcv336SUljF+x6zORm7wE7
X-Received: by 2002:aa7:c618:0:b0:6b1:c6fa:c45c with SMTP id 4fb4d7f45d1cf-6b4d60d6045mr5299690a12.38.1793611970629;
        Mon, 02 Nov 2026 01:32:50 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm3214273a12.25.2026.11.02.01.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:49 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Mon,  2 Nov 2026 10:32:27 +0100
Message-ID: <20261102093228.2751576-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
References: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_013252_836293_B46F00E1 
X-CRM114-Status: GOOD (  18.35  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..e68e17bdf0ba 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL
 
 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -394,6 +396,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	int ret;
+
+	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+	if (!(isr & XIIC_INTR_BNB_MASK)) {
+		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+		return;
+	}
+
+	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
+			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
+			i2c, XIIC_SR_REG_OFFSET);
+
+	if (ret) {
+		dev_err(i2c->dev, "Failed to clear bnb\n");
+		return;
+	}
+
+	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -883,9 +909,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}
 
 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
 
@@ -1030,7 +1053,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1097,7 +1120,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1181,11 +1204,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));
 
 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1227,8 +1250,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+				XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}
 
 	i2c->prev_msg_tx = true;
-- 
2.43.0


