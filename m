Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD66606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Q/wLYHB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b3uPEPP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=; b=2Q/wLYHB0slJ08SQ2v4LgITdzr
	yY6xKJRN72J72zk6sxPU/BGneLzUZ/kVoe9ARYWw4ReEVfudCZelNjIwhvGTQB9XgL8y+6iUmE5/c
	Le79Fe3ooZYUeaPYW3IiJYPlPr26jq1NvToqds0SVOKogqqDo5A2ksxHwUQO/iU9E0qWBf64tPKQW
	v0KAC2FV5XdR52/7QQcS01YUlcYPX91bJuQkm7iP9HqoBpNLPiJl18Huv7ZytjuId/BZ0IHsyjx2g
	ZhRdA6rlCKm39Ht8fBpWuEK4arFKGQRuWt79D4RY4CqhBChS34quoFq0LP2GGq0q/ie9qsH4buM6N
	OVFoDGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj17-0000000DFSf-2k0Y;
	Thu, 22 Oct 2026 02:58:57 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj14-0000000DFRB-43qh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:58:56 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e48934fa8so493826eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 19:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637934; x=1793242734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
        b=b3uPEPP0GpdSoeJ2WvDIrnCmMSCZf4YxA47zY4zC1nRFs7g9bxoo78BQTrrriHqtY6
         6vD5KY5H6KZl77o8/OvLTpn2VtdXFG5hrWCjUFipBvzY/A1SdlOdZl8X2/LqCY6kBZu5
         nPkzMIzzP45Njnha7kXujZYZtVwNeFyS55Pth/epVOz3znJyDFdm4PQFO3r7Gtrkwitu
         +GXfUvQ6zi0R1EmJCEK9aI5KfaKt8ghxR/M2BF9Gwi1wy1AT1gjGQGjsuErevof5u5mx
         0hkWcmizAM20t9cEGQpafvAL1k3aC/A/nYYjZYHV4+dKGCKgUEQq/9ENEIdtxs4CyabE
         N3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637934; x=1793242734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
        b=WqDPpqRhOylk38Ona/zfQvab8CPsBhm8cHWZGWD3b8ng4bWjBY6mPhkQ0pm8LT2bku
         4cL+xLr+OJTXJ+2rpoZ83OYSaT7nWgrFzcVfGz1ZWUEBotlh6dy1TwfSujsE8A9R+l++
         6yLscknMJhkPFgW1tJTJc3ww7EvnezZudmb+bdcaR+k3CzVTtKqvqWk1pFW9JJHBoVw3
         wF6sTg8WDK+9dp28IBcvSrV3mMv1Gl8EdbP8U9vo4zJSBaNoVULcpyDKKf9WrZYaWpRd
         qndC/0vlfFLF2GhRHUkAMC4HEDDnko1jr2ISwsLZpXdOOcLUewkv9GSde5v3Wp5otFdB
         xiog==
X-Forwarded-Encrypted: i=1; AKwUvBy1cCS6qZTC62SLdje7pqkXQ/KtQ+mMTXaPtKY3DeCHkWzmhU5HETkmIZwGpV9t+b0SbbWPMbrwgqCp9tgxBVbp@lists.infradead.org
X-Gm-Message-State: AFq9FYKpTIJGnTsvFKD7oNmf9Y9zaOXaGSG++AfZo0HzNCQV4toHyQ1K
	ygUWy5PaWpXwih+bSfZ5dkmvVWVwLfqy5FS1NDE/sBWTFAOZEKMrmAfp
X-Gm-Gg: AYBFou1g7MhRGVAq5vetGwl6l3EmGw579DSQQ+SQt8zpFh7pK6mmV6aLQEm4Vh5aMur
	XxcDzvCn/9nx35TUWppE/oVUSCAjV24lVZirivTN6iihqmRRIcOyiBhz2iW6iI0VZWVJn+Z9JXd
	iogFYr5D7rE8GvFnMNUQAYqXCmLh+3RWzfbG7vvgRZv8ZYJvxDtSau40vi1swUrKL+CPiTklEzx
	ZVlixo7ePwWmo5t73BmEVwLKSXwah1M2rmBho8cO85axRw9Mtf+OCKlKWFPcDSHg/zkRN+0b0+e
	StnSzJwmCV9UmrJXC2cxi+3yzsA2n6lRDuzfBumbQ12Hz79EOW7/Zv8+sQGaX55D+yqZYZvKy58
	oc3gZ9k32Xa5pWLF6imwI2gb9GZvXPkJxLMDTrfdrHo4MI0gm3yV02nA3fUN6ZREMGV+IJz2//N
	kPajMO7RUXdPIrI63nqaoXhsV679F3Z3wHjvGKCk1OpPF3o+RRAn3LkSJuo0E0NgaunrztzRofs
	9nSrQdryzdcu9LrOCkv/Dgw3k2cgGn3ViTZ5awjtSNMi/xRuDEzjA==
X-Received: by 2002:a05:7022:ea59:b0:182:94d7:f76a with SMTP id a92af1059eb24-190a728a66dmr4591460c88.43.1792637933923;
        Wed, 21 Oct 2026 19:58:53 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:58:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Thu, 22 Oct 2026 10:58:41 +0800
Message-ID: <20261022025844.150320-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_195855_013790_AC1E68E8 
X-CRM114-Status: GOOD (  14.10  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the RK3568 XPCS and fixed-clock nodes, describes the
RGMII PHY LEDs on the Ariaboard Photonicat, and enables the SGMII LAN
port on the same board.

Changes since v10:

- The rockchip,sgmii-mac-sel property on combphy2 is no longer set in
  the Photonicat DTS. The property is tri-state: when absent, the
  driver leaves the routing unchanged. If the bootloader has already
  routed combphy2 SGMII to GMAC0, the link works without the explicit
  property. A follow-up will add it once the PHY binding lands in
  linux-next.

- The RGMII PHY LED configuration is now a separate patch (patch 2).

- The SGMII PHY LED configuration on mdio0 stays in the Photonicat
  patch (patch 3), since it belongs to the port being enabled.

Dependencies:
- XPCS binding and driver (rockchip,rk3568-xpcs, XPCS glue, dwmac-rk
  SGMII, pcs-handle binding): merged in net-next and present in
  linux-next.
  https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

- PHY binding+driver (rockchip,sgmii-mac-sel): still in review on
  linux-phy. Not required for this version to compile or pass
  dtbs_check; only needed for the follow-up that sets the property
  explicitly.

- Generic PM domain (genpd) changes: runtime-only, not a DTS
  dependency.

The XPCS node is disabled by default and only enabled on boards that
use SGMII. The fixed-clock nodes are always present, as they are
static clock sources.

dtbs_check passes with the current linux-next, since the XPCS binding
is already merged.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 68 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 23 +++++++
 2 files changed, 89 insertions(+), 2 deletions(-)

-- 
2.47.3


