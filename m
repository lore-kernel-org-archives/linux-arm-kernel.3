Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE43606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBPjit05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XlLc/FPyLGvA2r8haINizk1+kzXPPQVxnilYmb128Q0=; b=wBPjit05BcmHwnuwRBaYx1t6Rj
	T14iaVi84yM2TlwOYOGm9XUccDaijpaqXn7LwvxV6Mm8LqZuvUOuoR/ugV0WTj/wrU4mc/VixAccT
	v/s3/zqPrQIeebfyuakMXOVmQ/bFddsaxfvegRptmVDgoAiMV+A8KLTHP6wyFazMMlwa3bHx061yC
	kE4U48ms+7UzDyHXRPdY+nS4Z59WZNosw6Q6w6n6PTp0twgXjZ2+AxFrBIsZnkVoLJ8hlpJ4cC6r8
	IzuT2CR/tQ/zsvml/d2FA2h3TzTGDDxkXr0mcnTPUikB2BT/Y446vdRnMkrQKUeYpDs9Vo5JWKB+a
	IJIaZdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3q-0000000Et3g-2DPv;
	Thu, 22 Oct 2026 20:06:50 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3o-0000000Et1t-1iK1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:49 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso130400f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699606; x=1793304406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlLc/FPyLGvA2r8haINizk1+kzXPPQVxnilYmb128Q0=;
        b=ixJ2dA7dusACjC/OkjnHp1M9RgbRXVhw4lS6RdlLZZOb2mhK7CQRMLD9upNAzA69RA
         AzMsHzfsDNR+eU6aYdd11c3OnpmKni437SstTojNo9w3+TS6Qo9XjHxihp62Cs7ZaJ5q
         kcLOwwdapUPE1LwR2GHDYP8xyRSMGkheWGJldzSsv4/oRJN1JFew47lcdcTO3LVRXtsR
         hsw7f6B2/8oc69TstNjPxjDrsnfOHcp+9fovpTzY4GEFXmwymx0YZW8fOlI40PnR7CAU
         1hTVC56A/+mvQ16W9ME1bRXuu1fZay2slTv5sJNHIRJ1e2WreedmyvF5c+uHJQngmVj6
         iKIw==
X-Forwarded-Encrypted: i=1; AKwUvBx6BOTg9Remu0njorC3jCw8KRc0NHnP1RsvAs6grIKkGVmUo4GxyNmmWlJR+jvekkCXYrrbHMDww9HOJ7y+92WQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKFFFx+dKmRTixdz/wZln1GKiGniSbRB/2DVldasi2uq8xpXNEN
	JWtHIXbL/YmdKSn/oxRnH/5xEkjgjecvjVvivsN5TV/dE4Oxtznermyx
X-Gm-Gg: AYBFou22u8Xz6eFiiBZ6C45kV46SthT2ncOrfA3ydACffUmZ7q7Kge3XgpvQISPTgmz
	2157OcdmNxmFKY96J6JXt9s86PEnoFTdt4et2WVNjhl7KLNH8F5Sf41YabMfa/JT3KywsEd5Igo
	en7+Hz95DEWqzHwx2PjFUF+vs+xXiQ9jGmIa91niloD1IbB7bw9R8gnf6vBZ92YWqv8OVh2aegc
	H2hY8YvG/ju56ioe4u9jGeq9dfZlpRCkE5kjp5DGt+lPXCC48ZFJm/99ik2XYW5YBxw2swMyZSz
	sov/T0IluqvOkoDixCmJEfpaBkMND4VXYXa5ZFOoOY97bZQC7idrJL9SR21kMVc6L3ZtLJSwMsN
	w1/POZ5cgk6TnECgrODey4mlcGV3yjR8atIVmtczAy98evo7FECeUFcjgoR/JyV/4aUjCS89xNd
	WGhUc0Xtje8VVpgirdJJlrEfC8c/Oe6RpJ0w7FF9sGQBvR8TA44TULb+3VpOOka5kCLSuwgkEyt
	zln4Yx3cIjBWmEGJP3ydqgt/ZT6APsNve50lgx1H0zVu2t2V90a2Jf/qqxziqdYS3NAlA1jztZY
	e4nl+7sn3nTonok=
X-Received: by 2002:a05:600c:3114:b0:4a1:a39b:e75b with SMTP id 5b1f17b1804b1-4a211cb296bmr2188745e9.21.1792699606184;
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:45 -0700 (PDT)
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
Subject: [PATCH v4 0/7] Add ethernet support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:33 +0100
Message-ID: <20261022200640.3101932-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130648_578776_FB880E6C 
X-CRM114-Status: GOOD (  17.52  )
X-Spam-Score: -0.7 (/)
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
plain rgmii-id. v3 said the RTL8211F TX delay did not work; that test
ran with the glue registers gated, so the bootloader's MAC TX delay
stayed on and the link had 4ns on TX.

Tested on v7.3-4494-g2a08195e4db5 plus "clk: meson: t7: keep the
memory fabric clocks running" (clk-meson-next): 940/941Mbit/s with
iperf3, no CRC error in 421k frames.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7
 - 0 dropped from rx-internal-delay-ps; vendor delay
   properties explicitly false for the T7
 - init_delays callback; the old parsing moved into the older-SoC
   function, marked not for new SoCs; patch 4 renamed
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - the controller-side delays are applied on a T7-only path instead of
   changing every Amlogic board (Andrew); the PHY mode left over comes
   from phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps is checked against the four values the hardware
   has, in the binding and in the driver, instead of being truncated
   (Sashiko)
 - amlogic,tx-delay-ns and amlogic,rx-delay-ns are not valid for the T7
   (Neil, Andrew)
 - the on-chip PHY no longer carries max-speed, phylib reads what the
   chip reports (Andrew); same for the RTL8211F on the VIM4
 - the PHY interrupt line, GPIOH_6, is described on the VIM4 (Sashiko)
 - new: the T7 node owns sys_ethphy as "pclk", see above
 - new patch 8: the delay ownership table in ethernet-controller.yaml
 - no longer RFC
 - Conor's Acked-by dropped from patch 2 and Neil's Reviewed-by from
   patch 6, as both patches changed. Patches 1, 3 and 5 only moved in
   the series, so their tags stay.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

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

 .../bindings/net/amlogic,meson-dwmac.yaml     |  89 +++++++++--
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  19 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 139 +++++++++++++-----
 4 files changed, 284 insertions(+), 51 deletions(-)

-- 
2.56.0


