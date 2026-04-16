Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EA0F8A14E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sHY/pr77LF/Sp632Lgdpg5zJm4hqirQJzcY0pCdVrQU=; b=N7m254v9GZcOUp
	v7a4ncQitoJR1UB4i3jz5sb7JzJOM1AZHA3Ns9k8BwDpf07IYwfKFzBsbgSOO8ex9fZkCTBocC6+l
	IdViWg/qbNI2XDsIOy/WGzf/RoMoBJeNZi+aDaEhRSOfZjkrX0IHWrQ53C7cmkiaEsderK7Z8slCA
	kYHAzO9bjb9cpl5BYwxoFQKPrpeASnXYtqq619kzJSiOcFsPI0P3j6asdgNgTtD22oiuQMEpFpJe7
	y+LL3Zuqt5T2NpIH0eM1pqN71ENbneCmIWISjZXVEtpdsyTmL7WxL0lyFh9I1JZQMU5Hen0Szt5Ek
	tS6Z+0WQlKj6K1mykDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIVL-00000002CEt-1bis;
	Thu, 16 Apr 2026 08:55:19 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIVD-00000002CAf-3kcI;
	Thu, 16 Apr 2026 08:55:14 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776329703;
	bh=0AnzjODYKSvj6YY8pPamvrp8pomTzD/WgVtAmSE50Aw=;
	h=From:Subject:Date:To:Cc;
	b=kClKD4jh624GykVfDnywccZMKG1f9OaQF9hoanGAJqYXv5w/Qs985aEl6y3vJ8+u5
	 Typ4PhPxeUEB/h3jH5PkbBmtr1xfctmduEYshklW6bGzH09uYI++0Rsxu3uAdl3sUc
	 vtA8Pb3wU48kXE67WZdIdKy1eOPX33SyUKcBc88w=
Subject: [PATCH v2 0/3] arm64: dts: amlogic: t7: Add UART support and
 enable Bluetooth on VIM4
Date: Thu, 16 Apr 2026 10:54:39 +0200
Message-Id: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jm7Zi2VEhYeQ/DopRBJgGqbSEYw
 t1FYOvy/cn78xcI5JkCFMkCniYO7IYN1CUB25rhScj1xqCEyoSWGk1dY9WNFJ2LLcYcJ+41NkK
 SSK0mqwxs7stTw/Pe+ygP9vQet/p4hFCZQGhd33MskoHmiOeLFH5CyyE6/9l3TXI3zvvtz4RJo
 kBRGZHrzFpZZ3fTMXXXxkO5rusXTM/sWOoAAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776329701; l=1839;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=0AnzjODYKSvj6YY8pPamvrp8pomTzD/WgVtAmSE50Aw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QK7L8feog0r9OwoBubcH0DzrRCO4DZaT/fDtCUbOaRPTMmWvFr0YxYvpnesLJq48MZUcmSp5ecr
 6aOXtgU6mYQ0=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_015512_091188_FA3748F2 
X-CRM114-Status: UNSURE (   7.83  )
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
Changes in v2:
- PATCH 1: change underscore to dash in pin node name,
           according to Xianwei's feedback.
- PATCH 3: remove clocks and clock-names as already defined in DTSI,
           according to Xianwei's feedback.
- Link to v1: https://lore.kernel.org/r/20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr

---
Ronald Claveau (3):
      arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
      arm64: dts: amlogic: t7: Add UART controllers nodes
      arm64: dts: amlogic: t7: khadas-vim4: Enable Bluetooth

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 21 ++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 73 +++++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)
---
base-commit: 6aa9edb4f8266cfb913ee74f5e55116550b5574d
change-id: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


