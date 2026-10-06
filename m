Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D481BCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 18:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZEtqJwsndU1rYP89s5Rpmd3vVzwce8s+vuHzK3kMOc=; b=kt5MooxlT9FVsN/WD5uG1qxFOZ
	Jjr3gGFMuvCTLWBJsKwap2cDV0pFZLpGXZTw0Dq3dtFOnfBD83yonCBX36KUjXSWXtz5Ly+4DFTVe
	vswl/ahuaAsFxtWnTOc146u28p7v7mzMJinuLwnzdLzyjUsSux9/oIRQI4gkQ83bKARBqFNQUNs4N
	R7/YHe0h1R0Dl0yECKNo0EFpDvY073M4kt+dmpFeJpuu5nfrShXHBev9Im9B/mMOrnEqdgYmKuYgM
	9phRKrut3ShzMuVnjqbKsZCAs2ScMQzC4Iooq19FFZfIKvxG17Z9CpzRfNh/4Y+hb5sG9PNj3uWS9
	IVr/1FrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9jY-00000001FPz-031A;
	Tue, 06 Oct 2026 18:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9jS-00000001FNP-43j4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 18:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 516F0447B7;
	Tue,  6 Oct 2026 18:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 134CFC4DDE3;
	Tue,  6 Oct 2026 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791310662;
	bh=xNzlYm8hBtZ0j1oUxttURUDwmWfHwPAM0RqNrSVT3Nc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JOHNI1JswonYkBZR8qv8zgMSvNTPs6qnAXF0Wb4tCGcUwhTwHkB7WJxb3Cg0N0Ua2
	 wd5wfUcp90cet7SNmybTUK+rVVUnRfL9nIps7Xmp9QNXSMq18R+DLNraNqs/bpnkVU
	 tILAwxr62qMedJRM6+4277V7z0sYGS8JD7GRV08Wh+8R/ijumVicoMXRRlSO4qFD5q
	 GDjafofhlbtAKVsECO+Qa8AWhH9jLlKipWiuu2ihb++110vmKpVf5LDNmu6NuG89JN
	 6Rw81X/bw2Zb+ahQ66i2loa+ihbGQMc9MXJwFmAqSd2fQyMDjpkwjn2riCwy/bqb4a
	 Xb87IA9UwkXWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86EACA5FFC;
	Tue,  6 Oct 2026 18:17:41 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 21:17:41 +0300
Subject: [PATCH RFC v2 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-cs75xx-v2-3-b7d6e1e24d44@gmail.com>
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791310659; l=1284;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=5AOAXUzosKDZHEZDxcfOQyKy1cJHFyhzY9zM3eY+qh4=;
 b=gVrT17FgKfjAEvCGctHj4jEqCwLS5ymZqdKA3kSE/W5iI8BbwUPsm6ywHxkDHlKNnKO0xOhAn
 utYo3yGaVocDeYNFWkg1Ho5UtMtqSaGVo2gG7W/eLbyHroDIsRkxHPE
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

On the CS7542 the bootloader parks the secondary Cortex-A9 core in a loop
that waits for an event and then jumps to the address found in a global
software register. Add the "cortina,cs7542-smp" enable method for it and,
as with the other release-address based methods, require cpu-release-addr
to point at that register.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70dac..7a394c500d6 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -269,6 +269,7 @@ properties:
           - brcm,bcm63138
           - brcm,bcm-nsp-smp
           - brcm,brahma-b15
+          - cortina,cs7542-smp
           - marvell,armada-375-smp
           - marvell,armada-380-smp
           - marvell,armada-390-smp
@@ -484,6 +485,7 @@ allOf:
         enable-method:
           enum:
             - spin-table
+            - cortina,cs7542-smp
             - renesas,r9a06g032-smp
       required:
         - enable-method

-- 
2.53.0



