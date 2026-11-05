Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2053F606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ukm+VyUt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k43Qo7Lr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e/ChMMTeQfEb3CPDQNx/z+/EfxozOTsC5cPmwjyqKac=; b=Ukm+VyUtHhIkz+L4GgTfvwKeQF
	LZa1q55BpL+EgclGXwg04IWEmdjqc/jdOXCpm8PF3ILiDFVT1hoy8wVP3eqReeftREjAf1YSYxccT
	JcVwCru5Kx06rbLhE7Z27R0PfuidVFjCgQxef8kcmoEGziav+FPE5KJzZLFMODYJRyXiHyjpAJAcq
	L2z42Jh7gGevShjc4uoIhgmOdO/ZwMP8EMysYWpns5YWjQfRLZaq2T6iCRPVIJeZqSPDWpXo0XTrb
	+ShHflQQ7zJlO7esUHr67wE7AL+kCncSQsSypv5TkyCk6CHE4/+OhDvd2GPtjJ3xsAEBOiLEFAliC
	wPNZcp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySq-00000009Gvf-30ch;
	Thu, 05 Nov 2026 14:29:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySf-00000009GjJ-22LW;
	Thu, 05 Nov 2026 14:29:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 255CE43E6F;
	Thu,  5 Nov 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793888945;
	b=VOXyyYF8mG/g9gFLPlnG1kGEBr4FVLK/bHWf19NY2OLnFWM2WHSgFmzHDThaymPjHAii
	 HrSL1JX6Hwkqtvz/PpL9NOSI1mhTY/2zZqJ6HTbl7BB1PL3KLo2B9F2SB20CAa+Sl5f+J
	 sAUDa32pS9UJZWGp2iNo2KhX48+5LbDA06KrRk1Yvk5XiXoI3JYEKxHYUuxdiOsU0b2z6
	 b5PjObMKFhkyAFjKWsDd8gOz/nmwUnnK+9N/wdGhQHnjhzZkjZ+LXP5w8+sEr6GCURz2T
	 DRDy649L5pImJ1aH5g+rlg+/e7DLKKIGKU2fBSFm8beu2i146QjPUFygCmLPoH3anFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793888945;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=e/ChMMTeQfEb3CPDQNx/z+/EfxozOTsC5cPmwjyqKac=;
	b=Inc0iasj0IZbbPgyIMJfiejGGMqocqDF7JR55PQXqJK/uL/2b2yYT0DLsVnAucKZo7Nv
	 7dqovLlETjDF7vbguX1mMymgyGiPBqWMyWNpwfPhAfsD3nPbxygClDzmHLG1VUBiLiiYA
	 /RM4xGfYsauSA35bx+JUOqhoUo871DgUT0xOn+iW2qobHwWZk4I0qVEto4coL//UK8/g/
	 kV1+XiUcFUTpEj5O/FHdwx11ObFA3wM6IdW81XjJl4V9B3jRkQzrwaFUjAp/Ni75PGGNO
	 jP9irGw0n9LvY55IJvyh65jXHyVARvgDKtF8bnctR6A+Ah7DHiDClgTblFnopRfRj+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B520F1F00A17;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888945;
	bh=e/ChMMTeQfEb3CPDQNx/z+/EfxozOTsC5cPmwjyqKac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k43Qo7LrWLFlQfZ76OkxWrcoa4gUc8RGLGqcUkFWi+zg0nw4Q3wUfKrYByWT2/Bi5
	 Si/3hIIWLljVdofkUP+VYbhj9zvm3SrdCcXKgCwVzrxeMPOIwsf4NqEmfAkc8pJhYE
	 7lzvOJHOLKBBrjwWoWNwn7l+sWos0H6Xnc2iQ7d1b7r8vryv8e+Nb+gj/R7bY9Z8/j
	 gWbE9TAu9aq3OGXAAFGIJYw6O0+NIHP4dV3LJcsPbYO7Z3coO10I7vHvdCPQAh4F1r
	 xpDsu/7FkogNlYMKOt+D2kLZHXR9xXtlvPQa8iyvcz6CSSQh/xaBImuxYJCsgDAT5+
	 jGLAWFMIq2fwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4372B472BF;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Thu, 05 Nov 2026 14:28:48 +0000
Subject: [PATCH v2 3/6] dt-bindings: timer: mediatek,timer: Add MT8163
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-3-e68d7d428f99@protonmail.ch>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793888941; l=1008;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=dyVoGhC2K4A9ebVKVo2WduqTmMX5amrsOD71wWVM2cs=;
 b=OTStIQccVtbXfsOKoJMQUEM6nzxD0nG6K5+Y5Ody2l1HoHMDW8gTHIuZ23PFPnh8pwfRID2rZ
 qXSU98wrc79AoYUMRQONjXK7f+gient4R1vufxCb/2Fq/ryEZmhG9VI
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

Add a compatible string for the general purpose timer (GPT) on the
MediaTek MT8163 SoC, which is compatible with the MT6577 timer.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..fcf4303e1426 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt7623-timer
               - mediatek,mt8127-timer
               - mediatek,mt8135-timer
+              - mediatek,mt8163-timer
               - mediatek,mt8173-timer
               - mediatek,mt8516-timer
           - const: mediatek,mt6577-timer

-- 
2.56.0



