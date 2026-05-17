Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC2CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qtD1lVmPgyK77uEJjECTLE482mHgEl/XesnKafKF8U=; b=SucsPON3fDZ7J/HxTV5m4TrxFR
	MqVTBlWAhMLGJNcVWE6LM+lrDwzTAaQoep2BfQOtrJF/BrjaBtgyItt1i31pPn6BcROe/wAXTYEyD
	r61VIybRP36fZ876BGjAfshYEtyx6CaS0pZeVbqyc5Q9ySXaHmDIfo3dzy7LzD4lkiuutF7cp78eD
	Dw9NMo7GjxmgM2rgRU9rBqeZrjFU5uOXbn3ep2NrqHxXRVPeqDy34nbsD59t7w1F2PkzP7GfyrjNs
	WXk3eovivH9lVjaUHs1A93ArFtMba+rU5vkIsUJv70Lr/hlA4ZVZ9iN7VrdwDQY1FoerwPJoH9Oh9
	pLoqPZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft4-0000000DAO1-3x6M;
	Sun, 17 May 2026 18:06:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft2-0000000DAN6-18VB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43fe5574cb9so29633f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041206; x=1779646006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qtD1lVmPgyK77uEJjECTLE482mHgEl/XesnKafKF8U=;
        b=saxLmQOR8uTJKzmGRusgyYJYF9URFJBBHYOVk3zljVPAVcM5S9wgkrUJLAEM5tltjV
         govEP0Cu21H53jDFfs7UnmvtXyF/1ijn7GGLvFP70q98u0qRVmaWYL96EMRKRmhLF5uS
         Kr3IQVC/iVm+j2Zs3Bo6RsghIfp/0SBIwrrv/VqqQbTSoNuEeUY1Q+9PeG1DNOBsaZrK
         +1XqTDl8w3l32EzVFcCGUHFwZwiN2nrhLMCD0dyRYG4CqxOBqdc9FQwDK2nngoTQk802
         8yaHTElzrGNNURXT2UJhNC8zg9qQ1yVyGqry/ZrC/fduu+7MwDd52bGttcQ+tBQnCOAO
         dOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041206; x=1779646006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qtD1lVmPgyK77uEJjECTLE482mHgEl/XesnKafKF8U=;
        b=OK4rMxwmgXMCTNfA4JDbtktvkGlpzOjd26rqndNPltfJM5p9IUXDsYKDM9IDnrzK1v
         vTjtGF0hb6vn7yvb8ol2zvm8KUaTkaHaMZTqmrPo9n76lEpL9ZFxdrMhl4BPn4PMlgjb
         35noz7z/Ozqa/Her2y9cg+RzcW1Enj1xQQGZxVV0KBiOgtB+rTA9V3pB87ZZb7gXwd3/
         p6hZG5T8OlvNeHtSwThwyYiI/Xdnw87o+baa/nNk55vdgkEL50gRyqocX75AiEc1POcs
         zjfBqS8jEAUUssLXcNHVKgqFUVk74I6mTJgAd0TxOyX0jwenMRSac+Zi4sbULVDi7BD+
         2Ktg==
X-Forwarded-Encrypted: i=1; AFNElJ+Du7jrEV/wjNZqRxLdGmTHb7Q3F55SIIc2+a8zAsRTgGWFq6JWOYoOo8UI1jGIRIeEmVEUjQLmZSODsL++9M1n@lists.infradead.org
X-Gm-Message-State: AOJu0YxSLOwDiwG72Am+cYUZoiy9gybJVjJ4Ef/uuxXSKOdRjCCiLa0J
	2CRQkPDYp4f1YzNwbnzW54N0GqWj5aisjTDgE1/TUWo44ZHBRPRDWs9X
