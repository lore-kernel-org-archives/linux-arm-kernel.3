Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F5C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQAyP7uPghjHMlxPMzHy+kXQk9c9O+V+KgiZJfyBzZA=; b=tE8kqax5GP1e2FYY8+qlhjhvL8
	jwQ0aRMqKqVwLzwxnv24XdKI3fuQXn0oS7cCYZXzl5DNw+YMs7I1VTrzubXTCXStCOMQwhYRwLFRO
	BxcJ1d+99PtsVVbmTvkxukS6eiGlFeBKHLCP7IDTqyR6QND56YYbPQ0R74FrWcQxOLXWfLcB3Qr5j
	VzdN/ZwepCH9wpV4Snwb5k6AXaUBKd88PdLslofE7+ILPG4HwX9SyrIb0QcI+IFKFIf3UQ6shP47P
	BZZ+3kpim+WPW8GX/c0XMOdNneqFTy8S7IbsaxK7W8UrPxdMZNt4GbH66GGFwbqYstwRsRjzbQgvU
	MOpmk9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuP9-00000005tPJ-216v;
	Mon, 17 Aug 2026 10:17:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuP8-00000005tOj-0FAQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77DA2416FC;
	Mon, 17 Aug 2026 10:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A316C2BCF4;
	Mon, 17 Aug 2026 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786961837;
	bh=wK06Xs2Ehefp3TZxBkcPfV9xrG3dW+KVswLp5LqL3mc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hQYD3L56vVpRmEgsqoWPaICGdfOUyI4lkWSb+x4Fg4zRYET1HKHf6aQWe9F9J3K8D
	 +b96IkgzWHAz1K/P+MwYpYax2oaCphM9nb/AostssPF7CuJYbOnbeZfz7ch4mO/FdD
	 d4E946Yv0w1X1ACd7EyLFhzVb/WW2h2Fa9QpAWOIfdI8O5aeMJ5HzJI0UmoSUM+O98
	 h2P9wPo38/dFlcLUPCnwC2/IWUAjrTQhb370GDKt2gZeEt53qNgRvbNZtTrbQixzTR
	 07DmsLkYAN9UPyjnVQ36Dstyhzp3lbVgPLcZoAu1A+DAQEI9rGphCOIt4F4ZQugPxz
	 noDFSF/eMYwhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200ECC5DF70;
	Mon, 17 Aug 2026 10:17:17 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/3] clk: samsung: Introduce Exynos5515 clock driver
 support
Date: Mon, 17 Aug 2026 11:17:04 +0100
Message-Id: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDfgmoC/yXMyw6CMBBG4Vchs3YSytX4KoYFHX90hLSmBYMhv
 LsVl9/inI0igiLSJdso4K1RvUswp4zk0bs7WG/JVORFk59NzYMP7LDOPC0yflqWycvIpa1si8Y
 aQUWpfQUMuh7fa/d3XOwTMv9mtO9fH3WFunkAAAA=
X-Change-ID: 20260815-for-next-lucky7-clock-3b4b7e6b1ce4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=wK06Xs2Ehefp3TZxBkcPfV9xrG3dW+KVswLp5LqL3mc=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqgt+n7x+JSaql6wYRLNjCbegcsTaeYmm3X/Z3j
 3dToC00kLKJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLfpwAKCRBJJwGyxHrX
 61bhD/0c1sO3XsVb6kLHOBkdMv24elZQGjDxSfXbEHMrA3gzRJIhgtAHvhDvTngOU8Yz+lMmLmm
 GrbWgLmltl2heHeVNkjw8r3iSonAsZ8eCXwHjq7vGjLTEH1/sr3aDufT65sBjiuxAuHGf7xwm2H
 JYL8K68pwvsdvyc8YRbVERTx58mpKlhRFVsuHd6A2KZRrq+gat+76lVYSE5Kh5CJY6w1GD5Af9W
 R/n3YUEWpMUf2gSmqsVRmrsPeBckjSnLVLis4r1QVNhaq3uPz6L8xBDZo6EVYKFrS6ExCt3n5Ko
 H3ktnZQ0d/upy5+KcWhh812qRw4FMmzh1AoRXbg6q9QqFF87FRQRJfB/BtbnDopimy2gVih5AtY
 gRQ17r/SsH+jDc3dBEQXLdRHVlo4Os9L7MRvHkuhfrGE+xO902Li1cdXSKrf2mOtfvoEUOj7qcL
 gLOxqru+Jta42VssLOPArOn/TlJ20EQ8QGWm9XRmo7zHFqqRkOaqR8dSt0jrhqfoaCKwJQ3Mfow
 PrJGkskySCzJBiIKBmLz6yeD9k11srtO1xaR9fqCIs60xpp0FstRku0P4Gkz8wXHfe0Sh+im7wt
 KtrjvjS+Zq2I3yS+E/FFahbfm2yxU0cnrmt8Xr7v9UklILmjSShyB074O1BXSnVGY1SQ+JA32kO
 7xGramGjXU5nZkg==
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

This patchset introduces clock driver support for the Exynos5515 SoC.

Currently, the following CMU blocks are defined:
- CMU_TOP (handles clocks for all child CMU blocks)
- CMU_PERI (handles clocks for USI, watchdog timer, etc)
- CMU_FSYS (handles clocks for MMC, USB, etc)

This driver support makes use of HWACG (hardware automatic clock gating),
so gates do not need to be manually forced on with CLK_IGNORE_UNUSED or
CLK_IS_CRITICAL. Rather, the hardware handles the clock gating.

Support for more blocks to come as support for the the hardware requiring
them is added.

I am getting some checkpatch warnings telling me to check the MAINTAINERS
file, as new files have been added. I am assuming these can be ignored as
I am not a maintainer, and the whole clock driver and samsung subsystems
already have maintainers listed.

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
Aiden Isik (3):
      dt-bindings: clock: Add Exynos5515 SoC
      clk: samsung: clk-pll: Add support for pll_309
      clk: samsung: Introduce Exynos5515 clock driver

 .../bindings/clock/samsung,exynos5515-cmu.yaml     |  145 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5515.c               | 1485 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   57 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos5515-cmu.h |  191 +++
 6 files changed, 1854 insertions(+), 26 deletions(-)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-clock-3b4b7e6b1ce4

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



