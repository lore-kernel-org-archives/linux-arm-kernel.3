Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441F0CED617
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDmsa/pzlfmaieUPYWrn6Qbx+Sof3bJ81BGiUv9KizU=; b=bcqE+I2HJxWwYpmxdpX/uX+Ch6
	U6myeRTt687b1n02Iu+JeS24gujoHHwLCC3i2VDnQJxo2gm6CFVp01H3ni1QpeTVACD7iDhEkTuW1
	d48yc2us3EOpmu9sgF0Td38X9n/QJJib4av6QlBmPqK+D3nS7X//xd9sIN0TTMHhwTd1UHlu+biE3
	9/tXCVlby68ahu0aNtQ210ibhEEFTqHt54R6YqmW3KHhx1ZWD73jVVeXNf2qWOg4cJwi0E6lUXxZf
	nnEkel2vHlyUZk523YWgofHbmRhZGNOeJC4mD1AABIYsG0wagupApTrmdneLllfxCUw14BEiorF+e
	0lh2GEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKZ4-00000000O9V-127P;
	Tue, 18 Nov 2025 12:12:06 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKZ0-00000000O96-2H7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:12:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 963071094E2;
	Tue, 18 Nov 2025 13:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763467919; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TDmsa/pzlfmaieUPYWrn6Qbx+Sof3bJ81BGiUv9KizU=;
	b=EHuSsXBaYqbBlFshrEIX/pllIptth/KuRlPdft8TVCz0i3e4lnutZf0TJ6nvA01rGKLZjk
	DP3wv4DILSTWsgTRvsc95U3EnmHxOW271ysKFFovnfwoXKzHzCQERM58VClqOGUgt5JE4V
	X6Bs954/oN2qasmhPEey/DgEse/UMOD7ng10HXar9Z7Zi7dzYRdAaJbhWwzaWd+aYJwNZ+
	lJVmY5cuXHBiwcF4PwiUcCuSNIjoP/0f2Utl+RI2IWrVwQ6eTn6qFcJm10HY+hduXu0Qkd
	nHX2SlzUWtFoKQA1QOnyGIvkQPrgNT/NToCf6VaHn6xo/bJqLnNwmOy0avmwLQ==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Gary Yang <gary.yang@cixtech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: cix,sky1-pinctrl: Drop duplicate newline
Date: Tue, 18 Nov 2025 13:11:24 +0100
Message-ID: <20251118121148.88165-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_041202_886857_7157BE6A 
X-CRM114-Status: UNSURE (   8.74  )
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

Fix the following DT schema check warning:

./Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml:68:1: [warning] too many blank lines (2 > 1) (empty-lines)

One newline is enough. No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Gary Yang <gary.yang@cixtech.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
index 36977b0d745bd..8ed53496c386f 100644
--- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -65,7 +65,6 @@ patternProperties:
             enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
                     24 ]
 
-
         required:
           - pinmux
 
-- 
2.51.0


