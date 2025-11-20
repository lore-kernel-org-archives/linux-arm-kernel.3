Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22B9CF64A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WkAfLqtamHjQxL40IAzYfMT/HFY/QAr+k+7LDKQ/6aI=; b=1Hddk7uo+63pREQ9rVahQV3ojI
	OG/JMqVAAfCrIA28oE5cegHLJrcvImNKLwOxjHQJpQ5f1RaoHfErImPuixNZDmsuH5WxxLoG27lDw
	AZV4vAbq1s2maEWcmAmKL+ABSOSY+wp38hqLjgXdb/WUVSevw8wf85R8JtwL0tckQIPlQIY0AMsnq
	cEuQdcZhqj+BcBE1ifyNxgpubutvexgIWXSdPUCxRvwPjVYjb4vvQV/2e5oH5Z9gTqlAqvx5H8RbM
	Kzk7QInre9aY/BZUxSG4w/0TIxG1mVqGji9XwHdNFECPQBIur4MPfSa/IflcUB5F2FZ+Pq9B30VEa
	DEbRmvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLucZ-000000060VW-2MLW;
	Thu, 20 Nov 2025 02:42:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLucW-000000060VB-3HgS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 02:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9D7B4041D;
	Thu, 20 Nov 2025 02:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F230C4CEF5;
	Thu, 20 Nov 2025 02:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763606523;
	bh=RQA4DSszhtoPx+DkNRc0LnzUIq3VnAKOmWO/RptSvB4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=a+mLQVSuF6JDeXUW9NOIaMQw3FmyRZCowhxEmnamo3QaZoWTkrUniFnX16xDDWuEF
	 J/I/6zr3gSqCQoNd1/u2zqemtTVTa8JuBFW8rDKA3SUWz8m7Vbn+WTfQBi1XeQ0Tb1
	 FQ+F8U2slyovGOdp5KXOpXyW6nuDVIoKfyK77zEXinkJwiTZ4AObBFyMATy4ew18GD
	 ilIRjU4UUA0pUAy5QVwWDTQ/UPP1yU6Le7wgkLep9kFMurajYvrFGw32WYtI2qdXAr
	 tjRhA8vuhLMDwZw1gQJDFt5L9FijDmb1SCYGiekcT0367bye2TED31SOpqswaWApvI
	 ed9iY86nluCHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73451CF58D3;
	Thu, 20 Nov 2025 02:42:03 +0000 (UTC)
From: Kimi Chen via B4 Relay <devnull+kimi.zy.chen.fii-foxconn.com@kernel.org>
Date: Thu, 20 Nov 2025 10:41:37 +0800
Subject: [PATCH v3] ARM: dts: aspeed: clemente: add gpio line name to io
 expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-dts-add-gpio-to-io-expander-v3-1-cb650ac76f85@fii-foxconn.com>
X-B4-Tracking: v=1; b=H4sIAOF/HmkC/43NsQqDMBDG8VeRzL1iYqK2U9+jdIjJqTc0kUSCR
 Xz3RqdCoXQ5+N/w+1YWMRBGdi1WFjBRJO9yVKeCmVG7AYFsbiZKoTgva7BzBG0tDBN5mD3ki8u
 kncUAWppKGNOrWmuWhSlgT8uh3x+5R4qzD69jLPH9+5+bOHDoZFMrU14EdnjriaD3i/HOnY1/s
 l1P4lNsfosii6pVVratVErW3+K2bW9A279oHgEAAA==
X-Change-ID: 20251106-dts-add-gpio-to-io-expander-a4c32ccf56aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, Kimi Chen <kimi.zy.chen@fii-foxconn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763606521; l=2490;
 i=kimi.zy.chen@fii-foxconn.com; s=20251105; h=from:subject:message-id;
 bh=LiRNEgcfoucbbjiQuw4XmBH0VHtCLMmaT5yizVx4fo0=;
 b=bW2nCz1owxiEGjHrPYtrqcOLNEKTMxvDiP9O8iYZnZpW/aqlGnvlIAXLHxGg5ija5EH41Fbqg
 ZiQnns1CaX9CsYlbxLYUVOqOpvxucRVXF6RCfX2bhGqHTCTbpHfOve2
X-Developer-Key: i=kimi.zy.chen@fii-foxconn.com; a=ed25519;
 pk=3zHetsW/3CYYIgQlYV9dqSS7aW7aZXLUaIvc+OKr3NM=
X-Endpoint-Received: by B4 Relay for kimi.zy.chen@fii-foxconn.com/20251105
 with auth_id=559
X-Original-From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_184204_866274_1FA0DD70 
X-CRM114-Status: GOOD (  13.60  )
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
Reply-To: kimi.zy.chen@fii-foxconn.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>

The chassis power cycle process requires a forced shutdown before
cutting off the standby power. The SCM CPLD implements a hard shutdown
host function that is controlled through the IO expander in the
Clemente platform.

This change adds a new GPIO line named "shdn_force_l_cpld" to the
PCA9555 IO expander at line 10. When asserted, this GPIO signals the
CPLD to pull the HPM's SHDN_FORCE_L pin low, which triggers a forced
host shutdown.

Signed-off-by: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
---
Changes in v3:
- Improve commit message clarity: restructure the description to clarify the 
  complete signal flow (BMC → IO expander → "shdn_force_l_cpld" GPIO → CPLD → 
  SHDN_FORCE_L pin → HPM → forced host shutdown).
- Rename GPIO line to match the schematics net naming convention.
- Add rationale: The current standby-AC power cycling process is suboptimal.
  When HSC power is turned off while host power remains active, the FPGA may
  detect a power fault. During this fault window, the FPGA—sustained by holdup
  capacitance—asserts power brake and initiates power-down sequence. A forced
  shutdown before cutting standby power ensures the FPGA properly handles the
  AC cycle event without spurious fault assertions. This patch enables the BMC
  to perform forced shutdown via the IO expander GPIO, thereby optimizing the
  standby-AC power cycling process.
- Link to v2: https://lore.kernel.org/r/20251107-dts-add-gpio-to-io-expander-v2-1-585d48845546@fii-foxconn.com

Changes in v2:
- Add "hard_shutdown_host" GPIO line name to PCA9555 IO expander for Clemente platform.
- Link to v1: https://lore.kernel.org/r/20251106-dts-add-gpio-to-io-expander-v1-1-b4765c092ebe@fii-foxconn.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 450446913e36..14271be4ff3d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -983,7 +983,7 @@ io_expander4: gpio@4f {
 			"",
 			"",
 			"",
-			"",
+			"shdn_force_l_cpld",
 			"",
 			"",
 			"",

---
base-commit: 6953afcd81a2cc73784e3dd23faa0a1aaf97441a
change-id: 20251106-dts-add-gpio-to-io-expander-a4c32ccf56aa

Best regards,
-- 
Kimi Chen <kimi.zy.chen@fii-foxconn.com>



