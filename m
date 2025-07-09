Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FA5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcwWePkZ+61+GRHS7T5VOVYWhMHoHSzeV/UXG3AzxcI=; b=mTGdvuvFpIuC+XkY2LIxfQCnmq
	3YRJbVEOZZSvpuDxLif74+XOjSFGyoBeqV11/wN1+7SZ3AGHhiDFYOkKNFV9+dVVPGJmLOGNihQEC
	Nb96RAnci5d/chO1JqgU9emus1Hnqt7IvMxg1hkdqh28KFdQWVyNOd2k4x1ordvHBDBDMPAfTD+uU
	RrnU26fveqPsDBhQZeahblhY1r3zm4/GBWwTFyrv07n7I/JIzD+lQ6X4j/xy6C/EjFti+DPYGbvxc
	65Dp1CZamRo9uWyzD7ryzzyZFemlD+D8F3BUzN3u2Y+1EALUPVByECEX50hNLl4EzbIeTe0sr2syH
	2qmcTNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIfI-00000006ziq-0I2F;
	Wed, 09 Jul 2025 00:28:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIa9-00000006yb5-1jGW;
	Wed, 09 Jul 2025 00:22:42 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7490acf57b9so3408789b3a.2;
        Tue, 08 Jul 2025 17:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752020561; x=1752625361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DcwWePkZ+61+GRHS7T5VOVYWhMHoHSzeV/UXG3AzxcI=;
        b=fmuPwkFzMVipp8Wh/HD5m+OWkPwZMeInNrGk2sDRTpWG7ylKwoweyIiQtPoPD7eQ/p
         FSgfdlzn/02qjcmWatRU+l1CvPHJ7GtgIYhvMEIlGN8EZSJIXx+W8Sn0UtniwH1pNZen
         iv7V3xrWuX53AN6OoBcqbObP3NKLnb4GIaMFmoy6zN1GL0YHV9cNKilpC1pqXyGtD0yL
         s7GIqNiTMcWL2kl3VUtQZKBcHBD4sUMYw9HxKrB+8U5ZcLO3Zn4P2k2LIqYpu+aRBaT7
         GxzdoP1IdulEjmDLytSg75QClN31wPqFSgQo7CgTtACvK96VGOe9YwpxudyejEOPjkPk
         o+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752020561; x=1752625361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcwWePkZ+61+GRHS7T5VOVYWhMHoHSzeV/UXG3AzxcI=;
        b=MqH0iyVn1NBJO3SmbbynHwoOfnScKoL/EqkO/IYpHCIJkR+lXDlFsCPK3HhGCxayxr
         tqCJVanGs5RYI+sPo/qNTNvPsZT3WqK5KZ4aYj3OKD8m6RPZEM+EHuvTNTLjMNG4v+Ap
         TQ9+bpAFdvVXZ61cFVclPDDNjWb3puSQAVcsaHWWMVik1IWeWRedBW0AJk3rvlQk6zQP
         GBirFrR+ZNtoViZqi666lRAO4Yv88350bFhomIMYOv/fq/kDRjlh55AGpxJUWAITeV01
         hM3T7Epy4LToP9PtGlxU1RWbJ5nbHCgc/D4BWIeH2BoY/WTe2yYb6E4bGNzeJuwOU4QC
         3ZMA==
X-Forwarded-Encrypted: i=1; AJvYcCUGT3m7OIi1Aq57nPJX9TnY8wcvpdhCx6kUOgum6TGUz7FVgE82EqSBwtr6xXrKlREHOZ5cxfR02uY58ZdU5lEb@lists.infradead.org, AJvYcCXLXWWxjgDkJKTLS9qrwgXV0/oC/0WTRVM/dTcuygqn5QzO+nvSQPivDfdiCprCX0egdKwhMVBqJ29rR/KkYoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJFCmZh0bXZ2wzFBxVh1jf9+00vQw8+c4xIcRa2ns6WBah9lHz
	EpqhTr0HCoBv2vGrmubG0dpegFIt8WBESqZn4WCJqgTlIOdcoKbLQ1gw
X-Gm-Gg: ASbGncsQJTv1UizWF7zK+pBnJOhCq/yNef84AUsh3u5TxnqkAiSyYiH/4y8fhFxUqpA
	vBDkEOTis8DZaC/sNw2bex+I3rNstL4KIo8Iac92aB0AyDtGhsKaO1ZaRnbDz/kE0C0T9AWu7Q1
	BJqcj+GhGWDjZgJDS2Sl2W7NCuFdyM4GcB0W5Y2PVyLbnZP5e5JZAboBd2sYV9o1+ILUuxjGxB5
	4klkfLmbbx60iWc1yMJa/0WgUpKDFbOsCCKpA9xt5uuzzXZgnz53mMPSdmrXzTEZYKQ4eMJoHf8
	pSJk/kGf+XIdeSsrydTp4EDWhURy7w3zDPBSZUYXXt0=
X-Google-Smtp-Source: AGHT+IEoBA4HHBIBWKsPCT2mLl7+qyWKOlyAaO+l5jgMStBRBhSbtVujXmRrrApyjtT9L32hT9oqWQ==
X-Received: by 2002:a05:6a20:734d:b0:220:33e9:15da with SMTP id adf61e73a8af0-22cd68be5f5mr777221637.2.1752020560598;
        Tue, 08 Jul 2025 17:22:40 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3924868c3dsm4910400a12.23.2025.07.08.17.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 17:22:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless-next] wifi: ath9k: ahb: add OF dependency
Date: Tue,  8 Jul 2025 17:22:38 -0700
Message-ID: <20250709002238.5988-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_172241_468720_B790F256 
X-CRM114-Status: GOOD (  12.23  )
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

The conversion to OF missed adding a Kconfig dependency.

Fixes: 2fa490c0d7 ("wifi: ath9k: ahb: replace id_table with of")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Since this is for something that hasn't hit master yet, I assume
 wireless-next is the proper place for it.
 drivers/net/wireless/ath/ath9k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/Kconfig b/drivers/net/wireless/ath/ath9k/Kconfig
index 0c47be06c153..47d570a5ca6a 100644
--- a/drivers/net/wireless/ath/ath9k/Kconfig
+++ b/drivers/net/wireless/ath/ath9k/Kconfig
@@ -47,7 +47,7 @@ config ATH9K_PCI
 
 config ATH9K_AHB
 	bool "Atheros ath9k AHB bus support"
-	depends on ATH9K
+	depends on ATH9K && OF
 	default n
 	help
 	  This option enables the AHB bus support in ath9k.
-- 
2.50.0


