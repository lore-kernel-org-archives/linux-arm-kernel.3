Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF66606EE8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QadQPqF9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1bPBiG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=; b=QadQPqF9Tji+7+
	acXfk29+MwaOtKSudzG2wIkhM8rXj8jlXosUhVKYeH7gSSNXxVEBiKASOSfQE8eNx9q7AJ/6ZFSmx
	Z9kwZEPTKdFP4872l+4v1YzbxtIcWBTEdAQ/c7CkTHmSoF3RukIvU1WKHjxgUWWNZm4E3sH6MlQQH
	5zercxiqizzaSWFnBviYiyPlLiVjA0PkbsXMfHTQ5CbdOG7bb04+KTNl1nRCvr0dn10VFpBuo3Mxe
	n/5JSTZoa8dH9cI3cXKofQDJMeL4lSGQ5iD9XlRLT1Z2l+/puDGdg3gZax7PWCW1E/tcOM8Qohlzc
	81OvlJ+VhssvFxm3Uk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHf-00000003Qwv-0O4H;
	Tue, 03 Nov 2026 18:30:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHc-00000003Qu9-1EDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:30:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so34357605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730654; x=1794335454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
        b=W1bPBiG2wbQctQxWFhfi36R8Ub1eacJF/LFtNUEs7Gw23buDMA/c1qvvQX2tSoUx3y
         616TiEjc+MpGXeYAvkZZhkemiSIwufwOb+qx/IlJCxWOlKEizJECOkvx4E9hyQaslgFC
         8BdiNbkjhQPRJ62X3VtDrPzaDoJqN/T74PvhTFBdAIafY8UTUSWb+r7qRXRcA05jMtnd
         /teEEwF++B8fdAQBguJryj2Q6wyOe1Eo5N1nPV26RPzg7p2ESvU9FkBdHVtrpwP5IBWG
         HcxHCF6qwlh6dg1AJrc6BXGGLfCcl2+Z5UEv9tPByAB6IssESu52Rpbj5e4CqqEMhYhf
         ZuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730654; x=1794335454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
        b=Kaaeb6YtK+sF2XZMhCuhCGLGmpbKbT92NnSo3D7rV90ArwwQ9SWFMsFuLoaMB9pJRE
         xJIqx4kMcn6eVe1V/qu3kKxUPv8bX0Sn4a1EPZ2QMr1lRQtWjEt5pE7dqzWTssiIuwMH
         FaHTTIuO8MNpkMwaOnAYQeQjbpzOg0TXWV0LeT3Tm5gVE5KODxaBTtFsQUNRdxoW0ECO
         IEbBYtFe4NU5NKpni3iYidUVcrXiZXq8MABig3KBj2HlGH8AXqMAx+sO76PcuYCKBxry
         HVKMw1oG1eBzSzJChNAXKs5m9t+DT8ZKBKGdXSwv3JOtmcqwhexkuFY6e41PEGKZfR4V
         zfPw==
X-Forwarded-Encrypted: i=1; AKwUvByQBLPbz+sIIxHEzGgPwKUBoRjh99SxGAGMVVjfdFmAZOaZhvB8f/nvA1NI/G8WmSqevwDf4jluy5cUpJOFEZ+/@lists.infradead.org
X-Gm-Message-State: APuU4Z/9Q/deUHALVlpp6DEkFt59CVAnt4cV05l//b1uGvrIdRdQQcLJ
	S5GmuvsAKKxIMLr7MMVrh7Bm4BmvwQDkahQicQfe0NPwsYy18JbCogDt
