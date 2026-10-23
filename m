Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E360A261A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ud3Y+eV6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E+i0RiNv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=; b=Ud3Y+eV6uuL6s5
	0/FPoYG0DJU4KNM3GLzWSYxZ5KxNa6JqQ63I2ZrdKMZr5sXXUEbEGhnvy510cqrKQCds7PzaL3g2J
	LaGSZ4ExpHEk3STnJtaTExcV7MOZ+Iin+1tgFa/EwacEZpZqbONsb3F71Hwaa0PuSwfCks13/47lr
	Cyvci5I2FUYTvW4AdODGMVlRGPvmWZVpORdyUmcbY1YaL1741wY+Ahgm/ZS61B1ZNM9ibhujMy31Y
	etM/KoStEfJ2DQtjKPrNLhPIoXwcyW5BJjUxh5KqaN5UnIras3l5/J+vkxknkIyQs5BQjjTok2PtI
	F1rd2Ok+uG2jp41h10Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kJ-0000000FNLM-2LZm;
	Fri, 23 Oct 2026 03:15:07 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kD-0000000FNIL-1tup
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 03:15:02 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-823b938464fso293612a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725300; x=1793330100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=E+i0RiNv5wiqN0Kp4MQt5Z4nCa2/8fz63UeG3ngRW2e4aRZrf+7cfootUg7yf+89fC
         g7ID2num8/vloO/aWCVjntGo42IEIbSJTaiAk7wNByMytMAXz15JyNotn5lWsCg58dWO
         EL/f/ZLKoo7GnbkLRvx2UX+UFpyn+t6tfdW9uTYpKuv1mnQtlUtEW1TMP8psKaCIYJeN
         kZOwUiztuHoaHFBc4cKq8ikWToI+m1tvtwXp+HWXU6/QJTxx9iWgt8SjtqFNWb/ZW2P0
         h1npizkH3KCzX5RgPzBAPvBK1GAAxcIr7gY+hhQ1BBBrJNZSX6jLXZlHF5eIuPKe5fS3
         Sdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725300; x=1793330100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=jFQi6HliAshK8rXCPXJWqf4swcheaM50L8+kOUTyB/HqBbBowozmGnNKw7EK6ycL/0
         gk+1SkImo83fvcRVTbJd/dp6ojRkD/0ay7kNyGqxa3iJqQL8uZsLzRBX95HF75VkZ5JZ
         63KAnYJDOeSVhEmrctI6VB4ZvcJQYdrR7hA9Zi+zg9Q+2hK5vqIFtCFX/dFMn7PzOuVA
         VYlgQqW1DwdOC2O3a07DI48I5LX5Vy+R0faxDeaKx2qmOEYwl/075p7uZqnBw2RE5e9I
         2AyrZcH6Gl49aomyvIDV1GLYnnpYTzXAuwOd0u0+r/P9eOZIZ8saJ0l2182Y4t6/C9Mt
         tacQ==
X-Forwarded-Encrypted: i=1; AKwUvBygfqP9FfzZTgzHyucw7braPCDQfRIN+7p+0AQWrECDbZLQQlp3X6RIjt2/99Uo9ITui9DWw/X1x6BYSPc1779U@lists.infradead.org
X-Gm-Message-State: AFq9FYJiNSq4GEz4Z7m5n0RJijiHk2lVM2eX5+UQui7OcnU/Q9mnWklM
	Jzwfu0DO2KUy5K2ZxlFbfMMQW8BCCM0v9MFzJ2igrI5dpAKibt/BaNzf
X-Gm-Gg: AYBFou0S5sazfmqmP57rNYAe2olqfGVWD/yqqImsgkEaeya/JHvzjVB/UAw3Y3jifx6
	SC+hA2JAldwlyXgSlSy2EUw9eIYBPj6Ey+6VXpeTX+QNRbOStOruy8kLuhBhaylagEGWw/IMRX9
	MA+++ZHt/myI/lUgfXWAkYbVfv6zZB5m1fas6UQEtyzmcUcDk+Cm5wOGdw0Y3cJ+pxe8QoSvGlP
	wNwvj94UfIzyRZ11eSl7br+5PH5UhM/Es5tURUF1pqItNhYLjoeJzWAiPhy1m4sTxpTY5hYJhRL
	DldSEDsfkAvrJUfckesCFURP2oLumm2/haWmT15RDmCCnws7FkAu7CWKmYPtnktyfBwwqBTcq9i
	BktyEikck6mA5+xBId9hVLaW8FUh00DtQRHWWmwCvB3Ha8BXWOvyzzv+q/Xqr8DzRygTHNehnOc
	XqnsxKgwFK920kqfH6DA+abN2yiM1x1tg/NKXygJh+I+wygLl1gXg6QA3czkbs9Wkm+eOIfeXon
	9FcMvP9nOFp3SBFcs5/+ISauk/2YkSrHHSV2ks1bgY0Et+aWQM5yLiXkqEnYQ8P9F1c4eerzObG
	+/ndgOioiMw/N5GaWZhhnwCkB87/gAI55pMtKA2Z0DStIaV08DnPmqzyYFLE6vQ36IxjX+dreXF
	ILOdrApHp+tpktxRp3/zSUzgkH4at/4ogU4NqeNENSnujqEeuw/hnPj7trXt7SJhmeZzHp5cTHm
	3ZgyLkfOTQzfzXrHB0d28nUH1J
X-Received: by 2002:a05:6830:34a2:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84faf57f015mr783469a34.15.1792725300342;
        Thu, 22 Oct 2026 20:15:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:53 -0600
Subject: [PATCH 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-2-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201501_525492_7457C7CB 
X-CRM114-Status: GOOD (  14.04  )
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


