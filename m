Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEF7C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xFB8S/RZuVevGLmJOC2VQ9evdObhwp1H0VQrlMHLxY=; b=RPhOdfUFmASa+LfTlHR+O4uPr5
	vSo32yFuBT43a/DiL5BCROW8aWhTtReEaboPbJhQ+vHJBQrNznqxWiRJJJIR2jRKuqZ6Tj2aAIR1h
	Bd55qKLlUasnwLiZ6jZnfpta8SdLPCzgzxbAOk3EbUj9rpJu+JTM67Wasp8N0EnT/QY9F8+MqdCr4
	lSwiWg0uY6bAll8RCAtZIVgWpcUOPNX+kSTonL7LSzF+cJnJ4ts/9ZY5yIq6cJIVoEs6/+0u9kbe/
	43SyOfeYlh6kE8pWiAQD5kVRLlQlvbU8QZO0DXCp0H8JWH4dMHRYUaC5/k9NmH8w0ZRozYt02dEXF
	IPUEyanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbHa-0000000F1Oz-1Mta;
	Fri, 07 Mar 2025 17:14:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbBc-0000000F0ZV-1r8L;
	Fri, 07 Mar 2025 17:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1184C5C5CCB;
	Fri,  7 Mar 2025 17:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF32C4CED1;
	Fri,  7 Mar 2025 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367315;
	bh=cvtgK9VT8/U3Roc7Bs3rFCNiDVd+wMNboSlrG5w2o9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f/9RcFCQNII0DeXK5YPc1dlvfqTvI75EHnpQGbStJz0s5aTcrAYDlnNB7doSVpgjp
	 TIyvy4kItRT02AUsc8pWGnUQefBS1Ts1L5KB7pPuMRNoywqG5v579K+GWXNdWlcvTJ
	 ukN5PacuU41bSHTypXHx7KXN435cfHvOju7paA8gRCCoYmoQ3VJm8qM0QiI48QtK4H
	 wozmgzSz3HlNQu697MzilNViEXedrtZZ5XgsCTwwzEi+OjiFBb7ess4ChP0N/qaYSB
	 OHQOM9klkVHn01WnFgJTYEYtVj7qQFH8i+Xn4xZbqESSE1YNDCgi4a/kM17YxMNoc8
	 VwYJLqlL77pMQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 07 Mar 2025 18:08:19 +0100
Subject: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add missing gpio-ranges
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
In-Reply-To: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_090836_539068_A65D415C 
X-CRM114-Status: UNSURE (   8.10  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Introduce leftover gpio-ranges property for Airoha EN7581 pinctrl binding

Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index b2601d698dcd41c3ef32af547ea41be0d6904ae6..21fd4f1ba78b05e5347b4ffe578656c8a4dc5636 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -24,6 +24,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  gpio-ranges:
+    maxItems: 1
+
   interrupt-controller: true
 
   '#interrupt-cells':

-- 
2.48.1


