Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A773CC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=; b=SCge58JSgt8ySb8KQpp/BfYitJ
	j3TcHf40roBA/WFvdB1pSEHuOqcfhduOhy6UoJYdY4WDLScOAjMjU2/SgyAqzf4stNrA0z87WbTQh
	ujPqkOhQEavaw3oPtlxEIZIoqkUxSBC/LO7hvyZdgQsCZXMeG6srf5IiwuTcCiFIeIKAUyYw/MD8i
	8aj8b6Wm4tLPeuIqI7cNOYbQLnrT0NhxLa/uCFWMQCVnjtW6qxj1i2hBx2U1BPO2iImymFsJ6bnbs
	dQsZDck1XTeQGruKE1ZN/rL+oqtDUbVSodsQF4IjMTMM8F55ipRfB8TNz7A8GreP9Uq4+3emEQFYd
	qwiebWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ236-00000004T8s-3YhE;
	Tue, 08 Jul 2025 06:43:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ20m-00000004Sh5-0ukI;
	Tue, 08 Jul 2025 06:41:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235d6de331fso51560765ad.3;
        Mon, 07 Jul 2025 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956863; x=1752561663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=;
        b=ZcjHjkJAPPSbemvVLCNDQM18z7fnHGIwBLUpjx9jVmWicjaqvXpxIGe7oyUmqKy6e1
         cafhMntIxE7vFX2WZQR6YHSs5G1lIBuo3Bc9CMr+KL0/BUuX6Xnw5J+s6jNeDNIN9Xs4
         UgWi/k7bSmnBhSLPTKmNss1A7aL2/Kc/ZTiycIiS7GbEs6NOINH/mgfkwkot1AepSQxD
         YseeVu9o5nZy3pkDYgbd/tHNoTzLNCLSdx81suOBuk9m+JywNe/h99kbAkvYidVobMZH
         7vAooaOnpGMns7t9dxA/X2b+I9YqDMLvJZXuxxALi19xLXrbdH99NJjo7YSEfy56lR2t
         UCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956863; x=1752561663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=;
        b=QVbNo+r36lKQZYANc5bYrWEW68dGd2moejkiPMlAb7pTvpP+LKUtgrwI50acntyehA
         LibST5QCPtqriDQWkLzsBzEdmv80nwJABfahC7Ik3mM6/usJMrO4l4TqQxAsVAnuOeBd
         lV3nMqzpjewpdeIaoj3rA5q9uw74cjjrNZ4SFtmwUC5JPcZkaLQ8cf+8VVEV9hpipZaJ
         8Yb4ROugTV3U06Pjy4IG0ybsqqgkADY4szTggILPlP1K2n0n7TrDKjdl3KPQS80kLF8W
         KX5F+GraPmwBLjaaWem554jeNitK5G1aAMN+2D1Vvut2X+LV0xlIw21eXN3vzTXei2Eu
         7KDA==
X-Forwarded-Encrypted: i=1; AJvYcCUnd22c0ODGRdHnLWinUjdPSqoSRigzUlg8QcN47t3RZZPJ6hllMcyA/7TIyfAYGDWW5dQsSEhuuuOj9os=@lists.infradead.org, AJvYcCVAuZC7EWvZQ2xffqpWelOd6X55Ld93ydvYOih8EgRnJ4hfcx9uaCUwp+dVXa56mPZyDNs9yDUlq85e/bJzbhzp@lists.infradead.org
X-Gm-Message-State: AOJu0YwHb9oL+hDhBDd9uZsLVwFYD8ZkrOnawRIRdQ4vyldH6Z+DSUZJ
	55gryjb8rKQiM+kCw/3L7VPWBq75pWm9qHGfFD8HY0Izn/cvkVggXfW+
X-Gm-Gg: ASbGncugtBxq1vMPwersffBYYfvDJbMwAtDNy3gkmAmRCs3FWH9xc2nBjZnePefu1qs
	1MCxITUJ4fVDWxnFBLwzmbCyJBe3cMKMUcY72cx8g765BBr9yWNX4iziHv4fJuXTSyflHNi/AxH
	dXIrMZDlB7/IOhdA1QtYcPqU4SbNZaWhVyzBqdu4hgryb5/TXIbYlbyIlEwslm7+36Bg0EieTWa
	kqLh0qf0FnPdU3nLo66IsmkrnjlusY1w3swkSg5FtvXmVZ2rkYuGT7wqqgy/v7225qy9qSoJqL1
	R4JcFdEACqLIN47y0A8AGpJVnlCzUOUYctkX9sWvyJcL43BqyaNBL92yNe3/iw==
X-Google-Smtp-Source: AGHT+IE8dNh/94h7PP9qu+pz6QETQuEDR3G8DOsyx27YTdMrR6Zstgx9PwNjmLqJHYn8N5lM6qUYiw==
X-Received: by 2002:a17:903:286:b0:235:ecf2:397 with SMTP id d9443c01a7336-23c85e7671emr225145495ad.33.1751956863291;
        Mon, 07 Jul 2025 23:41:03 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23c84597371sm108407375ad.207.2025.07.07.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:02 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
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
Subject: [PATCH net-next v2 0/3] riscv: sophgo: Add ethernet support for SG2042
Date: Tue,  8 Jul 2025 14:40:48 +0800
Message-ID: <20250708064052.507094-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_234104_264857_2AB2529D 
X-CRM114-Status: GOOD (  10.01  )
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

The ethernet controller of SG2042 is Synopsys DesignWare IP with
tx clock. Add device id for it.

This patch can only be tested on a SG2042 evb board, as pioneer
does not expose this device.

The user dts patch link:
https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com

Change form v1:
1. add user link at cover
2. separate the devicetree patch as a standalone series
3. patch 1: Apply Conor's tag

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042
    dwmac
  net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
  net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string

 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c    |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

--
2.50.0


