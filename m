Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18559CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1J6WMqH03oILDs2/tT5ntrxwega9iCwgysVz89dOfmY=; b=sm/JCcPHZ9ANUGdm96NpZScXcf
	5KTt3IuZdNVCDuZU9POG8ItvdAw3nsNPIehGJf0yGdCFBAtqZHM++j3mP6gcfZwxoMnPjG3HuCYm7
	AjOL1g4I9SeS9u0XpjrZfRuS16z6j/0nvIL7TYFsvfr8hfygqLM20/F9g043wbz5fmjIwMgr60lOR
	SZ6tV8gDMZq5WyvMDcXEwB9L1MocKWIR791ssCtvdSzSOJB1YBW7IlP5dxzRHbrQ9mMTSzHDStBmB
	DTqtPeyYGrFOL9u58uUJ1k3vRNNivbSoPFozfvcn7MU1JNX5qbt4EnvcjL6NDOXk+GejAk72+WVmH
	jajiLM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnh-0000000D0w6-3YHY;
	Mon, 20 Oct 2025 11:11:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnf-0000000D0uz-3x1N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:11:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47117f92e32so25748455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958698; x=1761563498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1J6WMqH03oILDs2/tT5ntrxwega9iCwgysVz89dOfmY=;
        b=ZLYu8JvTU93fzQUMwTdYx+LExfelYEFpDWwVuxnPv+QkLpoMIbVDs0XqpQgRd1r3Ma
         4WTFXVd5Ptyx9YOojUxLl0jNSa7N6mYsFu3JnkaEG4NFXLfFchpH03/jv03rN/Nfy69e
         v9lX641Qvgldf/k2kgkFTwMvSWkfevHirM8Bm4rI6SYj8btwzAAreOCbTx1JrSctE2Fr
         5X6I5YvZbxD17gEP0fxCSelpA9Q/ln6YUpz9tRp7KL0QnjeRHdvSJ9u98J4EjyqcBJJw
         ytoOrFkTM97spBG1aRufWxHis7UpB2GSKqO47BjxAe6eNHMDPsINdU9Dx3z9AyregJ1A
         ILVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958698; x=1761563498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J6WMqH03oILDs2/tT5ntrxwega9iCwgysVz89dOfmY=;
        b=bTS9B1hlJmiY1LJM0pNrKb+bEk37MC1r8e2vcoZje0Z27Ij/CBvXnIJzr1ufOCeC2X
         S4+z3hMvMCsaqcTmntV5EOlLBNPr61bxkopzrQEIK5rgcj0DxfArJPfK/lc/VxaPeK8B
         8DdfofJ3ULZHxP5F72dnRKys9Q7rsg1H282nCk8emuhgraOwCHaFpEfiS0pGqOf0Dl+B
         Voe/xohItbXoBuDPZYKT05sb2tLdSusxD5oVMCiC8bWecBDESHeaK70AKWTdY3FjWCIG
         jzFQNrTuKKKhnBAf6u8vGPuE9gs2pTlz19nOx45D1ym7b7NUiP7qDR16LfgDFBy+HoRA
         FFwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYlNrYavkTLn91TNSz7uxIME2Tsh3/KYLYNezcxdKqrKHlsVCIOHQ1XgulCHKewXgdjRa1wc4guiMAsAh1UsGs@lists.infradead.org
X-Gm-Message-State: AOJu0YykhxU+cPkoQd985ZvReDXusnNd3qqkcZIE0hSIoOEUhsmAotig
	870B6qiOgZBd5CyOW1ZaGRmOiBTDX7W6WL/sbdwc2E4lgSOP9FghpR1x
X-Gm-Gg: ASbGncuj5bkHuOze38MFJx73vMgV9Zrc+yWDnjW85RBW9HqqP68PgjiUzxo2mXHpytL
	z2IOtbBHSzGgqTMbpu27423Ye7eprldp839x2HrffKU23XnY8XlCavYBepQPaE9ImR1zAHNRM4g
	08Ek/7E6fZlgy1z24lsEwGuihJZp5i7T4TaFUKROFS6M7VAXqcBea/2YU1cs5qiIdGmARImffgC
	J1nnclp7NWKnLSoMSC5dIsoft8qBz8p/sj80C7b8Y56fTO3t9JJFehsO9gP/JgH3tw3fzeU+lNn
	Zv6n/sAVV9S5HWlzFJYlcrrCJC4td7Dynkpc8+eU7kOEy0p6yFY2d7fKeGK7lxrHvlvfGJf4gNJ
	1M2hfFBxkoqLsg89u+mIsZZr4hH5TlprBZthU1yCWRAbvIH+unmOEw7BLzAPsQCA4NgGKUUUkBa
	k00gtojsPkJzP+6/tHnlKJrVKxEWajQdgQRI1cVOzqjBc=
X-Google-Smtp-Source: AGHT+IHVbG6TZHa2zycGcNFH3hDK5XZiaq2XHp38I80LU/N8i2ztgAzL/k/rCSUQlcdD5KrEG0KaOA==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-4711791cadfmr110884785e9.32.1760958697834;
        Mon, 20 Oct 2025 04:11:37 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm12692219f8f.10.2025.10.20.04.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:11:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v6 0/5] PCI: mediatek: add support AN7583 + YAML rework
Date: Mon, 20 Oct 2025 13:11:04 +0200
Message-ID: <20251020111121.31779-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041139_995884_423BC18F 
X-CRM114-Status: GOOD (  12.78  )
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

This little series convert the PCIe GEN2 Documentation to YAML schema
and adds support for Airoha AN7583 GEN2 PCIe Controller.

Changes v6:
- Flags -> quirks
- Align commit title to previous titles
- Drop redundant comment for PCIE_T_PVPERL_MS
- Drop DT merged patch
- Add Review tag from Rob
Changes v5:
- Drop redudant entry from AN7583 patch
- Fix YAML error for AN7583 patch (sorry)
Changes v4:
- Additional fix/improvement for YAML conversion
- Add review tag
- Fix wording on hifsys patch
- Rework PCI driver to flags and improve PBus logic
Changes v3:
- Rework patch 1 to drop syscon compatible
Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (5):
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: Convert bool to single quirks entry and bitmap
  PCI: mediatek: Use generic MACRO for TPVPERL delay
  PCI: mediatek: Add support for Airoha AN7583 SoC

 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 164 +++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ------------
 .../bindings/pci/mediatek-pcie.yaml           | 438 ++++++++++++++++++
 drivers/pci/controller/pcie-mediatek.c        | 113 +++--
 4 files changed, 683 insertions(+), 321 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


