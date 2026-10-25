Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivUFNJsh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWu430Fz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=; b=ivUFNJsh5eKKNt
	bK6LnNYmL3lXZzHinQDcpbl6Cd3qck8BOiP6nh9P3DZnRC6iaMK1vs8REmbLRDeGNafmgniF61qtG
	TIdDHwV2Q0pRvoCuMZqaUU7Xi+od6yqDzvRzUwEMa0K7Uev85MgXhy7rE8nzi1cjkRBNn0iSv1vig
	zGs4OQHzd33WyGCxj04KHxG+wm5dJFEsBIm5C/ks1N/iwBoO5wtvo/ExfRsh/ysU/IJje832eFLjx
	FXirCTd2JbspnMnYIar6JAMMtGrz5o2NI1Pe/w0sKKEfvedYtiOF8nipbYxwVb/E3eiMapAIsewfL
	ssFqZPHlWs9r1KHk/cRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz9H-0000000172g-2zqK;
	Sun, 25 Oct 2026 14:24:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz9C-0000000171H-00xn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 14:24:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17125145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938268; x=1793543068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=rWu430FzLo616Krf9xBrGPDIoDXrP4H/LIgjnwUnyfAn2TOVPTEMPcI6k2MS/zcCut
         X/UzzhApQkXGwppZLty8E3fVOeEpqK3NAqgYucnepku4dV093rL4mKRGd7CKe5txxrpB
         lPqz08YvscYc2h1ZE0DsZPlKdaeCs6SDLCOrT+LtwVz/3ncIqXbIiQaTW11TlbfiIcXS
         tfnvg27loRHzeD+5M9CzrfbL2JxuXEGNY+wTAgH6cz6R6wjPsyO4NLIuMU2WFH2qylce
         ye0Hh9oRuOESB+6CSNGPL84bt+Dh0FxRTSDLo2qRKT759YGrejJYlS+AKsoA6odMmmNp
         IZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938268; x=1793543068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=nVL8srVAmRSrTNbgeK/FXWXdJizvgp2GlrlX/wA6Nb9DQwxjle+EBgslJrCSR36ZJa
         bdDhPY8BTfQLIiekLWfNgYZBLcC4yMZmO7EVq/5LCr7XQFHChRxBxscTR6bVKPSZue5v
         FUSr1zV8kTJexwYQhVvPUOEmyQ12v4GKNGxnnnReo/NmYgpTw//HjXVUGYlwiVVtES1v
         N+whFFofq5zRqRup2G8GfvApIKCWZaSMTVuytTraJbIAJSaiiK0LlBKmOT5VGwuUwT4F
         kvwS3fSVU99SuRVW3/wgLThaOEu0A8TblghS9FXzOVHaTNzXU77uxZswSnS58ys+bKkW
         BuVA==
X-Forwarded-Encrypted: i=1; AKwUvBx1bDsFxC/ROk1SlbWJHxz9kQSmivr5VsfttijsMAFBQDfGDXp///2JLLCKJyllmnQ9/E2nN7Z2C1OaD4qcAmDT@lists.infradead.org
X-Gm-Message-State: AFq9FYLtEMDfiZNEX9X5X/jmCcZj9zK35VP6uihcWkWxlJv6g52+rC1E
	f1fet5a1hgDFBX9+lHBKezuqnqAEEPZyO8+i8eB3t7Vv2I0XkK3Fq2JD81l+SYCytcW6PQ==
X-Gm-Gg: AYBFou0zAJNfiuhAykpracrigVa3L/ZWkMjF07xuUo6Sxz9Mk0kDlcbOHdTi4JKBJj8
	i+xEvQle6DjFgRcIKeW6URX+zB2yihEklEW0egIJCkHrHUHNDgJaL31LMBs4eujB6go3m4YgroH
	7tjbY2awpewUllZrdKiJlmuwXbHkvPm5Jy2Wx6i/o1j1cNceProeScF3BF8ZnH5oeXxCFqtnSme
	XmHjQEQ7mZR7O6x0Bw5Iaha4V9F5cQGwOcgbGisEeV0RP0t3KBszv3trPeqla/O5IQvH2CY0FQr
	4po/5ceOUtINOoBrCz+Dqe5TUF9hLXgCO0U9YdZ+GnD7uwKjsqwxREGdta9VsmOC71ZVb29/td9
	DSKOYJrHaUlbYsk3WBDaQCCQbvn6A4aLiBlQ88O9mTaNyO+2lijb5/WdJhSqIN7F02mw3BmqAgZ
	bW1HeuxmT1YqOTgiBcSkCVtjdYrFRcN+nlbs4GC/vyTXIAcMl8oo0EB2NxQEf3A5bvq7e9UhM2Z
	I3ReCEQ1rzPXoaOyIgESFnDdLm4+tBNWf1QrJ6qkkvOsR/FtlNLMh0X+iAsUtWavkxAL6WbgRHs
	SipXc4+WSpnXFQ==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr66206695e9.25.1792938268065;
        Sun, 25 Oct 2026 07:24:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 14:24:11 +0000
Message-ID: <20261025142412.112216-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_072430_052276_23B9984F 
X-CRM114-Status: GOOD (  11.32  )
X-Spam-Score: -2.1 (--)
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0


