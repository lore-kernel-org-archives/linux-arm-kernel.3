Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979E4109317A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsX7j3IsBCAR2JvcHeowKyby9MbV8ivPuVe631jWpdc=; b=cu8p6x5ufWncIBiH16mgEaxwH/
	s2gUOIIgrv0AVlzpfoOrUK7isD0I7alEShpY6ECv2AAELMp8DUweCON4BwASidzQPW05I4v4rsfYP
	RhGqhCxS8JnWtVBkubMyJuL/hmRVqCWLAnocwv9swkGvPUrG13x2phdS+ZoJGtjRPCh9IrufQLTni
	ZleZ5mi/W0a+kpTOP4MLUfHyW9dkUqorT4jXzca+kY99DtpyztxLMcZmq6zg8iCNui9VBVK5rXQ0M
	7mFXgN6LMm27/89Ov3MIkr/7nkdl1oviheDAUuCrOFD394yXBg+JC+H6iV9m79EKMn1mvwjHoQBx8
	1ZRbIvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TE5-0000000CATO-04To;
	Fri, 20 Mar 2026 06:20:53 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TE1-0000000CAT2-2QLS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 06:20:50 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2ab46931cf1so22927735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 23:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773987648; x=1774592448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsX7j3IsBCAR2JvcHeowKyby9MbV8ivPuVe631jWpdc=;
        b=UZ4SnBqC1JkDpzh5sTweQC7kajTkmY8GMogdjnBLc+i4fuEMfun7S7tkpjBgENT24i
         jXxmvbnzI19yWeFC0guk+1IEV1HSrJnGk2NHlGYbrgcLuO/9tdjmjq0LHh3p2ovmpnKY
         +tInfIiKv4hYTTFyZjouyBCmQOQ5MYY1fmM4mDWHsRRgbdFktaGagTA+wF6LGRS7d/39
         z9R9Y09B+83MsUy/NDS1GLuPiM9bBXg2cWBms1uRhu6LLLOvgtYHEH7HxtpAj4Avwo0J
         js6NO4eXkWhp9+XFxXEsuS53RtX7lyskJoGJ3TbAEzh669DVxm/hlUs7g4KvTRyZOj05
         zEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773987648; x=1774592448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsX7j3IsBCAR2JvcHeowKyby9MbV8ivPuVe631jWpdc=;
        b=npHiPJlWnFC8M1o/CqeJkQYAIVT0qch+qSS7x+jvyqA1OIR1PukUe739CXx7twe41z
         XHLQSWhSBt2Z088F6RKYJHIb0I5AW6cAJM7E6bz8QCbtT7S1n6Kqb8dkMd3WmkdOHqs0
         SCXckm31t6oF61SAuMq1gPXi//SAAO94Q9pYnnjCqPPNASMmioCO/EyuxDAdroAD97F7
         7It0UsTeMUkideEGbdt7ercO+CjxDYv+Q1GyCt2owpNiGD65hIvI/xcXQooXLQgdf/62
         FJql/5tonxela5B78cxhm8cqU7mNk7vNQ/phgkKrPv7nbXmE7tMdfXY+LJMYxocsGPRL
         KnOA==
X-Forwarded-Encrypted: i=1; AJvYcCVSuf3RR5rnvtBR72fsfMIKikbxMKTkaFbgDembCS9yppF6VFV8OtzlGB4Pi7mqOyIsKyC+u42uKljvjyqnsVB7@lists.infradead.org
X-Gm-Message-State: AOJu0YxBTJ4Z7mcB3S3teX/mSzSTHFF//+oWvMS8AJ3cob2HqYVLODhJ
	Wwf7k+uouzMRTfylXJ0l2OF+MBwmZB5pcYVfvsokCCupP4aocuQyAqQ8
X-Gm-Gg: ATEYQzz7T2My3RRxqmdTtm/qWvfXYBQbC2Y1v3MjzDixJVr4fR0xmPStY4NCYRvOgA2
	ZFKTt2OtiJRocUpKUbv/FsoFKih0drYnftTeCO62rnvmOm77y6WhcSrRZdIGA9IiWyL5AyEDvoW
	1zzBay21w0f2tRbTeIhkmXBlzocBOpemBurKhWuf1yeKgwE8pY9oIlvS/2Jt3WuWFpCaUJFR4TR
	uU2RS10f9tqc4h6zZ1xRst7kIafWMTlmiDXoYjI0Obvt2tHJRNjWzJV/zhEVgjNJnMMHyQTeQz0
	1nTrzrSocfkpDlOQZSxmsDY0MosL66la+AGhd9czdrEQYKW1jcqsgwtwnxPbVeAxsqP1S/pcXdz
	sUIPXBV59iDsI84wSLpqEVb9fyi1eA6T8FqpyEVpI70zhry+ugL4VGJHVqXh+DcGDtrcPqdimWn
	+zZlu1ZnepLnkDUu6eXvo2KUXZSFC7roTkPWkoqL2xbfKPqA==
X-Received: by 2002:a17:903:1a2e:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b077165dabmr46941965ad.10.1773987648287;
        Thu, 19 Mar 2026 23:20:48 -0700 (PDT)
Received: from XP-PC-yangg9.xiaopeng.local ([98.98.112.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836554acsm14418715ad.51.2026.03.19.23.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 23:20:47 -0700 (PDT)
From: yangg9 <cohenyang511@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	kuba@kernel.org,
	yangg9@xiaopeng.com,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	vladimir.oltean@nxp.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: close reset IRQ window and avoid double free
Date: Fri, 20 Mar 2026 14:19:55 +0800
Message-ID: <20260320061955.833785-1-cohenyang511@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_232049_627642_27AF6AA9 
X-CRM114-Status: GOOD (  12.24  )
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

From: yangg9 <yangg9@xiaopeng.com>

During reset, stmmac_reset_subtask() used to set STMMAC_DOWN before IRQs
were freed in __stmmac_release(). That leaves a window where interrupts can
still fire after the device is marked down, which may lead to interrupt
storms while the interface is transitioning.

Move stmmac_free_irq() earlier in the reset flow, before setting
STMMAC_DOWN, so the reset path no longer has that interrupt window.

Since IRQs are now released in stmmac_reset_subtask(), guard IRQ release in
__stmmac_release() with STMMAC_DOWN to avoid a second free_irq() during the
same reset sequence.

This removes the interrupt-storm window in reset and prevents double IRQ
release.

Signed-off-by: yangg9 <yangg9@xiaopeng.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 124d7a00f9f0..99b661379d9c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4212,8 +4212,9 @@ static void __stmmac_release(struct net_device *dev)
 
 	netif_tx_disable(dev);
 
-	/* Free the IRQ lines */
-	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	/* In reset flow IRQs can be freed before dev_close(). */
+	if (!test_bit(STMMAC_DOWN, &priv->state))
+		stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
 	/* Stop TX/RX DMA and clear the descriptors */
 	stmmac_stop_all_dma(priv);
@@ -7331,6 +7332,8 @@ static void stmmac_reset_subtask(struct stmmac_priv *priv)
 	while (test_and_set_bit(STMMAC_RESETING, &priv->state))
 		usleep_range(1000, 2000);
 
+	stmmac_free_irq(priv->dev, REQ_IRQ_ERR_ALL, 0);
+
 	set_bit(STMMAC_DOWN, &priv->state);
 	dev_close(priv->dev);
 	dev_open(priv->dev, NULL);
-- 
2.43.0


