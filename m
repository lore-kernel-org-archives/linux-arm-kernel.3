Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1LkonKg8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M20hHYQW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Q2rTkuHKJkR/zr1Tuxl2mFpv68LPyzfxCs06AgRLmCE=; b=1LkonKg8HoakYaIe8leIoOSCfP
	vitua/I4jE+80lz4mc7WaJ313MzuvfEV0h94Dy06E1MtfNrGaVlw5UVv8PEYIUPi6Y2S7BWlOm9mq
	wmPP7VCm5aLZd3/5Le06+RdtpjYK6oYF4EAEo/po0y7POx/wmNREXaZWeyVdOHhJgV5H2S2eHG4CZ
	jBIxKAQpPBtGEuaQNHeZl9aC6ZyqYHjRCpFhvAxYWKBhbK97EpRNRiNSQcyT7ypTiF9KGP1g/A506
	RWZlA5Ds4LDG3680F+o0D3gt16YYerHfzGZXSBvORASvP6fO7vRQ6/F/C6jnIbsCyom2zjQX6hnr3
	yEXHq8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUG-000000038tT-0bMh;
	Tue, 03 Nov 2026 16:35:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUC-000000038ow-2Ayi;
	Tue, 03 Nov 2026 16:35:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8952A609EE;
	Tue,  3 Nov 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723747;
	b=Jl/ywiu1yknyS4YZS1DRoXuSaLcEfoE0uT5S/f7MxBQTiBdZ5TCQ74owrklb2/QNL43d
	 i+5g4sjyqA+Wb5IBXdrsVVpxz/veFQb9rWWEnMYiiHVaQxpI3OlT4p9eAMYofK5LSteaY
	 5R+bdcxaLYMj6OC9qhtjrrVxuqXwy3annAsQ+6yk6w0LNykClb9kTkKUuG/qJY1fZWKvX
	 P2Su3Gtro9UuE6SyDzhLqAA6v9J2nJ2m/CTJrLk57P6MDm9xAgzBAegP2WgW6btBXL3oN
	 D7XaKesdtkYs3XA9vMn8d4p03b6K7Gvd6CQFC8poqq4vdRxmRMZHNIfUt+clR7T+ZZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723747;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Q2rTkuHKJkR/zr1Tuxl2mFpv68LPyzfxCs06AgRLmCE=;
	b=S2b3bzPmF4Xxu5eWYLlqEnXJ3KxlkrlGfTDHd4ehplfwQe0lcIIE2m4iI/pA6IuS40Ka
	 pt1ppQfuNAJSaKN2kUgJ/Uq182Eibo+qxn/5H4Ijf4yKo7KQ+wZAbCubrqHm/Vzf+p+Kn
	 YF2dPRoQ3V/L68jaQn2mrk2eh/Jpx7OonT37zP8UDC0att/+iSc8Y01WmGDpct5hq580o
	 XbgcUu7TXdEV/rbW+9aoFWcdtGujlmmxpbhhdaeQMgm08CZbbPAdMmUIHmCs444lvoM8k
	 O1IdmYPzXdYSIOH7ZpuMDQo66r67YqzigG4xC3qKrri5u1xmy7iXKFbqb4QaiIffW4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5420F1F0093A;
	Tue,  3 Nov 2026 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723747;
	bh=Q2rTkuHKJkR/zr1Tuxl2mFpv68LPyzfxCs06AgRLmCE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=M20hHYQWkJqXM5xczjLsyKZN3QhOcQCMcOq8+Q470tPv8+f9cQuVJwUf+1tb4BrxE
	 SICEhRXAX+zRZYjOC6DkexFE5nkK0y5PDkQXGGzezehaiBV/7qRbsCQCw/zKs1pjct
	 RICKhVImWSMRtrv6RkJCxCJf2BekbVM5pQAG3Qf7EQgRjfcoOuJmRBcCjhjk3DZBj6
	 Jj2dkxaMqB5ZUil7Ln4qRyaQDKlq+eaJkUh5CjvImVft4zigOk4PUV0oYpszvJdE4d
	 o3yBHGCH56x5+31oFXyGT0O+p2zMXLH4e2VMw2br5pOEgE9aJ5hGToJNc2oK11xUFf
	 d6nAyyXW5N7xQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A5C2146A36;
	Tue,  3 Nov 2026 16:35:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] iio: adc: mt6359-auxadc: various fixes
Date: Tue, 03 Nov 2026 18:32:06 +0200
Message-Id: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNjXTNzMwtdM2NTC920zIrUYt205JRkc8vEtMRUQ0MloK6ColSwBFB
 TdCyEX1yalJWaXAIyRqm2FgDBa7lWcwAAAA==
X-Change-ID: 20261103-6768-6358-fixes-fcdc79afae11
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793723743; l=950;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=doV4JykRzr4qLWTGO3/PJI6VtFZkP4IiQqJpVVNcdxM=;
 b=i2ltcp1uL6i2XvvgCUd1gj6cSYYIA2wrRRRsy5ngfrRObEo6GyY66rDAMj/UvULuGnKd2ynJt
 k+j7WbSQMzCCtusU1GCX49q9HS+//kVCDde493ZyOXlNeUh1BetuHwo
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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

This patch series fixes various bugs in the mt6359 auxadc driver. For
some reason, the driver had channel types for temperature or resistance,
while the ADC can report only voltage. There were also issues with
battery channel ready bit masking and scale calculation.

Changes were verified on the mt6358 (mt6768 platform). Compile-tested
only for others.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      iio: adc: mt6359-auxadc: correct channel types to IIO_VOLTAGE
      iio: adc: mt6359-auxadc: mask conversion ready bit in mt6358_read_imp
      iio: adc: mt6359-auxadc: fix scale calculation

 drivers/iio/adc/mt6359-auxadc.c | 88 ++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 46 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261103-6768-6358-fixes-fcdc79afae11

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



