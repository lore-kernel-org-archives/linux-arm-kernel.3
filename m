Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oUIGPtrR0wFb1D6MeR+1txZjwqqswpiIea1fPMfRCNo=; b=vbSOCQmpcnTeFt
	qdZrScUQTn+nDWEld1tVPKVNgEpMs4wZntFrlQCwybTbHcIbd+GTwpkVWo0tKMKa7KOeexJ+C0D5S
	avDqpGH0N4cyTA2Om0x7I9yzn5SZbYJXJzberHjlbJMVetWWu7eIHF2hPb1cqQbTCm9EbVCvyNibs
	D3TPgF2evwN9CVcj63rCXffgWL1TKJoyw2NT4FkHjsg6DIYDNdnY4d2RsNUnUuyhy7fYllVHQzQ69
	Xqji0SNN6JD/EWVhngZsSflKfEFpsfSTizZevrR1cCNe4hTQVmcAqFDG2X1bWPqKnb/hz363HEngi
	7Vu93rVZlBAixjXT4ycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh8w-0000000Aonb-1u8A;
	Thu, 26 Jun 2025 07:35:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh6d-0000000AoP9-3HjV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:33:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 53C5F22E3A;
	Thu, 26 Jun 2025 09:33:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA0oNzrxne4X; Thu, 26 Jun 2025 09:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750923186; bh=Z99aNcXqaaS4SQlpIEbclMo5h6ka62mxFrYm2osbZKs=;
	h=From:Subject:Date:To:Cc;
	b=DGykVyZnSgU7L8FuWvFz4dE7oQADIL3db9sS12sHuUSmJ7hL1ECX9KDicnMk+LrpA
	 tETM6jewN1vUr6eVFWjzudVD1y6v8gugGxNPQih+ADsmDCv03a+29zvsgSmG7mHOJU
	 JO2ShhpNyPibY9KsateFM5llJDeIVmAwMqtlQPmqWp7yIH/veKLylfP7d9vVQ9trxh
	 ZuaqaKL7J1X/TqQIGDBiraZoP9uDIQSKHE/WEBKxcoSaDpjguvQPNTo7F4ww4dAt4z
	 D8+nyc3ekMg01KAeTEQtohdNgtmyeZdRldmKLFP/VcnBF95zb9i2yJygdqQD7GBCSn
	 5LJxPuVmSzuTg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/3] Various devicetree fixes for Exynos7870 devices
Date: Thu, 26 Jun 2025 13:02:55 +0530
Message-Id: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKf3XGgC/x3LMQqAMAxA0atIZgOxYlu8ijiIjZqllUZEEe9uc
 Xx8/gPKWVihrx7IfIpKigVNXcG8TXFllFAMhkxH1ljk645JnXeE4VBc5GJFdi0tjrwNYYay7pn
 /UM5hfN8PlUgOzGYAAAA=
X-Change-ID: 20250626-exynos7870-dts-fixes-e730f7086ddc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750923181; l=1265;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=Z99aNcXqaaS4SQlpIEbclMo5h6ka62mxFrYm2osbZKs=;
 b=gpI29wz7F38DO8rebomTMbfIBORH6VaFkBhC5ETvLNG6NyrNcG/DIgfYlkqsHiYc9tCbQbeO4
 GAkOSnkgr9nC1dUZxNRTo0cT6zVcwTX8Htuvqg9kgpW/SPAjjNVYhT7
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_003312_230401_C9759A85 
X-CRM114-Status: UNSURE (   9.09  )
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

This patch series introduces a few minor fixes on Exynos7870 devices.
These fix USB gadget problems and serious crashes on certain variants of
devices. More information is provided in respective commits.

This series has no dependencies. Would be nice to get them merged in
6.16 itself. I assume it's okay to cc stable as the -rc releases are
also owned by the "Stable Group" in git.kernel.org... [1] [2]

[1] https://git.kernel.org/?q=Stable+Group
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (3):
      arm64: dts: exynos7870: add quirk to disable USB2 LPM in gadget mode
      arm64: dts: exynos7870-on7xelte: reduce memory ranges to base amount
      arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount

 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 2 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 2 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250626-exynos7870-dts-fixes-e730f7086ddc

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


