Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982C6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 23:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LUUsfxnE5e+KdpmkY5aLYeO0ZcAR9uEuwyZ4oYZljzo=; b=m+jU7W6rPzDnFnPNuZTBEuPg3L
	IgPvfL/D+OO0hA4h6XfGEw8JFue9dJsaqmXaisNP9E3DkIc+3OPN0wvzAqxH8GcNBwwoEt8ZRNXwc
	fj3GY3olT/ZLbFDZpoiqP5dKa8s5mwZF7Kt4cWJJWxxFwShGzu9btHQg5Vz3hWSOfJTdk+7qXoLzX
	J9Au87SoVOIJm65TY0JE9ZOXzhcl7tyDS7F/nNJSvBMx6GFdXWC5sHtJbTEQGEV3Sp4w5JtFfpVcl
	TarlYvMLdfdUMF40of4heW6r7Al2DlbaLuZuyb863R7LFaPgSPu+UaUk4Xc0agk3n8zpjkFflQjAg
	2UtsWHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrmE-0000000Cghf-0WjW;
	Thu, 13 Mar 2025 23:15:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhe-0000000CgFX-18dW;
	Thu, 13 Mar 2025 23:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 983C6A48795;
	Thu, 13 Mar 2025 23:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16169C4CEDD;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907461;
	bh=cXVyoRypaze7f+Lz1yx3qPNU5d4wDrkDtX8Re+XtxgY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=b3PDUsXSUn4yAJcNWG/UXUc0yTU2grWPne5L7CY4r0ziVQNimoEZalJ2v2D1Cnt+N
	 bhKxgn+aVCQC5eOV7Uf3JwFlm/FciXA2d2l6+pUxPGVmXGYzDh1l55RBi5m8CDSfqE
	 DCUgxvG26/YLBE/zb5B5wpt6LtjKQCabjMzo0AbxwoeH6xwc0zuummcpKf0oZ+MgVo
	 5Uyt3g8FLu4pX2d9g8yZcffGUWw5r9s/SXpSyPXasQVnKKaGqpPBAnqDGcEuQw6Ph8
	 KH4+eCerg5HuLf/l1KbNtF7iGJfDsQgz4Vsc+ulpURv6/gb/KUDc2id/+MHRLEOHKS
	 EtFQ5F/A+oJlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067F0C282DE;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Fri, 14 Mar 2025 00:10:58 +0100
Message-Id: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAJm02cC/03MQQ6DIBCF4auYWZcGBlDrqvdoXKAdlUXBADVtD
 HcvtZsu/5eXb4dIwVKErtoh0Gaj9a4EnioYF+NmYvZeGpCj5ojInrP3kZmHZFPdKCHbmiupoPz
 XQJN9HdatL73YmHx4H/QmvutPkfzyp2yCcSbb0QzaqAb1cF19TOTPjhL0OecPNrVgyKMAAAA=
X-Change-ID: 20250222-ugoos-am3-f67413860434
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741907460; l=1015;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cXVyoRypaze7f+Lz1yx3qPNU5d4wDrkDtX8Re+XtxgY=;
 b=EMJcVnU8xlRkgiTfuaF1TgDC/Cipw+ftS76kCrZ0lMvFf5GpTyGf5oOolGy6r7AhJM4pXhZCI
 yQvY8GnkHuzBGf7CLT58q9JRTOPS6BKhzJVs76y6QepwJkvBXX3UV/L
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161102_386125_9D947DF0 
X-CRM114-Status: UNSURE (   8.23  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds a device tree for Ugoos AM3, an Android TV box from
2018. Most hardware functionality has been tested, as noted in patch 2/2.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- fix vendor name in patch subjects
- fix mistake that made wifi not work
- apply Krzysztof's ACK to patch 1/2
- Link to v1: https://lore.kernel.org/r/20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net

---
J. Neuschäfer (2):
      dt-bindings: arm: amlogic: Add Ugoos AM3
      arm64: dts: amlogic: Add Ugoos AM3

 Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++++
 4 files changed, 94 insertions(+), 1 deletion(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250222-ugoos-am3-f67413860434

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



