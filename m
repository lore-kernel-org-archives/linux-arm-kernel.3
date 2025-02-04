Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA82C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=; b=t1hXdWHDTup8o2XKfISQXhEAYD
	Q32irIxn9eKhEpiwL/fIsFtHEBhLtNl/m9au+LsUx1AUM5I+5VL2LLpWmAtp6frN9jNP665R/2DS3
	1ezvs7f1rUDl6rpLukUZYRDziwL6ZKA7aaz/gwFUJEMKWSeUCimdC+uojjYLqpFU12BAtAEynPWRI
	poO5gR4Ekxy/Thx4foNGEzSPDvayjAZpz/BUA7vLmAfaaijwRT9TgIn/GWM4WP+Ud3JkOVeuYz0NP
	yS71nkU8gRaTpXJWbOgyWIKlfoXhOG2hLY31751HFFej5X2h3yZPZYuqArjbL41aFitC5ZC5Osxah
	EtesLd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDnE-0000000HT9I-2nnm;
	Tue, 04 Feb 2025 07:56:24 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDlJ-0000000HScC-0gSR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:54:27 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b7041273ddso466022685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655664; x=1739260464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=NPpZ/6BF6H2cLy+Ialrel8K9hGg89uuH9aj806XvbEowxuj6euQGvjjQTW57SBTno2
         GFXypnF1u/O48IQ+cBN8HepnOe8qBNWTagnjL2i5bGx0koFb3vgrj/QKp5KVHFjNuogh
         jebwS1Eyx9SWP81Q4/0RoRv+GWO4KAPHhbnfeHwVC2IDxQlKpLHpgiFzqxpAiPW+bTCA
         DmF/6eveFcdaec/0mCG/kQbc53AxSYfLwZqtJ98pAxiyTCa1zsGCu4etwHAX4xUWEXUV
         01VBLUTgkZ0eW9IPyGXQH5yRDpHTpNfAoJk+HQtvtGk45E5zGjPzAmdpf6vIYx7K7sX2
         UtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655664; x=1739260464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=G+QdG7p3ESxKwklhZ52yC8SP37XA4gcNLIq7Vf2y1SacgafV1Ovka+dttqES9d99c+
         uYXENLw82cAi3TBkSpm6UvODRji7aPhrsVx9J8CTlqwaky8FDp92M3jVjtIQuDAqj2Pb
         taPpULPUSCySmykzXlDeN/G7eUlpOWy8WFi0A4x69DhQoNzCusTz7OHZaC1u6mNIfoPX
         57XtzV8EWgD/RwVfuGj+eVQo+HQ2kzb1cYv169YltcNQofNZ2z3q0N/A/jZVsaKqh5ir
         j379WAbjY9wAcemOSDXi826cG+ONVW507EKrA8fgBxMHo4FY/RRykwg/14An5RcswJ3Y
         Zb3A==
X-Forwarded-Encrypted: i=1; AJvYcCUzXfzUPuRRqT4+l9Sjf/NhHHV+euEVmEX9d85ceujhAJUPHG1Q6al6yNc5ibwH4KISjwmGZFZc/mG5aVO9jnW/@lists.infradead.org
X-Gm-Message-State: AOJu0YybwZKS3jDyz5fLVbclwWtfN38j7Z3y52t0kYuHV9gn+JWHs5YN
	KpUjZ9xiPUA8bsjixHeqlXCc9TA4fEYCPuyTVM0NqsikpRnrYo0y6aivFPArqlc=
X-Gm-Gg: ASbGnctV1B5VVuj4xDUP1dpZLhdEq8rPEQRcGeuCJ5aAZdcwjWX/ykkX6d0w0ImSILR
	ELQVPs66u96NXIt1Abk5w/SNiIhPb8BcReOk3xqfhOypI795efRlXRZ5ubvp1TPxDfQt0b3VggQ
	bidvCDx5q77jGP6WhXLf+qFTjfEDslmsZsPgqFhJXDG5PBADe7pDUKOmyGGMxMG/ryNWGVTRRFB
	sMOxNqOVS9kUVcQ7WUCBRr7/L07BdgmGqJTLzMdCogv6UOLFptaBlYYHQb60uZnzyA7By4+kbBd
	pu4VAHg9FNGTvXj/7TOlEViopykNZET0+kY7F9I5IIlNBbtT6+03dyY=
X-Google-Smtp-Source: AGHT+IHnQYtrMWCiX8smMX+KNobk2NbP0fzLkqVqwBS3IWCPax1EIsVPqU/PPsh/vQevjqw+kgDNzg==
X-Received: by 2002:a05:620a:688d:b0:7b6:da92:fcdd with SMTP id af79cd13be357-7bffcce1d45mr3575797185a.15.1738655663645;
        Mon, 03 Feb 2025 23:54:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 00/10] RISC-V IMSIC driver improvements
Date: Tue,  4 Feb 2025 13:23:55 +0530
Message-ID: <20250204075405.824721-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235425_212726_227B58D2 
X-CRM114-Status: GOOD (  12.16  )
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

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device
  genirq: Introduce common irq_force_complete_move() implementation
  RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 177 +++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c    | 127 ++++++++++-----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   5 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/migration.c                     |   9 ++
 15 files changed, 224 insertions(+), 157 deletions(-)

-- 
2.43.0


