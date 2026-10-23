Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E759606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DTvRc5Sg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clvFAiVK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=; b=DTvRc5SgFBEAlg
	asYTVzRIVki+xQFAW7/rK35HImAev+Jwe7qv/SbgzgKXWp+LxibU/AV0Zr/XK9twnzIe50DmQjHnL
	ZG4oE4Roc9y3qS9rT4dNcnQ05Vjd8k7b2/dSu22U9wtZyQJIM4bbfphUfhgTl+Tq341Ewde/kt0MJ
	SPRSr2xxDrGYYXE7YlzuF25KSwwxJ7Pzr8Iwv+oTrzAu1rmjhaMc3U3AfDkdqw7WB8/it91dEe1EO
	wv9DxeuvMdtDaz/2CzckrJnr4XREwU988fheYU6ppi4+AAPLnDDhkbFSPPu9MMzrAUZu+1o915i4s
	g7NNmvoonWRne6at6xPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE9-0000000GnUX-0U0h;
	Fri, 23 Oct 2026 18:42:53 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE0-0000000GnR5-3Vxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:46 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-844a8bf7e25so856267a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780964; x=1793385764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=clvFAiVK9/WmBhJrE28v5j9A3XoRUsa5k8pP5RG+eywwQvq+rS3HQfjo4G+klW/U7u
         orQUNUy66gJ+DcsQBQp/YFv8L/bvXnQPLUCMBIkkTyEm+c5avl79aiN5OhMOSieRznyR
         y3sYntJhVqgIbkGIFch+MWqNhrQwGrxU06vC+H3ZB4Yk8bBmW9eKtwT/ME+O7yZSnIQm
         FKruVl38ronM+/nK67RPkmKHg/faV0o61XjL/H8YBjWkWfgaiHA2vZhrA4zvDasxi/Xp
         ItMDJYAkyxFAyvvkdOSv/JAOB1Rv2eERxOppPVVFRbQYZpRINTfoEVgFX+MRs+UO/LV/
         +b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780964; x=1793385764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=FLk57GHRZM0JJcC5MGClUupD+7UL5MmxydjkStdHExOKZHHFD0BmcJ9Ny6z5XHRG0S
         j3PIdczffF+XG9D3mCb2emNvcW3AzOqjbNkCZgiHTjndNcPPVFy0KDXSl7zyvc98+FWi
         L1qejFU40/Qg8Nq0f8Hv62SUN9UC7GnIeFZAHx2MfuJ7+E8VHm7JaX0soUIZhDMAIK4J
         wDVpYSBZmyYO3vnqb3GyzU+9gnR6o7JLu6EEk6tacrxtgQbkVbJOqzvCU6rPmt6zVWvF
         zjzhE9hQ9H6oKyDRBwB0jpHWQAJPhjhZ3da3CIiuLwTqzvJFLoD5vK5sgR1SuTU+OfNN
         4iCA==
X-Forwarded-Encrypted: i=1; AKwUvBxItznNHod0HP/R1sM9O5p2XyZgvSIrVxeO4mhKagHQ0Y0We+fhnhlFz66KPGK551uYs8KgJ3ntojvx1AUbYZeA@lists.infradead.org
X-Gm-Message-State: AFq9FYKDLINeDihK7biUXNF5zrKwh2M33qIN8M50nZiNHbQZllDxWmse
	SlCcPPlvMEpUh7U6q2HWTcRS20bOMqCm26MfB3SE7Er7Vc40+nRSaX/V
X-Gm-Gg: AYBFou0K5gx7V1OiTH7wqqh6Ss+rU+KnWTtTvy4pKTru8nTQhrfdePg9q3szF9tMdHL
	aRDozycNViiXjucs8hQPMP2wXGXv3hlP5sdJWJJMKVoNCVC+TgU3i/YVJTYc0DAQJ1QON/2iVGS
	DCK8Szd+aFLvNM1zsbKfch/QnTBk5FnHHacxc8pQjGoDZelZaFyMgaVSHPeo2ruWwY6/AsIjcT6
	XoVVdVknSjk2GucSwMfy9h+6U8mSviaAvLaAuM6pUlspZD0L+opY7rdOH5Wuy4T9UFGYWJjqVzo
	BRmwcdGfN6seJWLxNkML8FI0JC99P1inviXeY4D96sa0Kqt6ueFYH3ZepjQjqDvxeYglNfzbj7z
	Wba98EWLwNQIjZp3HgL3+lruZQCPSUkVwtHEUInAfXGcPUuRLzD7VDLXF88Kf+VfEP9s+pps/rE
	FQ4ZWevdI9at7R7KSvnN8gfQbxvFy3v69EMdQpS9m9Dev+/V+dgTdteWYe0BYSm/7+EI1LB629D
	iKxG/Jf6BlhkBfsGsw3jzOpIDsYR2m5K9IN2aIYIp7TB6QCq7vP0Z07T27YfITnjncePA5Tm0dp
	TrgKNbgJNln2vRWfkUGweQjUrQ9tpH8IJ+JL3+67mK214wmCTOjEMhyCnHqxxOaWTZo/YMHCoWT
	D7DSqML7KrecG6h7nkdG/NBipgRrTwLDAtbE+JVK8yk6pyVezNV1TGHF1KoCcqIQJkTxaKIK+Os
	Ap6w==
X-Received: by 2002:a05:6808:30a3:b0:4cb:818f:d56e with SMTP id 5614622812f47-55c0020ff8amr68675b6e.22.1792780963715;
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:35 -0600
Subject: [PATCH v2 1/6] dmaengine: sun6i: fix physical channel index in
 interrupt handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-1-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_114244_884991_956FB784 
X-CRM114-Status: GOOD (  14.17  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8752969366ff..9d94a37fcf10 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -603,7 +603,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


