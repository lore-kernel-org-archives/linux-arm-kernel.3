Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9907606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RuhdhzSu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MUQoX12s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=; b=RuhdhzSu6C1P5mifKAfRl5rwKg
	OjClOVzduK3ZF/zaWgee3Tm0WWYfDpaWuN4teM1F0o8jD91T1nvfTreCFRw/I+2D68RXpnE7aXXiC
	2IJWFH7yux8oWdIND1z/7dwYiuNMBLOT/qiCEbFp06hIwxkbreQEc3o5RjEEEOFMXFwetO1qEAa44
	ttDUyKMd9uxaj+omfYK//2XoA2GxnZ3NI/GOTUogKvdSCmLIS9EMJU66Mi9WotAmyerJW04iSAnkA
	xd7jSqno5zDjMsNaGXnrM18hvqtkuZkgeiN2qLQB/YwP7edsj/CKHMtJbDRN2DJa8Ji/ZzwaCL4jl
	z2pNMHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJv0-00000002VzV-2jvX;
	Mon, 26 Oct 2026 12:35:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJuy-00000002Vyg-0v2n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:35:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9722245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018110; x=1793622910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=MUQoX12sBmQEWtGeQqvCXqcNd7TPvSL2X0mIxxqSRmVKqlBEt6EgafNtDc36pn9EtJ
         GbJ/YPUoTpLYUEEYfir8unsEiW1MU6xAEcmN+oxh4hfcK93qGagurPf9xPlJBSgXBtdr
         KFTeomCnmktXIIBwsQ2QgY/uegm+vGQiuwOzdHqAKH7caeKeXE1frOlOJ6HlVC/+wfFh
         rra6PzIwj+OCKqL6AniWAIQcA4gQkT7UAB5WJ5OKUSaQRR1XmzDsBXw6WfKhYTaA6Gie
         L/+MeYOZfKeeD04LL5ct6SD6mv1+4kmS4+/NfBtLtJZg6TFcEkCmHk/cmYmlUtODE5CZ
         cfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018110; x=1793622910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=D3IN63JTjbnd2KeOqFlgvD62mz8gwwl3IpcNE6OwMg1dk/MjdxITOl4yxpnbq41Pkb
         u8QYHJE5fhDezdNyzAPES8B5bDizjprxADJ12jIizt3e43PSv89m0hiRB+j2YAAlZCrc
         fHD2bPI5wUtQ9rpPOOQCZd3BRFeu2zkLIPvVpMqpNWudeec+0C3i2jz/nLB6BWlhmSi8
         TMTmRgb5M4qfZ/kZYO9d1w6NCiUl+VbQDsf2/oC+ZZFyno03/bZxFVJeHQhFNs5uPBv+
         aTOFq+IoAXQ3l9Tdy7TkqWBloPlurkS7KMVNERqJB9WMcTHBDhszwGCCYOp7wHxAIvPq
         GQ9A==
X-Forwarded-Encrypted: i=1; AKwUvBylovlM04K7gFc6UmabujZUUAXsHKYA9B0HvWyQUpT6mY8Cy2mKIq7YYB9tg8Qx3LKEbpIdwMbMEVW56aPgwqcr@lists.infradead.org
X-Gm-Message-State: AFq9FYI40SfFjnE/J45aVOO5ahDGx/+qcQ7VP9ZsU6oQzodFuLo8xE4F
	OGJmKtEHQpz93+V66g0cWqHPfSJVvX0pGEZ7/s2lWsnNwNtBL8mXC2aunalM3Sdj
X-Gm-Gg: AYBFou0olTUN5CfGONd+fjFVjgjregB7lz9CAtYFLjufq2c7FVnAIPCDnP1+N3+Hu4G
	lC0iNMvDorAYirEt5m6zUNeVk8NqQYGFSAJQLLVxBeOoq6oxFQGDd/rALdE2BxpM/Tcqytwq4Fc
	J1s/YXbIUxz6oyT+hN+bgTKuDk6SpFALdQ3GDMpXwMIUjv599Q45D6nCJIpqXouiqrzlFQ+gZUh
	TCbg8qO+EtLCppx+b6Kiplquihishe8oVJ4PhO+cthJu30JFVH7BSSw41/chpCvwRire3CwUulY
	D0dbCYV+bsNVgVgGAvrKr9NmydosvU6ZvwBctZ8samd6y9GwqLSb1ad5B//7UqoaEaU39SaJlcF
	kaiPR6IuIPdIXhamyzrMRpxF1WycaaM7Kvw+xd9M2JUqCXTQ9skDKn8cFKmfv6NWREIHiQWfQwN
	eSkjBkp5b4fmYpsXFbya2EUL0BzwwCYWMBnVCgedtoa3JR87XCW0NwLFUlhL/y+0jl8//utbk5L
	TBvLXCDGu0puIiZnhiqK2la7Pya0TEs1xJR102LkL3+iKwqLrJ8/TOAi9NsCe0H0dB1oTfJ0R2B
	4rfOQrzeTxCLsNRoJ6cx4PfG2uHulpohRfp1Bi1UKO3CapWBztPsXuVtG5BTVSY+tG99LbEU2Lw
	=
X-Received: by 2002:a05:600c:83c7:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a35ac39cedmr117361485e9.3.1793018109889;
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm19175944f8f.45.2026.10.26.05.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix TPM reset polarity
Date: Mon, 26 Oct 2026 13:35:05 +0100
Message-ID: <20261026123505.48909-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_053512_275882_15FA4E0E 
X-CRM114-Status: GOOD (  13.22  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The reset input of the ST33KTPM on the Sonata carrier is active low,
but its reset-gpios property is declared GPIO_ACTIVE_HIGH. This
reverses the asserted and deasserted levels of the reset signal.

Use GPIO_ACTIVE_LOW to describe the reset polarity correctly. This
fixes the TPM not responding on I2C and the resulting absence of
/dev/tpm0.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..2644b7c1239c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -259,7 +259,7 @@ st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
 		label = "tpm";
-		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.47.3


