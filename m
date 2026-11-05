Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E8606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5cxWF2B;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ8uEU5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BTajmg9RWCNBoWlsLMKQTyqcM4v7/TvF39OQuP/nqgw=; b=Z5cxWF2B6U1BGqetN9PROfiRyQ
	b9SWpkHeRzzs/ezQhrC3QZH33P9P3LSCv6nqdETujl+Oha3eOLabJSYT3/R+MqLBZpEz/hwwhQJYf
	bbc/GXmBlqS1k/G+JIRdgYvw5X5wr4O5gXUZFgqa5JSH08GpUTaB+5czGGn8FrOPFFHYr90qoi/0Y
	UD6iyystqW5Hr50wK7eQ1qvtQuuGsuv+eyR7H1MlDHsgOKOZ5nFyDUX0AkNHt+pii/ksr94YbOYeD
	yTPHD4DaZ8a0FFXANcK5fxG95r+MvepRmHP7NE17T8AQ7WrUlBx42pBgMv7gqugkGHly3nKlNBs1h
	UBXpdtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySg-00000009Gjv-0RSt;
	Thu, 05 Nov 2026 14:29:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySe-00000009Gil-1wPr;
	Thu, 05 Nov 2026 14:29:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BB21409AA;
	Thu,  5 Nov 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793888943;
	b=bpu8HpTHgNAx2NNYssYswhLeCmQ38Kiv+F4rzB2hXOPzUMXqVpgdYgPdLhsSRdhRwwW2
	 zVC1yV3fwKcVeWoHHb0labmw6k8sNwf/PfN3s/htHR5+6iWr1KMsHwneYsWXVjUEM2kLn
	 KK2INisT5vjNkZ3Dl6RI8aj1KozvWptjBdrofgaLxMaNI5mgHvnFM3LiCr+n4mW8QckNe
	 I4mp0A/bDt6Wf39kdEvM5CnDQJGz4af5oFeW7IVb771MC1nmtfCMYww5PuDf05eBucV/s
	 TwIBoQfyVufC6bY49MRjkSxp9Fng4VZLOsWx/8aXaG/ovUUH9vBPIQo8IPXxTZnNxCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793888943;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BTajmg9RWCNBoWlsLMKQTyqcM4v7/TvF39OQuP/nqgw=;
	b=1OhUFJOs9ldr9jITYXCWvDXunTPao+pNiWSFlKRqDqP+UyqePEWWAC8gq+4X20q1xQl4
	 mS2Ax33AQXyAxO1xc2fvAgL7tRnZX+jT/pVq1feD/1SONxlYRv4QhMvLNf/g4s7YAluxk
	 Kqu+Q1U0BsjmYbIQZPd5Ux9Oh9yus9QC12GQcLbXrSJO4wl4Ad3L2dm52D0xWuB+K8uyj
	 zRrprwwtcHLFmIXriCVhKNiMSEMWNl7oDuegpJt/z5nVHadjR0HGnSaxZgRetjpk028z2
	 9FLQlSPWW0Vb9IuqPTzJ58+JtvVkgUFU0KKBb8CcnMCEcOCc6foYb+H3zs7vbh/ppOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3D981F00A1B;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888943;
	bh=BTajmg9RWCNBoWlsLMKQTyqcM4v7/TvF39OQuP/nqgw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fJ8uEU5DzHO1OqZpPUWKGNL+MFW7wm+pBDi4xwzDxgD4Fx/rLsKTktz+k91UYOF4Z
	 b7mWLDumvlCkTzi2iyg3QHLBsoQv8GINBgHWulMn6Cmkr9NcBPQllUkp0dvhPWtc9h
	 6OOx21slD5/iDucnvXYXPZKbfV2DvUxljyHq++TUoAs22bs8MGURW2IPgKpLM6SB9r
	 k0/+860bdgXWTgbB8kC+826/kAEjCyBcLL1dN6Ox2drQjlilgtGz59siu0pPebZncQ
	 7dpE6IB53etAgV/yC22tZe9AxrdG2+D202cJ1v1bXK+Qe/cnbWhla5cRz4xsReT0bu
	 8wIsvuNYXpo9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 526DC472C3;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Thu, 05 Nov 2026 14:28:49 +0000
Subject: [PATCH v2 4/6] dt-bindings: serial: mediatek,uart: Add MT8163
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-4-e68d7d428f99@protonmail.ch>
References: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
In-Reply-To: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793888941; l=987;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=NhECQjtErCffD7Hrf6rEzEREzak9GzWgJW4fU0Mkz9c=;
 b=Sagi85f7uqdQx0Lk0jaevhCGFN6sjUpjC6RXRjngoy5jOckdLEJRPF7vSMWs8fxmdinu/7upi
 rcmByZmoZx3CLsBhfgZQbnienY9E6Gz1Al2eDJmZcD54tkytNttO8LU
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ben Grisdale <bengris32@protonmail.ch>

Add a compatible string for the UART controllers on the MediaTek MT8163
SoC, which are compatible with the MT6577 UART.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..11801b58f637 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -43,6 +43,7 @@ properties:
               - mediatek,mt7988-uart
               - mediatek,mt8127-uart
               - mediatek,mt8135-uart
+              - mediatek,mt8163-uart
               - mediatek,mt8173-uart
               - mediatek,mt8183-uart
               - mediatek,mt8186-uart

-- 
2.56.0



