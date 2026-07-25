Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C328DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H86t3gf/zmT834UnYberSZX5pHmm8loG9uhscxnY3uM=; b=ZydISpePv5sdO0Ny4tMJ0l7n3P
	tnpEHkLH6bBXbeCQCJ3h+YYZvsg20BFLfhWZgG5jetzDfoER4OHVKLc3dS0Z4bTicxC8/edxKybNj
	6KShoP57BhwTOyQmrJ9+I3qGG1bOATjz0Kxb3shmu+GVnFxpwHjyddiVHt8LGHnmPklvTQhrciHWD
	LFZT7g/Gl5QMPmzKDwjRBdDzzxx+HXXfPNl+MnOyJBjC865YZr1QxeeR7HwO4WbAudLoAE6u6Z8iL
	7r+nEe0FZraeGJdR4Ql0hr61X8dYZpxhMVBgFIapxWnrPpmMn/uh9n9bARsd509NSHtqVfFES12HM
	7ZYKD5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjf-00000000OlX-0reA;
	Sat, 25 Jul 2026 13:48:15 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjc-00000000Ok2-3SQd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:48:14 +0000
Received: by chaosmail.tech (Postfix) id 633891C8684;
	Sat, 25 Jul 2026 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H86t3gf/zmT834UnYberSZX5pHmm8loG9uhscxnY3uM=;
	b=vcG7XnN8GCLBHY7JTLMMcIAx6D7SdKRWHgtPYeWr5qzKYtZs6zUOwdg1q/nnbqMdciL3iv
	iHRwZeqt+oEaZh59b88RS9UOVp9gQXfzMxbdQ1GEMTB+5e77tHmjCvm8OWRl7vCt2jXJGe
	2ks96ERFQF+BDgnJqCd7ZxfGequU02s=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:47:58 +0200
Subject: [PATCH 1/7] dt-bindings: spmi: apple,spmi: Add t603x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-1-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=1183;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=wqm7+TUC34pSmi/zpOaYMoWGiag20QOgkChGwgMHchI=;
 b=GYNQYwGqsfIDojVYIcLBsknBtdJECDpVEFwrgGgfI8vD4HIQS5gLW6KUw46QNkw0pr0xvHpnm
 0FpT9FSgeykAElDNeEuXMvb0mRLnc6gdo8SBPOAcl3OsgVSAigt68GS
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_064813_334059_7E72732B 
X-CRM114-Status: UNSURE (   8.41  )
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

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..9fc511bb0cb8 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,6 +20,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
           - const: apple,t8103-spmi
@@ -34,6 +36,18 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0


