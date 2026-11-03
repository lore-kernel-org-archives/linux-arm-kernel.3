Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6557A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwBSQQRz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3HxGv+W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1gdqOYKlykeDMjNrInWMx9d6T1s+WWML0Tnqk1SqxjY=; b=cwBSQQRzHUKEMVqc2XFlegvnjV
	cEzhFmWORGc3LC4ASefvL5aJesaoC6oGWpA7HZTTfxRaJtujZJi0JxAUp2kpU3ha8coJ3x8GsWH/U
	Gdewl4ypRI4va8jt+CdNMmdRUOE/RGKFtowQij014TypnucmCiTWIQ9ERiI46yJaMF7izolD437Ly
	bxJgCUnItzZIgqGI3fUf47BUXW8xGvY6O93bsgr7Nwxo5SAgocd3Nh/u+VDY1Q6e0XSyMsvlSqiyK
	9l0nyqWi9gaWf4xpnXjLk1hGZpYe++pyxWzDaB89LCLIOATPg0IFmU0CWj12j/92nman5GRKZy+tn
	9brswQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUC-000000038p8-1imi;
	Tue, 03 Nov 2026 16:35:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUB-000000038oS-13IQ;
	Tue, 03 Nov 2026 16:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8D08409D7;
	Tue,  3 Nov 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723746;
	b=DPZCazyoMffFxf+ZCKFuG21lh1Tx9p1M3qjK5iL+lsgrhIvoTKNqnN9/fP/uSL6feV30
	 kOy8fQ/KiWWnpvjFwGRd3DwpqG+01ZoeFkeEamcXUSL8hi+SBgoWwQ1SgjgBgszepsWVf
	 AGhWRrNXWvaWbIlfg+fH3daSE2J9eHI1ME/WjLlzocv8j0o3eoLjmBvSRjusTGf+BEHhH
	 5a/ZhAoGi4UTl/w68lamEbLcMcxAl00iDnnykQOZSINIO2kSf3K1ROjFx63gLkbeD/ksz
	 3NyUiyKZpgBNrnYIG446nNb2Wo/ILKxJkMtS4TOxpdPnDp8rq2u+x172ljDls8Hojrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723746;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1gdqOYKlykeDMjNrInWMx9d6T1s+WWML0Tnqk1SqxjY=;
	b=OjaZG+ixq/4s+LtSam5KimtLqc5Of+LQUPXHTTfuS9Au4BlGHofzz22qFP7jjj2+2QJ6
	 PAzTkOldOqofAhQKQWCL7KsSwfWC9QJfbRYhT0nUrRh8TRP3wWN/jcAwlgDPlwOhPVfXR
	 tQGoMC41yWhyZl+A7AUeiVaPYCg63nresumznvIWWo7PBFg9EWtMCTMJpW1qlegrf5DAu
	 Kp2NPsvMcM5cNSW99eq4OpUUEM6xPPCxcRknPI+4zsyKxKpu6+oCRSNkTAFK2jzVpBTPG
	 emMDiZNlbZTp28bHRooT9seonkRAX6d6xQ4Yr4IpLWLVf/ldQN/BRTj2l2Rr+ie72uA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B3B41F00A02;
	Tue,  3 Nov 2026 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723746;
	bh=1gdqOYKlykeDMjNrInWMx9d6T1s+WWML0Tnqk1SqxjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U3HxGv+WKizr4CCZFyTgYDsvuIq4XBqs3UU7kj4wbtZTZVPo9zl0VepxssKOySCXl
	 hfaW5bTmcENyBSpQYIDBdPb4nBsNDFAJ3q5Z/XMR28901T2IgKKoVKpcaKZ4aBoII+
	 VXxh7hHkQJFOoEQtwSLZMR/kh/O3Ua7u8E92yvjRV7Z+DM+EcQqcJgxK15/zXXw5RB
	 zOd58YR88L1OQIM05LAAx9f2pkgoJJZP4qlPORxQUw/s5NXh701CPjXhyPVFIVHbmK
	 weo/2KGr3naFgqxdLf+gaFCQWdZQNAirWoO2ocNRxIWpYZtku6AMdxoLkaccsYDXli
	 yTZj7mQIr5Ygg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D719746A3E;
	Tue,  3 Nov 2026 16:35:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 03 Nov 2026 18:32:09 +0200
Subject: [PATCH 3/3] iio: adc: mt6359-auxadc: fix scale calculation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-6768-6358-fixes-v1-3-2a868a33152b@protonmail.com>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
In-Reply-To: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793723743; l=1136;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=R/Vgi/Hmv+iUny8kYvdB+lQ+e0rpx+YnD5NeeGn0NQU=;
 b=Ezy6TSOcsGzfCu0rU7JGw9B0yFsyUBQrW5l7OFzfA2ilmV3BjvHHzojotw8pFI/KqAKTiz55m
 i9/lIENPNMJDO6inOzG1kNoU/VraL7W4N9bCNfNqMKxXsgfsqzYDIDU
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

IIO_CHAN_INFO_SCALE currently returns value without dividing by
2^realbits, overflowing the integer to an invalid value.

Fix this by using IIO_VAL_FRACTIONAL and setting val2 to the ADC
resolution.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 09432d0974cf..3a969c30f633 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -770,13 +770,9 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 
 	if (mask == IIO_CHAN_INFO_SCALE) {
 		*val = desc->r_ratio.numerator * cinfo->vref_mV;
+		*val2 = desc->r_ratio.denominator << chan->scan_type.realbits;
 
-		if (desc->r_ratio.denominator > 1) {
-			*val2 = desc->r_ratio.denominator;
-			return IIO_VAL_FRACTIONAL;
-		}
-
-		return IIO_VAL_INT;
+		return IIO_VAL_FRACTIONAL;
 	}
 
 	scoped_guard(mutex, &adc_dev->lock) {

-- 
2.56.0



