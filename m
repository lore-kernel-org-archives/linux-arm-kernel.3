Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBA6CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w7wnGFxKCc7yHOaz4m/M6wcLNTkWeL7mLpc1eKaDjVc=; b=A032jBNzWT55GfcyV7eT6is/wk
	ShOfboe39mRQqbWD1v45jwYyJIsBYleivLhMOcptgLO3swzdbc4X57f5++CEd4g+otMq/lXH3PNxI
	dSrCPK+pufDS+iGMF9442rZi7aKL2hYzXexAE/zG3noKl+SrCavazirTTwyX31EZR8ETcehi8YAWZ
	VKlUpIeNE943w22GO04KOc7CclPxfHX86tOUrIm4T9ojDo5u0PTVuRj+w50aMzD9jgFQDHBIm91a9
	0gl+ZL/iDpnTOtooKnCIk8LqYRMtmlWfx8XTXLcx8ZmtgFC6zilcAnluh9Mhg5/zxGGIXvjfn7TAi
	M7h07krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsUT-000000023TS-1ssp;
	Sun, 14 Sep 2025 19:34:25 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsUQ-000000023Sk-2R6a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878460; x=1758137660;
	bh=w7wnGFxKCc7yHOaz4m/M6wcLNTkWeL7mLpc1eKaDjVc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RgU5nZPBrcEdKZnY6SsKTT7w4/shHF7ADhfhQxFvfimVoAs/1eTjq2rXSrOTHdyU5
	 KLv2mnaN0FAFv070NRuVDtyiFsVBDJbS78uyrlvbULz11XOkMnwSAjkapz0PPjlvwL
	 vdRcnB+KSAGMot+rWcOzws8+nnzAo8BQ68VGcSzpnWB8XtZhchT9uR8xxm545hGDYi
	 dtqvoYstdeOoZ2YMUudvoeOXXp7OK7/L/PlbzPb/XjfMInWMUchu/BG98BhYAm8NfA
	 2untqNgifU2V+UuWWzp/MyXdeV3bbLZ8cbUkFSkRfLH9sIgACvHiAdf70R8OXSRY0R
	 GLBdI7iWGuVuw==
Date: Sun, 14 Sep 2025 19:34:14 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 4c117c558f55e3a477e3b3b3b80bbeca70676781
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123422_764974_44B2BE13 
X-CRM114-Status: UNSURE (   5.82  )
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

This patchset adds support for the pin controller found on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 109 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 115 insertions(+)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-pinctrl-b44cdfaeeed1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



