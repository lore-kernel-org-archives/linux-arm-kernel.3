Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B266EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Yy0gfaJ+XEiaavgjMVXQwyvjvii8ZCwWqfF3+zuXh0=; b=2ha54kYi63noY/
	uiKnrA2NuoEOoAM8EnVRmxfFyJpcgOWNy1khx0+hJkEEVoOzg3syDspO8iksu9jrnp6ndrjRm/CNf
	a5ekS/jo7k79NL7wKJFSEkgOJTLgJIbDF2ok7KkBlbRw3uyJWiPt3ZP9OePaPzpfmp16NPfMJgBRH
	ffWc0cMscEueXwYIo9Wj0tf/N3SQt7s+PW9rzsfF1CgVP9snCaEQtuNv0+TUyRKusQoJZQvsD5tm9
	4RR8lOBV/YfcIt+OvVaHQT1WJ0D3hJ39Bcd1exVPD8UcZycbQxRYOE4aAHNIpZ4sR7ZbuKUYWOdaR
	UkJFgM9PcRyYqBCgFT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugl7H-0000000GtBG-19Of;
	Tue, 29 Jul 2025 14:15:43 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugl4o-0000000Gst4-0t2C;
	Tue, 29 Jul 2025 14:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753798388;
	bh=tlrwdUMxmTMP/unojB4dl0fYvza21xaNXsLWOMIPgxs=;
	h=From:Subject:Date:To:Cc:From;
	b=krn3jAK/z2vFO1+nbqOz/i2yxFFMBC4f/Sp5Az4WM3KHq+RYyg0vyWgkOYDMIZOo1
	 CczfiIURAxSY7ImjtFj5Ssa86QOltP0/FdSoJGTxyuCZrlFlgdLybkNqgivW1FZhvm
	 8V+h/WOgSvoGISbzAyhPBpHrDjqfmYRzNUkmbdfoWqnecIl118RRbcAGfwrTa50Ott
	 AW+mVJPW2rZzXIz70JBPTsTs3napshhY37SaU24Z2KDuyt1JZemMFTarMvU6FWSc2h
	 t+c7q8gRFk6AFeMrAGoPOPRMC++M7BohXp/F1xsXEOTwZd146B7vAeVHvex04MIGHI
	 qkJAedlKy8bbQ==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:f717:c76f:99e7:4a24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id D3E3727E434;
	Tue, 29 Jul 2025 14:13:08 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Subject: [PATCH 0/2] Add Support for LinkStar H68K board: ARM64 and RK3568:
 dts and dt-bindings.
Date: Tue, 29 Jul 2025 10:13:07 -0400
Message-Id: <20250729-linkstar-6-16-rc1-v6-v1-0-8bd4a63f343a@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPPWiGgC/x3MSwqAMAwA0atI1gZs1fq5iriQNmpQqqRSBPHuF
 pdvMfNAIGEK0GcPCEUOfPgElWdg18kvhOySQRe6Lhrd4c5+C9ckaFAZFKswGpxJt6WtS9dUDlJ
 6Cs18/9thfN8P56JWjGYAAAA=
X-Change-ID: 20250729-linkstar-6-16-rc1-v6-fe283c53d74d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753798388; l=4962;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=tlrwdUMxmTMP/unojB4dl0fYvza21xaNXsLWOMIPgxs=;
 b=re7BwhPgidEIq4ayUlGl3dy8zPROGtz1bQgf8HYWldWWDN9W5dmY0cjRikZKVLJ0ZQ5nZMkUx
 qpaLD9oZBiiB6vNmH8vuLSSsEcZBEb51+JTTNtRP9SZGMhGi1GCU0xM
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_071310_456016_08833BAE 
X-CRM114-Status: GOOD (  14.71  )
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

Provide support for the Seeed LinkStar H68K-1432v1, previously
unsupported in mainline Linux kernel. It is a compact single board
travel router with the following features:

  - Rockchip rk3568 SoC;
  - Four Gib RAM;
  - Four ethernet ports:
    -  Two 1 GigE ports;
    -  Two 2.5 GigE ports (RTL8125);
    
  - Ethernet ports support Precision Time Protocol (PTP IEEE 1588);
  
  - Four USB ports:
    - Three USB 3.0 ports;
    - Two USB 2.0 ports;
    
  - Integrated WiFi:
    - MediaTek MT7921e
    
  - Audio and video outputs:
    - HDMI;
    - Headphone;
    
  - eMMC (32 Gib) and microSD storage;
  - Real-time clock (rk809)
  - Powered by:
    - USB Type-C;
    - Barrel connector (DC 12-24v);
    
