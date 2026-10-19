Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA9CCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CQqfyEbwUPHTuhLleCpoPBuAmX4H+mM6YRG6+FoBJqI=; b=jDlJOPIoAF+oT0zUGbe4iCCqzr
	UEfhbLgto5IDphq0sq9ccbO6Ljre+/zZvApKDmtIv9GjlfyYYjEq9BGu5CWHkO2ey2sxvU+gwi2W2
	eCv5srnYbjDrQltkkG0yvBVF+pT2ghtrbr41Ab6h40xzq5++UFdbkOFAgn3AN1+DBfv5pPToktnq0
	Ke2nPGw8iQMSKT8wZqtqGGezZF8PVw87dIHQrk9ShCahCZB8eAHAFhWokOiTgXApJQi2yw6c4tG3k
	sISAxMObw8Z9CJ+sDFBSaq///BpFIlmHHaNbFlQiRSKiVluNH9FFcIgaXdoyJ39Atqt6cTPvKkcRG
	iLfEksxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoYS-00000007lGq-3NKO;
	Mon, 19 Oct 2026 14:41:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoYR-00000007lFl-0AJU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FDD360136;
	Mon, 19 Oct 2026 14:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF0F8C2BCF4;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792420893;
	bh=6kpynfd1XwdzrYVYTdeaXZTq3IwSFC6OGWqTXpdz3k8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WJE0Q9G7w0hMWGQMzJxsiKROTcEEHWRcgf4S66ndzj1SeF5AM5VIxFCCUMNzJ9EFy
	 NP+uyr/JBoI8yHHY21K76GcCUjI2gYIBU3DmNRjmcKPTXp8FtlVVlIbXSXaRXhPvs6
	 18IEK9Xr3OHzn6iGJsbRE/J1nPfb2BW6ySWbShiKu4habCh2q7169xIeP6ILN+HmZd
	 GKbrINwag3FBWe0+05NzRtUB7QZaFAL8tWtVDKwvYobSVYaImtNZrzDyXpQJqfqGw9
	 th+CHQsXwkW6H3XJ39Uvy2J544P9fHGrduS1OO3Mvqmfd1h51K/4kCb5T2tU0ozA75
	 ETiXGI9aeCjBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD694CCF2DE;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/3] Introduce Exynos5515 pinctrl support
Date: Mon, 19 Oct 2026 15:41:29 +0100
Message-Id: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABks1moC/yXMQQqDMBBA0avIrB0wwVj1KuKixkk7VaJMYrGId
 29sl2/x/wGBhClAmx0g9ObAi09QeQb2efcPQh6TQRe6UoVq0C2CnvaI82anzw1X9jbKjFU5OFO
 aum60gVSvQo7337nr/w7b8CIbrx2c5xcZmt0LewAAAA==
X-Change-ID: 20261019-for-next-lucky7-pinctrl-64bf54588925
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=6kpynfd1XwdzrYVYTdeaXZTq3IwSFC6OGWqTXpdz3k8=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1iwavoG8bk1Ptimk9zQV0SQe2ytajaJBH/G2P
 ibOACjdA/uJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatYsGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+th1w//Ro7tCNpouTquWY0eo4khNMPeKlmjBWX
 djR4Lt+9Dn8nepSQFtyeoVeBJ0kAjaLVllt11cXsPGXGBrJx0UAGorrlLiAKv1bkNtE0gJqQch4
 StnVw/3eGkjKyWKJy+LW3UgaRwV8xJdVt27559IR/mlPYzZRfE6BElnM5fEyrGIrTECGHstNsL7
 Cs2PVzUqdtDuhFdLvLICJcXLV6CHXMd3JC67yb4POh28LXxs5cfhFe13ILHTh4NKVg7Kh71kZe5
 I4Wzqm6u0RzgEEZjcv0w9vSoPVLbp6st05ywdTW1XtLNHpUSNwF3EEScUV3eLjipEN7dY5GwM7x
 LEiAV4aLFX2r7s2oSfOrpO0cwztGE4c56tCs+pXmbzFkRsHMb3dztSY9flHd3K++3KMwUy8ypl6
 3jEzMLyygJJqxSIA1r88GUyXccavN98fW3rsz9XZnZxLF6jmamsOula2mc3vxcm8BxHLaS6xzXc
 P7y4utUQYbsgJ7VpfVEQiMgJxTeK9UmC0mUd6lHpSKppGd3XZpqDrbcoJSQwHyiJv1jgW9CFgwq
 u4KwJsl8Mh9KdQHrfPFQQJFH7txOKN7QLqpGy1UGf5FKRAR5NchpyWl4Rr37qE0GJu4veBTwBUY
 MRV+CZxH5BDYCYZFSV8RzXiKoUKEXQ8TrcMgPeegQhJ8BQIkQaFM=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi there,

This patchset introduces pinctrl support for the Exynos5515 SoC.

It is very similar to the other Exynos SoCs, therefore we reuse the driver
and for the most part the pinctrl bank macros. A couple
Exynos5515-specific macros are also added.

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Aiden Isik (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos5515
      dt-bindings: pinctrl: samsung: add exynos5515-wakeup-eint compatible
      pinctrl: samsung: Add Exynos5515 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 123 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  20 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 148 insertions(+)
---
base-commit: 993e1bec85faedf90c5d27480793084e54357c09
change-id: 20261019-for-next-lucky7-pinctrl-64bf54588925

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



