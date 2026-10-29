Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5F7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Au6/Tke3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEXYskPS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lRK+vR5DapZgqS0HuHWspANx/juMaX+qmJujqAN6Rqo=; b=Au6/Tke3eL0T6mpHPu50eP4aWk
	rLBvNBQa2YUPzc5WMgZMcvvVdDBZAH3OMgUJs3PCj6H0WciOLzL4Sm2xNjr7eNJdLL9jBhzDs6y0O
	Cv5oWfKyRRPsQ6tIdCd8E68RwA+jIHYsRdPhY5N6FVrPw0+sUctBO9xr0+yzmzh2HV2vW/n7t27E+
	/wsk5FCFos5x5Wj0Zqy1zWKRwB9bSgDnaeWw7jk735yM+vQ1IpFYvYHBCipCXJhg6U4w93MkDzMXm
	NkVJRbFuWbBPV7WjMxxdd71H9yUwIfZG8Coi5dFe4ftUosEeInQRp5Q038YwlTyoTbIP+ERaoAz/m
	HNGEAkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMTi-00000008r0g-4C5Y;
	Thu, 29 Oct 2026 09:31:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMTX-00000008qvO-3nU9;
	Thu, 29 Oct 2026 09:31:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED95C6021E;
	Thu, 29 Oct 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793266270;
	b=ftLTyQZDEsdyH0Sz7Ubxv+60Z4ZQV9pkxl7b+XXrteunBa2iRnXP/Kzz1V4HPMT42eUF
	 IPutoWScgq7p40QuDcOz58coJtwus8JQwt4DuKo8VSrxBGcNHctIDnA/XRYaYX/X9z/KR
	 rflPFcXnPuPU6WDo2rzsjnmWBtthM+fWxF/db33UsZs1C+LEJVYPVmhBVwPFhFBhkWfhp
	 DJ806ggpLC6eYlM/dy9JxQ4lQ8eN8ZPZAK5Qvj85bo/jh4TfRicvmesJIYFPHvsO5/I2x
	 9lAxtrWXqyp6DBCS9YIrWivhP7Cd3w91XWq2ageFaDthNZ8l9V7IsPk9QanPbIsqqhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793266270;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lRK+vR5DapZgqS0HuHWspANx/juMaX+qmJujqAN6Rqo=;
	b=UgsBMAXIJI2PclW0Tc6wQjM1sJ75wMsDmWBdif/QLliyv4x6cNbJdFA4qkZBGu2Qavnt
	 ANkLN1Bix4hGgR8J26/1LfTgBWBY8JBtBBPcG+u8AcZBpbfxmw0DQSfYTeyhiDOlvjzWK
	 NwUvNG/uXhJTk7seg1DfJaClf2l0dWrH9EGERUnHt8Fe0zzNy3184tEH+nyT4wPNiaTYM
	 kME+O2QwDYdgy1ksuRxf3DcHsYJ3htU+S5hssSl4P589jdkTLza51mI8WglVw5lk+OLh/
	 ycusWKfwZn0VU+9FKqDJE9oalqQHNJSmw7YRXDfZlaBpO/RyLkfviIrPfEzQ/FjrBrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0BDA1F031E9;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266270;
	bh=lRK+vR5DapZgqS0HuHWspANx/juMaX+qmJujqAN6Rqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DEXYskPSDmCO5wb3o7F1LKgNTAJ+QD+Q5DlwGhifui1pLhA8qxCVUBQEn2+S6KgEX
	 o0Y1tTqglhc0EXC+GrlaJuMP8r/KQ4+QYVquHxP7auvBlxN29bmygMz91VSiETrXSf
	 Z/OAZMBjGoEg+togOxQ+eqbnsB0kt5p6FaAupJ8QizibJHb/SiaIeJDcMB9m/Ghx5P
	 qxRe6puU5KAW6MWc2DOiz3AuzK1PlUkspCefOmW7bOZXhUU33uM5X/i7hZ/0WxdaYd
	 aFkg47qAJABIKynnmpAWO5Jj48UBHP/Xh66nu2kSq/bINv19e7D2cxT1CHgFOJ/SMU
	 ddBgEoq82R8oA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32CF9457C0;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Thu, 29 Oct 2026 17:30:53 +0800
Subject: [PATCH RFC RFT v2 2/3] clk: divider: add CLK_DIVIDER_INVALID_ZERO
 flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266267; l=2646;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=erjQIBkjDA84dTVLTzuE89941kvEx6V1M15mAHbEPe8=;
 b=M75Y/COMa5W9P7iRc1XOwuaQfgaKCQJcQkJtXFEVpP2ZItZa3Z3j5x4GpxtgBUsuhYOXxfLUk
 EUICoiNiwyoD68vezXaTQdTyxvh7+B/yg7YLCsnpmyKeXtnwg69fDeW
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jian Hu <jian.hu@amlogic.com>

When a divider register reads zero, divider_recalc_rate() currently
emits a warning (unless CLK_DIVIDER_ALLOW_ZERO is set) and returns
the parent rate.

This behaviour assumes a zero divisor acts as a pass-through, which
does not apply to all hardware. Some dividers, for example PLL
pre-dividers on Amlogic SoCs, come out of reset with a zero value
that does not produce a usable clock. Returning the parent rate
hides this fault behind an incorrect, plausible value.

CLK_DIVIDER_ALLOW_ZERO only suppresses the warning while still
reporting the parent rate, so it cannot represent this hardware
behaviour.

Add CLK_DIVIDER_INVALID_ZERO for dividers where a zero divisor value
is invalid. When this flag is set, recalc_rate() returns 0, making
the faulty state visible to the clock framework rather than hiding it
as a pass-through.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/clk-divider.c    | 3 +++
 include/linux/clk-provider.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..6c1523d22477 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
 
 	div = _get_div(table, val, flags, width);
 	if (!div) {
+		if (flags & CLK_DIVIDER_INVALID_ZERO)
+			return 0;
+
 		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
 			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
 			clk_hw_get_name(hw));
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index dc8e161f9c2c..fe2dbbba49e3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -744,6 +744,11 @@ struct clk_div_table {
  *	big endian.
  * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
  *	Formula is 2 * (value read from hardware + 1).
+ * CLK_DIVIDER_INVALID_ZERO - a zero value read from the register is not a
+ *	divide by one / bypass but an invalid setting which does not produce
+ *	a usable clock.  recalc_rate() returns 0 so that the broken state is
+ *	reported to the framework instead of the parent rate, without
+ *	triggering the CLK_DIVIDER_ALLOW_ZERO warning.
  */
 struct clk_divider {
 	struct clk_hw	hw;
@@ -767,6 +772,7 @@ struct clk_divider {
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
 #define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
 #define CLK_DIVIDER_EVEN_INTEGERS	BIT(8)
+#define CLK_DIVIDER_INVALID_ZERO	BIT(9)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;

-- 
2.47.1



