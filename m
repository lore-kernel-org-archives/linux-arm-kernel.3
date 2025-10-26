Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D557CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkcHqvm5oausehLopYq8VBGOO+MgKovuBr++31BH2t8=; b=Lrun31RQLe/3cq32CPzsDZS0eA
	IkZzaessXdVaqxhZZ335YT6PwvY4XkKOcCEdSvqeYPzr3gouAWisEixZkDyTm5a/5VtFvXfDlaP7B
	FfE0hvIeTAAXhV7QWkqlPMmH/eTIjNEw1b3PMtthgY8nsCDvQDs3405FhaZsIRc+VJ4fk4iahDOEx
	l11NcWK4GVC3qrXU+543+ZA68X+MIgNoMdzY45cAhr9y/CbCdqZ641Ask3tjsW1TbSd4CkcBc0Nhu
	gFJ488t0Tb3tDZRbyLWr7uliw2lWsQKlV01gM98haPrEK+DcXT/snqeiuWv0BEmJscfuwzUKhXQTu
	U/ohhraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25e-0000000CSXw-26Re;
	Sun, 26 Oct 2025 14:51:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25b-0000000CSVC-1fHl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1989D43C95;
	Sun, 26 Oct 2025 14:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F826C4CEF1;
	Sun, 26 Oct 2025 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490283;
	bh=6TWHTS7reub2A02Su6wGVDL/IsI4EyEuJgfG8j6eSR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HKMQXkDZR8iRmAzhaf5BY+bG0Xm3tI+zQGBvB1U4g19NIsqwMjL//j8Ok7Y6ltNpx
	 7msvA5TH1b4mbohAgDyTedG6IT8mkNVSwIYa6L1NZzIl+BprysTPjU4zL9FACaFLLk
	 dSRil39mhZugxxI0JmW3L7aT3V+7IDgQprbNe6OSZhENXKe/ucg0v35SzUbLDwEAV6
	 U6cdsxLpdd1mUzJeiO/RBQl/DQATfJ7+vPO9A3qLntRHeICcEXJnL4Q91zUxXTzfuJ
	 /bq381fHjH69kjKxlvw1+NoNhONqmjuyLZmvkOInNnlVTf87KdrxGPq58He/6JDcxa
	 J4179SZA1Pdog==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.17-6.1] clk: sunxi-ng: sun6i-rtc: Add A523 specifics
Date: Sun, 26 Oct 2025 10:49:16 -0400
Message-ID: <20251026144958.26750-38-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_075123_474223_6C0697D3 
X-CRM114-Status: GOOD (  16.06  )
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

From: Chen-Yu Tsai <wens@csie.org>

[ Upstream commit 7aa8781f379c32c31bd78f1408a31765b2297c43 ]

The A523's RTC block is backward compatible with the R329's, but it also
has a calibration function for its internal oscillator, which would
allow it to provide a clock rate closer to the desired 32.768 KHz. This
is useful on the Radxa Cubie A5E, which does not have an external 32.768
KHz crystal.

Add new compatible-specific data for it.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Link: https://patch.msgid.link/20250909170947.2221611-1-wens@kernel.org
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:328-346` adds a dedicated
  `sun55i_a523_rtc_ccu_data` entry and wires the
  `"allwinner,sun55i-a523-rtc"` compatible to it, which is already used
  by the SoC DT (`arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:683`).
  Without this entry the node falls back to the R329 table and leaves
  `have_iosc_calibration` unset, so the SoC never enables its oscillator
  calibration logic.
- The calibration flag drives the guard checks in
  `ccu_iosc_recalc_rate()` and `ccu_iosc_32k_prepare()`
  (`drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:83-178`). With the flag cleared
  the internal 32 kHz path keeps the default ±30 % accuracy
  (`IOSC_ACCURACY`), which is a severe timekeeping bug on boards like
  the Radxa Cubie A5E that ship without an external 32 kHz crystal.
- Once the new match data sets `have_iosc_calibration = true`, the probe
  stores it via `have_iosc_calibration = data->have_iosc_calibration;`
  in `sun6i_rtc_ccu_probe()` (`drivers/clk/sunxi-ng/ccu-
  sun6i-rtc.c:352-360`), letting the prepare hook enable
  `IOSC_CLK_CALI_EN` so the RTC clock actually converges to 32.768 kHz.
  This directly fixes the observed drift.
- Risk is minimal: the change is limited to a new compatible entry that
  reuses the existing R329 parent set and does not alter behaviour for
  any other SoC. All other compatibles keep their prior data, so
  regression surface is effectively isolated to hardware that already
  depends on the new compatible.

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0536e880b80fe..f6bfeba009e8e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -325,6 +325,13 @@ static const struct sun6i_rtc_match_data sun50i_r329_rtc_ccu_data = {
 	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
 };
 
+static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
+	.have_ext_osc32k	= true,
+	.have_iosc_calibration	= true,
+	.osc32k_fanout_parents	= sun50i_r329_osc32k_fanout_parents,
+	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
+};
+
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
 	{
 		.compatible	= "allwinner,sun50i-h616-rtc",
@@ -334,6 +341,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
 		.compatible	= "allwinner,sun50i-r329-rtc",
 		.data		= &sun50i_r329_rtc_ccu_data,
 	},
+	{
+		.compatible	= "allwinner,sun55i-a523-rtc",
+		.data		= &sun55i_a523_rtc_ccu_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
-- 
2.51.0


