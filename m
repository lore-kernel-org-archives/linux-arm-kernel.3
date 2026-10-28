Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67113606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPs51TWw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=McjKoNXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+BPqdivArSTnDxx/nLyMyQqfSMjb+Q3SA/a4HI7G+OU=; b=cPs51TWwIgHN92dq0MKIxahe6R
	9tzZDxTcnUOeCBHLdJKqvS808xXhDGj5WevrIRCJnTisqfb0IpO4Ynf618ECMwF7e4kfMfq8+83Ms
	0pvJKwo8fxxvaB5g78kBDoCK65eaPAWyyCsHVTtnQzBWSQ80/ypyTNE20n+jMR0SFbHFG/AB33NeO
	46T2mah5hs3Eu8XoXAy2hSbn5/dBhCxgDK2hgZO5SYqt9wDd2w3UHnLHiGci2qgYA9WdybXWm/JuG
	VPtEMXGUIl9XkEPyV/truJ0p6mjIkUqyvBZ1hEpA4ojnK8BsDDZTN9aCG9ESy4ceb13+GwRT2wr4p
	oL7kBGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM317-00000006yZL-15uH;
	Wed, 28 Oct 2026 12:44:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM315-00000006yZ7-251Q;
	Wed, 28 Oct 2026 12:44:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFDEF4093F;
	Wed, 28 Oct 2026 12:44:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793191470;
	b=3qQfLR9M3Jz/X+wc5XvOARSMs4LT12IgLNnd/cXpAexOk1pO8/SEY0GdGzQXjJqZRVbn
	 gXnTpKlq0k45xFAnyNARpJFB1JGwk7CcIwATiUfHJzD69UoKgDiQl5L8Ea06aNKltlsRQ
	 6WIbdOXPy6OM8hn6Qly5XNfftIxn7LoRAw4Bcwckjq8Un++eTmUnZkPSNW5Rg5xcYww7z
	 iy3XlOYbLgILpOitQTlUDVYHmcwHoYGi99HAWfmp0TuJ53lkXOIj5QV1L0S85daclOHdA
	 5ycn2Ti+2aJmalMZ6g3UHn9PQXE1iP42BjruJIUHGI0davPUCJrOjzGk9m2XgqW2YjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793191470;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BPqdivArSTnDxx/nLyMyQqfSMjb+Q3SA/a4HI7G+OU=;
	b=n7J/Uaa3Q4Z7KCPqirp0LWeSoKfYcw8287Xfq/oKgEtZjNLcFfCHix3y7TS6gSMpb4w8
	 0ZMwqwVCZUoSt6fpB9YsjTGsc390UFOIxO/Y28vLIy4PmcfJHCSVVx0XaIJkqL/b4qB1f
	 7ZCTQTt8zM33pDsAHwj+U/oe7Iq9TxhOM8kZYWwDlsI6aKttMJXy5rrpL0R+ywbzdZdb5
	 KbmT06LXqh0I9eVZHVoFE6yUX3UeEeS5sk0VJG0pbEr/20lha/l95V9ukn24f3xh1qr8i
	 4TwZWawU1FcUDuAugweyA6peMGeRHvFuqlTzWF6nTCb79htvp1lqqqIThW9L+B7K0xA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E8D51F01825;
	Wed, 28 Oct 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191470;
	bh=+BPqdivArSTnDxx/nLyMyQqfSMjb+Q3SA/a4HI7G+OU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=McjKoNXkLY6iD9z0dXPBPVukRkuMf7R+qpuFS/FS+BLMNL2M9SfiUlWwHndDJhBzC
	 EoAZspVJ5JoG4yBksohrVwYPfo3qKybSt7K6KkI5yuY3Gf57JpeiLQIq63wxtRoYeH
	 PwGjgJ78HN8GzikEDzzMSYOrkhv6fBfEOEzxEE7i0zcVl2IN5A5QPLEb0M441I8wbE
	 h7ASsH2Hc4FUpkx57BMtUzOBHtmGK1ozdnWRWh1tUs8RjzaojcKNmvE5w7+9v9ourn
	 MkNqfXAU8Pv16xD1sY1NLE7hKaFzZ92gchvZ3MItvdjrwZBTBASIWMfKTe7Uuoexr7
	 6RRIEhB3fByWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9DD9245466;
	Wed, 28 Oct 2026 12:44:29 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 28 Oct 2026 20:44:27 +0800
Subject: [PATCH] clk: meson: Fix PLL enable timing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACru4WoC/x2MUQqAIBAFrxL7naAiJV0lIqxWWygLjQiku7fEf
 A3MewUyJsIMXVUg4U2Zjsii6grm1cWAghZ20FI3SupWeHpGjG7acLxopxiENXryzpqFAd6dCTn
 6P/vhfT9ze29gYwAAAA==
X-Change-ID: 20261027-fix_enable_timing-842bfa84d4d4
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191468; l=2238;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=YfHg1NjHkAGSOc2XXMaHJKDSXCBv1aRkCpS0Jq7/gDQ=;
 b=qTW8KkZNLM3nV9LOBSEEfQv+uKohpmDxYarjmNUCZ87YMmcC+ZjOFJeNXG7A7twBX6tKFMe48
 rrpR1N39P4PDMv+hoT7jDY1Y1lqjTL1eiOqT7SGtztMv14yYImlyOrh
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

The hardware requires a 50us delay after setting the PLL enable
bit to meet its timing requirements.

Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
may fail to lock under stress testing.

For example, enabling the GP0 PLL at 1512MHz may lose lock and
result in an output I/O error:

echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
sh: write error: I/O error

Add the required 50us delay after enabling the PLL.

Testing on GXL shows that the PLL works correctly without the
additional delay and continues to lock successfully after the
50us delay is added.

On A1, remove the redundant 10us delay before enabling the
self-adaption current module, as the new PLL enable delay already
covers this timing requirement.

Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.

Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..77ea2960120f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -368,6 +368,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
+	udelay(50);
 
 	/* Take the pll out reset */
 	if (MESON_PARM_APPLICABLE(&pll->rst))
@@ -377,12 +378,11 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	 * Compared with the previous SoCs, self-adaption current module
 	 * is newly added for A1, keep the new power-on sequence to enable the
 	 * PLL. The sequence is:
-	 * 1. enable the pll, delay for 10us
+	 * 1. enable the pll, delay for 50us
 	 * 2. enable the pll self-adaption current module, delay for 40us
 	 * 3. enable the lock detect module
 	 */
 	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
-		udelay(10);
 		meson_parm_write(clk->map, &pll->current_en, 1);
 		udelay(40);
 	}

---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261027-fix_enable_timing-842bfa84d4d4

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



