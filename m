Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9346FE6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g5zscsCZ9HNh2uooTO1VH1ohwqoUi9dUWlAaeKGxYY=; b=cO8WWGC4madwkNHTXVuH7Wq/0z
	OFwQkdjW8/dwKeUdWJx6rzVOo0NuuglqkbeUfwB6bj1RPbjPq/rFL7dMsCaPboBgX3VV/psx5N9oG
	jQE/ojSfrH/l1u8dAXOV1tlpU43tEzxQeKx+vSnk485x6eQaBvb30UWg4CCuc5t78S7VZJYCf1Qzh
	s4/kGj7iWtokk/PS1UZlIOVT8wvRS5SjLjw4xawSJ89+SnkCxQphrEByJHQ0klDn1LCxd8jfw1FS0
	rrKGAVqes+B9PHS55W7582gdij9kDiGDDWjh9ebHgeSlDA8e+6nezip9G3tlFMguR7J6cC9/URa+k
	EEi9c3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xLe-000000088Bl-1jw5;
	Fri, 01 Nov 2024 19:30:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xIH-000000087HL-2qn7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66C05A44C36;
	Fri,  1 Nov 2024 19:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7653EC4CEDB;
	Fri,  1 Nov 2024 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489208;
	bh=7vrEPIQ4bAMycnZ9O2SmDP1fd541LGxGZlIiiqJbkww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e04tQXd/ycmZljhfHc2wntW3SLdlsxeQBFTE0G/d2z7Re6JkL4xyqhWL4Oyycgwdf
	 hyy6pgx689pkbxzMZe56fX4lDWhq+u91rBykKJunzVcLYujSJIXOKRtz55aRxHRTG6
	 5TDDs1tsekZ4IhppZ2IfNMbThcih0aEtMVYmz2mjyq+mkB3tlCIPtqNtLwWo6Dn8FZ
	 Cd6zJ4rOThwH1b6ZY6w8UYNmHbP8z7nETafz6P0naAhiZLt1ChI+j0DX/bAnrFLbPZ
	 ZRggW2mNXln3H+9Ai4jdIjkqfJuCMp8qPKId3drOkpgGRV6fpoZFTpRogPkmh6DN+z
	 PeMY3MXJ8qKtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CA7E6F088;
	Fri,  1 Nov 2024 19:26:48 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Fri, 01 Nov 2024 20:26:14 +0100
Subject: [PATCH v3 3/3] MAINTAINERS: Add apple-spi driver & binding files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-asahi-spi-v3-3-3b411c5fb8e5@jannau.net>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
In-Reply-To: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=wbyAeXiak8ymhiqSGZePVuZ0IdBpI3guim8H/E8/EiU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnRV7bLqS4lvlj9qcarJt95/wVg89c72c7eZ9JZUc9/Zd
 3qDxsLNHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACayqZ6R4YvkmvOrvJxvs5d2
 Wc3hWFKbrZ4W+U/Pu/G4acThI1dfpTD84ZNdL/7kwDzG6ttvY9RvpeT3/XJ4ZJy+U3Pf/d+P5oc
 GMQEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_122649_788850_A3E27366 
X-CRM114-Status: UNSURE (   9.59  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

This Apple SPI controller is present on Apple ARM SoCs (t8103/t6000).

Splitting this change from the binding/driver commits to avoid merge
conflicts with other things touching this section, as usual.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd10e2e00caa5a5881381cd40c0d9a..552febcb12a95766ff502960782941d9d016d5e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2068,6 +2068,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -2085,6 +2086,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/spi/spi-apple.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h

-- 
2.47.0



