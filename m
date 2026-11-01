Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA060A260C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2IvbUt4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWfNsQzA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=; b=T2IvbUt4cL4KC/gIQyPcYbmlJo
	00mv3/zUdui80jnW7OzrCBKw0mHEiaOCdwXsLshj3dSOGnWaDnF4/dmYXCOgA5m7yLGdkIbO/ZHgS
	D/4F25JtJbck3q3307QOOlR3gy9gUmzvMiygnLnCFMftej57jHsAYXUt129nnr8b1IPELu85gsWNQ
	eZCRYDF5uIHTDY4EbkWndyDhVA6TPZVR5tXuenpkBdQzOafhxYz68PMSJnKfR3v1beJ+rkrsMBs1q
	1K379CNYG/AqXUQeCOAQGY0pI1MF8BdaMkvpUH0I1vtYRl435PR4SmhXgTOo/1xdEvceCXq2AVNlZ
	lqsgt7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFJ-0000000EocP-1OXa;
	Sun, 01 Nov 2026 19:29:37 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFG-0000000EobX-2qU8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:29:36 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-36758ba1f01so1182915eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561373; x=1794166173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
        b=LWfNsQzAg9dAs8QV6V8QKlhJDgzZZPNcUmPJ5MKl4ewdifgSaVX1AUXCEIHdB2vNHQ
         Q8nLUEQfAD0tnPFD8uZn8IcDDQyPEfeoh0ZfIbrouFY7g9VafMkCwLeOvb4aE0v+NtKj
         yIwPS/kc0cl6CyMRV4SzoQgIIDgt84mfAlGBXADFZ/+We9yyHpN579YTC5hHvGddQq12
         MAQjVUqoTS5Rx7LTsYKumm9b3BDSbg25WbmjvsxQabIRBOY0uPxSXBshEWVDFyfZTPHU
         PovOu97VDFNatHBJX1GVZaAhxysW+QGmsgxOt7FM+vyqCHZ//VD7OcaIPDLcjdpoSmZ3
         wHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561373; x=1794166173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
        b=zHCpK3xv+IDEQIy1P4AO86wXn69K4sBCSlAi4hfQNZKIf6v4WpyySJTWkfvNf5mY0K
         If7CGd1HRikVmpeM3eeXpxnmbqnyHQ7saW9F4hXOcLRgrNP6xQDKiWRh+QmNfl8c/ze0
         R6Nl+legCIIf5eAhG7NLgGExu2xeQLHDjUpP8SiwurJVAYhw7m8pvrBih9xiOUf5DSPd
         Y1Kok5cNSvAGKRESLNYT9OBYSQL6O47Otus3ldV0CQtxiLsgSfXk2sXv1C+SudU/oDLd
         ptfROGc0vOKymUGEAwNQXtwbPuVA7TwuTD8+8rpxaThyipJTi1OBv74t9A0u0QcztejG
         RGVw==
X-Forwarded-Encrypted: i=1; AKwUvBz25w7ChStqXGNRYeHeP5DASvjJoWX/HJK5EkhCCFw/cWbnEtqys9EHr1lS4YhI/wz/KIRSNBF0dttx55p5z3aX@lists.infradead.org
X-Gm-Message-State: APuU4Z/8JaNke9L+pNKbHJsDOPDVLZJEfbk5bn+ZVi9vXIn6IT5sXHeT
	rBZhQl0KrlY+lQH3qWFfcz/ACDREOJlCdUk8MezxX/b2hZx0a/9VM4mmIimzppsR
X-Gm-Gg: AYBFou1YUr6Eadx25y6xFVD57QcZx81POf6L2Xz6WAR6M7ZsWLs7HTCDmF4x1F9Tw81
	6NLwZLbyfO6136n1S4kLkYHfWQ0pICQJBoJKd2QBDxw6/iR6DMOcbhYojnS6kHIrNwxI9Snl7ht
	/oiSYd7b0+aY77ouFHpw6AEw3cj2/oeEOVxOfWRxPOpi84+XH3MvLTmuKmWt4nRtbvhHzQOEeKF
	DTUdtf1qeMhMO3lGvOtOX4Fzfdtiy/zwRBV5Qc/BXqt0TN6bJqx24QPlJ4MTdUadgwJpWv6Aie9
	u533S5bcL6tA2Dww4QLkUkwkvKLUNdCIcH6S456DQSG9SFphvbnmPiRBSuCbd0QsoeKYnZoPAWV
	9ysWndS7mQWjwfp08CZNWqV/9G5nNuYRrKtx7kyKQpHuwVkM1tWedIlOem8HLwfVRKFkX5tq2if
	k+QrX3k0gff7dzbXcchgxv6lyNiUjeX4tmA+7wEjTQlnlzoYeMXudqpwOzy2/5SFu4FiApchPPb
	QvCz/wEal8BF8JVAMD3zWQGLJFCzD8NU35LQqQdkZ5hYi2P+gco5lTDHPCpDuurAxsov0X6wqdk
	f+tLbfllPrqy/L75FgcsIzlh87xu7g5I2XAJFxaoogJboETi
X-Received: by 2002:a05:7300:8251:b0:36a:1a65:ebd3 with SMTP id 5a478bee46e88-36a4237d4a7mr11951653eec.18.1793561373232;
        Sun, 01 Nov 2026 11:29:33 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:32 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 0/5] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Mon,  2 Nov 2026 03:28:02 +0800
Message-ID: <20261101192807.897562-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_112934_722305_3C6E9C37 
X-CRM114-Status: GOOD (  13.49  )
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

This series fixes two classes of board-level issues found while
bringing up several RK3568 boards.

The first four patches address GMAC clock parents. On these boards the
DTS lists SCLK_GMACx in assigned-clocks but only provides a parent for
SCLK_GMACx_RX_TX, so SCLK_GMACx keeps whatever parent the bootloader or
the hardware reset left. Add CLK_MACx_2TOP explicitly so the GMAC main
clock always comes from the internal source. BPI-R2 Pro additionally
describes clock_in_out wrongly ("input" while the port is a fixed-link
with no external 125 MHz clock); switch it to "output" to match the
hardware. On RK3568 clock_in_out does not change the hardware clock
routing today, so that part is a description fix.

The last patch fixes USB OTG power on the Ariaboard Photonicat. On
battery power the USB port is dead because usb2phy0_otg is fed from a
regulator that only exists when the DC input is present. Add a boost
regulator gated by the existing vcc5v0_usb30_otg0 rail and switch the
PHY supply to it, restoring USB host functionality on battery.
---
Coia Prant (5):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 ++--
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +++-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 ++--
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 21 +++++++++++++++++--
 4 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.47.3


