Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J64YplRT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcyfP3YR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZlCHGoRtMbV0sOxoCDUMJOhQ5x4ULZVSAr4XX4def2o=; b=J64YplRTHy4FC8Yf6LjF1PuC5h
	5B0BZHIfl1VEmjhqIe4uoCftOSwFOCgYeJJZ4Ac9123FiGYjTsxW+uMJR/lmM7jQRizkB8j0xrK8P
	v/b9nbDieJK2PWeFV1mG/W0/9rFN4xnu3CzOr3Zm6UAW3nLzVi7v62aDEkKX7qtHmhXS/YnkJMK5H
	m/kMCULHyyGQLYTc1FexTaBh2yojalcKUGMRemPBADb4FYHQNx4/mZ+feFm48AewVrbbSgfeRo49E
	mNHcqbuPgwyFR2gJc5WzJ8YpTk27mUW8VyobUA4CwrWVqWJmJqfgtAiBq5uqEBYA16bMugFc2Fnch
	Sa+5/7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcS3-00000005iEo-3q0P;
	Wed, 04 Nov 2026 14:58:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcS1-00000005iDs-2ZXM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:58:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e9995ce866so6442555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804336; x=1794409136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlCHGoRtMbV0sOxoCDUMJOhQ5x4ULZVSAr4XX4def2o=;
        b=xcyfP3YRqfnLKtSkQLtzwO08qTD1EieofXIHT9ceHY2ImlJTQJwRvpk7xWEqN8cBKa
         GC4hzqSJhEkzfLf4KdrmLMx0pvY8SZHvS3r3HE1sKT2erHKGKXzuEh73PILWxREsiK3X
         zNhFRdHsw5eb7NqE3SuSRPTyvDksBeDLQQhZlpJCWsmoLCMw1gDsvHNLDLTeoUiIGtL7
         ydGLM3p+PvcC4EHKBfUjxgZ5iGkvE6uH5gn4wHpseKlC3VrauVpybnJ6s3GhGNkXnw++
         d1q7+3gMNTB3PVW2GITFubzC0s1m/PHiLiGAhdsIOI//CI00YY1hiAN964+EEuAXHZGi
         IfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804336; x=1794409136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlCHGoRtMbV0sOxoCDUMJOhQ5x4ULZVSAr4XX4def2o=;
        b=BkIMYEdRFMvsbBcPNx/A8Yan3V/gX7qfSzJGTu3qKRs2MlGFl4Cjmxu66aoJfNX2Y4
         npc+rsFarGc15Pa4GmK2AAtEImdtOFK0a+64mtpIVZmSkFRltvUrYaD0ZeaWc2L8372b
         DXw9MYF7nd9jWD2iCT7T/WB8Ugt19OCunH6IlHITHlDaruu55CJKxfNY2BYt+0/dmHwW
         YcRqbWogyoHyJ1TDgf91P4YmoEfe/udrkL3KQZq23BnCy9T+3BahlVNFe1XMUOYfhNxX
         UFscrkMRe2zAH9LPkTq/Y7AcnX+xVoWp9hXixXW76aycYhfLdN81XEO5OLyTBZLB+Dyn
         hs6A==
X-Forwarded-Encrypted: i=1; AKwUvBwB6soUEjp+QFjp5vke8eDrr2bZt05wqTay2phBjk7A90k7ywlbRyHf9buAUGAYDwDur+a5G5N3PxgaHFRDf9MO@lists.infradead.org
X-Gm-Message-State: APuU4Z9vDjnmKn+VRQDbGaknuYERtzEfX6xUxPXOGEqdyytl/Do29msE
	FO6e9ju9Xk4MHMdDY4BxVqkyCn/Dh171tHYnNddvPcDiKdFNNulpEQc5
X-Gm-Gg: AYBFou3YpwY6fnJf1ad8hG8QAAZ9bQ1C0MFSPU+va6WTYn3PYap8eiT2ca+Td2PoOHf
	c8QuuHDlj6TI/+N7mnSdpXc/Me7CCIE9McGxHOCL4+75u4sZyT0hyUP1DQ8vLLx1egmopkUX+wG
	LfvlEYahyQGTLYt+FgKVN9pUy/gqffjTB3rAe//pWwSjqVHMemESQRK/AiVuqPx3ZxP+KOTbdHX
	lNj0jCLCytCmjlKGdv0MWIzH3YdkRsguY7sHZtf4kxG4QqkOouC2mGk294xOvD5Osd1Tw40phXA
	VqTJsJtpfDZiZMpCjpEtKvrq2QWHEoKbKcbFkep61WBECRtD6eCqTkDUm/PQe5rcKJib/3xk6zM
	jR4MS654YqR35xeppiMeMHmtMKVPs5fgCDtIG+g+GW4qW07jk3qr0YMgFZv/V6XVRK8y9nK2Cav
	vTTeUU3Mhzm2em1MnQIx9/mBOVLajf2EgFC4plTXlgNk578My56P/JAA4B0PGE2y1fVnGki/CGm
	9/zVkFM4LkU279fg3qcMV2VRWiGt7pDpACRh+nBavVUWsha9HzVu1oUivSLhPKHTBKx50QGiKrK
	BISsDSTn60Rehd54/nfpzrwjnIp+tFBrO6GHFLuFgvk2dw41Vpl1OmfaLn+STFCnNxpabuBNiQP
	tIoH9Ze95EyuoVB5xaDJTf/9jab+B
X-Received: by 2002:a17:902:cf0b:b0:2e9:4175:3077 with SMTP id d9443c01a7336-2eb364962bamr175279525ad.15.1793804336225;
        Wed, 04 Nov 2026 06:58:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd596asm9269185ad.1.2026.11.04.06.58.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 06:58:54 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rtc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] rtc: raspberrypi: do not mark the file comment as kernel-doc
Date: Wed,  4 Nov 2026 20:28:30 +0530
Message-ID: <20261104145844.32361-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_065857_641191_3FF83EAC 
X-CRM114-Status: GOOD (  12.80  )
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

The file header opens with /** but is not kernel-doc, so kernel-doc tries
to attach it to the RTC_TIME define below and warns about it. Instead use a plain comment.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/rtc/rtc-raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-raspberrypi.c b/drivers/rtc/rtc-raspberrypi.c
index 0547a96c6..657734b96 100644
--- a/drivers/rtc/rtc-raspberrypi.c
+++ b/drivers/rtc/rtc-raspberrypi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
-/**
+/*
  * rtc-raspberrypi.c
  *
  * RTC driver using firmware mailbox
-- 
2.46.0


