Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE0ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okDm8OYPX+OIIRoCLwG7RpXVE0mKp8taEG32jPY7ZLY=; b=xkiZxhxvc/yZuHwPrRLIihpOgr
	kLc6kQGMx6LIFLTbmwS1EObhGN+OLGU4nhmFLSTXB+6MMu68ZDeRbUY/hvHzNZQKqwYtcfMzFIvtC
	KsMyqKofmyGX8Xa/OhbISzg5XeYL2Po60pGnbJcCwlyNVaGmxO8jrg6m4vufatu7ZUXfoXqt2n9Id
	RO5lIeIjwJQqyG3gEwobnVBRWWvoNfw7EtpTNMnMjYz3+z1GXz/hnNYsiI/0RH1FS6121JYxEWwk5
	Ws54iEwhbeKi99QUmVLYyWmIq+SXfN6Nx7umBVobb+aaieRY8MzqqHG/bwpiGbeMzv9u0wCQjgp+x
	mn5cLBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn8b-0000000GNKC-3WT5;
	Tue, 28 Oct 2025 17:05:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn8a-0000000GNJg-0IdM;
	Tue, 28 Oct 2025 17:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A65961122;
	Tue, 28 Oct 2025 17:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0592C4CEE7;
	Tue, 28 Oct 2025 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761671134;
	bh=oL0rXXmMHbcR3EvMkdJ0IKxdFjgk39YWymPhTwNMDgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAc4R7RrcicVl5PeahubF+TfLli3xATxMXRSgNiesCP4FlAu9VGhv4daehI46gO3t
	 YdHl4NcawireCvk/sBo4Azw3sJfkZADoxK7hWgThsdwGxQv0LWx37SyEnoFJXQnFkc
	 fg+aaheIUkRocD6+64eu7paqvkKQ/DSpVWcEiTuJElMCyfGc2LiclFQDx+zdVYqojG
	 anSZI/vwWlsw3nc1UUGe3i9AKZ5Ft4y514OUiwYDcbSXE2I9ALHWxC1Q4sd7rB8FvQ
	 jv7/p0goh4MSQI0HzGXw0pyIkbio0QbHKE8itMZ7ybLs90DcIHeYH/iNvG5rpkGqxU
	 DHXj6ifX+xy5A==
Received: by wens.tw (Postfix, from userid 1000)
	id D9CDC5FCB3; Wed, 29 Oct 2025 01:05:31 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/16] Introduce Allwinner H6/H616 NAND controller support
Date: Wed, 29 Oct 2025 01:05:29 +0800
Message-ID: <176167109288.1159653.8613197052957076565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 28 Oct 2025 08:34:53 +0100, Richard Genoud wrote:
> This patch series introduce H6/H616 NAND controller support (but not yet
> the DMA/MDMA part).
> 
> All the work was done on a H616 board with a Kioxia TC58NVG1S3HTA00 NAND
> chip.
> ECC is supported, as well as scrambling.
> 
> [...]

Applied to sunxi/dt-for-6.19 in local tree, thanks!

[16/16] arm64: dts: allwinner: h616: add NAND controller
        commit: f55a2526317aca8ecc1b21b346dbdebbc6aad97d

I also fixed up alignment of the clocks property in the nand-controller
node.

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

