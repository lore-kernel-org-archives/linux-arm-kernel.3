Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rzldGcr4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TfzLH53m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=; b=rzldGcr4GsG6WlQCFDZ7Ij1/z/
	3qsW5RCo9/BseqwIKLKw6V+4DDgUTRy5h2wmy+C18HJ1kN3CAdDnAsyORZuLs/n3iJUFMC5cTDpko
	jx98QgBnVg3Uqv0CiwdtYuhQce92qcoylavS0yR/GXzb0aM4faKt2HSMXVWtuDgQc7R0qmwB/xEm7
	ueRQl1rFRrWcgrSbDw/jxIZmogKN1qWu46m2q7ODsi62b/Cr/676F5uDEIKsImRpQzQm3wZxTJxMD
	PjfuQ43gOk1KGFax0G0bld2hu949liG7mDiys2PID7YByAzzefamqI/bH3IihJdHr7UaVCMHaRFj9
	T44p9fTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRW5-00000003EKr-42Hc;
	Mon, 26 Oct 2026 20:42:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRW2-00000003EJt-36zy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:42:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so17842545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047316; x=1793652116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=TfzLH53ml8tr53GKrxYVp2TS/rT+Ad3B0ZuB2IzMQLpyZh+4Wd9IfMrLj4/Q0ty2Fg
         hKBYnKQtrkZHqSU34Wpp9vSCez/5coQjfjHIgR0Ve6YMntyrVMH9BOxrMVn01bW+ZK2u
         QGV3F3+n33ryurNDsvtscXUgEwkO3dVfw3YLKyKFS7VTb/YySPZi9xj1doPgJPtbI3b+
         StumtN0c/AK7HUB0GgpCQhgzXV7Es1gVfqBaDxnJnDBoLhMaPEKypBhWG4lhBpN4S5CU
         wyQB4wK32vdzFgeMQqJvMgJjH4A4OMf/N1g17Y2uL6d6+/y89MZ/gh1OK8LW+aHmJZ9g
         j47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047316; x=1793652116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=leXecMVvmakZntZ/PPU+Wt/s1ffkdbiwwM/bzmotKXmnMdMWh07sWy3D05sG1pCrRo
         iH+xYasgxnfAf6/4k72571mM7XJOR8KXRbr0+IOTd7Wn/xNcPHxgeeel/UT/H67x9hKk
         Yr016+rwnCwWaa27fPOHGeGpUG8zBPsDis9nZtGn9pkWVemWwHijuKYJ4ubfQP0f16ap
         b08JljR8TsnLJAkwFioQzfunG4DUWLhj9G9jTn2CXBUeUAElKSdpFIrY3Cl0OXVReVv1
         JN+Zabca4z/O3/40/zq+Ux3Z5yDmofhbNAEIS+8orBgsq9AWhh4mNHgWobavfNbUaPkM
         zPgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxfDbZXt0kMLeNw7viB3YQipHtPFxoJu6+S8dV8YQKzi2zq9UQhv6KDh+xL0rkgq/gux1Qs2fb4dLtckbqWGtc@lists.infradead.org
X-Gm-Message-State: AFq9FYJs6G2GrilMnJIFvifelH4ZRqgeH4K6XyKPEP2Uxxwz4zkrXQPh
	RIlkIiogP5+53dL4vyfDZHS8U/8b1CswTnuDQx+5S52Lq/U+5uWTnYV6
X-Gm-Gg: AYBFou1P4OZHOuOfxhMwdpQs643MYWUznqInrMmvYT95CcDvDAq/2anVqIZ/pLGVYKU
	0uW1dEOmluva2DaraLla//q+krslcZII2xeKLRe7LOUDuu8Q+s9VvbgBlDVv8hkscNfFEadMVMk
	sLER9Bm/fkh4V78OdTwouWqg4MNFJBeRYIqUWDKwitcL4IUUdnygkZI0XrH6EW3f00sku9KQzC6
	IATo1mzH757URGTjEZMyK+QPis3CbVN1+f4prMBZ+CBcl2bVTEKE8OLipHMoGq5DTuXvQWLv4Ub
	czXb6DLETEMpMZaJVoZLtre2OloNDL0r+4ZOEuzujEVjQ1UuOBVFzsJLjW0LDR1kPW9WlDqmA9g
	bi6ZTYNejodtMREUwQUchaXQmy/dstZA2rVj23WM8S/VnkHhy9901OiW1W8+WLpDpkct4zrvCSb
	yGxzyKP/1XPtvN+STpPYhCTP7Ob8fyRB7DhEfCZLk+0qj4SmfChp9pwA3oaUsk1/R8DB8IRAIWW
	BEKTXur/V8lklAZtYz6j/Y0plpB1SAgx2KpRsDFrU8nZ9P9PS1iQQ5ownSNGV5/KzmKYSKYSLhd
	eKXMciCBapd6gOrKipJxlaqPK8inkMXSk7p6Q0wFS21M7lp/HDyAtBpJDzvTbaIT1rpyWuhm7wX
	A7LGJTQMOEqSDV85nuxUVoSTBepi4616mIkgjgA9S/bLmDrelghSllK80TnISGF65qSum+Y25jQ
	mNmLV0
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr150264255e9.14.1793047316294;
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:55 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:52 +0100
Message-ID: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_134158_845084_45A48332 
X-CRM114-Status: GOOD (  16.45  )
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

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

As with other closely related boards, such as the ODROID-X2 and the
ODROID-X, the ODROID-U2 device tree includes the ODROID-U3 one and
describes only the differences: the micro-USB port is peripheral only,
as there is no VBUS supply switch, there is no expansion header with
SPI, and the 3.5 mm jack is headphone only, with an on-board digital
microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available. The DTB of v3 is
identical to v2.

Changes in v3:
- Fix the line wrapping of samsung,audio-widgets (Henrik)
- Add Reviewed-by from Henrik to the dts patch
- Link to v2: https://lore.kernel.org/all/20261022055208.17746-1-pepe.schlehofer@gmail.com/

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 4 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)