These patches:
  - Create a devicetree for the board;
  - Add a (dtb) Makefile entry for the board;
  - Add the board to dt-bindings;

ChangeLog:

v6:

  - Responsive to comments received from Krzysztof Kozlowski <krzk+dt@kernel.org>
    - https://lore.kernel.org/all/20250729-poised-proud-ibex-5ab838@kuoka/
    - https://lore.kernel.org/all/20250729-passionate-jerboa-of-superiority-c7aff5@kuoka/

  - Change made:
    - Put patchset back into proper order, with dt-binding before dts,
      per Krzysztof and '.../bindings/submitting-patches.rst'.

(/* Thank you Krzysztof! */)

v5:
  - Responsive to comments received from  Krzysztof Kozlowski <krzk+dt@kernel.org>
    - https://lore.kernel.org/all/20250728-dashing-discerning-roadrunner-bc8b87@kuoka/
    - https://lore.kernel.org/all/93c39b36-07c8-4883-bd23-7d0194c50a7a@kernel.org/
    - https://lore.kernel.org/all/642df1ee-5e92-4f0a-bcdf-7e10dbc0d59b@kernel.org/
    - https://lore.kernel.org/all/9ebd9797-8d92-4799-bb8d-59a796e6043c@linaro.org/
    
  - Changes made are:
    - Revisions to commit messages:
        - Removed notes on base commit;
	- Fixed checkpatch warning;
	- Removed notes on device history;
	- Fleshed out the top-line summary of the dts patch;

v4:
  - Responsive to comments received from  Krzysztof Kozlowski <krzk+dt@kernel.org>
    - https://lore.kernel.org/all/20250725-muskox-of-authentic-gaiety-b8eda4@kuoka/
    - https://lore.kernel.org/all/20250725-nocturnal-messy-cicada-dbcc10@kuoka/
    - /* (Thank you Krzysztof!) */
    
  - Changes made are:
    - Clarified the base commit working from;
    - Base patched against:
      - Commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 (tag: v6.16-rc1);
	
    - Revised commit message for devicetree to be clearer, contain
      more details about the hardware, and be more succinct;

    - Revised commit message for devicetree binding to be clearer, contain
      more details about the hardware, and be more succinct;
  
v3:
  Responsive to comments received from:
  - Chukun Pan <amadeus@jmu.edu.cn>
  - Krzysztof Kozlowski <krzk+dt@kernel.org>
  - Rob Herring <robh@kernel.org>
  - Heiko Stuebner <heiko@sntech.de>

   /* (Thank you all!) */

  Those changes are:
     - Removed copyright line of <amadeus@jmu.edu.cn> per their request;
     - Fixed indentations;
     - Replaced space indentations with tabs;
     - Packaging this patch set together properly using b4, fixing the threading;
     - Clarifying versioning and Changelog;

v2: (https://lore.kernel.org/all/20250721201137.233166-1-xunil@tahomasoft.com/)
  Responding to comments received from Heiko Stuebner <heiko@sntech.de> 

  Those changes are:

     - Splits the single commit into two, one for the yaml binding,
       and the other for the board devicetree plus Makefile addition;

     - Adds other recipients needed from get_maintainer.pl --nol and --nom;
     
     - Uses git send-email to send the patches, to avoid adding line
       breaks from the MUA;

     - Changes comment style to conform with style guide;
     - Removes several unneeded comments from the devicetree;
     - Changes LED naming scheme with more standard nomenclature;
     - Changes naming of regulators, prepending 'regulator', such as:
        ~ from: vcc12v_dcin: vcc12v-dcin {}
        ~ to:   vcc12v_dcin: regulator-vcc12v-dcin {}

     - Removes unneeded tx_delay/rx_delay from rgmii-id
        
v1: (https://lore.kernel.org/all/20250718075058.243a5619.xunil@tahomasoft.com/)
  - Initial patch to provide support for Seeed LinkStar H68K

Signed-off-by: Erik Beck <xunil@tahomasoft.com>
---
Erik Beck (2):
      dt-bindings: arm: rockchip: add LinkStar-H68k-1432v1
      arm64: dts: rockchip: add LinkStar-H68k-1432v1

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/rk3568-linkstar-h68k-1432v1.dts   | 740 +++++++++++++++++++++
 3 files changed, 746 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250729-linkstar-6-16-rc1-v6-fe283c53d74d

Best regards,
-- 
Erik Beck <xunil@tahomasoft.com>


