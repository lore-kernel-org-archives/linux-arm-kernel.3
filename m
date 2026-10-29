Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=unQy7Gts;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS6Ze+dq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=; b=unQy7GtsbxoGk+09dqhLuZG4B0
	m8B5HCDuXn96oP+jXZm+qK85Vq6eyDMm9mblj/1T9sgPrcdMHGUUXGx2glQqtmAQeb9aiXAIXUDWW
	hVVSv4dSgJrEI7GjIKJqz9NEd5kHfqwHSMifUhLxPd+N3AWmIq9ETlFBN5jSoRRRNtHgSVwDau8ck
	ebpcDx9E44RNP6aGvf8z1KpVTWSpjF7QoedgZpJHA+nkcq5OV/uftUW0mi5s+3zCaai/D+bSISYZo
	CcR5oyMh0//krzO4bo9xCYDvhQd8BSKAl33BOV5iUcR/FqZIMl5Zq6NykPRS5ZFzF/zHRQcMBXiIs
	WWprZURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTr0-00000009xj9-034E;
	Thu, 29 Oct 2026 17:23:54 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTqr-00000009xew-3yXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:23:48 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-9906870a9baso1258782241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294624; x=1793899424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=TS6Ze+dqg4rpfwDHx14cKzPnKCrZoBvgnoxT0hT0CDyJkA1CbkibxflUfmWUHI16t4
         R+LWuMUKkYZNQJhqOiVsu5tq4EXNeYXIQ4ZKCxW+0c+mJlamgN7+kh8nKI5aiznTRiZz
         1WfnwZqTjDAZEBwCMc1gD6RyMN20T57/N2DohvgBiUGuDtzeWLLhLdNZ4JdOxvyob/Sp
         2RceY4IjLsqai4yBug/yrdfvjYc6mg+GjUhW8RMWAh35CZE1XqMtZeoEkvW57sPrt4YL
         9lyeeL89qh0gQkCcNZVNz+HqtjMND0yzvuj7Wc+QgpoyIIfQ97UNtXhUh11Yi1D91C9A
         tVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294624; x=1793899424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=nP+VNaaPDbn6tYnq4GGr7QF+ZtvKa1qnN42NIizIWm+b4cVWmz9Usb29zKWcLXBxTt
         DwOCyaLm8MUZO+Ky0J1FegFtCPF/Qb3bSOrrM1MumRNHFs1UG0S85F58oy2ioA6gUgOF
         Zre3n8vq6WtS6ogo9K7FywZ8fsGBAkTx9wLTQBunuSTHNlCK+3FGZspHyKY2pXuI7I1l
         lNKRNnQVzf9RKDxGiPsxxotS+9XcOLPbvjvkUY+SHRNAaAhH4e3uCA93FvR/ClvRu7ek
         rJmCULtdXPsUgIUu4nPMLdfSlBpxon8Hr9uPY/N+H6hZZYwj74jKvEgkGVGnM8wQZmW8
         7ZAA==
X-Forwarded-Encrypted: i=1; AKwUvBwtgu/PH8mSzrWO0ER1dMCckq8Ach58gpU0hJx+Edfi+RsvW59Uj3vpDBK2iNwqAWAzmDoyx45XCu67QTaheGKc@lists.infradead.org
X-Gm-Message-State: AFq9FYKI8WvAG+5ePvi9DwxondiqUgLUn9RQfQQBHv+HeyQyXo1PV2kp
	eRd4UVDzMaXg3sJ3hj6MBeK0ZdB7hRBUIIP3/o/yCLWpnvxcnEIct1jY
X-Gm-Gg: AYBFou3w1PR6wGIM2cFGw02J+CYb1J/kac1IpMJ5q7Klfd0D15uA4nFAZmeLPZu5Y0t
	XuU2pGqCUv0Z400P4ie10O/K5OjU6PyiQuVxCXY318j3w+ZUY1IR+ZBx9ro0SlikyaWlMhkCiv6
	7NCwkmiXBgGRC6qY3/B85Fdi1m9o5ALATAUGaTa+HFcsHwkHZDRqrTJP5Aoa0UW8Mv5Dys5Wpqw
	V5Zcv7jvlz3NC3xLXb0m5/SlC87OIo0dWWzuqgYdJ5YdqDi/uNZTw+4d/aBRgWe0zpH9UOsO4dq
	ZYd3YgV1JvA7uFd8SXHGpmHBo2zHNJDLw6yrGswGsQ0hCWewNvbG4ECjQs+bzSYplZiNGrykkIM
	1XVVhBa4nWu4f3n+OnbaHZtd9QahsEonIlMvMBMY/id6J0OkdJZeMelCuYcn1gIMrH9qYhDn3aY
	/e2j1X8OceAv/6BIZAY+Nu1gHaoXD3o4DhkSHDmjyZSfR6DY5PK7Do7vhi/s80uK2IasY6j9SM8
	86M51UmAnr2Nd2oExbiJYeBvaMAiw9lKtMgMcfCdPoS7MGUKyzoQjGPTj4RyG16oo/jQnXFni71
	axEc2EuSBnaWLGKYAAIizMWUZD0oR25rcSAJgH1zJlRt0lP7NrqjZl9RV5rnBBWUw57sDNgmWix
	mMUulrAFZi795jENM4xRESMufjgQBW05s20uN26YydZhv6NNrW0mHsMJz2g==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr3505471137.8.1793294623916;
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Thu, 29 Oct 2026 14:23:23 -0300
Message-ID: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_102346_012899_931D1B59 
X-CRM114-Status: GOOD (  12.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

This goes on top of Xu Rao's v2 "phy: allwinner: sun4i-usb: disable the
PHY2 PMU clock after SIDDQ setup", which touches the lines just above:
https://lore.kernel.org/all/CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com/

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
prerequisite-patch-id: 77e92419764dd34a945f7d546d4cb1dccb6da112
-- 
2.43.0


