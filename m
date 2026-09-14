Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mU93+XcsvOUq5cuvXfLSq1odlV5Mf5ix0Lm4ZLOxMBU=; b=2ILSIx7oC9sj27GqmGfAGYQeqc
	NpuLwaf23mUNmDl6u04ji4kPWDbTeiKm/5eBFnbbQP03eeHQa880S1O0b81Q4jYftrvHLagwXlI6r
	FIvzZw6fv62HcWRdmFgW8FdH0psi/UJynMB61GcTTCdxJoyTXSr0/wOcyXXL17W2JEtyRlc1akT0W
	KC4SiSQinDliELXDCsma6p0Po37Rnxwz4vU3gXXh2LOreW46SfMjlKfo/O8XXn4/kihOnVPlwSwYV
	s38awDJjs5E1O9gqTRRQD79kD/5DfPgiWBts6P43YRzAHuS6icbzxaKN6eW5s+JzuS5BzJKZw0v4h
	bl1bs1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsM-00000004etf-2XUX;
	Mon, 14 Sep 2026 21:06:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsJ-00000004esZ-09yG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:06:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F073E1570;
	Mon, 14 Sep 2026 14:05:56 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A725D3F882;
	Mon, 14 Sep 2026 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419960; bh=8Hpqna4Yql4B2KSm3n4ept+rS89EMGziH5WyeFW7i5E=;
	h=From:To:Cc:Subject:Date:From;
	b=WGgDhAYfNXwFRuaOJ+oVAAC+STmpKW9AObcf50+DOL658q0o9xZlltQ8haUAj5Jgq
	 /TAfrNRJiuj4FgJf3giAg3B02pWEuGt1XdbADVS2nOYXo9ndLoBe+MIhkDcaQOhWA3
	 M6w0VtZgaJhL+8OdzrjZKWlyKbQIujX2WlMAjRWo=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] dts: allwinner: Add Teclast P80 tablet support
Date: Mon, 14 Sep 2026 23:01:12 +0200
Message-ID: <20260914210115.28151-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140603_222403_D24DD7A3 
X-CRM114-Status: UNSURE (   8.69  )
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

The Teclast P80 tablet is an entry-level tablet with an 8inch screen
and an Allwinner A133 quad-A53 SoC. There are other tablets using
the P80 name, this here is about the "G4" version from 2020.

Contains the typical triad of DT support patches: vendor prefix, machine
compatible binding, board .dts file.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add two Teclast tablets
  arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet

 .../devicetree/bindings/arm/sunxi.yaml        |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-teclast-p80.dts | 205 ++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.46.4


