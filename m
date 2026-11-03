Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dcc+zx3C;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=sKmCYXkY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MwHtqe686HLLhg33s9GZ+hUKCHbjkbGAfCD5MLRkHsE=; b=Dcc+zx3Cbl4JFUZ+Cp7iFkDmCL
	B0WVf/6EoZfbHepvqbTtDVO+KPu/perwwakjV/bHgBqa6iT16eA3/B4AJcmTWzXQ5L/mjRiiitFl8
	rxycdiD3/G6QxNmP8iwG+WyzPSBaANYM/910oeRQMwqdBmPoBAu34lrnR11MEXG2hdOpbL34tk2vz
	wBUGxTTGqjrXGECD5G0pfpibC0mGnk3QMFONNNKvfQp4fDouYoApLlio9mzrxWMtCGo+LQo9zQtrk
	kthrNDXdh+7+cI88whhqRV2HBMWKJhGEj4D4a9VmCVMUWs031WH1aGnBffOPPE3Z15GTtkd4+lpfn
	tBA7kJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCa-00000003ctg-2bnx;
	Tue, 03 Nov 2026 20:33:52 +0000
Received: from mail.rnplus.nl ([178.251.25.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCX-00000003cs7-2UmW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:33:51 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 02B9737977D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qphZLj1y4tFr for <linux-arm-kernel@lists.infradead.org>;
	Tue,  3 Nov 2026 21:33:42 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 45CC737963A;
	Tue,  3 Nov 2026 21:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738020; bh=dZ4MqU5UF2diSUFxnmeqIV/vngMvCegRDFqFTjout1g=;
	h=From:To:Cc:Subject:Date;
	b=sKmCYXkY8tZ6nSXpHUqoJ64JTJxCtzSCMqPqL+GYDRKYpp5zRKtSTeRQXXZlVx5f5
	 ofj5qRnZN0zZjdH0xCRfiXOub5URoOaht+YxgNzLb7sqXuFcveqUBrl7WrSfVbO3zw
	 BfG/42nLc+bVyu2D7RD5aKyDHcixKKtl5VHgxN+Q=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: aspeed: x570d4u: devicetree fixes and cleanups
Date: Tue,  3 Nov 2026 21:33:01 +0100
Message-ID: <20261103203308.54789-1-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_123350_054568_1610D498 
X-CRM114-Status: GOOD (  10.42  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A handful of independent fixes and cleanups for the ASRock X570D4U
BMC devicetree, found while working on OpenBMC support for the board:

 - Remove the w83773g temperature sensor node, which is only present
   on 10GbE variants of the board and should not be instantiated
   unconditionally.
 - Fix the tachometer channel assignments for FAN4-FAN6, which did
   not match the board's actual PWM wiring and produced incorrect
   fan speed readings.
 - Give the eth0/eth1 MAC address nvmem cells unique node names, since
   they previously both resolved to the same NVMEM cell name once the
   unit address is stripped.
 - Add gpio-line-names entries for a few GPIO lines (NMI, BIOS
   chip-select, LPC reset, hard power-off) that were previously
   unnamed.

Renze Nicolai (4):
  ARM: dts: aspeed: x570d4u: Remove w83773g temperature sensor
  ARM: dts: aspeed: x570d4u: Fix fan tach channel assignments
  ARM: dts: aspeed: x570d4u: Give unique names to MAC address nvmem
    cells
  ARM: dts: aspeed: x570d4u: Add some GPIO line names

 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

-- 
2.56.0


