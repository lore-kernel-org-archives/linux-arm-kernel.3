Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBB606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYyAXPV9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j73r+lT4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RZFjcUKLDQB2Qqzwh+QT+vaE3N63TGAe0FwqXRZaMiE=; b=hYyAXPV9v02e2CozZlqgSD6M15
	m2whMbavTZQlEsGuCvJ/ahZfp+ayF/pDH0a57JB9mJXYX5DRaTYT7iSxnPO/fjItgCd3L6KCECnqM
	M30xG4kY+qIiX+LqJYonSANQQQXOqnOPAxeNnfgHeW36KE6LqhvnV1G8CR5Rabtr0tr/7hf4m9Q/L
	JuV84i+kP0trIYm9Xg2v+q8CfyutY/JjCt/IEmubmqreiAJqOh4VnEndaNPQonH4q19JK+MBm0TXf
	q7kvGLZNla76z/xFrwT5P++Yy3PeNf+yY1g1D2cMxBsu0e+mmoxQU++6fRvuuLsSS1Wqa+p5uomN7
	xgKHJtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAWg-0000000Fv2Q-3omp;
	Fri, 23 Oct 2026 08:21:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAWf-0000000Fv2A-0qKT;
	Fri, 23 Oct 2026 08:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A518340A1D;
	Fri, 23 Oct 2026 08:21:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792743680;
	b=yqumJyKUIwjsAXvSZEixJacibLfnkBa+d7NYfvhkGAiTuYDT733LNH9T6l3xB8c4CcY0
	 iHHWyJVNlZ47vacEoFq1kwe5N62hmQQXRh+fETrKkDWjdATTdluCcBxpJhdDxVp26TazD
	 7it8JyrCYbwFUDZjpJZKRe2nDabKtooALNW6qiU2lCX6AEzAvfPMLB42js8vi+lpxYPLv
	 xWNTlIyUdddq8p4l7IuxJ52gotOsmPrL4uDhzG9ecc7tANFBIqtD1+Kin50Ht9W+JitRa
	 AosPELMRKKmvx9oVHBoDgYnYe+8cRNAuSGwLX4z59QLGIam/ei9LuPHAK+tDgKLu3kQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792743680;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RZFjcUKLDQB2Qqzwh+QT+vaE3N63TGAe0FwqXRZaMiE=;
	b=AAhY0Y0n13RTqoCqQaPZn/Tof9MngJXjnKG0jkRQ1zQdTfNmPqbdrVZSFION+jdRHX+E
	 fC9+V4a3cE1FPp0U+0qCa8UFUe9O5rvawcgc3kGhkEcbHouD/sh+LOlotcQS6frmrhtdF
	 MGoPT5skZwThiWarwYs7WHbkoWNigUVnrBB+JpUHI4G9n19evwgqm4wcwtuQ6aPVhbHh2
	 LWsD59Lv/6rpeWOKhhF8M3txIAAsJgZrfJJjLZPV42OqWj+iErepZITkLRr5pfPCPOvHl
	 XbA3ohtZZ3h2FOKz5bugczxC3a/g+Mc7AqICy/gU7R4jrfwXSdlCzCOftFTkDBXli5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFF6C1F01825;
	Fri, 23 Oct 2026 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792743680;
	bh=RZFjcUKLDQB2Qqzwh+QT+vaE3N63TGAe0FwqXRZaMiE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=j73r+lT4gTh664Jz/EMl3qFFghk9nujJvX6BWafr8b5iYg/u4c1MJ9aM2fbtH+YZ6
	 7Bq9oqt3kJfiNN/xAMOWDkZr/2S/qEQIMIOZbxHTz6MTAWzwLy2F6J5NhMob+chanW
	 cpn1glCQuXdkCJi5aK9O8w+4yIfX/0V+d1ZlNUaeHFfhMYeVbJBLm7U3Utmk7qDG8V
	 w/CjiG2PBroao/yM4ChQSxTd1DmDnzngKfh4q4vKnknk5Yx2Lsg4M2eAEQv/eOZdvg
	 ycgFGaGoYpu5rXNQDqaMnNIKLE167dXwegBThFou6fNjIzKjAJPeGsCp1Rx+tRjhX0
	 lNEuMPQIXoCOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6FC1F4441C;
	Fri, 23 Oct 2026 08:21:19 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Fri, 23 Oct 2026 16:21:05 +0800