X-Gm-Gg: AYBFou1Qa4dC94Jh6O42wzY/MgeYK09zAtxAF4vhrjUzUvZHzw0J+DSIuxarXxukmL9
	xq19DcWFKcJtXiJjM13zhp3kLbcx6ruGLkkJYEjk8a9FAluyNKbdDZ0W4Ck93tNHbDkJjXHhPrw
	EWx4GmpIS4rFpEPrAbkpNciUtt8Kh1CmLOjWCrZC1NIW38z2ratd7q93LmIbDj3V5bW2wuBTPQw
	qROEO6SDaMagCBex1FJoKDpOxeCbIYw3hj+hY9NEmQbmE14iEAGd18kyipTtAeAagM1LLJD2lgr
	iyx1MpNV/x7JQ5Pig6T2AP1boiHnbdd060y7b/1Uvo4mBCYKkXX2BQfx7zIU2DeMFjV9v18UYgL
	DPKaUInNEuwgmTLGBw+cYAwKuc/kjcGUXUBAtZXr6NOPKYJjynR5NtkzaJYBUAT3kcOjTf/u2pC
	nzKuDbNdt+ismjbQA/FhAyYksW0O4lRvOG+GHG/k8SVvQK3Ok6wZSpPHVBDXLeB4pM4Ji6bpmAp
	iwO0iPveML04gvgn5pGorC7juL2zd9gK/5vSjMMBDKnRX3usTPqbr8SPk4qqW1O0c6ahRkSCnLP
	UbqwU/x0sDM8d8JkVfQuuHAL8kB+7mytJW0+1rnQrC4Aq7IxJ916R9H/DXv6yGgSXH1xNyMkPUU
	qzhNVw+pVeeuSxClI4VTeoKrHl6O8ZSmxlG7AlcJUIqzkrHgJaH0DhHGJU6TuLffY49pAnlmClz
	2Rv/YkbMcRyP5u7OiT1t0pjRqWIXn7fg1DuAHKdz2KKXN6+35cTGKlYDcvZvv6UArF+u3OoHdrl
	Spj3gYCOMp3h3U17prnDhV2zcBw3h0JGR22NSoIuoFBXXbS8A==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr314872025e9.13.1793730654277;
        Tue, 03 Nov 2026 10:30:54 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/4] mmc: sunxi: Build IDMA descriptors from mapped SG list
Date: Tue,  3 Nov 2026 19:30:29 +0100
Message-ID: <20261103183030.81078-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_103056_369888_D5C776EA 
X-CRM114-Status: GOOD (  21.51  )
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

dma_map_sg() may merge scatterlist entries and returns the number of
resulting DMA segments. The DMA API requires using only that many
segments, with sg_dma_address() and sg_dma_len() (see
Documentation/core-api/dma-api.rst).

The driver instead builds one descriptor per original entry and uses
its CPU side length. Build the descriptors from the mapped segments
instead, and split segments longer than one descriptor can handle.
This can't overflow the descriptor table, as each original entry fits
into a single descriptor.

Also check the alignment of the mapped segments, and unmap the
scatterlist when it is misaligned instead of leaking the mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 91 +++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 479420071c2d..b875ef4c2b79 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -356,36 +356,49 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
 }
 
 static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
-				    struct mmc_data *data)
+				     struct mmc_data *data, int nents)
 {
 	struct sunxi_idma_des *pdes = (struct sunxi_idma_des *)host->sg_cpu;
 	dma_addr_t next_desc = host->sg_dma;
-	int i, max_len = (1 << host->cfg->idma_des_size_bits);
-
-	for (i = 0; i < data->sg_len; i++) {
-		pdes[i].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
-					     SDXC_IDMAC_DES0_OWN |
-					     SDXC_IDMAC_DES0_DIC);
-
-		if (data->sg[i].length == max_len)
-			pdes[i].buf_size = 0; /* 0 == max_len */
-		else
-			pdes[i].buf_size = cpu_to_le32(data->sg[i].length);
-
-		next_desc += sizeof(struct sunxi_idma_des);
-		pdes[i].buf_addr_ptr1 =
-			cpu_to_le32(sg_dma_address(&data->sg[i]) >>
-				    host->cfg->idma_des_shift);
-		pdes[i].buf_addr_ptr2 =
-			cpu_to_le32(next_desc >>
-				    host->cfg->idma_des_shift);
+	unsigned int max_len = 1 << host->cfg->idma_des_size_bits;
+	unsigned int i, d = 0;
+	struct scatterlist *sg;
+
+	/* dma_map_sg() may merge entries beyond the descriptor size. */
+	for_each_sg(data->sg, sg, nents, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+		unsigned int len = sg_dma_len(sg);
+
+		while (len) {
+			unsigned int chunk = min(len, max_len);
+
+			pdes[d].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
+						     SDXC_IDMAC_DES0_OWN |
+						     SDXC_IDMAC_DES0_DIC);
+
+			if (chunk == max_len)
+				pdes[d].buf_size = 0; /* 0 == max_len */
+			else
+				pdes[d].buf_size = cpu_to_le32(chunk);
+
+			next_desc += sizeof(struct sunxi_idma_des);
+			pdes[d].buf_addr_ptr1 =
+				cpu_to_le32(addr >> host->cfg->idma_des_shift);
+			pdes[d].buf_addr_ptr2 =
+				cpu_to_le32(next_desc >>
+					    host->cfg->idma_des_shift);
+
+			addr += chunk;
+			len -= chunk;
+			d++;
+		}
 	}
 
 	pdes[0].config |= cpu_to_le32(SDXC_IDMAC_DES0_FD);
