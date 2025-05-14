Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F6BC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xsbyx99fBNMgU9ktlPU+V9QGJHk36OFXFrXA1xWOpDk=; b=w08Z5+G6IJJLzeaUi6i8IzjxA+
	fh8ER4avnMjgxPUOHJjBHvC76TALaj3FE07rfN686J/Mmm2KbbPesOIMYj0pEdFu3GP83nsTuY4ZM
	8DezxPIMQvUQczr19uY7RyagWIdgSAvlUrZqZ/FlFEGnXOYpQeCo2i9dSAGAKf+w7I26M04+gvNa7
	k+0SUd0a9ktqfG22Yombcx3wZYQSY+UMsfpvsLsR0eX35GMDrmQbbEA5oPF32sFJ5FJatST+mdI/M
	g4Xk/JAOQ42j71KsZ+21gdteFeinl8A01f/KYNzZku10B+Qf2eqk0mD2qRXSJtogDjkR0TAVCLsFi
	BfuiRa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Db-0000000EFj6-3FBt;
	Wed, 14 May 2025 07:07:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF67b-0000000EEb3-1Fvz;
	Wed, 14 May 2025 07:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69DF643786;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F87EC4CEF0;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=SqXI1uvoCkhyqkrY5xjtQtfDKxNrvjB2D2HwRduTNGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K2OHsTUQNkDEkSSMUAjk/aeXAhC6BLnwtb/0xF6Z5ExttzehGBwqkkPM/W6VlW0tQ
	 nhQ414J24WnwQkTGAn22KMNF2vfCWUlTK+9mLoFc2JKex1wU05/R1z+a99mvCwlKF8
	 Ki3QbEnnnNuuTOx0FPGegaG1o53H3aZOQ9DYDjMLSdiLmSdYUEwl3ijYdK3f+qNJRW
	 uPqvKeHgoWP3six4emWbwFSctczNr4HA6zlCE+tlxoUAq9erlfho2OMKn+UnKb1moY
	 AyNkJ2Qj9b1IbqwAPNhaLbZynzRwWHdD9kHPiEqAMzP2YOqnjPA1sQO+hKzN5KgCXe
	 yzQhXExOX0TTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E97DC3ABDD;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:29 +0800
Subject: [PATCH 2/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-2-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=1044;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SRGfN0xHu7rPLyCZFtaZT28fxmetKbOy0Gk6C4ftPKQ=;
 b=3PHyXSoGV95skhliBDZMXH0l8EuvpG+EqyHCmUwBq2UV0lVqWG3FLCfhsTMVqMVVP8Ru2jAVz
 s83N7u82Sp/A5O1bSI4WQMyrSDP8znh40QyaIPL9cu/bGH2f6sCQB/K
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_000143_368585_E718110A 
X-CRM114-Status: UNSURE (   8.31  )
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

Update dt-binding document for pinctrl of Amlogic S7D SoC.

Amlogic S7D SoCs uses the same pintrl controller as S7 SoCs. There is
no need for an extra compatible line in the driver, but add S7D
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8a6981e9f873..96a7c5646c13 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - amlogic,pinctrl-a5
           - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-s7d
+          - const: amlogic,pinctrl-s7
 
   "#address-cells":
     const: 2

-- 
2.37.1



