Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FDE60877E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FHTVeTYU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHFQnuLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=; b=FHTVeTYUfq+/tGgdJOxj2P9xBp
	8xB8t7ELqxkkKX0ZfPpHaxHfJSS+0V+6rI9ZJ5LJrxZFs0g89FjSaxz06KDjKuVTa/28BlzQunHx+
	m4DcOgRlAOXwSiKQU1Ml+cZSiDVe/Ugo98I3TPwOr0h5bh+00gwk7nGXlEw1OFylNWAquLkpdtWG6
	bROY/RkMFyUyEZTjRE82HxWExzLEX9ktQ6GZ2s7dxNBRXb/o77N91GwcVpZg82wE9GaRC9v0sbaSr
	kKm1cVwKqF+9jSyF3voc3oJmsxx5DshHy9Krk4ltJUDXwyXmr/5zre21Y+nwsOQpkop+XSHVjyjWq
	PziFZZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0S-000000076h5-217a;
	Wed, 04 Nov 2026 21:58:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0P-000000076fj-3pPo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:58:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so10776195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 13:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829532; x=1794434332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
        b=mHFQnuLwZARX90E1xI3hirgPRkFQspPrrd/Nz8dPykR4VdM/uAH/FSduXK+Fs59AZQ
         /Aq4j6GL5MUjYddv4jPfHhZ4io1ENcR0KjdF3AtSy9T8dNi/YecIriE5gqwW5PahnuMe
         SLUlsDcmqjsHXh+3zdvRYGEfFmXiJvb1MfCt/5cg3NRuD4iQM/uvUAH3Ffvgj+sQH1hT
         vgUq6n648rnuykfBASwNvM75HavqUIAX3ExsNrAcWISUkzVefTz6ZQjr4u1e2KQVezvu
         x/MIHNR3ZoZhn/nP00AG4dcW6Pt3gXRF4i3/Rn27/QADyqg/Cem7Ijvzstzhxwze7K5T
         MBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829532; x=1794434332;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
        b=Sy4lU5c956MPlY2Xm9+/KXFUmg8x78+hyzndDJfviqu/fdR69j8elXxRhXdhc8PALN
         x9WvPQ6WA8N9hJohFOwdZjkwuQD2WjqOXqFwN2k/NPLvCc5dd9fX2kSSJcO6k7qZ47I2
         3PG2ICiGSz/wcL14AIu6hZcXNRoVCJ40ZL+x262yiPS/a5zInz1cfVdcc0SUSDHLsodM
         w61kMmm2cYMtHMUPVxtuA4oTKVxffhbUm/pBoofNA6dAuQfT98o8KoSE3jaDeTxydHFR
         DhGkLw2qQ6Ooc1rv19xj4JJ93R9BpBIx3hSyr87rP5FzDBGPvQap+vKwjqCMKZwwXh5O
         xmSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtzk+VpaK4dIeQhVsrNkNCmVuf4tqcoW7nVsoW8rkIVTF8mJNvqbfAFzJHTUBOJCQYEynUGJ9wqJan4v2Ft/I0@lists.infradead.org
X-Gm-Message-State: APuU4Z8OnZZ+jPAntHkxkOlM20KDS1Xzb0IirOylDEZ5zKqBxdYEC/xN
	c6cmBHoqSpqPGaZbuTfKUPiEt7bLXCPcb8QEaQtOt6RiChtxdQAQUVxK
X-Gm-Gg: AYBFou05CFl54bBXndl1HW27UXOi3OABPyDUceYkwBdGelnRX2DNDyfcmTYlTvmU1Ky
	ALcOBe6u4feij7T/vMrlY4rjIlO/3/CsjgRPccjdkGxtwfbgoWUewdVMNb9qyELBZTZiqeSU5uY
	+3k1MvyD5naMJVXewX3MWP1oSQ1WQfnJimXUv0eprbzLbaL4XS/yPktIrA/QudX2by88HnZplDa
	ZCIqtJ2lftmLEfHbVYyBF2Lt+ZE09VVGdfeyXfgXpDwNCk8j2j01GqeCCSnIA5xf1ugrOLotXda
	8LclXa1KifQ9Y0HZIGBuXb+uOUs8iEe8SKPDUbW2Zi3LvDiZg09cd37S3rWxvBfCgK61rhK1R18
	+XZZ5CQlZ0XqKPESG0rGZShA0hcmI4MUOS+iWtC9QiSeEVHKfgUGsjOLYoUQ5TAB/EHaNrn/wmP
	AHCtxoigUZE23v0attN1A1x/QZYOVYkLObRR6A2YFvgnR5tyVQCnMQhaFaSDAJcfBsw0eWRvQl9
	kcVp9GgTDh+CjNLp8Bn3fWicXklZLXTTXEzBj0FvSidFQvKf8qcRSOhpbqvEu2b12YwMA1cZXuB
	ZXFmCi7MnZRUbSglihxGuuZ7mVZ1BbvmZqCz74+beNnqoILUzjxSTKyM+LbK3NBEYAweF3P1dst
	XhMqtNYIQ3yOyxfOhGpfYUvBhwAtmx7bBodBFdf9KdEdnlA==
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr368381185e9.12.1793829531676;
        Wed, 04 Nov 2026 13:58:51 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:51 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 0/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Date: Wed,  4 Nov 2026 21:58:45 +0000
