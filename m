Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F54C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+l02QjJZPgdNDkG0wt7GBmzVqxHnEVWXGF3do2KaOC4=; b=LudQRaLnKRkZF4HVZej0+VvB5L
	lJ1uYn3d1nIFFIMvqnvP63MsmonwGi4kjFSre1xp+Nlerx++9YO8GsXCWkNE/i69FkqLe5km4uHOt
	RTz+fxKa0V1Gwmks4RrMurqCeiPAnK7tWtBXQXpTBZflkSwa76+3hIXBve1SfpjyYVLlcC7OoeCHp
	j4vDCDJ88mAqnOXDNapCz9OKmgJ+nvlfQFFLWNLCXEFZ/DvSEHs0wPinY1oYPjILDFKeM48FLD9hZ
	cCZ3LQCmT6LUhkjZagffKLp4FjTzNCyENTYPlv18izsDVd0+FGI3hsjuP9wvdrhqJPBfcCWp916YJ
	UnyiUaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzr80-00000005Hee-0Gqv;
	Fri, 28 Aug 2026 07:35:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzr7x-00000005HeP-2CLI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 07:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E78C143502;
	Fri, 28 Aug 2026 07:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBA88C2BCC7;
	Fri, 28 Aug 2026 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787902552;
	bh=ZOBCA19VLQ1IKCeBijN70gbTvNCwCmZyIOxmk5n/RS0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=P6fcJnYBFAFPNb+rLD734AKtJZcm1UY1AB47GGgxYNn4IbpsJSChO+h5+D5yJlZse
	 RIAWAI0xYunON7sNE00ky5MVvuK7wJyfEXeJ3CbLzjCBZPUD2Mu5AR1bsFLW6ufFRV
	 x0jdeRZhGN+f5/AGL3NDJxAvma3nYOG27SN9zo3gpV3u0b3yk8CQUw1s341F9rg1TP
	 cYkWPTlHp9qGMcritB4wmWw4wupiVMVckfHJKgeSGekD4TOnrRWmXBDzHaLUlYMl2E
	 mV+rkDDq1qMiKYU2bhuB8hCatrtWC8wApefGpj3/C0YQkP+P4M3c2+lMG4PstWkZTE
	 lrZU0yfETzXEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99041C61DCD;
	Fri, 28 Aug 2026 07:35:52 +0000 (UTC)
From: Dirk Chen via B4 Relay <devnull+dirkchen.amd.com@kernel.org>
Date: Fri, 28 Aug 2026 15:35:38 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: Add MCTP I2C controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-anacapa-dts-amc-v1-1-463eb4e6a6a2@amd.com>
X-B4-Tracking: v=1; b=H4sIAEk6kWoC/x3MPQqAMAxA4atIZgO2hfpzFXEINWoGa2lEBPHuF
 sdveO8B5SysMFQPZL5E5YgFpq4gbBRXRpmLwTbWN53tkCIFSoTzqUh7QN8aG9reO14clCplXuT
 +j+P0vh9XFmTzYQAAAA==
X-Change-ID: 20260828-anacapa-dts-amc-6712c7963ef3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dirk Chen <dirkchen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787902540; l=1212;
 i=dirkchen@amd.com; s=20260202; h=from:subject:message-id;
 bh=rEGeEm+ATZyoe3HxKSYL2gspIoEHBpWwgs2ytKBM6Z4=;
 b=Z63sFH/O7K+hj/ourvWsfKtVprO2gAFZc2jSHH6Tbxnbat8MpVQlRfpYi3XVYZFUWaSrvasBs
 +1b7UiNVonCDvhTqDRb4Ig/k6pcCe5oU0prhRBDgXib5zdgVH7BKUkW
X-Developer-Key: i=dirkchen@amd.com; a=ed25519;
 pk=NBIyLsVg/YYtGLruq9XLdLWx2PP/1MH4jDDQ1V+7wes=
X-Endpoint-Received: by B4 Relay for dirkchen@amd.com/20260202 with
 auth_id=622
X-Original-From: Dirk Chen <dirkchen@amd.com>
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
Reply-To: dirkchen@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dirk Chen <dirkchen@amd.com>

The Facebook Anacapa BMC uses I2C5 as an MCTP (Management Component
Transport Protocol) bus. This patch enables the controller by
adding the mctp-i2c-controller node under I2C5, with multi-master
support.

Signed-off-by: Dirk Chen <dirkchen@amd.com>
---
The Facebook Anacapa platform uses I2C5 as an MCTP (Management
Component Transport Protocol) bus for communication with the AMC.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 1fddf3a5d138..6073a643ea80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -433,6 +433,14 @@ i2c4mux0ch7: i2c@7 {
 // AMC
 &i2c5 {
 	status = "okay";
+
+	mctp-controller;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 };
 
 // MB

---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260828-anacapa-dts-amc-6712c7963ef3

Best regards,
-- 
Dirk Chen <dirkchen@amd.com>



