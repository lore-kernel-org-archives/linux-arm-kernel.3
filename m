Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A824C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mpE4zKyAH8svDQr1EVUQPc0P7SOzCqW4Zan7hwoFlao=; b=nA7Yc8wgNdfb/yl2m8uzXCDGJp
	LK5FBMpNo0ajXQ/6Krqkx6QMcndvvwRPtRTJJZBlrp1HH3GOraT/dXLU10XPgR4Bmnfbqfj6q+UXg
	IOK/2gdhZO7faEPAY7fkJVV2+Am6LfiTQfuG80egSjTTH6z1Rg2bIzilUjR5+zRc8dJ6CnUoJ5llo
	pQoX+4tsMWWnB6UIJc+kQVG3ys+2HKR/EuC5uwZCPY93CcghD54Ik8LbbvidB5A43uOQ3woB/rToo
	Ug+NdwNAPBviSTWEKJHqMONGmSbSpNdiKoEe0QAtT3B9frp67uvdTN+boHH+IW3I/o/45N6DSojPG
	vVjJGnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwBU-0000000Dr19-1Src;
	Sun, 09 Feb 2025 01:32:32 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwA4-0000000Dqiq-06WN;
	Sun, 09 Feb 2025 01:31:05 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-46df3fc7176so30159441cf.2;
        Sat, 08 Feb 2025 17:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064662; x=1739669462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mpE4zKyAH8svDQr1EVUQPc0P7SOzCqW4Zan7hwoFlao=;
        b=kOGhVYXsDaXWszB0gcJQdm8wfb7wBOKxb3+fKf18Ksjv3fuYNTaw/z72T5hgGm9eUF
         SX0mRxREsyVpx+zFXHUU9AXCq2NeP9FQnhV2Fx9mKnyZZST/WdE/18TJR62j9LHNQWwL
         g2n/84XQSUBH6XpmZ/daK/ulfNmHcRP3vDKbQ8hZd70D3hwdskV4ejmi7ncwDt2Wiv8a
         HMkE6WksgQip9r77drEqwhKs54U0zYNOTbOcHm0lCt8ju193YU00rrHyyJmfpQ8MaYkH
         oUpWeKtBBdSWnx10N0mpfQe7Edajjegmk5P/yWpFumtWrR45vg3G/IYc2t7Ih+sZovJb
         XDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064662; x=1739669462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpE4zKyAH8svDQr1EVUQPc0P7SOzCqW4Zan7hwoFlao=;
        b=W+EV5nagKq8f8YapHNGf8yu07kjy7+MSYLyJ3cgsl2dGRJWUkDHYd7k2ED5pPaqQX5
         1I0wY/TPraIKYvYBBYI4LSWrcJTBlCeB47PQVzL+rp1NunqCaaL551pmkUzZORf6p6pD
         syaiTWOur7LiM3wuw64d0taSe4s99a7UykdHsijt7J4C33tt4rqYjO/rTvdD/6BtE8ik
         diOGJzFrjSj5rbN6A9VOzFGWV4t1I0upYnrLmc9bn6LqvR3QjTZYGT+iHJgCtbMigWPV
         Q15gkA2T7U5i7XYwV3EGUM9T2mSpZZfCu8s0kLslC4PIx92yjGakDde5aRTHB5WF1SkG
         hgeA==
X-Forwarded-Encrypted: i=1; AJvYcCW91cChPy7Oo4q6lOMwOfgmYU1DJu4tSVMUyvN5eAafQJqzBdZjmhJ5kCKQ++LQ9Q+Zbf3ALhoAVHIYEq0=@lists.infradead.org, AJvYcCXEOQV252xyWCAZtAdIVkZ7YvFgHsqwsM7ZvMLkCucq2SBRcaCmL7YVcoY8RMRRSzyuOQzUcx69o6NF1cAefm+T@lists.infradead.org
X-Gm-Message-State: AOJu0YxHeCNR1baI231V4d3s5m7F/O94BKah2kNLn03J+9A7M8rzJ4OJ
	GMc7E3g21N/BccF4Vm6UM1+Mvxt6wfd16nkH2VFiiyQg/zY49szi
X-Gm-Gg: ASbGncsCgRaQ6NKR/P5lMBnMoBiAMMqlvc1cVVBD7OgWW1tYyOgK6tl3adUO0yglTZZ
	brvk3lCseGjfLZn6H/xG0dqEU9gS0O6hr1OJOMUvdCoVKQT6LLnXF44eE9CmMyj65oAP5zJl1Sq
	Ytb4xZSMcmPUTXsyi7S2g9WFCqY1SF2j3+jUyvJy5QofZaK30yxNVtTv20KlFJNXXc71Wklehjz
	Dcr0y6OTXNVO3vHPk0LeQiJfKeX8K4UvF0Sdf3z7bCNNn3LHyGOx5jPy0hRzvjv+NU=
X-Google-Smtp-Source: AGHT+IErNG966adydDNeNbSis7LGgBN1C8RNiREv5yWv/KkleMlno0XmKLtdyzMfyEP6jLn7m+bHdQ==
X-Received: by 2002:ac8:7dc2:0:b0:467:4f9a:6511 with SMTP id d75a77b69052e-47167a348c6mr149530651cf.30.1739064661848;
        Sat, 08 Feb 2025 17:31:01 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4714928d886sm31368431cf.18.2025.02.08.17.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:31:00 -0800 (PST)
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
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 0/3] riscv: sophgo: Add ethernet support for SG2044
Date: Sun,  9 Feb 2025 09:30:49 +0800
Message-ID: <20250209013054.816580-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_173104_070253_F16E1879 
X-CRM114-Status: GOOD (  12.58  )
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
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1