-	pdes[i - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
+	pdes[d - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
 					  SDXC_IDMAC_DES0_ER);
-	pdes[i - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
-	pdes[i - 1].buf_addr_ptr2 = 0;
+	pdes[d - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
+	pdes[d - 1].buf_addr_ptr2 = 0;
 
 	/*
 	 * Avoid the io-store starting the idmac hitting io-mem before the
@@ -397,7 +410,7 @@ static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
 static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 			     struct mmc_data *data)
 {
-	u32 i, dma_len;
+	int i, dma_len;
 	struct scatterlist *sg;
 
 	dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
@@ -407,24 +420,28 @@ static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 		return -ENOMEM;
 	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i) {
-		if (sg->offset & 3 || sg->length & 3) {
+	for_each_sg(data->sg, sg, dma_len, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (addr & 3 || sg_dma_len(sg) & 3) {
 			dev_err(mmc_dev(host->mmc),
-				"unaligned scatterlist: os %x length %d\n",
-				sg->offset, sg->length);
+				"unaligned DMA segment: address %pad length %u\n",
+				&addr, sg_dma_len(sg));
+			dma_unmap_sg(mmc_dev(host->mmc), data->sg,
+				     data->sg_len, mmc_get_dma_dir(data));
 			return -EINVAL;
 		}
 	}
 
-	return 0;
+	return dma_len;
 }
 
 static void sunxi_mmc_start_dma(struct sunxi_mmc_host *host,
-				struct mmc_data *data)
+				struct mmc_data *data, int nents)
 {
 	u32 rval;
 
-	sunxi_mmc_init_idma_des(host, data);
+	sunxi_mmc_init_idma_des(host, data, nents);
 
 	rval = mmc_readl(host, REG_GCTRL);
 	rval |= SDXC_DMA_ENABLE_BIT;
@@ -1016,7 +1033,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	u32 imask = SDXC_INTERRUPT_ERROR_BIT;
 	u32 cmd_val = SDXC_START | (cmd->opcode & 0x3f);
 	bool wait_dma = host->wait_dma;
-	int ret;
+	int nents = 0;
 
 	/* Check for set_ios errors (should never happen) */
 	if (host->ferror) {
@@ -1026,11 +1043,11 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	if (data) {
-		ret = sunxi_mmc_map_dma(host, data);
-		if (ret < 0) {
+		nents = sunxi_mmc_map_dma(host, data);
+		if (nents < 0) {
 			dev_err(mmc_dev(mmc), "map DMA failed\n");
-			cmd->error = ret;
-			data->error = ret;
+			cmd->error = nents;
+			data->error = nents;
 			mmc_request_done(mmc, mrq);
 			return;
 		}
@@ -1091,7 +1108,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (data) {
 		mmc_writel(host, REG_BLKSZ, data->blksz);
 		mmc_writel(host, REG_BCNTR, data->blksz * data->blocks);
-		sunxi_mmc_start_dma(host, data);
+		sunxi_mmc_start_dma(host, data, nents);
 	}
 
 	host->mrq = mrq;
-- 
2.43.0


