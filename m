Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA64606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5Dg1NqP;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=elG7yldB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UMqE8EVxBYiDVAgwLjMfmxM93uXTjiR58AH6MC3+O4U=; b=k5Dg1NqPxKfZq5urt/JTTYUDx1
	vkcTh1IQcPer5JA8x0O/KgDErDxXVz4fKFNTdywic0rpOH03WIRITBfqw1LDk7GwgtboFpKecG78L
	xkB3R/+QdPLGsmhebsllMveQGD/ek0uPoDRo0hprRsKvBehRrCNyDvlEMxXid6fH6HVpfYaC/AHld
	XJiCmq7N9jIClHpgWVsohHWN3iWSrZrgv5lO0r0plWnTiwf3UXv3RPIOwVBmGYcnBgIW3cr0pQ8Qa
	+mt8lyMUWlnC6Rv9Wk8E4wajOgb9sTsy5Vi9qblgqKPH1braav1WQ6N56r8g3RS7M9YG4RSOON54t
	jtLNSC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYpX-0000000564E-1apC;
	Wed, 04 Nov 2026 11:06:59 +0000
Received: from out-148.mta1.migadu.com ([95.215.58.148] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYpQ-000000055ze-2r9k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:06:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=90W3Vbe+A7EuTwCgPA1AIqMGxOjdh2ciRdVhxid1Mc0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790409; v=1; x=1794395209;
 b=elG7yldB6sqlf+DYHH88h/HcfX3C5m3SxEU1voeZtdU8dqe50+xUdM9qir62QNc/lPLthhjF
 RIsFjoWKEc2Y1UW1BNQkCBY0Rndr6ZtxgF+8MEE2RMKdTMzex7xZlqko2AAIBuKZgXebvyCFJO/
 nte4mpc/2vi1qoglprRcv5tF/x5jlZtB95Yq5LPujLDD0Qk7yTGA4tjooWBRc2T+JS5TOEssbuT
 3LjI1zTf1CrxC76nGrY6TP5MpK1fp5JlKOSlq7pT6VPixktseEt3M2Wh6e3BDtHmc+EhdTKszzP
 GyRCl8vJl/M6jwUvw6iG/OviIeznwjBMN8VN7ie3XFndw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2777f5a88c7f50cb;
	Wed, 04 Nov 2026 11:06:49 +0000
X-Mizu-Trace-ID: 2777f5a88c7f50cb
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 0/3] Add support for FriendlyElec NanoPC-T6 Plus
Date: Wed,  4 Nov 2026 12:05:03 +0100
Message-ID: <20261104110640.1132917-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_030653_511610_1C9B1F85 
X-CRM114-Status: GOOD (  11.21  )
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

This serie adds support for the newest member in the NanoPC-T6 series,
the NanoPC-T6 Plus:
https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus

The main differences between the NanoPC-T6 Plus and the NanoPC-T6 LTS are:
- use of LPDDR5 RAM
- addition of an M.2 B-key connector for a 4G LTE module and a companion
  NanoSIM card slot.
- different audio codec (Everest ES8389)

Support for it is added as follows:
1. Add the NanoPC-T6 Plus variant to the DT binding
2. Move sound card definitions to board DTS files as the Plus has a
   different audio codec
3. Add basic support for the NanoPC-T6 Plus

Diederik de Haas (3):
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
  arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
  arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus

 .../devicetree/bindings/arm/rockchip.yaml     |  1 +
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 39 ++++++++
 .../dts/rockchip/rk3588-nanopc-t6-plus.dts    | 91 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dts    | 39 ++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +-------
 6 files changed, 172 insertions(+), 35 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts

-- 
2.55.0


