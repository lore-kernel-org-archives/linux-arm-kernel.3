Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B967C71151
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMkAypVlp69wwJItK7v3XCoQrQXV5TZgqU82VBtXqbU=; b=BaU98XoDRGsiMLlwNyT9iViEYk
	NMuWt4PyBtR8h4z1JxlDZZcQCogZw7Ttv55W324zwyiboMutfpEDz90ojib8baIMouE4Zz1jVP01a
	jhsDHxswtQI8b+9hrahaDQtBLnX7+QLjFSKmzIscG37F4a7334cdAHBPZtMsAxa81kGUQWkfWFhNa
	fHRmUevgbI5+Q6NdBUqFgFEZiGZ2zMamQAnc3e3DHSbYRRCzBMllrmqmvmGR73c40L/lx64z0VOpJ
	9SOqEr8pl9+Nb+oeg9Nbaq14BySfx6pvnNZo7lutmGNUeVzJ54GfGNaDqNXw7jcnY/Ta5E39mOPR7
	2nb7SW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4io-0000000GXKf-1Hao;
	Fri, 13 Jun 2025 13:45:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4co-0000000GVUY-2WgQ;
	Fri, 13 Jun 2025 13:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5C47629D7;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82919C4CEF0;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=d4zt0JOBC2hdaumNtVVwuXPV9bmTleS7AL76KtydixI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=orDS8zZiDiEvC5a+Xj68U/brImg3QVNBSWNpgk6qGEmLsw/AI1tiuhPfPDAZjpmiW
	 BYA+lqYM31aNms+BlF8Zbpmj9FeoBX4Yb6QpMtIB/+wU+9AdFogYYVGhBLz5yD3fL5
	 nV0YshzW/JvB+p/57A8rn5ixtyHetU5qmr2QHKPYVlIZASM96n+RO0PjiDnSGx7AGK
	 /4tAFOPTgBXW+mPDpfWtgo/iXa7x/eNgrnwM7O4czC3ZDjJcnQ0zTCmayIIkttqYlx
	 J+lIIUtEADx/EA/PUSrk0o+irqkaAJh4yXHpw48pPbD40fbWN5msgTrCb/poyI6xbD
	 R7p7bTacb8jpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735CEC71136;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Jun 2025 15:39:13 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-ugoos-am3-v3-1-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=1125;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kZwR93fnBy9N7Bg/HslF5gmhIegfe1/51WU15kA7fXw=;
 b=dd33tXb2gztAfCgLiRlEw/IQQQHH7LtYQY6rjV/dGwaie7Sf3Bs/24sa4q3zEyvnbtipEILxQ
 +B+Tk3SGZRBDguFUxz4AzBcLk1SvJ10VqAaApauwVEK22UxHof8QINI
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC.

  https://ugoos.com/ugoos-am3-16g

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V3:
- add Martin's R-b tag

V2:
- fix vendor name in patch subject
- add Krzysztof's ACK
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 05edf22e6c30368bfee7be61bbb4b682bfbc1d5e..2a096e060ed3d30f243d39b47817d2a5a36361b3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -135,6 +135,7 @@ properties:
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
+              - ugoos,am3
               - videostrong,gxm-kiii-pro
               - wetek,core2
           - const: amlogic,s912

-- 
2.48.0.rc1.219.gb6b6757d772



