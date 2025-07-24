Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D1C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bAVOS3piVT5lY9FwaQYiSEN1EjKhF4/zln1ISsdNxtQ=; b=25jmpPrtnvFvjh
	TcbQmJaBfZ1LA0893IbbrG/3yVHFbWQ3RoQYkcXBw6P4a0uDsEGLSyJi09Psp7MfKVeOrxolvLPpX
	d5FaEReK7CtI7PGxGyM6gbN7naucxg/ueStX+SqarWrOyrTmqYJbMC8xX+C5b6S/6OjQc4kmgSZ/F
	ldTNV+xXMfBGIooBPp3oUlkWrvneimXfJcI3P5bAEqqRgks97LAS0I88c5NBDyUhKfw6bsFA8mnxW
	fbjSWwwhPV6ynRpwiYI/cU4Jgjd8ih0Jjns+gCFKbIAM1RPtmQMK9Yh0NLvnWjOTv/oMninIe8P2u
	O8ejl2oGRDSTe9oSvMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3kh-00000008Wdk-2GAz;
	Thu, 24 Jul 2025 21:45:23 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3dm-00000008W4n-2wvc;
	Thu, 24 Jul 2025 21:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753393092;
	bh=JeAGk6NYkvfPfqHLOr8TWn4GJgc1Cbdem6yu/9lIHzE=;
	h=From:Subject:Date:To:Cc:From;
	b=RKiwrIdPJv9Ke91bak0N/Y5e+v8AR014Kf6u2TR9GCpbTU4u23emZMVhPWrLqIQ+u
	 BgQD94ilM7Uz5CHDRc67zPSHsTyejew61Va9AC3m7z4Gr/8QaCYSz/gX1nRRairsF7
	 caiM2welyTIINMO06sCFJfzL0MY3f2zxGiuZot4MGrDcvPWVbuBkDU4pBc4mmTspsM
	 25/cvEUMeFiSdw2Xr9frPF+9tQjufJeoIaLbOs8t9kppLNiyzSoRHwaCpTDyy15/cD
	 o+FrBI6JEJokwRC+HnsIOaT6u/V9zo1zSDWKE42C5XbnnQGx5G9gPEFo7qgWTFDFKc
	 LAwd20ZNUPjdQ==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:ee41:bd43:23a9:712b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 3A7FC27E434;
	Thu, 24 Jul 2025 21:38:12 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Subject: [PATCH v3 0/2] ARM64:Rockchip:dts:dt-bindings:New Board:Seeed
 LinkStar H68K-1432v1
Date: Thu, 24 Jul 2025 17:37:57 -0400
Message-Id: <20250724-linkstar-h68k-patchv3-v3-0-b9f87b7306e5@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWngmgC/x3MSwqAMAwA0atI1gZi6/8q4qJqtEGp0ooI4t0tL
 t9i5oHAXjhAmzzg+ZIgu4vQaQKjNW5hlCkaFKmCKpXjJm4Np/Foy3rFw5yjvTSqjJqcKj0YaiC
 2h+dZ7v/b9e/7ARgPdDVnAAAA
X-Change-ID: 20250724-linkstar-h68k-patchv3-21094073ba09
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753393091; l=2664;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=JeAGk6NYkvfPfqHLOr8TWn4GJgc1Cbdem6yu/9lIHzE=;
 b=+ZDkbpa6vkxeOC0QJD/czLtJ9ist4dUPqRrGlDu34z70ELft/1ITo2EbcQ2hfzsmk22fAvIB4
 8efQNSeZWaPAV+koNyDwfnGKFNnHzhbPmVJo08FAswPC0Lurnon+FbE
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143814_810136_52D2E4FE 
X-CRM114-Status: GOOD (  12.89  )
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

Add Support for LinkStar H68K board based on ARM64 and RK3568: dts and
dt-bindings.

This patch series provides support for the Seeed LinkStar H68K-1432v1,
a compact travel router with four ethernet ports, four USB ports,
integrated WiFi, HDMI and audio headphone outputs, eMMC and microSD storage.

These patches:
     - Create a devicetree for the board;
     - Add a Makefile entry for the board;
     - Add the board to dt-bindings;

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
base-commit: c3b855b67143231dc4ce359936c882e6b71f8ab6
change-id: 20250724-linkstar-h68k-patchv3-21094073ba09

Best regards,
-- 
Erik Beck <xunil@tahomasoft.com>