X-Gm-Gg: Acq92OEoPCFMH+W6AvQ2zEdkmCZgb8TjZ2Oa3FCDDLthA4db4Tamudn+EOpVmohkNcN
	2yq7cX5z4aX1Yaph4yHjHNIoY3dziy7AAJeI4mQD6tsGDAeY5fgPOcVVMToCVPpY+5lWbuY1XO0
	fAQcllFttCL1qFgMzVOlsHMXogRTFRjpHykr+fML6XYYyhKvxzkEXSlxQ9csNtZ5YzH21IEKbcj
	f9ZVbLGebUETYqkA5qtkzgtphROKEhI4fQ2nwB551FJxKJJFPw6RblHdsPJZWBAO6+MADHQiuKr
	mJIs9FnoxcodgZnJ/AGFrm3PeqFt4vOy/ruy4d893UyyO1KqihybmBgRiVziQwht58kA+ngAPxJ
	IGkXsi8ob7Tfr7oLUHw1Ip2a7RtQGa4wIaOKzgUp/whrJ8U28nlQi9f4l4DA2XxvmN1AlAKwQG7
	PC7xL3GKPGX2g1ueIr6UbDXCCt9eEOhBxKDz0tPoU0BLMu4k+2kIV0c/xRpEC4XGM=
X-Received: by 2002:a05:6000:2709:b0:44a:ba79:f039 with SMTP id ffacd0b85a97d-45e5c613c1cmr5692426f8f.8.1779041205587;
        Sun, 17 May 2026 11:06:45 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:45 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 00/12] crypto: atmel - introduce shared i2c core client management and capability-based selection framework
Date: Sun, 17 May 2026 18:06:26 +0000
Message-Id: <20260517180639.9657-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110648_330130_75736F29 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

This patch series introduces a staged refactoring of the Atmel crypto I2C
drivers in preparation for a shared core-based architecture. The goal is to
consolidate I2C client management and selection logic into a common
atmel-i2c core driver while keeping ECC (ECDH) and SHA204A client drivers
functionally separate but interoperating through shared infrastructure.

The series moves existing ECC-specific client tracking into a shared
management structure, relocates allocation and selection logic, and
introduces capability-based filtering for hardware selection. This allows
individual crypto drivers to request hardware clients based on supported
features while still benefiting from a unified least-loaded selection
strategy.

Subsequent patches extend this base by:
- migrating client management fully into the core driver,
- introducing explicit capability advertisement by each hardware client,
- updating ECC and SHA204A drivers to participate in capability-aware allocation,
- and cleaning up probe/remove paths to ensure consistent lifecycle handling.

No functional behavioral changes are intended at this stage beyond internal
refactoring and preparation for future feature expansion. The series is
designed to preserve existing crypto functionality while gradually
centralizing shared logic in the atmel-i2c core layer, reducing duplication
and improving maintainability across all Atmel crypto drivers.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
Lothar Rubusch (12):
  crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
  crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
  crypto: atmel - move i2c client management instance into core driver
  crypto: atmel-ecc - simplify probe error handling
  crypto: atmel - factor out i2c client unregistration helper
  crypto: atmel-sha204a - add i2c hw client list and improve probe error
    handling
  crypto: atmel-sha204a - switch to module_i2c_driver
  crypto: atmel-ecc - switch to module_i2c_driver
  crypto: atmel-ecc - simplify remove path and relax busy handling
  crypto: atmel-sha204a - guard remove path against missing client data
  crypto: atmel - move i2c client selection to core driver
  crypto: atmel - add capability-based I2C client selection

 drivers/crypto/atmel-ecc.c     | 98 ++++++++--------------------------
 drivers/crypto/atmel-i2c.c     | 54 +++++++++++++++++++
 drivers/crypto/atmel-i2c.h     | 12 ++++-
 drivers/crypto/atmel-sha204a.c | 44 +++++++++------
 4 files changed, 115 insertions(+), 93 deletions(-)


base-commit: 6c9dddeb582fde005360f4fe02c760d45ca05fb5
-- 
2.53.0


