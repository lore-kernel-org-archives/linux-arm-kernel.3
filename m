Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B917ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LcQuVw/J9+OwtI925SmuMsmyDOciy3HpgHqq+vmDC0A=; b=AFdGF+WUiV9hs0tzlJSw6qgR97
	5gfIOtREP/IH37ZYk565HmzyoxjfxtKu2sJm+C6YDFh4u3D5UkX0UR6p+GYnXCG1TZoaZceRecPkQ
	5BVBkqvu5bipfJ12JRHBmo0WFALPHGq4sHRIVS4F8v/DUGh5Nmh9KhfyJMx3/43DYYkzumCcpglPA
	C02Pmv/RIPaZeo1EAJ/XpDTBs9kq/QLejpOjq5VHf3GXGOiTwm/s0WgwGT2gsMA9O7Hi3njz0ulHJ
	Cr0vYNewFzO3sLXZntMNrx7x8P9Xfw8kcIokKAT4jXWbtywLsnRRAM06DZ/WGWFpLmWgmRfj7IYyU
	ychZKOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fv-00000001JTL-1Vo9;
	Tue, 07 Oct 2025 05:55:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fu-00000001JS0-0VfK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45FEC6121E;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAA07C4CEF9;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=Gf2m2IDyByH7gmdlj92TgGHt/kPecA91fuSLd1/3x9A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DIe5+HwmMh+CxenYgQjBf7eh7ra6GAu+eA/KSdv/htod35kmYPfc7cEvFkVTyafXt
	 jA2XHc0thB3aGYnj1XtL1G0zW+TnlYzsFWj7J+ldl67uMkFyslnvnthgbvblDMGTgi
	 ODHwxPQhXmOfYIn+7sPK9Y0mnvkPPDGwczrz8S/N+EguHkne9nrN5HL2S6Q2Y3x5Vo
	 sRDU5P9r5amJZtt33yARnHKEwWgWKyn8WoQFPEtShqKYFvefyzOV1IeYTpKZINo/zv
	 wcd0fco8eAZD8ZeK1+25hmL6t+W8ADe6SSqqqCeelzaM9rkUDVafNhZdDStsEKkGsL
	 5qW90SIdSe7mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6622CAC5B8;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Subject: [PATCH 0/4] Describe more hardware of the HTC One (M8)
Date: Tue, 07 Oct 2025 01:55:41 -0400
Message-Id: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2r5GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3VwL3ZSSYt3ElJTMEqBaICsZKGdpmJiWaGSiBNRWUJSallkBNjI
 6trYWACYatAdiAAAA
X-Change-ID: 20251007-m8-dts-additions-ac20291afa24
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=751;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=Gf2m2IDyByH7gmdlj92TgGHt/kPecA91fuSLd1/3x9A=;
 b=5ibouckw/wXrYl4/1BrXypwgXknGcJqzOUQh6dcjqcFKMMvY/k9z74zd60/bSZG0EfDv9s+B8
 EzG91zLwpQFB8ZlYwSVn66l7/BfCCKOPEQDf/3bXylR5woqjL2zMLfY
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add hardware description for these parts of the HTC One (M8):

 - Notification LEDs
 - Bluetooth
 - NFC
 - Touchscreen

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 88 +++++++++++++++++++++--
 1 file changed, 84 insertions(+), 4 deletions(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251007-m8-dts-additions-ac20291afa24

Best regards,
-- 
Alexandre Messier <alex@me.ssier.org>



