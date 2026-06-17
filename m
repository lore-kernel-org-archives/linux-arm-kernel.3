Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DB7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nINJVCu21DT96GpNo+k2c3zfErmFrKlsVNR8WlObQRI=; b=0u9Q6PymvBUiD2udK5wokz0fC+
	s72CnhV6y6K6W848Z2RFpjE/iFe+0W2+CUNTAZ0WDwFRIS+sw489HeRuN1NIh505Z/8fJSd62e+i3
	Iqq6EhV5QPQoThbaN+qHFY3NsRbU8cIH6oWONcNC92M7ZtthrVoqXztsNIajuKVPzextOf63u0msI
	uD/lfNF5GxEFD55cC74BQjlirX6RAR3pH7uqin4JPKzS8q1clgXrAti23ZIsUMLCVAmANucpPKzW6
	F6Eq8JLjUFVyDUD08n+4ZraR1opDURi0ncxa+APX//BB+wDDupY8Rclx9NcB+jxmAhZUnW4BoCu7k
	lWvKJ6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSH-0000000HQN3-3vL2;
	Wed, 17 Jun 2026 13:37:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSG-0000000HQLC-26Pg;
	Wed, 17 Jun 2026 13:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B26776001D;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C3BCC2BCB0;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781703439;
	bh=kNEUKK5Kiz7cVomN/f+dhLQomGTCo4fTF2+XBbA8V+4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P7M03ZUzdm5VFwApRisRqAME3UyBanEUlNPFnrFUzGCn4wMTmBUShV8dZ9E9eiKC8
	 cmf2YKcE3WpUTv4veomsKjnexLs1mq4uGJUdr0EQnESn78jYumCMnQ0Z81uWFGnmXv
	 mI9bOeLWuo/NqZZwGvQnWYeyoVUnlTHmgMEQn5tZ9rrD0xrIOXS8suiR4qH+hC+zHm
	 GgGHikZJhogg/U0Sn4jQmAYpqG8x3PtIebz3yuDpzlhezeXSliupCJabm86Fmvi8fN
	 0pxqcZP0sUzYPDcDW9fRqpUUTLYypnVDm+QDvKkYAB2Dsy0y8wSb1ExVQyA9I/ai2R
	 hiEH2IhI1RnbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52515CD98F2;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Subject: [PATCH v2 0/5] ARM: Basic support for Amazon ford tablet (MT8127)
Date: Wed, 17 Jun 2026 22:36:58 +0900
Message-Id: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBBFr9LM2jGAAawr72G6QJjaWRQaaBq16
 d3FJi5dvpf891colJkKXJoVMi1cOMUK6tCAH1x8EHKoDEooI4w0OM5nqSy60b1TxD7lgHdX2KP
 Uog1WaNVbgjqfMvX83NO3rvLAZU75tT8t8mt/Ufs/ukgUGIRyQWrnT7q9TjnNKR5Hgm7btg/Eh
 YJ6wAAAAA==
X-Change-ID: 20260616-mt8127-amazon-ford-basic-1509d7052f7e
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781703437; l=1406;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=kNEUKK5Kiz7cVomN/f+dhLQomGTCo4fTF2+XBbA8V+4=;
 b=psGdIht1ihbxy880dbwYEJnCWYHl0rwzxJ6NAnyQNRw76nzvrM2yEjmVriqe/kb64VOjWvl1A
 6bRcxuMeSLjAxA2mYLOU+mInYve5rpe8z4bDIM991pf7VXlCq2ErD9e
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series of patches adds basic support for MT8127 SoC based Amazon ford
tablet and fixes a small indentation error in the dtsi file.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
Changes in v2:
- Move amazon ford compatible string to existing enum.
- Fix watchdog node not sorted in unit address ascending order (sashiko report).
- Move bindings documentation patches before patches implementing the bindings.
- Link to v1: https://lore.kernel.org/r/20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me

---
Zakariya Hadrami (5):
      dt-bindings: watchdog: mediatek: Add MT8127
      dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      ARM: dts: mediatek: mt8127: Fix indentation error
      ARM: dts: mediatek: mt8127: Add watchdog support
      ARM: dts: mediatek: Add basic support for Amazon ford board

 .../devicetree/bindings/arm/mediatek.yaml          |  1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |  1 +
 arch/arm/boot/dts/mediatek/Makefile                |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts  | 46 ++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi             |  9 ++++-
 5 files changed, 57 insertions(+), 1 deletion(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260616-mt8127-amazon-ford-basic-1509d7052f7e

Best regards,
-- 
Zakariya Hadrami <zkh1@proton.me>



