Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87331C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ET59mmvDVO2YQFnVohFm2Jxp2fIqgmVKkU6505WFy6s=; b=IxxVQGuojzvXygL/aV2N3snhsU
	/2qAZsLW+6iiHMS18vCfjsbVQnuyxNyGccl76LnPqsP0yMSKWBzF9fj5zUhmw3pf/HMggDncJQcXl
	UqYnG/N6MadJbfJ9yOZn73yfiy3MhAjvKKzBVKuXiBe9pIhTYbBPMqNCYtNqacmxfUILLkZ5eBeSu
	eRvw1kuT35BOtBWVeHkVX6BSywcs0usw0Oa8LcrR2t2IlaP+WSTWxBkJioI+Sc/iljKROYNx4F1OS
	zv7k/W3LcC57qXjo+eGysyRpgws+cIIUIUbecLw4I+9sEyevHHObyi3cu4eLJUELoLeeocsS1wnoV
	bPzqhG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHmA-00000003fJ3-2gg5;
	Fri, 21 Feb 2025 01:24:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHkf-00000003ezx-0PjG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:22:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 293EA1BA8;
	Thu, 20 Feb 2025 17:23:06 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7CBA3F59E;
	Thu, 20 Feb 2025 17:22:46 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] arm64: dts: sunxi: Add YuzukiHD Chameleon support
Date: Fri, 21 Feb 2025 01:20:35 +0000
Message-ID: <20250221012038.13706-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_172249_178972_73586130 
X-CRM114-Status: UNSURE (   8.90  )
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

The "Chameleon" board is an Open Hardware board designed and developed
by YuzukiHD, and mimics the Raspberry Pi A form factor. It sports an
Allwinner H618 SoC, and alongside the usual devboard peripherals features
an eMMC chip and four USB-C ports:
https://github.com/YuzukiHD/YuzukiChameleon

Add support for that board with the usual patch trinity: vendor prefix,
board name binding, board .dts file.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  dt-bindings: vendor-prefixes: Add YuzukiHD name
  dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
  arm64: dts: allwinner: h616: add YuzukiHD Chameleon support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h618-yuzukihd-chameleon.dts        | 222 ++++++++++++++++++
 4 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts

-- 
2.46.3


