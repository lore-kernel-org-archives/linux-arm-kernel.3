Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A03CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wKfObnJxj/WexdyiANw+RIBzKmRCwblXppp+e9llQqo=; b=HC1jRRv4wf/EyK
	cboQ/enCg4wfP0ErDoEmIyzngxfd8qt/nFGie8QJD3ncZNR/C+vXJLm47XS2QnoRDgIiCUBvHNLAx
	njjQTDDOq+sjM2s2qhLwb4hUn6kmek1I3WjP6komUyP4z9L62xH0de3neDiF3Jp7qWAdpjmLtw7ds
	QlmwtKwKWLrAQgNfYUh1pxgQKKZXazwY3bip4DFeqbPNeBGci3DF55Oj84Xo5FjXobjHnADMAZk7m
	4sOR5glex6CqdyArCxTcbZvTagCtvIZeEoHO4MMgjSXp8b/+OJl5WJu1TucoMIdgte6uq19Q9dexf
	jgo944KqeBYl7ZH9sXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPX3-0000000EmAj-3hd3;
	Mon, 28 Jul 2025 15:12:53 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPRz-0000000ElM6-1B2Z;
	Mon, 28 Jul 2025 15:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753715257;
	bh=P7GBGRaCytwVoPcpEo/GTa18XaJiFL6s41D1WBhUN6M=;
	h=From:Subject:Date:To:Cc:From;
	b=Fv/9Tf+ntvIQwAA/WeUFCxrd7jUITd4QzDkpOfqtvkm1zIi4bvpFwblU12Ts/ZZ1D
	 c44s8/32kZjWq/M6ya+jXPeZe5SI1JV6SJ9oNfu4eL3yHR8OdxiQg5bHN4WjNgC90v
	 Eiw6ys56iwzcERoZ9tCvsMWntMBiXTM9AvBhXXBt7aNXcfOVVJFm0fL99WFaYm/p2k
	 D81K0JsyL0KvZUR/ag98rHtH+4rbuB5AOCiHxfTUu6mSKADjut+nq4R54FFfi7aaWI
	 fHFGp0byszvYaKKbbd2rcPBpgg2z8k9EIbeXV5s21+cr/B5SPjnb9cHeIUUbH/50c1
	 Pb1k5HMesB0Ug==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:31ee:da95:eea2:34e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id CEFC827E434;
	Mon, 28 Jul 2025 15:07:37 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Subject: [PATCH v5 0/2] Add Support for LinkStar H68K board: ARM64 and
 RK3568: dts and dt-bindings.
Date: Mon, 28 Jul 2025 11:07:35 -0400
Message-Id: <20250728-linkstarpatch_v5-v5-0-b4ebfeaca652@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADeSh2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyML3ZzMvOziksSigsSS5Iz4MlNdc0MTM7NUiyQzC2NzJaC2gqLUtMw
 KsJHRsbW1ABQT77ViAAAA
X-Change-ID: 20250728-linkstarpatch_v5-71466e8b6837
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753715257; l=4590;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=P7GBGRaCytwVoPcpEo/GTa18XaJiFL6s41D1WBhUN6M=;
 b=LByh55mLcNOseDPfg8APMtYS88e0An8W/GWWiS6utY07N47Fu/GD2mS2iXKWqg0jIGTkMMn0Z
 s8piwSZkclPA+WGnHwseU/PRu5r+M67JStj+Xy8uGqe3a93BP/lDXd+
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_080739_425580_927BFB54 
X-CRM114-Status: GOOD (  14.46  )
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

(/* Thank you  Krzysztof Kozlowski for your latest round of comments. */)

ChangeLog:

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
      arm64: dts: rockchip: add LinkStar-H68k-1432v1
      dt-bindings: arm: rockchip: add LinkStar-H68k-1432v1

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/rk3568-linkstar-h68k-1432v1.dts   | 740 +++++++++++++++++++++
 3 files changed, 746 insertions(+)
---
base-commit: 5f33ebd2018ced2600b3fad2f8e2052498eb4072
change-id: 20250728-linkstarpatch_v5-71466e8b6837

Best regards,
-- 
Erik Beck <xunil@tahomasoft.com>


