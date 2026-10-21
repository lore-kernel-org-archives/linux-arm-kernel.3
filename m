Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E30E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YQolb4d+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ShKWn41F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=; b=YQolb4d+G2J3fy1ncYJ2xIL/m5
	FEuGpHXDEedL2ya3LFPm3pph/VNYzCqUJYO312CEeXy8vFSlDvV1dmZBZ37RaFQO7Zsq0cQ8/5o/8
	3WROgyeVhk1DUnjfD0qyCWWhUorm/cxfkkeF6y54eTgM2BteSCS94OQj1WlTAQ5fJcZpeWPGQc13y
	NVt83TLwPpe1FSgdGlI9Fo7yBMcTeEwK6oqt1OA9AyP1SOR26Xnzuft0LkGS9E93tJqvm0hlcvpog
	mg9DkakAxBDdwfdhfZ225MbAWs8tit53+0mT/bdjh4zIj2q+t78G6K0zB1/yDvsq6NjXT7c4UPkRj
	07n8lZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdS3-0000000CtGR-2iPZ;
	Wed, 21 Oct 2026 21:02:23 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdS1-0000000CtFl-31iW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:02:22 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6d00d120b28so787898eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616540; x=1793221340; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=ShKWn41F+vE4UYfEZ4VV8p8yHD3m/G98D3DVd16vzkTH51ch1FtcAbYB9nKTW+XFc3
         uDHHHYK2BLdG64iGwGDhILdtPc7hMLqwEo26exDkgtIj8anUgrEZMy+HpfWmLRD/8nhL
         AfxoVaPE6zjsMpZiXdA9L0lBERdsVL5fqkylPCpyzRhxWJgDBTstf90qR+BipdnVqjwV
         +eDlJXpYcAwWY+JkeSswhYdc70eC3NgKLVpVkPRu1cwdeLHX6xKBpLNfCWrTzPdBTZ1L
         QAtcN3/WVVWdZbk37kDvaNOSt2QWFSz5l3j5cj8/+Gvk+kk6GT8KiRi8Wbz3wHfpdRpJ
         13mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616540; x=1793221340;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=vvTDaIhA8C9JHS4Zta66hue3OTDFcRf5OR/9+iqiU5fy619uj6mbX7R2jAStCGZ/5i
         BtKlckqeW4IUlZqGpn+CnZD20nAbEH7hF0ULm7fx8JAw5r5EFiIGuEdbdBRTH3OSRf8P
         3iXHowJhoPkcSLKPbMZm0eqM3it/PlZ1Fdn5YduWiZw6Y75p9nrOyhCexae6SP1TQKaU
         ZgrD1/ENdanECJ/PyNzS7SKQmzW5QPEk8w9936LFopMxy9dD+Rx3wtyt2rZ0/Dk3Pr+x
         b3bPfSJ9i8sYHO6DSMeEbXjI6IKkqzF81tEBAYnTa6hF4U1q/Su3z1DvKpTn3rz8ww3r
         yx5w==
X-Forwarded-Encrypted: i=1; AKwUvBxup+KQEsrokd8PEFgYBxLVFmCxVzUP8zfubJCnzuf8Hs8536VES1w4QpVi82Gbb52Kmlrqgm7Sbz8F4hst0HqF@lists.infradead.org
X-Gm-Message-State: AFq9FYJqySdvZ9IKETnibBJZWzQf96OUle1XyRhcM4oe48JmIvoTiXQu
	D/Fw6QoXnsEozUWLwbgt55RED8dsh6+LDn7DlKUmjjxOHQZ+wJ+0dq5FpXCIoQ==
X-Gm-Gg: AYBFou1YRrGYovyTWWJ+m/UGQfSTXJ4SZ3jwb/QVoAbYzXbyklVUQsiq5DSGSc47ZIl
	xdT/nJLZHKymEqs6DRkNrMMsLeSIpEcGbJMFaCS3/Z34ZbmqztBMLfT3EHYJLmLoep6iG1G7erx
	QjeBnfiDNnQWGthJR0AkXfHXBt2m2xaigeqUb3u3FU52E7qsjHDfVmarCDqZZF45Lqozd3PBUFV
	wKA8nohgOQU3yLfgnepAHu/gHM6AI5yc0uHFqjWDYXea3wt462154Dc99v85ADhy7bojJnw5BuW
	8+1qX7zb4pQpRke9R2DbPzrcHCQaFZBsAdx10uWJ504+Lp3qcWI2QIm1D2gTHRggivQNaB7dHDA
	lC/tN3tjiUnE0xw0wWY6OsPKnYalKOpPDXbx1KjotB9vM0vrv/i8uMC9w12jgZoYwF4vho2FV2g
	oGrJVm1C14Ny0Tj4eX8ppSnFiBRdKtlgveJBvdzPTwleAv6b6nmogisnLffLiDbv7kwVNm4XFr9
	uvwZpqoXKECEk0jMGDBrMUzxKgzas7ptYgZqPMzXKKNlItNb8NyxOG8SMeNOgjBbzgabgR2vXDT
	ZunZDZoTenkt5R5fJ21V6e+7XNFhfOBO0JyPmiHx10ZNBv7IuhF8EOkTqHrIPLKMWg27ZTxL5aw
	Grp3VBw/QHJqQjqPYOK9TSKdosEqW1BD3J6nzIIAL8NSukQLNhmqYfmVYSYruSx2o5Tn/4P6tvW
	D6LIE=
X-Received: by 2002:a05:6820:83c4:20b0:70a:6888:2274 with SMTP id 006d021491bc7-70a68883cb7mr438594eaf.45.1792616540307;
        Wed, 21 Oct 2026 14:02:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61ce790sm2885699fac.11.2026.10.21.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:02:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:02:13 -0600
Subject: [PATCH] dmaengine: sun6i: use the channel pause enable bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wqDMBBEf0X2uUtNChr6K6UPuWx1C24lUSmI/
 95NfRrOMHN2KJSZCtybHTJtXPgjCubSQBy9DISclMG2tjOtNVjWMPGiIR1jmjzOfi2EQbvNYGd
 cNPHm+j45UMec6cXfv//xPFkFb4pLldZF8PWdvcSxVmokGVjoev6O4wcRv+NjowAAAA==
X-Change-ID: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_140221_769965_5B201F02 
X-CRM114-Status: GOOD (  14.58  )
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

The channel pause register uses bit 0 to suspend DMA requests. Bit 1 is
reserved, but sun6i_dma_pause() writes only that bit and returns success.
An active peripheral transfer can therefore continue while its client
expects it to be paused, for example while the 8250 driver reads RX
residue and copies a partially filled receive buffer.

Use bit 0, as specified by the H616 DMA channel pause register.
This fixes the pause request itself; it does not add paused-state
reporting or change the handling of transactions already on the bus.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..204b0b812431 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -60,7 +60,7 @@
 #define DMA_CHAN_ENABLE_STOP		0
 
 #define DMA_CHAN_PAUSE		0x04
-#define DMA_CHAN_PAUSE_PAUSE		BIT(1)
+#define DMA_CHAN_PAUSE_PAUSE		BIT(0)
 #define DMA_CHAN_PAUSE_RESUME		0
 
 #define DMA_CHAN_LLI_ADDR	0x08

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


