Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80080CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V00Z5DL/A9FXYMAgUkHfhcLZBXRy5zkCojqrzEtI5Kc=; b=pHxANNKjiq0IBQQi/eNvnByFqI
	JLS4b+g1lLX3wrbfpsjXug0CW/4Gcv1LLYSBj6U/Gy95w+Gd3zJlFWZ6yS+0EEATjyA//47FfyWjp
	Cima64/isyAvllIrmqhTuOHaElidsOIKBXxXIgKq22uj4UD5uTXtXBvgrlUDl0lL9fzg9ldWtjCZu
	MGIVMorCtgj98nEuNeoTde6hlYHqYxpmAtuJRUhHXrnXfY4gIAz/NSPLOvoUR/rx4J228iKAmRpUG
	QxDu7ApbtM8XQkpHaq5h14fHXH7fbY9UIz50r7FxJEreTqzRMNagoEL37rAAdU0lNk9jMlQ/vSgv2
	74z1hvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJs3-0000000B5nE-3Z46;
	Mon, 12 Oct 2026 17:31:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJrv-0000000B5hl-0zs8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B7594424A;
	Mon, 12 Oct 2026 17:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2AE0C2BD00;
	Mon, 12 Oct 2026 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791826278;
	bh=GCubckKkvtS/EOiOIxWc0YpDQoyEYzgiiDMrguNF01I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n+yV1LXpWIReonDDWt5VY/94r5W7mn9LSUdbaSU74X22ZvNylW1VNDIY5XbkjhTTS
	 SQ6oC1TSkfSL7dgiIHB3BXMF/AuCBuRWUyTQPgP0xFI1jDxOHagtZuMpvnTzj1bUO/
	 j1wUTFoDMUDAWfjAvYp8qi82UuR1LXLPxZTCKcQCRf8DDAh5xpgMCB8R91cfPBaR5V
	 rJklVrmmig9DAlWGBLCftjBb23G4uG8mMDe6xk7GwNM9FqRrV5tVOcGMuRH+SVyUtJ
	 wl5iDzLKskBCtp9ZgoaJTKs5oyRnIGGmdXgRbXyu7y2NWkIpN/LqOz04cyRomU+RAP
	 bhazAde6dETDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF91DCA9EDE;
	Mon, 12 Oct 2026 17:31:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 12 Oct 2026 20:31:24 +0300
Subject: [PATCH v4 10/10] MAINTAINERS: Add entry for Cortina Systems CS75xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-cs75xx-v4-10-df250d903682@gmail.com>
References: <20261012-b4-cs75xx-v4-0-df250d903682@gmail.com>
In-Reply-To: <20261012-b4-cs75xx-v4-0-df250d903682@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791826275; l=1124;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=NwAetqwg8dZTsEYKE0lK90ntL9PQOHqCts3OMdvEgqE=;
 b=gD/lajkp6aakN54TRwqEiJb1/VfUGhcjzDONHf3KkYw1H7rqzEjVyCXTFyvD0YVtlP3SPUqpr
 ctM++Kj0Y30Ak24GeWT1G47vXmUeZo4MmcTG1o+Pt63xXmHNGADsIoQ
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

Add an entry covering the Cortina Systems CS75xx platform code, device
trees, bindings and UART driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d137a339..176046436 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2914,6 +2914,17 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS75XX ARM ARCHITECTURE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cortina.yaml
+F:	Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
+F:	arch/arm/boot/dts/cortina/
+F:	arch/arm/include/debug/cs75xx.S
+F:	arch/arm/mach-goldengate/
+F:	drivers/tty/serial/cortina-uart.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



