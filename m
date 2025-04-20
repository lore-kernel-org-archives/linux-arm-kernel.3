Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D5BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVJWWaSd+uGf0MzPBXFFVs35PhBwozxoHR3GhvODwbQ=; b=xGuZub6VnliicV0efDxX2jQ+By
	RrwMCZiszA0qrPSjxm5WGEb8esWrw/RyZiJ6MgGmQ4mk0oN7S6x53Jx/Q/boWU83Iax2VrMfm1Tfo
	bj3tnVZzH3sKQRyHuJNo8p8jujUQwDe99HMiNjMbogR84UjZZV4xUTLj205B8CTT6jNwPCnyK00EY
	uTa0RQSRhR7HstyQDi5PJEVCCMX7aLU3eWPTSynX5qEzOl7ATJQhePc7d4z8XtiRXgMZJ9OrsW8nO
	CuI6glcHDoqipYV9CywTba+wIBtReUTw8A/PQJ+pDtKPGBu10MEqELlSTpxnSmYoYEQYKKtQ3anAG
	sBLR7kng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6bsG-000000033xd-30Hh;
	Sun, 20 Apr 2025 21:06:48 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6aLl-00000002wKS-0stF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 19:29:10 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=qm2M5DXPtCKo1Glxkprzegx2dOakQczkJvbAJaxCH229JSjefyB1/6NIQWouVY/x1IMjuD50SfqHCyLIMMiT/7O2WvapNYAhaCQQNc1mtGQM8tuof5Xa6RCBz/ljUvaFGmfM7Ky9AzH9FafQB0sC4wEEwvo5U5QK5j7ELEPKJ0TRiIG0k5ZHNe6vlDcXaTKMdmwnJ53s6yRi3HZ08qOVqnB8C0ZXj0AGGq6anuBkBYukbyTk9W0NUwVhPZ8CyT0zVv6p+Tls4xCwJdGS/j0liwSPOAnFK9+Ojf6dRLs2qwwg8rq/bool3OlC6ctzn+xN/roTsnwFASufDdTzSlXc9A==; s=purelymail3; d=purelymail.com; v=1; bh=QOd6z6A83o0QZNnyI/ifSdk4jGhOOwca01N1b/7gQPA=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1149203934;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:28:44 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 20 Apr 2025 21:28:21 +0200
Subject: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add
 exynos990 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-usb-resends-april-v2-1-25dc7d2e6dd4@mentallysanemainliners.org>
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
In-Reply-To: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745177319; l=1286;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=QOd6z6A83o0QZNnyI/ifSdk4jGhOOwca01N1b/7gQPA=;
 b=2rOhwRtKIKC1Z2fHwV7rvy28V9+d3GYFQSW3KYruUkmRkeQ+jcbN3WSqq8YKLQGUsXsMHzLw5
 v52B2SKFmxkDd/JMv1JLXoNgfGWcxS/mv/JbF3ZgmcJCaQJpY0Y7eIY
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_122909_314003_737D801D 
X-CRM114-Status: UNSURE (   8.48  )
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

Add a compatible for the exynos990-usbdrd-phy. The PHY is compatible with
the older exynos5420 design (two clocks) when running in highspeed mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index fdddddc7d611364ce17870b5b8963b5a0c0c9668..5b240fc761c38b49fa4f673ea4fff0609470b414 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos990-usbdrd-phy
 
   clocks:
     minItems: 2
@@ -187,6 +188,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynos990-usbdrd-phy
     then:
       properties:
         clocks:

-- 
2.47.2