Subject: [PATCH] gpio: rockchip: Fix debounce arithmetic for GPIO v2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
X-B4-Tracking: v=1; b=H4sIAPAY22oC/yXMQQrCMBBG4auUWTuQTqFFryIu7OS3HYUkJLYUS
 u9u1OW3eG+ngmwodGl2ylitWAwV7akhne9hApuvJnHSt046ftjGOepLZ0s8JYu8CnuMcQkKPru
 hH9RD4Duqj5RRg9//evu7LOMT+v5O6Tg+e9INuoEAAAA=
X-Change-ID: 20261023-fix-rockchip-gpio-v2-debounce-90767cde2ed3
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jianqun Xu <jay.xu@rock-chips.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743678; l=3798;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=990tz6V6xSqlnsWsntOcrs9gs3SDwAyWpRr2l3eS5jA=;
 b=MT2tjLEkyabOrZ4KFYK1MjnqubLChv5mTzLHiyvAzJ27voIKRUdgCfGc/HuEDJpf4r0Ur6HxK
 vjeJI+cZ4ILCoeBSjnIhtn2ioR6lVFz7/f31Em4yLqEq8ZqZtgJwf7S
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
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
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

The debounce interval calculations use unsigned long operands. On 32-bit
systems, the numerator used to calculate the maximum interval overflows
before division, while multiplying the requested interval by the clock
rate overflows before it is assigned to a u64. A zero debounce clock rate
also causes division by zero.

Use 64-bit arithmetic for both calculations and reject a zero clock rate
before division.

At 32768 Hz, a 1 us request rounds to zero divider periods. Subtracting
one then wraps the divider value to ULONG_MAX. Decrement only a nonzero
rounded period count so that such requests use the smallest divider
value.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
This pre-existing issue was found by Sashiko AI during the RK3572
mainlining work:
https://sashiko.dev/#/patchset/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com?part=9

On 32-bit systems, the unsigned long products used to calculate the
maximum and requested debounce intervals can overflow before being
assigned to u64. A zero debounce clock rate also causes division by
zero. In addition, at 32768 Hz, a 1 us request rounds to zero divider
periods, so subtracting one underflows to ULONG_MAX.

This patch performs both interval calculations in 64-bit arithmetic,
rejects a zero clock rate, and avoids decrementing a zero rounded period
count. The existing set_config fallback and divider register accesses
are unchanged.

Validation:

- A host reproducer confirmed the 32768 Hz, 1 us underflow and the
  incorrect maximum interval produced by 32-bit arithmetic.
- The combined GPIO arithmetic suite passed 126 cases for each modeled
  arithmetic width, covering both legacy GPIO v2 and RK3572 V2.7. The
  suite includes zero-clock-rate and request-boundary cases. The 32-bit
  run models unsigned long arithmetic; the 64-bit run uses the native
  host width. Both are arithmetic-level host tests, not ARM32 hardware
  or electrical tests.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Collecting data
  - Automating tests
  - Reviewing and adjusting code style to follow community conventions
---
 drivers/gpio/gpio-rockchip.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 77b239a9a601..714604c11d78 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -201,20 +201,25 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	const struct rockchip_gpio_regs	*reg = bank->gpio_regs;
-	unsigned long flags, div_reg, freq, max_debounce;
+	unsigned long flags, div_reg, freq;
 	bool div_debounce_support;
 	unsigned int cur_div_reg;
-	u64 div;
+	u64 div, max_debounce;
 
 	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
 		div_debounce_support = true;
 		freq = clk_get_rate(bank->db_clk);
-		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
+		if (!freq)
+			return -EINVAL;
+
+		div = (u64)(GENMASK(23, 0) + 1) * 2 * USEC_PER_SEC;
+		max_debounce = div64_u64(div, freq);
 		if (debounce > max_debounce)
 			return -EINVAL;
 
-		div = debounce * freq;
-		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
+		div = (u64)debounce * freq;
+		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC);
+		div_reg = div_reg ? div_reg - 1 : 0;
 	} else {
 		div_debounce_support = false;
 	}

---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261023-fix-rockchip-gpio-v2-debounce-90767cde2ed3

Best regards,
--  
Cunhao Lu <1579567540@qq.com>



