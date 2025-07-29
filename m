Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53884C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GMWavNwlosG6g22rYGsIMSRxw8g8/+BefUg7XkZ5Vb8=; b=nMLhqavTK/WepS
	1pPo35AUyqRcK5NbFxApqzNvAiThPV+rzcWYpAHc9uO9Z4K5f4YYyJ4rW8QrBcOFLYbEFoGNbyBaC
	4XibhygJV12Qn2Kt8+GeZ1eGEKjwqgVY7OL3M404+89qhaskivcNU092SlGWo1GyEySyGiPlR88pE
	rEZ/ZFVBm8tFbBT8cvG/7RMIwFTcFztqqIyCT2FJlPlB7SuSQ4U8dQQNb0ECqXUYNzVqw3HP9nkiQ
	SqBZ1G2Ip8/ofNqqImKwogHbSTpqewaq4MVQptLL7zh+u/SqIGft8Zt+Tw4ZXimftFmk1uMxc//QH
	KfxP2BEyzfpNTWjFp6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglZn-0000000GwQe-0L3h;
	Tue, 29 Jul 2025 14:45:11 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglUu-0000000Gvmi-0LJn;
	Tue, 29 Jul 2025 14:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753800006;
	bh=6fv/yxfI0HkZptw0QcDLPYXU5y08P7QykFX2AxkYUuA=;
	h=From:Subject:Date:To:Cc:From;
	b=mcRVOy4zp+xTP1Rxjm+6TlnymcMGmPZ3UMgrcidz9o842ZMnUgMrXl5ahHdoI2iBc
	 hPrCVrDbYc6RVvFC0x4zSOXZT0GuAsC33TWoRx7Sy32sSx3hR4Y5trJ6ypT5JaQqXZ
	 MF5nHSfio+YmyJMoS2A2N44KILcSL3Tmlx5qhGTfidDypFBWo6tXDBsFe/CKcHj8E1
	 ASpOJvLxh2ltyl/4FJdiNyWYRK+sTpCJ/55+lVx0Xe7sCSeEntSIHV4R4uI4XC+DQR
	 JkIJcobP5OSHLBpViWpJYk9E/l3RJK/rCNdZDX6EGvFlDYRHPdWR9tclM2ogXkA4xz
	 CEAwlFKh7EKuA==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:f717:c76f:99e7:4a24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id DC47027E434;
	Tue, 29 Jul 2025 14:40:06 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Subject: [PATCH v6 0/2] Resend: Add Support for LinkStar H68K board: ARM64
 and RK3568: dts and dt-bindings.
Date: Tue, 29 Jul 2025 10:39:50 -0400
Message-Id: <20250729-linkstar-6-16-rc1-v6-v6-0-92307f465835@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbdiGgC/4WNSw7CIBRFt9K8sc8UaGl15D5MB8jHvmjBACGap
 nsXuwGH5yT33BWSjWQTnJsVoi2UKPgK8tCAnpW/WyRTGXjL+3bgJ3ySf6SsIkpkEqNmWCQ6y0e
 he2GGzkCdvqJ19N6z16nyTCmH+NlfCvvZP8HCsMXxZjolhROdUJes5rCoFFw+6rDAtG3bF2OFp
 m69AAAA
X-Change-ID: 20250729-linkstar-6-16-rc1-v6-fe283c53d74d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753800001; l=5247;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=6fv/yxfI0HkZptw0QcDLPYXU5y08P7QykFX2AxkYUuA=;
 b=o6P6At8FiUw2E0BRyZf7V0PYnM4+hw2T98poG/cthVi+2/8Q6X4kd8Mld13hydT2YevGX4Lf4
 QqVj3bbRPd+CIbUwR5ZSoCfEz07FSJc28dNLdUiEblq1TIEaJNEnAtK
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_074008_240822_64CAC8DE 
X-CRM114-Status: GOOD (  15.54  )
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

/* resending with patch version noted (v6) */

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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250729-linkstar-6-16-rc1-v6-v1-0-8bd4a63f343a@tahomasoft.com

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


