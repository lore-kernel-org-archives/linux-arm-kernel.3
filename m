Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016B8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=75kKbb31JP2zVHFIDZ/o0cPWp6patqfUDNdVfPTRa8g=; b=10dt9ecrU9aBNBMw5vBpX5QLrm
	g19xXxlxEqLQr1V6+TItpSNANONWHVPjBSdDlUZy9lBWleDRcdcGrpG01GpcsiFvJN2hwIwaMCuxr
	oUn8VUS7eE5m2EXgM2uhWcuu0AwSTJiNbRnQWfvFDRXM8IA2V/vsfajXqt/o1LJLSO2c5fIe0EB0x
	7EEN0/4HyIasnafXpf88y+puh3ehmKkPzsn2ouZAJxHJVQi0WbVaqjL9zn0hsqCk8TQXpskxUDw1J
	wbJy2O7X5LB9w3uGVlI3n2YL/tk459SrxIMzUIE/pWTAN8reUdw6/uAGePzr+jSpFQ/Sus0gjvRPS
	XiiCKHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU72n-0000000FH1u-0Z7w;
	Sat, 04 Jan 2025 16:30:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU71c-0000000FGpp-08rX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:29:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436249df846so90723015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008158; x=1736612958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75kKbb31JP2zVHFIDZ/o0cPWp6patqfUDNdVfPTRa8g=;
        b=gGLuBPYN+46fvi0LM7VLMh+v6CgqjpKjohx5TqbxB1hWWBU4evt4s48b8InxRXV9FB
         0HUeY7AczoyrtSG9aQBTdW7UQSCHInScAipVBewxbcYFHyjPJeOQS+jjJXQmsVFRv7Y1
         5Zu183JszKO87jugauS5I4d+Ru1k/Iy15zIUPqLO7wYNbN80RewkePIILE724/JDC6i+
         O5tm8UKBVxiLNjlYjSsUlkIjVkpsHoMDFrQN1fUX2OvIW1qHTqXQCuGv54UKDtfSA+Y2
         guzRpaoWgXbtI5S2VVPFwnzC3xx5ZtzTAgQ6u1Q7qtqRUUQmP3RuyXZa4UOsAuHOPieh
         vq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008158; x=1736612958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75kKbb31JP2zVHFIDZ/o0cPWp6patqfUDNdVfPTRa8g=;
        b=JwWWY7ERhWUy3ZMvN304ga+3inx0x5eLAJCiDPO+rhYDR2snqq1J9A7KSvDflDScgl
         Er19eMCO7OPE9fbgieAh3L1j4Qkv7o71ONJzKvPEIYphVBohRRs9uCezYC0mc6BGUusG
         funN6dB8aAei+Igfor7pnAEzUm25G0FjKn/tE5Z+Uoci0UQNhtmdxX5K/jv5qyLraFbH
         uX8zmtm6406FbprXXvULyuBnKhvdiYaCZZoMeTeEMYXxfBgQ+80UUPWQM/jFsR7COJgx
         wJejP7qg2lAUlRlNl12xFk0HQyXwQcP7kOotqG5Ba/7nZprEAYLJm50F5XllFSKtixZG
         bs5g==
X-Forwarded-Encrypted: i=1; AJvYcCV5YmAI7LBItKE9DmCjFNfudWOEQh5EhFcPe4cWtHNMGz2/1CHDgQy0lGZJGbgIXWOEqghbDS192pJVx59+ZKOy@lists.infradead.org
X-Gm-Message-State: AOJu0YxCdYQ+iq0oGBwI4pxxt1DnFAK/KnsrHyI2Y20F+UEm0EZVcCUQ
	VlRKe+LUe2iqLRB/MULYqoPWFkferNNV9u/t0JtITmqdbRBQjz9m
X-Gm-Gg: ASbGncvsSxyq5u3j9UwhgSxuywXJkE4wjncmCab6ocP7I+lz31FiL6g+1nRKgK80uuC
	FYWX2dEWFJDC7x31nhVoZUR7748br+YEgp7Ib5SvbMGVOpBxJIa7/PGD3gOyhggMvWEzILjrbXK
	qc9E7drPRumi7sRIZr1Hrl0hjIv5kJUlAUr+9W81V89KAG4+T/zPRG3S6zn3kOZNIlwnXcsYZTL
	sFR/XTjj8cGo0Mq2+K5NC/eTupNSgPMvtSkW2YhzyDlolEPbX3c1rfvJ5cBiYI2huW2X98=
X-Google-Smtp-Source: AGHT+IEwXbvJYKrDP+G3pOKdVCJMWC5VrzP8JtzhdZgCM4Ja2ck79MkUoLJzlgAPiaoTuEpTbft98Q==
X-Received: by 2002:a05:600c:154c:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43668b49a47mr423056215e9.22.1736008158197;
        Sat, 04 Jan 2025 08:29:18 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:17 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] soc: samsung: usi: implement support for USIv1
Date: Sat,  4 Jan 2025 18:29:12 +0200
Message-ID: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_082920_070549_815381EF 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hey folks,

This patch series adds support for USIv1 in the existing exynos-usi driver,
as well as dedicated sysreg compatibles for exynos8895.

The USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895).
It provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1). It's a bit different from USIv2 as it doesn't
have any known MMIO register map and the serial protocols that it
implements share the same register base, hence why the way of modelling it
in device trees will be with ranges, like so:

usi1: usi@10460000 {
  compatible = "samsung,exynos8895-usi";
  ranges = <0x0 0x10460000 0x11000>;
  clocks = <1>, <2>;
  clock-names = "pclk", "ipclk";
  #address-cells = <1>;
  #size-cells = <1>;
  samsung,sysreg = <&syscon_peric0 0x1004>;
  status = "disabled";

  hsi2c_5: i2c@0 {
    compatible = "samsung,exynos8895-hsi2c";
    reg = <0x0 0x1000>;
    ...
  };
};

This patchset also assumes that [1] and [2] have been merged before it.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/all/20250103082549.19419-1-krzysztof.kozlowski@linaro.org/

Changes in v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - restrict the possible ids of samsung,mode with an allOf:if:then
  - set the properties samsung,clkreq-on and reg to false for non-usiv2
  - only make use of exynos_usi_modes
  - make sure pclk and ipclk are enabled

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for
    exynos8895
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1

 .../bindings/soc/samsung/exynos-usi.yaml      | 55 +++++++++++++++----
 .../soc/samsung/samsung,exynos-sysreg.yaml    |  8 +++
 drivers/soc/samsung/exynos-usi.c              | 42 +++++++++++++-
 include/dt-bindings/soc/samsung,exynos-usi.h  |  7 +++
 4 files changed, 97 insertions(+), 15 deletions(-)

-- 
2.43.0


