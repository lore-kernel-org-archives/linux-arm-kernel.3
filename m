Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A96BCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RO3rlVweL4wzxlzwt8GsioQ0hl3iL1bex6b5HIskg9o=; b=hF0NV/lCvze6NKcdFunWp1bYsj
	rheixfPZPKoMNGaD6Or9QSnVanJjZx3qbhxz7DdOYZF8xgGvUJ0lNcTWIiWaWTKAQLMf3bnTHG1CD
	6c4MFRI65ANUYZ3Nom6WhZTtTMuS6y10qYCP4yP1SQb+e38OlyNgl0cXv46yLVttf8bQ8pOO8a0BV
	HrN2kru19Vo7Dbl739MC6ehi6ZoBI7/M0ZMhSUPQxzmqmBOfmyfqiBL8N77c58m87vhRTx9wteqZV
	Joikz4yWBEnaYWSztHYD06nXHCoE/Oe4u3f6yw893wSpF+gPfI2zWVem91z61Ejfe2HC/o4YZSQKm
	2UAfHixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPykS-000000078e3-2mu7;
	Thu, 21 May 2026 08:27:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPykH-000000078VX-0vhd;
	Thu, 21 May 2026 08:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9F6A403FF;
	Thu, 21 May 2026 08:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC2C5C2BCB4;
	Thu, 21 May 2026 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779352027;
	bh=bzdk7Kr97M8ZTKkR73nEt8S7smKlwLk3jyxCaislBCE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gDf6J9CWA0Jkj+sVyKVjYft0qdrfcuAu3LQz1WoiH+hv0NLkaIZ2ATVwNpmU97ioz
	 0ykkbd4X4S1LvMXMliPzlR/X14Zr+i6PJcnG1/whPEFaw/e7mxFfdo4gwiCupEfN3H
	 NIHycvMdX6bfrvnknGywZ4OAKDyLRPJ/+i+oztVtQluhAa+A9miJsj+qLzpcehTaze
	 8kIxP6UET+zM7aP/LRUPtTGoFKsSwNFdn0l/T1JWvSXjMTu6ozAJjX27+78IQjT/8s
	 W1hIfRQLsjgSn05fJd+BZ8GWrh9i6Y3rbnSW+X1mAvCseKQcUt1V3X3FyFhrd32JT+
	 BBX/2nkVR32mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE88CD5BAC;
	Thu, 21 May 2026 08:27:07 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] Add PWM support Amlogic S7 S7D S6
Date: Thu, 21 May 2026 08:26:57 +0000
Message-Id: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANHBDmoC/1WMzQ6CMBAGX4X07Jqy2B88+R7GA5QCmwglrakaw
 rtbSIx4nN1vZmbBerKBnbOZeRspkBsTFIeMmb4aOwvUJGbIUfICBQQJQcH0HAB1LoWutVaFZGk
 /edvSa2tdb4l7Cg/n31s65uv1W5G7SsyBg1QWW4V1qWtzqYa768gcjRvY2on4c08c9y6urlCNs
 elTCvnvLsvyARIbnMHgAAAA
X-Change-ID: 20260325-s6-s7-pwm-281658b88736
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779352023; l=1053;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=bzdk7Kr97M8ZTKkR73nEt8S7smKlwLk3jyxCaislBCE=;
 b=fQiZzM/Lh8PPnpiLD5LGzPb/OkLEGlqImpKBfEDcs3FUg3JubOsnLumaApJU5vjcr4iZI7XYT
 stuhJIZ/1xGCaD7/XckedZzIBGzrxZzihsUTqgTQOjCd/oOqTvvpAOr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012709_330864_AB5AD47C 
X-CRM114-Status: UNSURE (   7.88  )
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

Add bindings and driver support Amlogic S7/S7D/S6 SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Use npwm instead of single_pwm in priv_data and format adjustments.
- Link to v2: https://lore.kernel.org/r/20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com

Changes in v2:
- Simpler s7 clock desc, and drop the example in bindings.
- Make minor changes to probe based on Martin's suggestion.
- Link to v1: https://lore.kernel.org/r/20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com

---
Junyi Zhao (1):
      dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D

Xianwei Zhao (1):
      pwm: meson: Add support for Amlogic S7

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 19 ++++++++++
 drivers/pwm/pwm-meson.c                            | 41 ++++++++++++++++++++--
 2 files changed, 57 insertions(+), 3 deletions(-)
---
base-commit: b1385d0c7b7c633e55adcf4a7c1ef46c43a84a4a
change-id: 20260325-s6-s7-pwm-281658b88736

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



