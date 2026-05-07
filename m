Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1817BCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mn0oYr2VZrCNI6U9frwbxqw7vWlxIIVmvJQiIxgUHk=; b=M/1R2ui5fwMlmhrLQvDNwtiheP
	RCt/fx1JyjwH1hah32ZFv3Q/ynUJSkXTl1vLbE1ubvqBQ1DlC1W3IugN5yZMWfAJ23bdtVWMXuPKl
	lHWp1WgQ7viGKNYeLh+SlHuLkuavb/9io7XT2adm1vFUZOSpwYcHt281t+o9QXHNKf95ReWbKk3vA
	AIe6NbV2aPOUu1WknqvTa4ZIkz3CMqyk4uU1pMT4atNTHiEJ//iecO4T6SvlvnHtMvGLox+7u/b+b
	QDfQRKySK2FbPiuO11u3WYUjil1uHO4ayrTT+jgsKzEAS8msOjGqyAQL8yrhUI0rtvWTWGR1hV93b
	ozNP9fTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtzC-000000039YE-0zCt;
	Thu, 07 May 2026 08:21:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtzB-000000039XQ-0eKm;
	Thu, 07 May 2026 08:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 974646015B;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43478C2BCB2;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142092;
	bh=ADtYUrAasvGOltfd9FShuLbJhinKTxBPxoHCICnXTv0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=i7qiVokwvsXAC/sUis4JV+ecyTT7U+VbOhqUONVnGGDfRYGui3xgy6rLXBPQV4znC
	 VYXmQGm7tY4YglsevSuvUXSaWZTWT1sfFiXl9wBqOG97aYBcJ4I4F/ATG/CN45kePo
	 QnS8qlV3CI4eXJLjKk+wTwMt1apK8ijNpBEIGFBS1XKNxxHbR8NNj0Mnf8N3/bFIZC
	 HMQO3C20Ir1g2uCZC8V2mhmY05M1WiUMzhx7wbH5q178jPVt4dtrIQC9psogaINED/
	 oJl8617MGDODwoe+xYHHBriqKH94jkl77rsj/GysDY2JWPqnuu/RW6b6WGU+SivbTi
	 ImK8dCz/zPgQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E0FCD3427;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: add support amlogic a9
Date: Thu, 07 May 2026 08:21:05 +0000
Message-Id: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFL/GkC/02NwQqDMBBEf0X23C1mUak99T+KhyQmuqCJJBIs4
 r832ktv82YY3g7RBDYRnsUOwSSO7F0GuhWgR+kGg9xnBiqpKQW1KFtc2Ok1TDnWQkhJVCkL+aB
 kNKiCdHo8L9YHdGZbz2kJxvJ2ed5d5pHj6sPn0iZxtj9DRY9/QxJYou4bIZSqbU39S86TH1jft
 Z+hO47jCxssS6zBAAAA
X-Change-ID: 20260129-a9-pinctrl-a9511aa224bf
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778142090; l=833;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ADtYUrAasvGOltfd9FShuLbJhinKTxBPxoHCICnXTv0=;
 b=+WPtDI+UlHraHDXBTPvl2FM/S60lk+5x68/SNLerSm/CfB7+/O7viEMzuv4ZAUaWnS6YseElv
 3trpOG25Uf1DbIa9FB3fm7J1h0rS0e7B4OD5g3UmGfF6ya2xc+isLPO
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add pinctrl bindings and driver about for amlogic a9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Add a commit message explaining why it is not compatible with previous SoCs and rebase code.
- Link to v1: https://lore.kernel.org/r/20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A9
      pinctrl: meson: support amlogic A9 SoC

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 61 ++++++++++++++++++++--
 2 files changed, 57 insertions(+), 5 deletions(-)
---
base-commit: eccd2fde7dbc398a6aba9120c01247beeca55aec
change-id: 20260129-a9-pinctrl-a9511aa224bf

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



