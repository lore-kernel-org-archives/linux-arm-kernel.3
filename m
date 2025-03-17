Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF550C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUD0N6l/6YHq2TvWpHymzwK54V+HoRCXn/g0pEGkeLs=; b=cl2s7gML7mjhskT/icERHy/hh3
	I+UR7+aBQKsvHYqNCELikHnDCiEiWfX5AESj9s3HBLiNGlxgpkXansj35l/mC29zOWEDvIugHrGsc
	q64ZSaAObZRjnD2aDRg6pRwYfWtbfPtpAFYSFneHPZpd5u70OxK1I2IQvXwGR0JJBLhhqpbkyZsH7
	qGFwwG8qZOljt+Pf2Q6EiZZohmNLNvAFnUPpRqUIYYs9Ujfie5Ctw8QCnnxbRC1883pXOh/ddbYZy
	BwMbZNDp4A9q1vgQeWQPnGkgPxYK/k5FbWUWwq/+ggm3SkH0aY9M5xHwpZahz8Lv4bCCqXlqKg2rE
	wegz7HAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4qp-00000001YgU-0Sjh;
	Mon, 17 Mar 2025 07:25:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4iW-00000001WmP-24db;
	Mon, 17 Mar 2025 07:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60F97A464A5;
	Mon, 17 Mar 2025 07:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61D85C4CEEE;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742195814;
	bh=vm35cYIdAhLZq9LNk3261kdI5GbsmTAMDzIyENxuRJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CuYRya4MtqPW5aQokT/AowMMGNqOeVSyMdLBZT9ZXNYYfcxr8MyFqWWEMa9FDPXZ6
	 62GDvdbo0Sm9S4vusf2+wgYc+7xnHKOp+x6aVP81XDoVsZl0ltJSq1hpMs35x32O/o
	 xctFIBNwDGog2rMXRGSFnb9/T0QI+iVUfGRqrZehCQCl4UzkoatZ/EFCXQuIJMgkGo
	 dxgcDfE7He77+uyDL1MN+vITIG15lxrlODeR+GOTQ9R8KBhaJvCkw4nUSe+kPDCAwM
	 CAqkJvoz3DaLa7VSgn3uKmPF/0hxn9BGXvtSq8yClcZs9WtVNqfh2EqmGAJR3RM9Tp
	 lR//b8MvT4vGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CE7C35FF3;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Mar 2025 15:16:52 +0800
Subject: [PATCH 1/7] dt-bindings: arm: amlogic: add S6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-s6-s7-basic-v1-1-d653384e41f3@amlogic.com>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742195812; l=998;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Wj7jFeJyWB1as0Aiyf81qr7pjy4df2QQR553NSdpnoU=;
 b=JrHEbgLFxYtq3HcI4cNA/1nztKjg13wf2WuB6PsRL0fk2ileEs2wg9KNTq6LoaPhb3MiMp7CJ
 x1cG10+F0TNCw7hdt91ntyn6yuWBsfRYag3hwNUMrQm+sTsuAr0zfcn
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_001656_621161_135334FD 
X-CRM114-Status: UNSURE (   7.51  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the new S6 SoC/board device tree bindings.

Amlogic S6 is an advanced application processor designed for
hybrid OTT/IP Set Top Box and high-end media box applications.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f5..67423c838719 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -237,6 +237,12 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic S6 S905X5 SoC
+        items:
+          - enum:
+              - amlogic,bl209
+          - const: amlogic,s6
+
       - description: Boards with the Amlogic T7 A311D2 SoC
         items:
           - enum:

-- 
2.37.1



