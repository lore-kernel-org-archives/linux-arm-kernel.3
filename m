Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE9C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=; b=uPSwrkk4DNw7dDDuZmPIbSvNx9
	KJBiPDyaTliM+cFrnpl1JnZEv1udqQKWwQVyE5ufxjRondRAVI0vIkWAOWg1mZheEyVX37TwCEm1p
	44wgM9Z6E6oTd5Y7lNl1fczDKE7A+xVTl+hD9/HB2IPqL8qLv0EmGRvohD64JCl794xH4ox3GTswl
	5HWA0L1pB/5P1leelFRjzmu51KPpIwZQ+PuJbOeP1x3aqSNWnwPT9MWfWhKh+JEdfW8CxsmNCPiP8
	0ZHA8xKADoxnCFXhLUf4i2jZt+bZ9TNImfxL/lHqKJSDGbZtGiEVwOr2tmldsi/1LCwy3+Os/4H41
	Izpln1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdy6-00000001n9t-0TZd;
	Sun, 16 Feb 2025 12:41:54 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdwd-00000001mqX-2Qg5;
	Sun, 16 Feb 2025 12:40:24 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6e672a21b9dso9297006d6.1;
        Sun, 16 Feb 2025 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709619; x=1740314419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=;
        b=ObTwNppCvnbM6nKOeTnjdDJH6gqM6gq9uOKytiuToV97xt7PMrjHhII8oEWat2Zcbk
         BfqJXj10/zcYkaVP/gck1tMg0etrglICZMSxEa8axZueLTyovt1RZQ7EhGo43qpppFXM
         RKp0mYBxAhODV6+RlurhEsN82N3kv0nAEd9feviCiWMLeuJtHvUOIOZrmiupJieq3+Uz
         fpZOMQGKMl368b+nzCaRn8wGlEzDJNv9um9It0p1alOKaTp29fytuAIDB8W2uaYezHRo
         ARPTQ0mcgiWnUVtDLv0OptZmGwWEt/M82fufwXNOhE0R2Huj+hPQZ48f/HaiDvQKivjY
         A5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709619; x=1740314419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=;
        b=hQhkAkDzjijLoETItDTUVz2Th41hI5tSCRojIjWDwFOrF99etiHTJ8B8ks5+BdQ65o
         se8m1PovqxpIG6NdpYPP6IgOWBNjF3ZUFM/YuMg7LMh6O/QfVbPTxGCFtEjqwHcIUYaY
         HoyV1r/yO+49t5PJgoAVnEsyrcECKxljH4o52LyyVznguicpNw9Sru7lOspfLYyERcgK
         Uz1FoKXvWatxKnhruLPh5DgA28vZ9OlOE8zlCenVhleX8aPYf1kSHozRFlfYhC84qdXL
         ZT6R+OKbTmh+RXbLkEDpp5m8eRP/DWE2wKBAeDFr26BlzwddJABs53CwGb5zgXNcHGLE
         T5ow==
X-Forwarded-Encrypted: i=1; AJvYcCV68TGXtJTLIvfLOxGJFHOjf4qJmsJT3kfB1tp1tLMPITOs2Z1geeDZzR6Lhv5LKxNqRNYGDXCm5Tzjrp9h/AUF@lists.infradead.org, AJvYcCWE+P6G6ConT5Wg3twqTVRBN+1yaqY1e/UlEim5HvsxByw4jt42c3fmeBoSYSR4wc+a47yqwdnIVNvq4Jo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIG+69q/vJk+ZyK06M1sm0xRnmP4SeOaUBHz4Psy5YVxUEq2ld
	L07VCvgCFer1XR8/GoSBF5cyQ54mBCOka+Q9sNnaaBONqEfLYe69
X-Gm-Gg: ASbGnctdbpqYxt5nqSqqn21n3Y5PaQn4Nzu8RQ3Eoe8LBE4CTxVrMWWz/XVMiUXaGgq
	v7WpHhGMdi0RNK5z00DqIhLzZUncYSmV/50tLDWRId9tU2dLks+ZGD4wVxDqx9Qk/A2POL7/H5f
	qR1YZqw0mK1LnGXeFdwi81FO+pKVuCDgOg1h/r2X0MkWBoeJbATFZp30YV0G0wfsVlmI2pna54R
	5HK0aiUyNhDg0qd12EppLhyr2ATeG7YBLHbf5PhTz+Yi6265QGB6M8/xjQ+VVgPKiY=
X-Google-Smtp-Source: AGHT+IEpfpOMHZ8O/1KvInhk3KcC7dM/mez8wsS2NuX284w3zcB/+PjufIWyqrWrlCFEXBwTJBBy2Q==
X-Received: by 2002:ad4:5f0a:0:b0:6e0:ad33:36c with SMTP id 6a1803df08f44-6e66cc86d3cmr90601876d6.2.1739709619021;
        Sun, 16 Feb 2025 04:40:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d77927csm41319936d6.10.2025.02.16.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:40:18 -0800 (PST)
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
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
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
Subject: [PATCH net-next v5 0/3] riscv: sophgo: Add ethernet support for SG2044
Date: Sun, 16 Feb 2025 20:39:48 +0800
Message-ID: <20250216123953.1252523-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_044023_632627_A6B4C4C8 
X-CRM114-Status: GOOD (  12.64  )
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 107 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 259 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1


