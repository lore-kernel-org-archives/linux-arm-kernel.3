Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CD1D767CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4KSyovOfDrHV8NZhZMB3HLBTUX+scqNEzF0S7bESVM=; b=vSB1PyB8W6ThZzl2OKkWa+E2Ut
	vfAMOM4MZ6rNhS7dES86Q3BIt+zJ8grGqc2B62pP6X/TnQ9BfAje0uuMXv0LK5AnwFaxjEDcgkrJQ
	eQDpREwac8pOss6n2HjecfokBI/zp1Mp6XaCOdl01MEyosSQwQjqRvCinkGOJ2dKrJ02Q4ffXFoPX
	kbNny+JMCaIqr6dHh1ZGBeNraploBHtodsI7Qg5WNMbmw/+arzgTeCntfhY4esdT6ycyBdxQQMggx
	xIXVRvxtsP2MwOJOpMkzVSbEzjsjP7d7HJrflZzxX3jFejd9nmG+rl2ugppEh2bAtPzOJjQpNBPI4
	vwZ6isCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VjQ-00000003kLX-41XV;
	Thu, 31 Oct 2024 14:01:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6URV-00000003YF5-0v0o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:38:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e5130832aso623002b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378304; x=1730983104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4KSyovOfDrHV8NZhZMB3HLBTUX+scqNEzF0S7bESVM=;
        b=J34XKRGsyUyGUnBVQ/opJG+F7sKR09t1MOOiHM9vrjsRWr9szMEpuJp5wKtXkQVdIn
         kQlfo5CIXMuuvv5pf8DHoWq6bwt0OM1hQgnFQFbbZoxiyYqzANZcGfMPNDZV4kOMvBSk
         tjxoJfbsNavhdpAbftz9N0SVfd09JbUbquu1xDsICRvK9fWdcWWNg+wGivY2U8zIcBMu
         JcIRNAFoyNJZN+XlZW/bOQg8y2N/5BST3JIvnEBTxeRGkJk4GQvzPeFNEX9ZkiAn8wnK
         X8rTwmQazupCA6fePN5yCvMou64NfGejRSgvyxacgaNc0YdS8MwLoh4oiUtYO9VvqhbK
         jfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378304; x=1730983104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4KSyovOfDrHV8NZhZMB3HLBTUX+scqNEzF0S7bESVM=;
        b=UAcwXXChUQss3wm8+XMWfOq63iFohIITL/K/cmXpYm+thpFWz8s8FDmvky2IOia6bs
         yLnoxPuxKyVRRKr1niwbhVDmVWkSwDGEev06NQ+NgWasDZYpyYw5N62xMANsG23h5ACK
         wLBKUw/35qhcjhf4gGVh5s1+ozkCjESvBac3WsDb3T6r4muZq/o645wyEbIQvYNjW9L/
         5U8UlsOOQKS/SYLGZy0wSCTsknJPEJBRL6G51iKq6+tMX5SQq6CBEC/dO4j+x/Brn1Ea
         SA2d6Y/a266iGeVqs4/+A2cub3FdN82Iv8XOH7BfixPz1xa8H+sz4P3meGxMQTkcJAVh
         N4pg==
X-Forwarded-Encrypted: i=1; AJvYcCW3q5rxCZjWG/+tUVGx9DpAsiqHnkreMPMsqbxQ9UMf0YgAyS1zURhcggCjWSAl8OWONxhMcSohULZV8HDSNO4r@lists.infradead.org
X-Gm-Message-State: AOJu0YxVLNUlpYmhO01gKYw6tVIwCBcwvcz44JsokhopgV0ynALYrcnj
	JvqAL7VV5K4TgBq8IiJ6nGyB8kYGjlvrImC0g/bVcmH0onbt+gck
X-Google-Smtp-Source: AGHT+IEnmJEbZ+p+tbzFPr8vLmUwpdgp7oxOJv6CIcqZsn3QmOiDgdAFjb05DCavEh812W/iJV9K3Q==
X-Received: by 2002:a05:6300:4041:b0:1d9:2bed:c7e5 with SMTP id adf61e73a8af0-1d9a84b89bfmr25790299637.40.1730378303416;
        Thu, 31 Oct 2024 05:38:23 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:38:22 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v7 0/8] net: stmmac: Refactor FPE as a separate module
Date: Thu, 31 Oct 2024 20:37:54 +0800
Message-Id: <cover.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053825_280435_7C517B17 
X-CRM114-Status: GOOD (  15.64  )
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

Refactor FPE implementation by moving common code for DWMAC4 and
DWXGMAC into a separate FPE module.

FPE implementation for DWMAC4 and DWXGMAC differs only for:
1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
3) Bit offset of Frame Preemption Interrupt Enable

Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a

Changes in v7:
  1. Split stmmac_fpe_supported() changes into a separate patch
  2. Unexport stmmac_fpe_send_mpacket() and make it static
  3. Convert to netdev_get_num_tc()
  4. Commit message update for the 3rd patch

  V6:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=904502&state=%2A&archive=both

Changes in v6:
  1. Introduce stmmac_fpe_supported() to improve compatibility
  2. Remove redundant fpesel check
  3. Remove redundant parameters of stmmac_fpe_configure()

  V5:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=903628&state=%2A&archive=both

Changes in v5:
  1. Fix build errors reported by kernel test robot:
  https://lore.kernel.org/oe-kbuild-all/202410260025.sME33DwY-lkp@intel.com/

Changes in v4:
  1. Update FPE IRQ handling
  2. Check fpesel bit and stmmac_fpe_reg pointer to guarantee that driver
  does not crash on a certain platform that FPE is to be implemented

Changes in v3:
  1. Drop stmmac_fpe_ops and refactor FPE functions to generic version to
  avoid function pointers
  2. Drop the _SHIFT macro definitions

Changes in v2:
  1. Split patches to easily review
  2. Use struct as function param to keep param list short
  3. Typo fixes in commit message and title

Furong Xu (8):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Rework macro definitions for gmac4 and xgmac
  net: stmmac: Refactor FPE functions to generic version
  net: stmmac: Introduce stmmac_fpe_supported()
  net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
  net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
  net: stmmac: xgmac: Complete FPE support
  net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |   1 -
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 150 -------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  26 --
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   6 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  31 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  11 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 413 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  37 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 165 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 480 insertions(+), 412 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1


