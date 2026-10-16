Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF21CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdOHOeZUKsNxNoi/BkPDgmePe7PcCdsdpCL+vRvFalY=; b=G9NySAN/MKdnIcIRIQwTiYdfrr
	HXm/LFbJAKacsE2p7XOqQdr8iqC5r+rolPx/ohD+FEzSkX3CkagNQ/TH4C1gZB4Ehbm8dBYfP8Qk6
	ajE2IuEN3xiSI4NFytBRngLFkAZzkSYMIL8MVnD0EsYfYAEhshu2SR9N24VebQlCqjCiLi74PmWGg
	CUSJwNnDvCtCRJZxnZgpU9OLWBL88zsBBu0zMoqdRBpSXD4eGtRPB6Z1unhJnPc2AM4j24kGG6cjc
	FPS6ZTQwqOaxNUlkCRrPNwePc6aZ55dV+wMC9qsx3sJvRf4I8kqHTtu+oj2gTjUzHojFyN3TNnZ94
	obuMDTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhQV-00000002y47-2lKL;
	Fri, 16 Oct 2026 12:52:47 +0000
Received: from mail-ed2-x03.google.com ([2a00:1450:4864:33::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhQT-00000002y2X-0bi8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 12:52:46 +0000
Received: by mail-ed2-x03.google.com with SMTP id 4fb4d7f45d1cf-6a5d1305572so1080489a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155163; x=1792759963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdOHOeZUKsNxNoi/BkPDgmePe7PcCdsdpCL+vRvFalY=;
        b=ir3wTsBzWGjsuQU0hylYrzFlYdrJ431P1V/Ftlf8t2P+Zz5hgeqGtoQSUIVtQS7T/P
         n8r8AM0pNK+6s/EY7hEqgdTmpj4wRUn1LYrJ/RedR5ViJrEY73YUkRksWUTYJLiz0prQ
         qV98VX6mnJxOtDsGKIYoMLwO15x2D0kMqR0QCoImZ3ZZFFxp5Ams3ItVEtZDZVFxy8jd
         0Kx98s5FxJOPH7SoYnfQ3qCXHdVllKbX7Iw9YARbpqaEC4m+ZefltgKdD+LKzLABsBWJ
         Sc6+YS0c8/dBPR1umaWH+ckkwaezuoUzO3wEhLUMTzH7UjulzixjwyrshK22wSJtxW2z
         mkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155163; x=1792759963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdOHOeZUKsNxNoi/BkPDgmePe7PcCdsdpCL+vRvFalY=;
        b=Duu/tEW6ks8PX1XkKxZIy2SNuu86ivNSYlvMF+Ry+xrcqvM21RKJjU8/I8tnM8CyF+
         V0dZ1uyisLYCctmXkTwrIO85c6OYEV7evd9kkeVscV0dYGJsJZyYn8cQGq5Bo0iCV8Zl
         RSZ/gkCToeOwy30YhP93A7MHIoaq0jqDhLOTuG/sz2l1rIVykX7tubIJxC7uyNhmNpxa
         e3TPcKxM5fclOH7xJh8r1/PJj28XYpcMd1dAWkQIEkZF45DkSgAl8s4icuQK1RRKKUqD
         9kcrZSgRtse7HwZK/XNo1wCs8lb1eYyADpCgSoifqPDBmJqEjozx1WSdgAS69nVVBjoF
         CwQw==
X-Gm-Message-State: AFq9FYIHJMb4tPpeTDq7NNNYj360SnsAA37cL+CpjUmnwIKeCLE3Obs8
	nvVc9TdUVssJ5pZKxuRD48yvSIVhpsiiMs3o2JJN7kqgvHPiC1A6jxAx
X-Gm-Gg: AYBFou2krM0qthaJ/kq7udQzpzVlbB1prLDJ2hzMd5GDZklkYQ3gYhe7dDGRR91+Yr+
	YE+5MC9SRw8N70bsPRVxi4YclCVum5VnGhlxgrH23DV1PX8wS3Q9KQoT2JGzz8uELaVXC1ya2HP
	qLPDOd0vNyhEJ6XoIROLBFL/lmp4lPzPDZSmLaBseiXaxK0dg/1dH206QFZI0TF77nt0oYoKeI/
	UIw5H+xavOpx3enNw2RLPoPw3bQ0HIhZ3P1AMNuT8akwL/B8YycUsXJGOUsYMQTjkiZocNIAtzG
	RGo8fB67zzrcByyigDNf4izH+Y8V1LbjJn8Lsl+p49Abkg10N3ITNphQmkpCxcm4Vp8qTjIs11n
	t7n94HaZK+wWI/cb5GhuocW9g5pha0eS/c3thv+f8lJhyyiHVOuBGyW9eQPMj4rL4/I0gp2vWMC
	B1Q47o1V/SbnRSbwRdVd+P3KzBuIS6fLe+AUp8fCMtsvRo9xBZMVqXu1Da6ereJhKSKbOgX/wJ+
	vK9j+CLBI7sPVkfTvq81gvfTm7dOPjHck9S6+IQoEDWvYjQ0BMMb9MGOBhLYBUXvEAhv4AZkcQn
	gt4LUdvpYMFpqqc2oakgDf0rew==
X-Received: by 2002:a17:907:97ce:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c40205fb322mr271162166b.18.1792155163197;
        Fri, 16 Oct 2026 05:52:43 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm69433966b.10.2026.10.16.05.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:52:42 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v3 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Fri, 16 Oct 2026 14:52:29 +0200
Message-ID: <20261016125229.1798791-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_055245_202403_788A6EE3 
X-CRM114-Status: GOOD (  11.83  )
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

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index e68e17bdf0ba..fc9a0628cb67 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -359,16 +359,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
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
+				rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT,
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
@@ -383,6 +395,12 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	u8 isr;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_getreg32, isr,
+				isr & XIIC_INTR_TX_EMPTY_MASK, 10,
+				XIIC_I2C_TIMEOUT, 0, i2c,
+				XIIC_IISR_OFFSET);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 		!(isr & XIIC_INTR_TX_EMPTY_MASK);
--
2.43.0


