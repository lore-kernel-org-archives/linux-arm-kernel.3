Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27A8CFD355
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/9QGz46UYtLMXI1pmFW9bRaeIDfyEN0luwe8T1UQhkk=; b=jjnFpl/xa11/nwCRh5FOswjtJh
	9lo1A1us5EE+rtlMW4lukfTviFFNkc5co4fdbRcucRWnc9FDQItiLF/j0lKpRusjINLvD9TdoQgVp
	g2iBIbF3Q//Y41cj+C7uh1AhGo8YLbb8XjGFfSdla86vo6q5BuDc6j5Ww+IdiTaAOJVSiPFN2MSA0
	P9j/Rg27eXjf8vzaa8rPP42JSZg5BfxyGJIHuPGkK/T+dfYSaO51eiNxp7aahXMyoe1GEBJh7zHM9
	F2DGG+OvSjvcCzg6v3DOUeTOvMLSHton63ViylUuRi+32rTsgeYwBetNlBl2VgQ+D+fXS7NTwhb8C
	qhID8udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdzq-0000000CKiT-2OVE;
	Mon, 24 Nov 2025 21:21:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdzo-0000000CKhs-0coS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 21:21:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so4382313b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764019275; x=1764624075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9QGz46UYtLMXI1pmFW9bRaeIDfyEN0luwe8T1UQhkk=;
        b=ha45ODQ02aC0BQwwKt1TXQ5ThpomukDCdpjcUU98zhX/twiX94Y4MvOc02SM4VTM+y
         962F5r49DmHN6vEkzzF5uvQA2xedrLAJGAbFK1HamfjjpFEWcKhV8vjBIv0FE6+60m0m
         SVf+47yD3E8bqQM6iAcB0+mxnweCozbQ1Rupdk3cCt/cbsNV4llymmbG4nExlFr1ejHC
         v7e2QKE18DR5+Anb8339MAOTOwsPsEyAVyg57+pope8ubMXICKk2dEw8tBkWOzYE6qqs
         19oxOEtumJmh62/su09SzVPkLdX/B9aP0IXFMOA020+1TIFdhyBlXDkW0fkmVHAwfr3r
         pijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019275; x=1764624075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9QGz46UYtLMXI1pmFW9bRaeIDfyEN0luwe8T1UQhkk=;
        b=cm9vuh7eUkONN7zjDX10fZqrOACm7I47rSCV8PNIUsLLc26OmCO2LaRYpJVA/uLnc+
         QIigjjMhgOpiaVFKJZOTQIVpEFqW1E3MXMOe5+96TTlHJ3EMxgwM3Df55APiOcZ43xJh
         T4Tc07Beme/UBQLr4xteJMX7QRUwCuBjlKd2+z/9eo8svxkWGmaKurVD4bJej42lNX7O
         ADMkG3XyuEYPQbJkntzAvEfb+2dBmuuQgMmuBtUjaYGK2SLRZ2ejgtQlXD5EJbq7pVQQ
         hVF+8ja3SUgl+6XgtZtYVeRdZKmRzE76ZKMqhEu08GFDt5yQ6ohotIaRYMyKEi6Dkb5m
         cwbg==
X-Gm-Message-State: AOJu0Yxkikue3QqIjKGyg63L1NHHg9hKGzmjHlPczImcHj++oFxMjva2
	zF8DPiJYxyX9llDcqyKkBxK8NM9GGXY2NuhYlWa7KtlvNmvPBl1yLVJ3
X-Gm-Gg: ASbGncue+j5m0AU+Whh/ieL/Y2dU2ToTO0n65lLNdx12jDtmb05Y3N1ojA/ipV1nSQY
	Kx7TD6Cplg5i2GXJgxPmKod1vW9nHLF0atBb5USvS3j/T3xDNmHn9AUTAZbLw0s+vFsVJIbImMt
	P2B9WD7fKEYEeyoA3IwvuWI1THYP65GlwTbJJUY/EhzD05CROtFC5JInTwfKbpB+pSMRuMweaSQ
	+gpQdJnM77OZy+yRVkhkpHbgbl2inVHa73cXkqRXgI13kGa6UaArMZlOzTF7o7Fcq7fL4KbXERs
	E5GYJcOBQ00qV+zrhi5udrbcCnPHd7/0gXQeLt1unQo3z6PiqqgtU5sHtfcwITYQnjahIxU6DSD
	DjL/08HpxrQlLmD4rLfw7Br3cCofV5bpaUo9DOFZADFyNUNzQg30KOPsomljD3nrLFpP7qHMmMP
	zx9w==
X-Google-Smtp-Source: AGHT+IHgLL5D3yM9RdlZQ1MwTuPoHc0+CT7LUpZzSIOdrIYHqHAGsgDGRtjFBOllHJFbG3YjuM6J7Q==
X-Received: by 2002:a05:6a20:734c:b0:35f:cfb:1ee3 with SMTP id adf61e73a8af0-3614ecc9fd3mr13510474637.25.1764019274844;
        Mon, 24 Nov 2025 13:21:14 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed076eb3sm15702319b3a.1.2025.11.24.13.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:21:14 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	peter.shen@amd.com,
	colin.huang2@amd.com,
	Peter Shen <sjg168@gmail.com>
Subject: [PATCH v8 0/2] ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC
Date: Tue, 25 Nov 2025 05:21:04 +0800
Message-Id: <20251124212106.2068069-1-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_132116_214866_0D822897 
X-CRM114-Status: GOOD (  13.16  )
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

This patch series introduces the initial Device Tree support for the
Facebook Anacapa BMC platform, which is based on the Aspeed AST2600 SoC.
It configures the platform-specific peripherals and aliases for OpenBMC
usage.

The series is comprised of two patches:
1. Adds the compatible string for the board to the binding documentation.
2. Adds the main Device Tree Source file for the Anacapa BMC.

Changes in v8:
* Dropped the unused 'pcc_memory' reserved memory region as suggested
    by Andrew Jeffery.
* Reordered the 'spi-gpio' properties to group all '-gpios' properties
    together for better readability (Andrew Jeffery).
* Moved the 'pinctrl_ncsi3_default' pinctrl group from the board DTS
    file to 'arch/arm/boot/dts/aspeed-g6.dtsi' (assuming this dtsi
    change is applied separately or already in the base) to make it
    available for other platforms (Andrew Jeffery).
* Revised the 'gpio-line-names' for better clarity and alignment with
    schematic signal names, avoiding confusion with pin-muxed functions
    (Andrew Jeffery).
* Improved the formatting and readability of 'sgpio-line-names' list.
* Removed the unused 'led-2' definition from the 'leds' node.
* Added support for the ADC128D818 sensor to the I2C bus.
* No functional changes in the binding patch (1/2).
* Added clarification for mixed-case signal names (Andrew Jeffery):
  The mixed-case names (e.g., FM_CPU0_SYS_RESET_N) in gpio-line-names
  are chosen to directly match the signal names used in the hardware 
  schematics.
  This convention is used to maintain strict adherence and clarity when
  cross-referencing between the Device Tree and the board design documents.

Peter Shen (2):
  dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
  ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-anacapa.dts    | 1044 +++++++++++++++++
 3 files changed, 1046 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts

-- 
2.34.1


