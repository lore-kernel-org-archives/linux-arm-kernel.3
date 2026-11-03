Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130B60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZ4kBzOw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Jpxt/nQGal/nc4TuRsev6IcXoTzVp5Y6wAOXrs7jBpA=; b=kZ4kBzOwgQ24zCkrDa/h6zyXtU
	1IVKMCE19DIscNHZAI5ll6UhBzsuQr3FKOHUIUs9lPSsHCQopNwoXLCX0MhSfJK6VuDalnXHd4bt2
	fHPR8ngpD2GqHcGgw1U6rV22k6nZDBN9xo+O3K3eTBPeZjQF09KqnKHrJLp8Zg3zKuT3QC14wVN4I
	mQcQQ2EiYQbR2aDOq7QRLZOEjFzO4VYTPSJKAEROmL80ddhaXKfbGc09wvRCqSooj3T1A/Iuut50y
	P+Q4PTfXHH7JuTdbDrJOOsjB/sH36bVxJsR6a8wnUL++xhc2YrlWkQZ/IHIrhcMT72GAe90rwBiRq
	RFSL/kvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVi-000000039Ty-1VKl;
	Tue, 03 Nov 2026 16:37:22 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVf-000000039RZ-2N0c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:20 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3802433f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jpxt/nQGal/nc4TuRsev6IcXoTzVp5Y6wAOXrs7jBpA=;
        b=Qgj9C8ZIGex8ftpCoK+FHt66LUHS1Np2+529r5meGg6K9GDq1pm1cIrv/DfCtBuTCS
         4uyxgHFo74KXYdrF3rQaxS0T2Hj0btugsyCX69qgjyCS/Clzf0N3oYe7Sp1IjnyGMdHx
         2Ml49d6WIu/M7zZGEROdPv53phTMInxbcVRzfqVY0WrUukhGlPBhnrhprn3tHvQQYQ72
         PlTZKildfoo20v6BjopPLAexRjaJU/6Ay7tKtqi03qucRpCAFgc7v4B2nJKBZ0SI7x/p
         9uuksoAxx2ot3FI+YyYjTAg8J0UIbXQ+3ZnvRFkdDh5Ec9vHSJSLgqunADThZlsA65ne
         8VYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk+fV6WMjiJZ5lp3C9djhxDmy5TGhlvY/LOujEBgsFqXED7LyJXSmvX2/ti+1rjAbbSIXuylkFzjX58+eIebAo@lists.infradead.org
X-Gm-Message-State: APuU4Z+EUAKCMe9ko77Egl9njv5UTIqSalSDs+HdL0AHgwvcoAmK/YHR
	2CVal9cgtTXMl8oS7YehaivN3lO8EQtde3cgLecyEla+4sbzoRdWZFZj
X-Gm-Gg: AYBFou3PvkkSdCSSc+/CKT0jihfPw/LR8nTr/wOibINTyGCMm0xUUTE+6SoC2S5gnE5
	aGYPGK2F0N09o4qmEfJmGbYBLU9zacYxXlFQRzK309xx6i6ob8KuUfyAl8xecfpdHbbVfTGoaiV
	hkl0KB2+SSbv4uW9vpUuUgjMiep21bwaZPw0NLRUEnezOG3DghmG4RJ8U29+HVn9h1OH5ika7r1
	yJF4sdAshXP+f7FgGT6nRgG9LNVoRq2RCluHAomEvXumCXDN4PclfFElDVesr3xneUu5/XsYgZR
	AqBoJzzWi5xVbMaZYdLuwkT5GT6XQb9BBxqST3kO3jd4lzffnnNzL4WjqkwxYPcUDf+m0vjGXHr
	XHrzRQ1FrDVT72bBJ67GbUiL2uBMQ5NNyOxqfdTQS6+O7V/+coauJfjf3aVsDBiVjYSn/MVxhDT
	4db9ooRcAI1IW/odoxApomxU302lJkZFV+grQiUbzRq+apRACFXF5nRYpgvXEJEyX30FycLz8eQ
	wMoT2HQrZ4APqaO15JSg9Lh4XweQ213sLWXaDLX9CdLTqg1/bqA09PR8wCOgjNoyZWx+/1sZxTd
	HJOhDAd3JDjpjDcHyBt0RrxDisAia2EFPjk+TrtFaqDY3ilu5ICJnE+HwiRENiJtUNYgQn/1Lu/
	L6zH/GUEA63gLlbMoFeuXtZx95w==
X-Received: by 2002:a5d:588e:0:b0:48e:6652:fdc9 with SMTP id ffacd0b85a97d-48e6e4f54f1mr28922601f8f.17.1793723837259;
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:16 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] Add ethernet support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:08 +0000
Message-ID: <20261103163715.385394-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083719_621917_4A629638 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The T7 has the same ethernet glue as the G12A. This adds the binding,
the driver support and the device tree nodes, and enables the port on
the Khadas VIM4.

Two clocks are new. The pipeline stage between the controller and the
DRAM has its own gate, which nothing else claims. The glue registers
sit in a block gated by sys_ethphy, so far claimed only by the MDIO
mux, which probes after the glue is programmed: every write to
PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".

The delays follow ethernet-controller.yaml: phy-mode is never changed,
the PHY adds the 2ns, and the T7 accepts only rx-internal-delay-ps, as
fine tuning. Its TX side is a quarter-period phase selector with no
small step, so tx-internal-delay-ps is not valid for it. The VIM4 is
plain rgmii-id.

Tested on v7.4-rc1 on the Khadas VIM4: 940/941Mbit/s with iperf3, no
CRC error.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (7):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 88 ++++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 246 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