Message-ID: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_135853_981647_0BB6A1E5 
X-CRM114-Status: GOOD (  15.88  )
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

rockchip_pcie_host_init_port() waits T_PVPERL, 100 ms, before releasing
PERST#. The line has been asserted since the GPIO was acquired early in
probe, so that wait is also the reset pulse width.

Endpoints do not agree on what they want there. Some need longer to settle;
a JMB585 behind a ROCK Pi 4C stops answering configuration reads if the
pulse is stretched that far. The measurements are in patch 2.

So, as Shawn suggested, take the delay from the device tree instead of
changing it for everyone. Patch 1 documents rockchip,perst-inactive-ms and
rockchip,s2r-perst-inactive-ms, named after the properties the Rockchip
vendor driver already carries for the dwc-based controllers; patch 2 reads
them. The defaults leave current behaviour untouched, so there is no Fixes:
tag and nothing to backport.

There is no DT patch for my board in this series. Its JMB585 sits on a Radxa
Penta SATA HAT, which is not described upstream, so the property belongs in
an overlay.

Tested on that board with the series backported to 6.18.58, the kernel
Talos Linux ships; only the context of the #include hunk differs. One
kernel build, two images that differ only in the overlay: with
rockchip,perst-inactive-ms = <0>, the JMB585 enumerated on 4 boots out of
4; without the property, all 3 boots hit the same SError in
rockchip_pcie_rd_conf() during probe that the board hits without the
series.

Igor, since the defaults are unchanged, a Helios64 with no DT change should
behave exactly like plain mainline. If you want to exercise the property
as well:

	&pcie0 {
		rockchip,perst-inactive-ms = <10>;
	};

A wait of 0 to 15 ms enumerated 17 times out of 17 on my board, but your
slot supply is a GPIO-switched regulator where mine is always on, so I
would not take my numbers as a guide for yours.

v4: https://lore.kernel.org/all/20261028014116.2432425-1-ehbello@gmail.com/
v3 (discussion with Shawn): https://lore.kernel.org/all/20261028005603.2399220-1-ehbello@gmail.com/

Changes in v5:
- Take the delay from the device tree, as suggested by Shawn Lin, instead of
  shortening the wait automatically when the slot supplies were found
  already enabled.
- Drop struct rockchip_pcie::supplies_pre_enabled and
  rockchip_pcie_supplies_enabled() altogether. That also retires the hole
  Shawn found in them: devm_regulator_get() returns a dummy regulator for an
  absent rail and the dummy reports itself enabled, so the old test was
  unconditionally true on a board describing none of its supplies, on resume
  included.
- Keep the 100 us floor from v4, now for any value a board asks for.
- Split into a bindings patch and a driver patch.

Changes in v4:
- Hold PERST# for T_PERST-CLK in the shortened path. Old power does not
  imply an old REFCLK: init_port() runs phy_init()/phy_power_on() on every
  probe and resume, so the PLL relocks microseconds before the release.
  Measured 72-75 us by ftrace, i.e. a real violation of the 100 us minimum.

Enrique Hernández Bello (2):
  dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay
    properties
  PCI: rockchip-host: Make the PERST# inactive delay configurable

 .../bindings/pci/rockchip,rk3399-pcie.yaml    | 15 +++++++++++
 drivers/pci/controller/pcie-rockchip-host.c   | 26 ++++++++++++++++---
 drivers/pci/controller/pcie-rockchip.h        |  2 ++
 3 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.56.0


