Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074EAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BXfvNz1ryO5/g93Wt7ooo7FgKRsXJmcsuwaEC8d6FOs=; b=tYPdtRexYgYPScCoFdCAH+vYVc
	aG83xpKk/E46f59uadj8S/leSsdV0frQdvfRAFOSrOXKbmUFePhDXkTRjWxA3kDaiId+7L+iFNZoO
	ghD6Gx4fU3Y00o2K0/pAPCm+el9vf+lKHJqygzBaNQiCpy96BEKp+k7WSyDEq3fbS5UonaNZfoEDS
	xwqst6G60XomGG6/60wQ5Pr0BCd7OJGYa7gpy/LcpJYFuTKTAUMdO/QxJjtfP9I7TLfH48EE2fgP3
	UOg3zCn9uYSqmKn5zYur59Zt5euAavJNIr48vKH4GG1pWIsAnk/Fl3hMgNaz0U4S3unitWGcWXm63
	3meom1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0G63-00000008Hxq-08ih;
	Thu, 03 Apr 2025 08:38:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0G0n-00000008H5z-2u2b;
	Thu, 03 Apr 2025 08:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36A7FA46660;
	Thu,  3 Apr 2025 08:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1FF9C4CEE3;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743669199;
	bh=QgyehMsARveK93ZZL1S0DWD6VKwpD0RfUNcyzEEiVwI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=exP+l7ZVtg7SpZn0pCxaOSXBK2L02RuTVX8UKSOIH4gE4VYAZsDIP0XreMOkfNuYA
	 /CWDSKtkelw6H1gJwt9kS1LulFiiKt/UrzKfGGt9Rf6ahxq8l5tZJ7jR3dMRPGOlkW
	 mVUnFoSw7L7FcmqGryPj3r4Vep11kkmpNME9Ssb0W1z2kkpiVAwZ3k0A5heF+pKPF1
	 5rhwplSSVNQXuMjw3gN9ap5BGQ8nIbzlPvzDNLuPgVnomeTSkWL0YDi3AGBhzfzXYq
	 Bf27qSghHvroclrpabvZqmGVNw9tqz8k6Vv76IccyAaiVdWh1Ct8j/ncE9e9MXvOv2
	 WiMVu3I11LE3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909ACC3600C;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] Pinctrl: add amlogic a5 pinctrl node
Date: Thu, 03 Apr 2025 16:33:13 +0800
Message-Id: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpH7mcC/1XMQQqDMBCF4auUrJuSZGLUrnqP0kWYRh1QI4mEF
 vHujVJoXb4H/7ew6AK5yK6nhQWXKJIf84DziWFnx9ZxeubNlFCFAFlxW/CJRpxDzxtAg8Za4cq
 G5WAKrqHXjt0feXcUZx/eu53k9n4ZVf4zSXLBdQ1KgK5RG7jZofct4QX9wDYoqV+shTzEKsdWg
 kEpigrK+hiv6/oBEbPHo+MAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743669198; l=918;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=QgyehMsARveK93ZZL1S0DWD6VKwpD0RfUNcyzEEiVwI=;
 b=wC3pYUawqVLxEBq/uVvbyL6+tKn79Zulf2H4XuvfZ3meWIf0mcSkbL8sDDDGC/t/nsGArhLVW
 COjkuoNlARFCmhaENF1XQ+4ZRl5fa5kaZRVR6OmFAd+EmC1zhfc2qqr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_013321_807242_05B49AC3 
X-CRM114-Status: UNSURE (   7.44  )
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

Add A5 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Remain blank line.
- Link to v2: https://lore.kernel.org/r/20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com

Changes in v2:
- Modify bindings according to Conor's suggestion.
- Link to v1: https://lore.kernel.org/r/20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5
      dts: arm64: amlogic: add a5 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  7 +-
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
---
base-commit: 79e0ecfc780aaf8c0b6658607f75a661a5f00736
change-id: 20250318-a5-pinctrl-f3c6c6aa0e7f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



