Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC23C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nOqcQ9E+8drflPFHAs4vSUWLT7BoxqpED98LP9u+w/s=; b=KgJ5KTdjk8Tf6LMcC0l+oTmpWh
	5dVV8T7/fgPoJIcl81neLcRfDBiZbEGzV8iJ8Nxky+HWoVVKnHmYVEnDyWzjgT6NMulnW9tN8sRsf
	iQhOvzro02URMS9ZtsNgSfpUhBXmsWbj3uoVzBukzAbvoeUvDiVx1VJfQKkQdvedvWBdqnwTyGwLn
	cECM73X3SGwV+vE4bIGTVCa3MeteLNcyheCNmFfiYkMU/l/4Fdb7IpLfqbmE2DNluP9z5HprAkBwz
	T/9u9Ok5xGj0E/uYbJYovp9STqroPnZlP5DPsTI3/EjzwUWApKFCrRJQOwXOqA1JPYBMfyoXEnTms
	oQ8bdTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMzC-00000003b6I-3yTB;
	Mon, 30 Jun 2025 22:28:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMvQ-00000003aXX-32VK;
	Mon, 30 Jun 2025 22:24:33 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a43afb04a7so18517631cf.0;
        Mon, 30 Jun 2025 15:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751322272; x=1751927072; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOqcQ9E+8drflPFHAs4vSUWLT7BoxqpED98LP9u+w/s=;
        b=fHVYsOSt0xwUyYQJW10U1EzgI+ga/trpkQTbQ/31xH3c0ikiSF6+mi9L34qLnzFgwM
         JNc5P+dc7uIm8VSQcsVEKcNlMqWKJl0XDmDctPsQOP2+i1P4o30cgR9kaShOIvRZ7uRE
         NYiu0xSqWSURlO5JOfshzgjMgZ0qPawJol5TkfCEGFffLOQxqpMB1dQZ03dL1ydohIpT
         3b93QNSemRWVGdfnwKGwhxFBm4pMXLspl6/vCYyQYrkj/2SG158FOaLN7XARTNwRtQOQ
         VIPEpxa0DDFVPUyUCA20xjw8EZ/jCIeCIZJKSag3iNVkIRMOcJxPk4BweoSS3LJvH/on
         JTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322272; x=1751927072;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOqcQ9E+8drflPFHAs4vSUWLT7BoxqpED98LP9u+w/s=;
        b=TfgAYT6SwqhEBOkIgizKMoQ0YC/CKyDXiKEl1CmfqdkdU66ty6FY/YIYHw7f8Cjh79
         rJ+9PmpW4H25uKkof5VfVtz6VcqLcXZeLJ+0F8RVRjTxWXh2mBHoO7Fi+qWqdLJgNjEO
         MGVi/83Za7lkcFZJHmuB7vdFw/tqOAKdvWSt1BnRKUVYQCF9zplO914x7DVGcs6gCoTq
         oUGr4Jk2VJNNicCQvHw/a3ltahpxyM/7gv59ayqGlPCNISY/AY0UCOb66D1rl5/UHLNk
         +O95txZlWj/9CJL1HV8Nwp6tlC6yd+gQdevEwZRgeaP5mU9vqzW6J8e3kdijEDpVzLw+
         xirg==
X-Forwarded-Encrypted: i=1; AJvYcCU5DabeJ+DVU46jr2aeFEhXkvtib8eIoOHVqXo1x+JrBzv0pjAgL9g5kXlOvTHE/slml6/7ORfx4odY@lists.infradead.org, AJvYcCUiZxO3cQOGGaRe7y3CbAQR8m3wvQFV/6sputrWG2vqmQHV8tB2leTQu4lnbSOizXju1QZIRRgSVzO2kD4qxb8z@lists.infradead.org
X-Gm-Message-State: AOJu0YwVKqos6Z1vww2s5hTcjTuXQ6m8xX+b8lh9CAuzD+8TGgc2vQya
	OpvkJyexezqIX7Plal+gKOc9TZzSqvmg+vfTaLstjFx/iioQUnIExeYqB4i20bfH
X-Gm-Gg: ASbGnctnVqummK3D1LpRj9FArTgLdnpmMHw67p66sIVn7kvlkk41Bj5lbRgYTNi2njs
	lrwE7MA7zTaSlWt/CKHm5pCeyT4Kt2EN+D/Gk6u58Vfp6RCJx/e/70yp4vpVruizLA9AapTXVdX
	cUpk2iROx1GJO42aGu3hV7cRW+QIwK67vFtXqpBTJa2pO4HKBbnds4KAhOdO5vpBntyylKQ3Mmb
	/eoBpho3uJ8G6VASBlM2SJMtvNPAngxgvBsZRWcTR4tcpnnMGTwEyHLyjUJLpaOG0cQGYvFm4dP
	CR+a69R2mnRt9vaTPck8GvRclj7RqI2DezEhr9eIKcoiY7ztsOzdisDWPNw/
X-Google-Smtp-Source: AGHT+IHQqj4onXTfLWFSXWgdbcEMH4oCP6peKWldHaIP1cBl7zoluZL5kjSP1aRSbi/hl5ifZScA2g==
X-Received: by 2002:a05:622a:2305:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a7fcbdc53amr248768291cf.41.1751322271627;
        Mon, 30 Jun 2025 15:24:31 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771b8854sm74755966d6.37.2025.06.30.15.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:24:31 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:24:15 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 0/4] PCI: rockchip: Improve driver quality
Message-ID: <cover.1751322015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152432_759932_218817C2 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

During a 30-day debugging-run fighting quirky PCIe devices on RK3399
some quality improvements began to take form and after feedback from
community they reached more polished state.

This will ensure maximum chance of retraining to 5.0GT/s, on all four
lanes and fix async strobe TEST_WRITE disablement. On top of this,
standard PCIe defines are now used to reference registers from offset
at Capabilities Register.

Unfortunately, it seems Rockchip-IP PCIe is unable to handle 16-bit
register writes and there's risk of corrupting state of RW1C registers,
an issue raised by Bjorn Helgaas. There's little I could do to fix that,
so on this issue the situation remains the same.

---
V8 -> V9: modify third patch to better reflect authorship by Valmantas
V7 -> V8: add Valmantas Paliksa Signed-off-by to third patch
V6 -> V7: drop RFC tag as per Heiko Stuebner's reminder, update cover
letter
V5 -> V6: reflow to 75 cols, use 5.0GTs instead of Gen2 nomenclature,
clarify strobe write adjustment and remove PHY_CFG_RD_MASK
V4 -> V5: fix build failure, reflow commit messages and also convert
registers for EP operation, all suggested by Ilpo
V3 -> V4: fix setting-up of TLS in Link Control and Status Register 2,
also adjust commit titles
V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
suggestion
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (3):
  PCI: rockchip: Use standard PCIe defines
  PCI: rockchip: Set Target Link Speed before retraining
  phy: rockchip-pcie: Properly disable TEST_WRITE strobe signal

Valmantas Paliksa (1):
  phy: rockchip-pcie: Enable all four lanes if required

 drivers/pci/controller/pcie-rockchip-ep.c   |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      | 12 +-----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 15 +++----
 4 files changed, 36 insertions(+), 43 deletions(-)

-- 
2.49.0


