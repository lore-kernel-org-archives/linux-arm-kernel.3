Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7810ED674
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6lPcbVZmNujHQL5UUK06jTEaRvN8op1BFC0EEEqHKk=; b=euC6Q6RjqJqelNlCOLXMdjpCdt
	tMuuu0HO5SAVFAgVYMnXGcuxIexN8OI7ZfcT9YnntBf9EX8iSd5Tcix7ryhZIKrfBCyIdqk8FO5Nl
	hE7GrxwfA89WNnRPLeQwPtn0B+VXRMrZJo0GvV7APwaJZXy9qJfUGT0lA6DpAkbhrM2bU56Tmya9/
	D2ffR4lf5MVcJPCo7h1Qxnw63KH00puBBzGaKpzQMejNoC3J2b/xHAXS6Qgb/vGA2CXSF45KEn3mN
	2Qr64HMiwvIyZQnKbF8NHoSYb0fhhkpkSncbYF8lRO4Ww3PEO6yTYG0rHtpXvqpyfq8OKYlFpkmoj
	ISafVqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67yJ-00000007aHh-1dwk;
	Fri, 27 Mar 2026 14:15:35 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67y7-00000007aAO-1lkP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:15:24 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38ad12fb595so29378931fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1774620921; x=1775225721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6lPcbVZmNujHQL5UUK06jTEaRvN8op1BFC0EEEqHKk=;
        b=SYn5ar1L+T5Afz2KTSBux2Eecf5NHg7UpWrSwDY+lt/NTkDFftHoODb9hCEmGRWWuX
         B/lI8YmaQDLV9uOD9CWG4F0UqNSlKgDDXRT2FDTMLUzQXllBMRVMvJpp2UJFVg90vOTn
         ekCVkl1YIBnH0W2y/YxwBqVsCtcQhsKi5EVrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620921; x=1775225721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6lPcbVZmNujHQL5UUK06jTEaRvN8op1BFC0EEEqHKk=;
        b=A5892jt8QwAiaAcat9szFhuuFNUxrTTML8PqGvGal0QLTDvObUNGLNFbugc5M0WHgB
         jUs1C/pVAb3PJz2XjQMzqwm0TCRzBoJLSt3WGfsFBtqhmXwX0KT0mxEjjS9+kdtRYEva
         eYw1AbkiScC5b2O6Im9dLhId9c0hyYCmS/0oLmkR7AYIVfIc8yh8+e/JAtmhSLVv/ovV
         a6d8PlB7RDWkeSWXGvscQn4KwD3O62XpQZ+keIOEKMFd6wGqWQwb67Xl2b+2vimAs/mn
         AwBh8ovVPwFi6o8oQeHOHW+v/N5R+09ZD9KF43D4/lycG6W5ymPHx/6Bt9iZPZaEFSZ1
         XI/Q==
X-Gm-Message-State: AOJu0YzSN0Z4w0qbe+m3Z7fyLU4t5uF/ALaw4vbqho2vFeZVpH23hgwo
	oqBz5p3eTKq7IMdpri5lmtl44znQmu9SMTGOj52ebouOqJrTGRk4RtFvzUPiFGktIh4=
X-Gm-Gg: ATEYQzx0okYCs8Ltt6hdRlHr1vsDQYsSEBHo53Ct+MJ8wGd/FUlE5em8By+Dgm6Wa7C
	8LRdW8/M6roDmakLv23d+ZrJWP3lUlGO9oaY4/23Dqr4ipYdGA0+eUFpUusOnf7kPCwO5rQ9Wxd
	h/bFQ3xAAP/jc0mulqRBm9jhRLh27k2XAWYDw0KsBi5PxqEPXScjuvfey1Qh8C6hvyKFiBHRRvA
	lZuB7JAVTZcs+lAA7ACKsPgmkzqwnP0BDBjwl+8IdchGfrYCLuhObzYxVlVChJqOH8EQOdQsCjj
	XD/QRak7FCVEGi4Z9/y58BYM6ZDDEHpkS2eMVfGJrl/i1qlBVqCNlnJpbFeJ30SQZDcseHG1/OA
	7bX871QCiHfx/BE9VeBQsSyEb1sItazjjYn6/m1Xj9W2s5Ph5H13LAmmFF7MekI2Ut6AA0myYjT
	YZJYxpIpAB1M1iknyUxNSr/JngOYHQPX5VARht
X-Received: by 2002:a05:651c:19ab:b0:38a:4923:e01d with SMTP id 38308e7fff4ca-38c756ff12amr9980241fa.7.1774620921108;
        Fri, 27 Mar 2026 07:15:21 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c6a848cddsm8219761fa.13.2026.03.27.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:15:20 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 2/2] arm64: dts: ti: k3-pinctrl: sort shift values numerically
Date: Fri, 27 Mar 2026 15:15:13 +0100
Message-ID: <20260327141513.1250499-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
References: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_071523_488098_F4824780 
X-CRM114-Status: GOOD (  11.10  )
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

The macros are easier to read when the values are sorted numerically.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index bdccb153e089..4491898d8294 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -10,15 +10,15 @@
 
 #define WKUP_LVL_EN_SHIFT	(7)
 #define WKUP_LVL_POL_SHIFT	(8)
+#define DEBOUNCE_SHIFT		(11)
 #define ST_EN_SHIFT		(14)
+#define FORCE_DS_EN_SHIFT	(15)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
 #define DRV_STR_SHIFT		(19)
 #define ISO_OVERRIDE_EN_SHIFT	(22)
 #define ISO_BYPASS_EN_SHIFT	(23)
-#define DEBOUNCE_SHIFT		(11)
-#define FORCE_DS_EN_SHIFT	(15)
 #define DS_EN_SHIFT		(24)
 #define DS_OUT_DIS_SHIFT	(25)
 #define DS_OUT_VAL_SHIFT	(26)
-- 
2.53.0


