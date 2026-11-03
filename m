Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF24606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KtZ/xD6M;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wS/ZznUX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=; b=KtZ/xD6MdxHKcHRpegUYqHiX6Z
	ZWJj45tFy6nIzjfEdxDDFlgArtc4QzFAnQ1uuWYxfIlL4R1d1qH9vkteZp1jQ41EvLxhdraqCV5MH
	0ygIDR5CPvkjxXC23YvsNfNiKrfwT0R3v17oappcRi/5T3rk39WR633mUSAkeRRfQFNkSRbf5BoUa
	ekWX2w5Ns3uaTjdRRigBIBbdatH/IDdTOachh2NPcujMY8/GFenT/WC7ADen+JjlsiZ772NMnfymE
	sl4DwUlCFWpk7qWZCIpI68qon1lZQtzdXvcn4aZUed06PCO8gaQbt9i3AEFJyxXo0EsnfWQ+NPVWd
	N3Vfq/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKQl-00000003YCG-2OuH;
	Tue, 03 Nov 2026 19:44:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKQg-00000003Y8W-2R9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:44:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so31770105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735060; x=1794339860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
        b=wS/ZznUXEbkdPhT6DCeN6o4RKiPUnOTh33cFC/EVA2SAAR0ATgiOQOwXcdI5hZVO76
         Uj8Aei5gp3LQRX36wcqeDu73UPmLEWC9dVLoQkicUyFf/2n3adnmGho45aQ6xxhC47TM
         JhaI0eF2VHVHIIxVXnKAtOijGfDEpfvPJfKX5Al6Y8RC8wOfu6y+fwKPRXBQ926B/nHN
         +Lq3Z8w5ey4DXHY3FYGi+xkxMLv+mMhFwfN6APGjRV0R4d5NxN+f+Ci4qEZwO5Hm8Umh
         lptb2G8vncE0bdDEfohxTtXQd2LjwcmxtiBqjx8tAvL/MQSJMBd5R8SHqLzklKR88vg3
         hC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735060; x=1794339860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
        b=WrAlAVHxk/fx8uPGk99nXsiGlftzkR9zjP9kfCUATfE2fM5au3o8EM1wD7wvtzpkNc
         WLeDkYLaRYTAZOsdLhuXMLglfcqXsGIHXKl8DSaPS+rtFl1fXKUfvOjUOTpGVprVawie
         cqxePt9Nf14LC3L4oz9jxC0IqvOfvQellCHGzL3FQUksqkFdnmoSqNR/TPxhDJdBiA8Q
         hMZSWee1dQ3jZWHOK38X5QQMxqfWC6RiZtGnZTQZu2YAWXHchlKk4R8RZadA/PaJ82yB
         4Q4CLXLL7Vr1h0mZ316nUcxRiJpkLB6DBjcbK/6eW/XNkht1VM22B/g/KFKAevJOjK5l
         wvhg==
X-Forwarded-Encrypted: i=1; AKwUvBwhr2Bg5FnnNYPLOo2aXMHqtS4MjzNssd17CUCJW+XYF/D8VExipFBK35S9lr1HSISSb8/15AKWy+s6Iu81DyZA@lists.infradead.org
X-Gm-Message-State: APuU4Z8lY2im0vpGF88Z5sSfkmhBSja6Ny2UNeMcHJUjC3uHDL7b9EkE
	wgU6t6GfxUjnlRyT9OSYYzhZ2L83c2ZIkTy1wCYe1oi57np+5rLHoLO8
X-Gm-Gg: AYBFou05eZB+45/m18XHCCahmNZnjbyPE/mJm80oXZrJH02EPkHrxyXBTE/AnNAx+g+
	Y41DSJ8L9h6k4FAAisnf9/7V2cYsf3JFgs3KRIC34YjhStBxPGO1yaIzJudIW70V9JJj8iu6V/T
	RJ6n+fvRg4fl4dpSfG5B3V2LuWciyye1lAU4+MCzCZ/89UER9fwpK/xpXb5GVGBg9kPvz1S6gZI
	q1ZvGqlhqUuRZlZ5w41LJcmKBuI8+aThU7B5Ayp9nKad7Gs6q+AFI0NbA689P+QzCAd32ARWN+w
	MDKBSSLAuN5fmGNc6itXOWVwbgMF84qD/7r2nXzsOGTa0qsJfbH3vSrDkoM/1IfGUOrEAz+ZKvD
	yoxqELzb3eza2AKAAk0k9qvIh1/8a4s6yRp676Iey6bdvlYHUcd52M/IVcFKiY1hDv/kb5WEyfu
	iuXCgv6vVUeFKQkFntGegfn3t9Me8euqZlsmrlOVzdJLwiosdjLHTXyz7HzyTTr9i5TeqqpCNFI
	OhD5SH7pOdhs9rBfqaN3+0eef/o0ENzFIZQsjPb4j238T/syoCoIAvseKcN0I/L5KfOXHKz8j0C
	9bCQUIy5q3wTTsk176okPRZuhyfH6WFLGFlUIjCnfJovuTnYMpyiHloyREbChulU/1LFY1zSSZ7
	84W01xZqIpTKmPEiMTupJtQTKINRqOUCPchcwH7FVZ/Ir+O4eemel7lo=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr328108365e9.27.1793735059988;
        Tue, 03 Nov 2026 11:44:19 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/3] airoha: an7581: USB support
Date: Tue,  3 Nov 2026 20:44:05 +0100
Message-ID: <20261103194410.6632-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_114422_649691_A6255E71 
X-CRM114-Status: GOOD (  19.94  )
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

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v15:
- Rebase on phy/next
- Add review tag

Changes v14:
- Drop blank lines at EOF for DT patch
- Fix SPDX tag for move patch

Changes v13:
- Rebase on top of phy next

Changes v12:
- Rebase on top of linux-next now that clk patch got merged

Changes v11:
- Remove clk patch and move to dedicated series

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (3):
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  61 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   0
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 663 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0


