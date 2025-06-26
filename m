Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D2CC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmyV9jCOSjX6kUIcowF0X65KppacgFsw0acL0K9TCxs=; b=bdmTDF0GzSIY4WX6+6aZXHc5LQ
	KomvDV599FNkyps7xzHB1725cYOflxoavggGjiSQhgeUChhbaparBICsFsM252krFRr9QdBWkpicO
	AlN3r2iJNmXgFJp8HJjoIEzWoVnziPXqx+o34rYIJJcV7uGPaMG/4WoHGGctWhYsEPmhpkRaiMMYh
	KCiwg9U65Ig7W5KIRCR9zxEDEbx2LWMdNtYvkQzYyo2jS1iHIanphIk5FfxZEPcpU6vgkBFnghhe0
	GEHqMU3uW7mxjM856rr/cYjdxvAb6WUGzpiceyIOI/HQwcO6dgenNG1AZ9IHcs8dzmHwTg7O6eT5r
	mxvpM+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjbA-0000000BFnM-0HFI;
	Thu, 26 Jun 2025 10:12:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGj-0000000BCnZ-2JCD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4117D5C0780;
	Thu, 26 Jun 2025 09:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0DFC4CEEE;
	Thu, 26 Jun 2025 09:51:42 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single
Date: Thu, 26 Jun 2025 11:51:32 +0200
Message-ID: <b4283a68aa01c82d4435ee8334093dcbdf5bd4d2.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025145_629716_FF4A5B97 
X-CRM114-Status: UNSURE (   8.58  )
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

Document the compatible values for the Renesas R-Car V4M-7
(R8A779H2) SoC, as used on the Renesas Gray Hawk Single board.
R-Car V4M-7 is an updated version of R-Car V4M (R8A779H0).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 8ea7f69eef73239f..5f9d541d177a4265 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -388,6 +388,13 @@ properties:
               - renesas,gray-hawk-single # Gray Hawk Single board (RTP8A779H0ASKB0F10S)
           - const: renesas,r8a779h0
 
+      - description: R-Car V4M-7 (R8A779H2)
+        items:
+          - enum:
+              - renesas,gray-hawk-single # Gray Hawk Single board (RTP8A779H2ASKB0F10SA001)
+          - const: renesas,r8a779h2 # ES2.x
+          - const: renesas,r8a779h0
+
       - description: R-Car H3e (R8A779M0)
         items:
           - enum:
-- 
2.43.0


