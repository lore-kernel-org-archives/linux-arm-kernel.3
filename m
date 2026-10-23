Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF32606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+T8garX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LDdkNcFl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=; b=g+T8garXIaD2Ph
	0uYYqU0/AsJVnIC4NEnnJDvxl4srnG5CYFAjfLSFA+UraLlNE6bL4Fyyuc2OESk2FBgY21DdA6yG2
	kbhoxRzx1eH9rZqeYDgdVjj9nOoCNHT4R6/MjTavx30ERZ0Siv/YxjKdieCttCDYTlosG5Xy56mN/
	OUYHGdqnZIlHD9WaAK8ZEX11+8oV4XK9srbueZrMkHtdPXNmNC4nneMYKlLvqsAm0mgilEp+3qNIp
	yXRYgsr79IUCS1YrZHaRnhGWPd0VUeKkggqwFqt0lQ7BrBG0sTIF3bNJW0CdhvE6lknw+oeVx9Z4O
	G7a24jRNmDkx5+FPWEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kJ-0000000FNL1-1ta1;
	Fri, 23 Oct 2026 03:15:07 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5kB-0000000FNHj-3YKf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 03:15:02 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-7037daaa820so173887eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725299; x=1793330099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=LDdkNcFl2xe6tn/y3SgrYkpK1QceDAz89cTVS3I0zJandIZtYS78KmeO5nHx8tuoEN
         0VbIYjvw3NkPdbHVsIUyVNfd65UIHkC0BL2fj1Di5mQ8AXWrYyz6m/eTO8DF377czPMM
         Y2obHAWIUmp7Y6CtfP7y5PD1eKlti+bySzwsslfKjGwvsbS+vBAy21VE8IpySlEU1E0o
         ZQ2cp+oYVfx+z8kKZgAuXiTcfxUu1pNReOVeclVNbs1QU3c48EWWYEaqcMmqL2MB7oxg
         sPCKBRRd1Qy00M1DmgpG+NHOGqt190jAeT9YzUfpbyMO5LNTa6/2yDS+tC6WMsjdqAvI
         FWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725299; x=1793330099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=ucVzTP8qvRPMrOM1KBXh2HxKYBYw1F18pFSoXRN3iVuib0wF0+dsrZ/7YYd5QIE08F
         c29QjxC7h3EduSdLI30VRRKf0NWx3ZauzlRMlnnAiCG7dauSLuCzSoFcuiATSTj3aI92
         LYKBlqlemSbzkdfGBVtb44zDQIZuwUmxRlrSyGeX65WEb/hCfDI+7cDMNKadetJz16Fu
         s16m1x81HqRwWNw81oe41rn0YCLAJUnTe/le7lWxLVVGmiElNItfAP59mon8riBtXUh7
         OQWSTqZ3JcfGxRwwZtlw+U+6yubvO5zFZEQtmGtidqFhPAuGsJnzcQJDkLxnxD6/29/f
         CXvQ==
X-Forwarded-Encrypted: i=1; AKwUvByE4N9BfpMeRddRGmb0W6RI48WY/067JA6C+Sx6AVc592Sh35AUiucFVonVoNjOIfBo11xHR5nFJkSrsMFQ2fmm@lists.infradead.org
X-Gm-Message-State: AFq9FYLTSn4luyrrsIipzw/DgTD817PBiOtOySjEhKWzKxCqNZP8rJ5Z
	I8ML7UkL2R6TpzU3CFe0FoFAgEObqHEm0AlPn1V5pxyWGU7CG/vE4+hI
X-Gm-Gg: AYBFou01erxRpy0F9VQgCfWfwvuoDUB+sV6ClYQHYt9+q25tAM5FhFhDqLHVznB8YCQ
	qNCuonAYmVs264yaLCGNslPiJJKCfLfLzHai2tBCvpBOATqY7SIo3DCuOGNoyadshW+kz9sW0eC
	2U5toHuCKtt7WAq8CvwfF9xHyHtYsGa4C/kkSNaGNCsH4pvrrD/cPAL8b7XIRxiPpJr9lDcoreD
	hicN9dSAhLio3WB5JWBEfkXsU/VUbl0rq9IS6uqFiv6lLhIEHvdunK+vJ/c0diORIvUxpnN2u3s
	bQ9Xm921lEy/zyGASu7H1r2GIN/Sj8EczL2biPe4xfqqeQ5DOJHmWZAw8fpabxWdJe1fo7hqGSf
	DlMQq/sX+Z+tbgAlfsP1NtoA05HPGENPyZFl955edmFNJnK1bozgTFmuZsXkaItvtYvsPvZ/Rbe
	p64eJKYSo4KPCOehAk3uB45j8UIbxJ2um22y4LU6b5zBnOZFIDL7UXSwPeUXEz4G77onFHdkNNb
	qa0GdC4Hfa2VKcZjQ4FGJxBWeOfZYV8mGn/KAhiG5XB+Hh1cNfy1ZFjPnb64Wc6CdEcpC/ZMr9D
	DF8WI1lkKU3jpdxdWnbtxSL+9PimBEVt93kO6LeRaHQNjD4nZRWqwBZlqxidJB0TgUgDHibrSyl
	vv4dpEK4Vgb8/C4D/4/Zoc3Zx/5WNrNkPSY/lHZ5f67Ev7gdr4WSYZuXctSs8XvLYuN36YblFHp
	Fa3FqV
X-Received: by 2002:a05:6820:a013:b0:6c1:f38e:7053 with SMTP id 006d021491bc7-70b8880e70cmr711138eaf.3.1792725298780;
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:52 -0600
Subject: [PATCH 1/6] dmaengine: sun6i: fix physical channel index in
 interrupt handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-1-01085f684c9f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201459_914239_F580E9AE 
X-CRM114-Status: GOOD (  14.08  )
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


