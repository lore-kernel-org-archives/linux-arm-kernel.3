Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F779C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=; b=goNPA6VkeJCDfU80bdeBTcUR2u
	r59DHtpGbRCcKGuDDtIGfzFFjcEsH59+ebtg3e+t3vm8ExgZoOppZS3eR+IgxsMiu6OMgTudKMdif
	ptv+kcjOxMtmEIb/iDbd47L8u/iClNiAnKqQ5iZFD8jdWDfA4vVKRo2LQuJSzZl0FudtVLVPzPCrX
	897LA/lLAMtc7wa+Le7VEy8L+xWwC0WKcZAZ7UYZzHwJHMnSGVilBNplldE3tJQ+K+Ie0YjkMzU3w
	kkPW+NDZwqXXVYYpERCTpWGQu8rZzA54G0RIuYtVdiNBzAVCUr5GSODIOaPbUlZBFMcr0yGXq5sRG
	SqDm6bYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuS20-000000056qg-0mw7;
	Tue, 18 Mar 2025 08:10:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRzD-000000055wS-2b4c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:07:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43935d1321aso1651125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742285262; x=1742890062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=;
        b=bdvs35IJkqQdmJW+wFKHGyWZ+ZWble7Ifhek3paa3BZsIdJGW9vQpoQeHSXDQifsKb
         SN0662CRdThcGoHy08zqRmQSfa7LFTxO4bhRWBEnisc1MiFIvy5R2gD6xpnrbRcpPuOX
         Tl0MoI+NlFFt86T0WKdVCT94JUtADOcLWVCGOfwuK298MEmwrioXIeio9WIrHpAaQL5A
         UzbspsJ651HqzxBb6IBje9N1gHb9qTlY2thyj4QSxZJMzPf3s84IC0PEEE3/zKOMh1sq
         12O0e9kRoRApYorSnUYBb39rvdgcz2TGcWMLegcdVYlisjC+VJIv8Fifk88WGx9PdP2l
         OpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742285262; x=1742890062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=;
        b=WOIxz7MeG8KUeNjRsDaDyBz+aDGgQtx87eeY8hQ6XoQFrDfC7wFOOtZVibGotKelEC
         1rDDAm3X9XUIfTrus+luzMwy9Xk0R9aFfgKym3R/8E1WbuxGjyHzojdWqbYxLI7K3D58
         MoHKKQJ+6QeL5yrTqiHvyL8V4tblsRtztrhop7166oQ0NMnfXSvoL9b8RbVDVCFo9Hmv
         Qvi9s3bbtTG1pmvp7wJuFmYRN/5p1sUKYyPgdGQLGdYzZCFX7vTDB3zz7KiOpBk0Rx5g
         AciYrudURC18DPgFStfiRBE/GtF7vp1q6EceBbe+S1DCYshf5sIMyGVlEjSbuBaHITHB
         mFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvxsWN4dKR2RY9SSpSwQBm3iwFAyMOwpByPxebIZyWeRC+Xtl6spybs9KQvkbyKhJ/yjljSyqPOQ5oJU0VRDgd@lists.infradead.org
X-Gm-Message-State: AOJu0YzqQ9fy9kvYO6Lj9WJjIrBaZu68QzK5HpIPGrmxIbrVEXf5WBvp
	nDL0MnzOtNKtTQWb2IRavzLE5eqDAu3Han876vio2KxMiJCTjraz+qDKGJFw3Is=
X-Gm-Gg: ASbGncs0u+OGF5BIqOldpRqkdwzDF2cD/e4cgIYReFWybDqItvW80dUMqUiVMZDW/EU
	HICNt3yBNVA2Nw39/hVk1bidfFUPTbP1xESiBFeo7llrDb5U0rmbQ6A4Gw9H1Ld8XIWzrPEVXhR
	NUBYabr3arNDKEgod83fYPTUVBn4C5A+62UiBlktqU23Au1drYvbAU6yE/t5uhJ8wV4ZPMDhi4B
	yYXGfw6NwiV/UGr8kNrrQoyd5vaG4tUqhOUMnJbF5cLdeNb1mz7KilSB3bhE3reCTdA8BowAI34
	Cts+wKriOEQSwNq0aaPj7WgqUWKVh0SmikAPrwks0n6YS0RTM64xt8Dqtw==
X-Google-Smtp-Source: AGHT+IFwlyR0auz4mcdACDhys146VQDwS7zQVk+tqjA/y7Na6v0bxrpeypR8IICKSK0Vi8hm17Mb1w==
X-Received: by 2002:a05:600c:871b:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-43d1ec6544fmr65619435e9.1.1742285261948;
        Tue, 18 Mar 2025 01:07:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c4f9d59dsm17389527f8f.0.2025.03.18.01.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 01:07:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct decon_data
Date: Tue, 18 Mar 2025 09:07:38 +0100
Message-ID: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_010743_662626_D1706C95 
X-CRM114-Status: GOOD (  12.21  )
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

static 'struct decon_data' is only read, so it can be const for code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 5170f72b0830..f91daefa9d2b 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -43,13 +43,13 @@ struct decon_data {
 	unsigned int wincon_burstlen_shift;
 };
 
-static struct decon_data exynos7_decon_data = {
+static const struct decon_data exynos7_decon_data = {
 	.vidw_buf_start_base = 0x80,
 	.shadowcon_win_protect_shift = 10,
 	.wincon_burstlen_shift = 11,
 };
 
-static struct decon_data exynos7870_decon_data = {
+static const struct decon_data exynos7870_decon_data = {
 	.vidw_buf_start_base = 0x880,
 	.shadowcon_win_protect_shift = 8,
 	.wincon_burstlen_shift = 10,
-- 
2.43.0


