Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9358EF4198B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wd/XOyCn9x2pmcjAIHIM27ByVykDFvtZMg4xvNIthhY=; b=fUcJRXsyQzWTSX
	hATVoyjUAhFD2bkIVGFF6R0zr8qquJ8vgFE0F3ZaVwNt1TqDF5m4a/LIicRR0zt5qPgVB6/jVo5N/
	d0Ds/2qWHzolKW2LrRZ5laV+sCPCmx2q0jWm4m9pJxqJAZ5xkmZasC3fN+hb0DTufxuiG2ivu8VZa
	heprZQEMYUJPFjg/3pq0sW+Y5zlHnsMm/H3gkNT5OMQoqEZ0DwTjb4Oe8p7UsDpQz4mLZy0HJpsps
	PSD54jxoPPYMAAv9gsjdAIAN8EGvMSzn+L4NtNqgDKtKYcYGSnFXir4tdMlkbucjX1bMHi7xk7KPN
	AlfTBCaEQLKMflYDtSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyFA-000000011wS-2skw;
	Wed, 15 Apr 2026 11:17:16 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyF2-000000011rn-0VvD;
	Wed, 15 Apr 2026 11:17:10 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776251822;
	bh=QZzNdEfcIrynyi5Gz/PNV6yy84jWoGk8vSGZr4vkPQk=;
	h=From:Subject:Date:To:Cc;
	b=umQSsiTBI6T52/AgpmhZeyrR2Lt5cz9JorbekwHyrrg5vXzhUkjUn5yxrQedKX+P1
	 DktcwC1pqXcWxWIHOc7WtBvHSDF2ZORjpGiOl6sSNF4a6uLXS1uTMfGCbQ5C5cIrWq
	 hbaUdbt5JFfxrL5SyLNqBMrLz1r6ZYVJ90vipo2o=
Subject: [PATCH 0/3] arm64: dts: amlogic: t7: Add UART support and enable
 Bluetooth on VIM4
Date: Wed, 15 Apr 2026 13:16:12 +0200
Message-Id: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrDIBBFryKz7oAaaSFXKVkYnTQDVVs1IRBy9
 0jT5Xvw39+hUGYq0IsdMq1cOMUG6ibAzTa+CNk3Bi31XRpl0HqP43uhmlKdsT5w5WBwkopk5ww
 5baFtP5km3n7d53Bxpu/S8vWSMNpC6FIIXHsRaav4v+hgOI4ThDkWfpgAAAA=
X-Change-ID: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776251820; l=1500;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=QZzNdEfcIrynyi5Gz/PNV6yy84jWoGk8vSGZr4vkPQk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDAMs/E70REmDue+8UqHgoZ5kt+XUuMVmChc2pxpgCZKh2Y44H8OKwb7msGtpJJybnohHBNwSsU
 w9TsT3a6k3Ac=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_041708_607632_E1362B3C 
X-CRM114-Status: UNSURE (   6.61  )
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

This series adds all UART controllers for the Amlogic T7 SoC and enables
the Bluetooth controller on the Khadas VIM4 board.

The T7 SoC ships with six UART controllers (A through F), but only
uart_a was previously described in the device tree.

  - Patch 1 adds the pinctrl group for UART C, which is needed to route
    its four signals (TX, RX, CTS, RTS) through the correct pads.

  - Patch 2 completes the uart_a node (peripheral clock) and
    repositions it to respect the ascending reg address order required
    by the DT specification. It then adds nodes for UART B through F,
    each with their respective peripheral clock.

  - Patch 3 enables UART C on the Khadas VIM4 board and attaches the
    on-board BCM43438 Bluetooth controller to it, with hardware flow
    control, wakeup GPIOs, LPO clock and power supplies.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (3):
      arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
      arm64: dts: amlogic: t7: Add UART controllers nodes
      arm64: dts: amlogic: t7: khadas-vim4: Enable Bluetooth

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 19 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 73 +++++++++++++++++++---
 2 files changed, 85 insertions(+), 7 deletions(-)
---
base-commit: 6aa9edb4f8266cfb913ee74f5e55116550b5574d
change-id: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


