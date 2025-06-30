Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD1FC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn8BMki2iNN1P/r7R/LxfdYCZZ1q8hREXMj3I0Sa8ZE=; b=jYbpSdVIW1ySf9f3rr1xhtz0Dc
	J5VxmeQxVa2Gf1/bvRc6ulWx8jMd2O0jBpmQKiY1xSS+v+g8aQt9VY3nWdVUMiQKMpWfDC0SYLyM8
	Ietb32A7nW6Nhh+V9kek06J9qd+zFTne+H84RMA0TBGQtZkg6Q8hewLXMvoyfXZo0OUPFW0txxyWE
	aHmnxcH2nJ1A7SHT8GjmRxbvI8lPfHjdKYQ7W29rgj3FHly1FOEGvBrjjcLm0HoLc/HInrD6et4gG
	TMqBv2YVZY+Z9AqS5nRq4c0+//C/EAYRTWo9PMsO2h5OHTIRfq7bCXPcLCVO6MrXVM8WtCLuS8OCP
	WKVmqWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBAP-00000001neC-1bYU;
	Mon, 30 Jun 2025 09:51:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB5N-00000001miZ-2LD8;
	Mon, 30 Jun 2025 09:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Cn8BMki2iNN1P/r7R/LxfdYCZZ1q8hREXMj3I0Sa8ZE=; b=Iy+lnfhedJb8ntN9LrDCbgPqG8
	S/rRq668VaAryVBv5dvtasNvt5dUT4AvN3LaIe8wc0KhtQHG0lK66c+Np1yNMnpyk0Fq0XSyxX8Y7
	0HM73wMZnS3fclioohKbi5VwYne6rfP2KBRETPcPs3KdlltdMcuNJ0u5JtH+Fac9XUV2Uc6W+qD1s
	I2P4w14BQU/4OQP1ZRoJ7bxg1JVY5GJI4KEIsSuIaUSExaxaEN86DrfGNH+i1rfCe1ggUoqjtt0Fr
	NmsD7VTBdcyZXGUAfDCfkiLdA1pf1MXKDljzGcwrd5Z1Z5AIGS+cnj5cq4JTlHdrbmGGIO8CwFkOq
	RMcDd1NQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5L-0006Zc-EA; Mon, 30 Jun 2025 11:45:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI receiver on CM3588
Date: Mon, 30 Jun 2025 11:45:47 +0200
Message-ID: <175127673171.138768.10885736294525239875.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250622185814.35031-1-valentin.haloiu@gmail.com>
References: <20250622185814.35031-1-valentin.haloiu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_024601_594665_9BEE20D0 
X-CRM114-Status: GOOD (  10.62  )
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


On Sun, 22 Jun 2025 19:58:12 +0100, Valentin Hăloiu wrote:
> Enable support for the HDMI input port found on FriendlyElec CM3588 and
> CM3588 Plus.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI receiver on CM3588
      commit: f9f45293f0d8bdc5e2d0d255cafa0acdb2c94616

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

