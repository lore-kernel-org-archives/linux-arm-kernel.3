Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FF9C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=; b=zq7Vz12gcW9FlWz8I0Jy+0GsLR
	EQQ9P1JBQTULPK2jlFTQy1ZMheRziGPVOTLj8h20ebZRc4OJt7DkfFW7SchXJ16FOSX022UNj3eZs
	jF+TAYmvV6z7ZDVFsaInUBOPJioGcDTshTxYeFYyS4hVPrpo3oq3MZpU5mYvKZGIaAaiFllGR/vb7
	yDQZK9BuZg4wlDINL6FmB6kmQjq/UMbB0xAVYgphUGK9o7xQriCIt+BJPsEwfC8dvd5FtdfO8OlRd
	VhMeDORIvCu3dlCU1EefgrzcS6xUrp/Di0IV3HVNbHQsA2HhIUW9HT2TKD9QzvQVtgPZF6T5Ofj7M
	krFE7qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiSN-000000079CQ-18vC;
	Wed, 05 Mar 2025 06:42:15 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiQ3-000000078eA-1veO;
	Wed, 05 Mar 2025 06:39:53 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c3b44dabe0so327516585a.1;
        Tue, 04 Mar 2025 22:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156790; x=1741761590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=;
        b=ErCYxLFCWp/kLBhe4T0Ga49D4wTQRmo8/SkiOxQhojgqmaC/R59EEhm7E4IYMycxyW
         FekF53nBIuNvXoxNHIJ3HHllbD6uxTbh3AysPQN61Iaeque/LFxBlDxArT+H3NQzQ8B5
         Yw/dtxsRTM75fgzljsQHTyLGYMbrT03E2eS5O8Nh+dQLMuTluzKDSAKg93ImB1TYXqM6
         G4qww8jy34bq49+ktCGkenDoYK7/RuDB1lvwDkjxIqI/qDQP8Rg6rYkeiPzjg++1Uq/E
         utOVY26J1XfsEjowEZ6ZPH0pFvlYXca/F0olcy80/FD1+jpHhwsOqgrpUKQE6YYnPwYb
         qT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156790; x=1741761590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=;
        b=AoclTWuGzvAlFFknEzAvdXL++yyeRfwzx91vhiGRgJsOBchaEK3NjXiShz1tJEYGqv
         6ZQrlnO/WuatpuLLobniCPEU3h1iZzMjRwwxthLkyJAefSCWuOhS8A0jnwu6KNKGFdqm
         k6KFZaNnoL2Fb8goVt5i5Ac+dJIBltAP/TeSHXhbtE+fx+Ax2yw1kEmgkTavGPsP0/8t
         7yeczzbCuvBrQOfwELVj5/sNdIDdjzPUO3eBYyizgkzz9ry2yrDWw0SFSYa2PGGVjV4C
         SRNCe4Ve259PqaHz9pcXB5B8eLQSTago6mEAsWpIgyLDq4NFpmysPkdpHCLkj/HEoSdW
         jbuA==
X-Forwarded-Encrypted: i=1; AJvYcCUtf6fOJCmN2XW0VjGnonVk7W3PUUrkyU7pbLqM65iU4d6H9MvTE5G+3q/sTvYoh60nZEVoBGL/jTJPLC8=@lists.infradead.org, AJvYcCWRAC81IkUsdhjXk2GFZhE/OqE5h4cvMWT4TB8qN4QDVgYr0Cq8A7JOQXE+YSLTEGnTrDDBdkw8lWadUyhruEy6@lists.infradead.org
X-Gm-Message-State: AOJu0YznF1WMKzZuePyqLstTKSIr9kcKFtgcvA2z1AX/8ParXuDXyiT7
	v6JjmaBpmO4T9rODClC/B5CVA515yCF2+IPASPzRa4ytM0UpNDGV
X-Gm-Gg: ASbGncuFth858CNvcOG/HeEENWLs/NBGN4uiXgc4G7czuVJFMwa0F67on0LOZmfkI8N
	G7OeHwOtxhe+GiUzfOnxnzS6xMfvsOUdtyN1Lj+8PR7+N82drGjBdMbjMaJa1Da7bvYR2UBzzMC
	DBB4EcWrqbIg6SYi+2+pJwPgFRy35Xbd1VGUhRxk8KbJ2Zyoh/8+IAyp1xkc6qfI7cwsLOMqg2b
	A/rU1o01Cb8XJgCm7Xnd1LZA21enWVEecj/91p08KsbgdDuSTMls9WxnSHpzKel7bEosgVFp3UQ
	E5sldLasGMt+/zEA8oqg
X-Google-Smtp-Source: AGHT+IHQn5rcf/yZwl7qfbDraLVtkQEZKtE6MR9UkwRor+hKRVkXlhUT2tJZmUlvvrfGucfe6+0vEA==
X-Received: by 2002:a05:620a:4899:b0:7c3:c01e:ad0a with SMTP id af79cd13be357-7c3d8ef2cd2mr402188285a.49.1741156790046;
        Tue, 04 Mar 2025 22:39:50 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3cc0c20ffsm231314385a.91.2025.03.04.22.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:39:49 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet support for SG2044
Date: Wed,  5 Mar 2025 14:39:12 +0800
Message-ID: <20250305063920.803601-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_223951_522048_51A49D2F 
X-CRM114-Status: GOOD (  13.95  )
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Changed from v5:
- https://lore.kernel.org/netdev/20250216123953.1252523-1-inochiama@gmail.com/
1. apply Andrew's tag for patch 2,3
3. patch 1: add dma-noncoherent property.
2. patch 2,3: separate original patch into 2 part
4. patch 4: adopt new stmmac_set_clk_tx_rate helper function

Changed from v4:
- https://lore.kernel.org/netdev/20250209013054.816580-1-inochiama@gmail.com/
1. apply Romain's tag
2. patch 3: use device variable to replace &pdev->dev.
3. patch 3: remove unused include.
4. patch 3: make error message more useful.

Changed from v3:
- https://lore.kernel.org/netdev/20241223005843.483805-1-inochiama@gmail.com/
1. rebase for 6.14.rc1
2. remove the dependency requirement as it was already merged
   into master.

Changed from RFC:
- https://lore.kernel.org/netdev/20241101014327.513732-1-inochiama@gmail.com/
1. patch 1: apply Krzysztof' tag

Changed from v2:
- https://lore.kernel.org/netdev/20241025011000.244350-1-inochiama@gmail.com/
1. patch 1: merge the first and the second bindings patch to show the all
            compatible change.
2. patch 2: use of_device_compatible_match helper function to perform check.
2. patch 3: remove unused include and sort the left.
3. patch 3: fix wrong variable usage in sophgo_dwmac_fix_mac_speed
4. patch 3: drop unused variable in the patch.

Changed from v1:
- https://lore.kernel.org/netdev/20241021103617.653386-1-inochiama@gmail.com/
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Group GMAC4 compatible check
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  75 +++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 229 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1


