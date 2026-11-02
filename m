Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52896082BDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YJnGnjFX;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lGybLoNM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=; b=YJnGnjFXftIoiQC8w/anjRjUq2
	qOwm8su97TrpCtXbxABUyOgld01sl2pLpW37nN780p0P15kDxb01NygfBH5M4So/HG2hZ9mRmL4aY
	9odn5TA/ZsjSWvZABhwC086R7tbUfXvNrd7GhmuLDgrpcgh4YmMAUokjxhRcXJ2ldyfZaCUtPBRJf
	VbAxU5scrhuQ8wW802ai3jH9bBUWS7pVGeGODw+29+Px4+ZSlzizWrwW8Jw508qpp6iwzM6Fbd5CI
	G2iEYqUwZHBfuzylJ7Nsvi8wHF59wB/wfwbPSE3fTNqogo9ut7oN/1q75YpGSytSu7eWJSmnfhE5r
	qUQqUaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy62-00000000DFq-3Lcj;
	Mon, 02 Nov 2026 19:53:34 +0000
Received: from mail-wr2-x08.google.com ([2a00:1450:4864:30::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy5z-00000000DE8-1BfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:33 +0000
Received: by mail-wr2-x08.google.com with SMTP id ffacd0b85a97d-48e293ecaa7so1001958f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649209; x=1794254009; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
        b=lGybLoNMLdJjE7ZFOxoax7p3j29ZFTVtWpE6e0b2WXgPZqD0MwylAnzjdb9ppQMUbq
         m/9ON5CElGVzfJCm6xrFm4vDxgAc7nuyOczOKFSenNlrLMn/sWKPVIqx0/17gPyieQ7N
         G79zycmfAbxRy6hZl0KZDtz1A8A8h7w5xnpmiQEdmNs27jX5N7TbzQQS1jAsUVsmB3mm
         D1s3HKOK7AtVKNwZDKyhdtQPMcWyVW1ncElZouRvCjGXfX7keJMYAv/2fZU5U1TRDSu7
         KmnVZFSe9+saBZhqHpysnhLXogep3vxHcv/kYA64SAkbJt6ShPQJFRzfOK4kvfnq8M0O
         aVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649209; x=1794254009;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
        b=rJTtVQkOpMq4KaKAWdH8tx61mP3kxR9uCGYtFAF9BJA3gNSrW1QvCqHCZInBkt3bjI
         7Ii9zIPEG4FWxIRblAx1nPCBnbAdEdyp5C1OPANZXWlgBh7da2PqQW7NJH+j3vJUmgv6
         /XjFtbvlsnYkh6TjS/VDbvQk3GIPPhKnMM9mTvh2exegnyQ3KatmN8XLkst+5aI7sTKu
         A691bcbwA7wJ/RiatJ0oM/Rrkv/qNrc6CDVggOHt1xwwJBzaIXDu5q7lOyOIv9dlDi3J
         fsrXwQwRMO1waDnnl30gRbDBSt2f88jq9XXmgH48bYzuT4mr8uMcw6yhVt92zn6pDbsB
         9LMg==
X-Forwarded-Encrypted: i=1; AKwUvBzYwX9s0EjysYqo3txx9o1tGADhbgHbrAsYHbRRuX734flFWw2hzhdvABltN0/u/Cs0i+n+P2g7ieY76KELp3kH@lists.infradead.org
X-Gm-Message-State: APuU4Z9HC6jGFajFxcO1vs8iZzKl589Lt5viEZsbQ4Se1oHrVKwXCLaw
	MoIemkY8aB6GpMD7eBCOwt8uSJjR0aMNIRuG9QEKZLWaV86g1kJtAC+EQF8DC01tfBk=
X-Gm-Gg: AYBFou0XzfCb+1g0EgHxgrQ5eAvJbPbaITy7JSqJKjuJFA4iF+mbbBrqoKU1mziiuA4
	XZQmgncw/+IoHFnLMl2kZYvAQDeUKxICH7gnuh9jPwNJv6Y4J2nTo/+QQk6nUNav+TDLrRh8gU0
	h4ZkRHU64+ZknsEt2vvZQiZPMFjHrMI2Qvh/Lhfi9o3iJTITRQytH+LVaGI22iS6g8ZCTR5WxOI
	9YdbnYQUPFM/SDMa7LjtR9QglbroYop4ToMnU7mJHznTX/896ggIh7CnBYat5NeIiadCHW1HpWM
	Maa5PDBHQZAWjKtJs3znMLsFjDadYxfaRKCSicVogA77c/AOkygk1loS/Pd2Q9iGhqQroSjj2H+
	m2QLA+hM0eXg0xf//X/nG+PO619YQUk34M3JgcsGGMYYQ0KxmSEJG3H8G8UMUotZuMUyI9qH/Ft
	9DlPt7i+N+vrQb429HAtO1u0iNkOhiKVnPebqZzF+DgUq0FxzDRIG3Dng+KrAJcZHYqP7oSLv5M
	BlTzh5e4PAWgtvO51Ij0wQ72FrLbWiYuH5PN1SEfjPYLxMCqMADdiZHfnMKpUhbNa3DOq267OLa
	XDmZGALxo02Ns50mdJb5ZBGA+wOQCJAxrQw+R9PTfpj0LymhFpQxPjZNrWeloMGdn37NXNOCdL8
	FqdrhdiAWksx8Hg0uThVjr5RCGfI=
X-Received: by 2002:a5d:44c6:0:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e6e4fad74mr19327972f8f.23.1793649209253;
        Mon, 02 Nov 2026 11:53:29 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:28 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v3 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Date: Mon, 02 Nov 2026 20:52:46 +0100
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ph7YWV97DuIAyQP2hpMVGQ
 7i7BWOiC5ZfMvO8IwnoLQZy2IzEY7TBui6NbLshpi26Bqmt0ibAQHHGJe2LwbQUr4PzklZ3zZW
 m1RAoiDKTRjOe14qk795jbZ+LfDp/dniUFzTDzM0XrQ0JeS3pyOe7b0WtViKnjJbCYMaA7xno4
 812hXc75xsyZyL8QKDXIUiQkEIIyEFyhD9omqY3MYyDOxoBAAA=
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2941;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=/zToKwQTm1t+VyPJvHbpStnNft3Pne07RC2dktu4oxk=;
 b=G0KWPNDEdZFaQJ1h9rp2gNIuq5r/X6WNHQpFFKlZFbFyWDTVZqmxnjbGt4Z4C2+kJeiZr6TcZ
 C/pGNRbhFcuCtpX9ipEFYMG5d03ldaCXX/ODi1VObVVP1auFfkjOCrI
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115332_029892_4BAB5B88 
X-CRM114-Status: GOOD (  13.68  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Storage (MMC): Update MMC node settings, dropped mmc1 hwmod.
- USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Without upcoming Andreas's patch (not yet on the list) that silences the
WARN() for the missing hwmod from DT, commits in between the hwmod DT
and the code removal will get a harmless WARN() during boot.

Tested NAND on DM8168-EVM, seems the pinmuxing is working fine.
GPMC_WAIT is left with the pull-down enabled where a pull-up would be
preferable, and GPMC_WPn is not muxed (reset default). Neither causes a
functional problem.

Changes in v3:
- Collected R-b tag from Andreas.
- Split "Update USB node" to have separated hwmod and DT edits.
- Removed mmc1 hwmod, splitted in the same way as USB.
- Reorder USB reg/reg-names to match the binding, rename nodes to the mc base address.
- Dropped patch "dm816x: Correct speed for sysclk5", it requires more
  investigation.
- Link to v2: https://patch.msgid.link/20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org

Changes in v2:
- Removed useless "Prevent USB being put into idle" patch.
- Dropped "Match up capability flags for USB" patch.
- Refactored USB node patch to use ti-sysc instead of usb_otg_hs.
- Added "Remove hwmod code for USB" patch to complete the ti-sysc
  porting.
- Using DT include instead of dt-bindings header, dropped patch.
- Link to v1: https://patch.msgid.link/20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org

---
Andrew Goodbody (5):
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Update USB node
      ARM: OMAP2+: ti816x: Remove hwmod code for USB
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (3):
      ARM: dts: omap: dm816x: Add specific pinctrl config defines
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl
      ARM: OMAP2+: ti816x: Remove mmc1 hwmod

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts   | 17 +++----
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi      | 78 ++++++++++++++++++++----------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 46 ------------------
 4 files changed, 80 insertions(+), 81 deletions(-)
---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>


