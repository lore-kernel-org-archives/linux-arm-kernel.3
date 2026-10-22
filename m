Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XnRg4WRX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+/GU+Zv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nwMxmAB7zKCpQjoLCsCioWT9WOsoTyLEjiLRi7z7+AM=; b=XnRg4WRX/iJ1jTvf62DJuCxQE7
	XUowah+SaSKeHQA3Yw3GKQUIh9T4KZKwphNV912sg98RsEbcJ/h62A6GzScuBwBcKpTPSoKtNJWUv
	SIFMu3o5gmWAkqvsCwHNrD5avPrNGjfu87xaXxeKM7yiijrsZ8W31JzlwtyhmDxMA7UiAUxpiBvIx
	mfkC/MAO7FVill4OJU4Y5viLRWn+Htm9Mftk6Rig9XMpWD+wTWr+2sDgJk4fUzsgW5A/v1YpDbd0t
	HwLc1urldkHaIqcvA+RCWiz3AGLgy9FPxurSdRK3a5G76LEDTuXDxL0kBHzWNFrPJZHBsPNESfD3b
	/2JVVQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0j2-0000000F2S8-2fWv;
	Thu, 22 Oct 2026 21:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ij-0000000F2A3-3sqL;
	Thu, 22 Oct 2026 21:53:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BE6D60A53;
	Thu, 22 Oct 2026 21:53:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705989;
	b=w5mjGfeHGD9hctfHTCp6FMcjrbIvBFFcyScT7xlZdkZTBZoYqsW6/c8ZCC5tpvUDOcA/
	 I8SOtbm1Yv8V64OOYxrk1nl1FVflcmRcGp9QR3ln0qVthiF5ZSxNczQ39RuXnV3WYfY0e
	 4C/piG3l1hWnZQ9pfaB5URobcBRSawcetIl4NESzNBOVep8AsyeMVUwfj3eYM41D1zXt6
	 BBO6GNts9OsXUpTjsU/v6rI9V0t6dXoCP1WNjL4+Xu4EP/HGBEOPmuVmbtvtFJDskQIFo
	 y302/INPTHlbip5YT9ohEXHiBU1WJ6yc9ntSbXnEkP7xlcBa1S28gJ+Xw1l2dWMpilQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705989;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nwMxmAB7zKCpQjoLCsCioWT9WOsoTyLEjiLRi7z7+AM=;
	b=due8GBSK6kKNSSd+3lUDcGSDjWciO9xAG7mkJc2UDaBHIKCwLUgk87nOsFB0glZLUrBZ
	 C1rou37yCnihQdTJOIaHJ9a5QIlCxiVzTOMs987vYN5s4XPpRGJVYQE1PSy6wcZN+yWKY
	 phiPoDFaS68+jjHfPDOVt6hg/x9oD35blna5yfB6Hh6uBcxEZWbcv7cJyTpppk8a35PLu
	 yR2QdYH9EtS2tpeBVEeP6+SUByPtgMbkkJhAbF4uz7oj5XGxyw7yPco6eBhnHEg6chUTF
	 m8x02AGOGpZQfhJn6mKOcv/U4cnH+KX5DTo0IWb1C7znzOYkfRopji/aDcozIKkSYCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AAD61F031E4;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705989;
	bh=nwMxmAB7zKCpQjoLCsCioWT9WOsoTyLEjiLRi7z7+AM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d+/GU+Zv9XcJhflI4ugnEoASJ/y9LaoIyzUlAKyJ0CsfKvUGFzke8MG2N4W/3KrAw
	 j24ip0dkkeGBloWBVbaCKvBnQvtiWVJZ1VfZix7eI8WV9LZbiEiZ7fIC07OE+M644i
	 Oh626I/cn4NLw3Imo1hIZ3+yEfjDgVjlmzz6rd5qosC3+FvRuvNqqhtPs5y3pQtwto
	 XGH4adH8zr7lOTOKHTx0m8WyjuCRAvnimqfbOR5+q9oBCnE/pWISeMmonF/5OeFwj3
	 InTeQHyHzAzOXW5djBlkLD1GjFFQHcl09cjRkJCxkiLtoRHUluqN3IvzMxv1mxBN3g
	 srH6JgZ66WyUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF13341F99;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:41 +0200
Subject: [PATCH 3/4] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV
 clock ids for g12b
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-fix-g12a-clk-v1-3-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
In-Reply-To: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=8rtE4N9DTIQOCn9hKMflNgrg74QraAIVcHNIzm/ZuJM=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1n0s9qH3l+eu4Wm6GXlp6aT5T9/8n/DwbMqtNSfj3
 fe2JItO6ChlYRDjYpAVU2Tpn2t54t3lo2e+7lFPgZnDygQyhIGLUwAmcpGfkWESw7Y2JtWzi/Yy
 JB8P2ZTEZvXz8VmF0K7WNfw1alv5j/ExMnSVMu23YbFfeEHhf/N21WM3+GZdD65abmjvvlXNdp/
 AVB4A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In g12b onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: d43628e9bca6 ("clk: meson: g12a: Add support for G12B CPUB clocks")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 07105b2089c3..0a738c3c7fb5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4849,9 +4849,9 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
 	[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
 	[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
-	[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
+	[CLKID_VID_PLL]			= &g12a_vid_pll.hw,
 	[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
-	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
+	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll_div.hw,
 	[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
 	[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 	[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,

-- 
2.43.0



