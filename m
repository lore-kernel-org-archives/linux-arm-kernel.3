Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EB7CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ1mUoG3fV3WXVXEgWYXPGDH6zt9YlBv5QtbpRwYCsY=; b=2T9xwLeQbipA+Zmm4LYQzECmzD
	ONNMwXJWhYeFJqmV1CksTI2YdVOaSIh4LFrweLNXqEWnZUoISAiYMcvbbEw2RZaDFc8zoHARoDNgc
	dasLLIEbbX+dK9wgfx80MqqsY18VwFbyInf6OoyYh8lNH2U2QG6+rpp4Car1Fxr/CLss5YvakvKNR
	oWaKX6dt+gyed0JxXq5+FseHjx0pJYvL2NtFXFZnoezXDwI1cyynol0NAGCme33pZEbTAK929d7lO
	pKDdUIwDMwM4sVa4LBffgdVx5cY4TtJSkWfv7cBQr9zkXy+w+TTuRAm6RBySibfnX39CreR8Z0UB8
	ea/q0P1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4Al-0000000CcB3-3mVv;
	Mon, 01 Sep 2025 13:02:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2GB-0000000BytS-2pOK;
	Mon, 01 Sep 2025 10:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kJ1mUoG3fV3WXVXEgWYXPGDH6zt9YlBv5QtbpRwYCsY=; b=Wdj/akT7fKwJp5F02KcuG2r+k4
	O0joSQsiYLQSZ7IJ3D+Vc++OH8Eoy15JN+21KfldeCJew+tuoYo53N7WqCGsBwUB+dw6pAO4huQ+N
	/wSj/MhmHFHEbSOtE6G0twgQvUP3/jVV4CP1g9gxigcTG3yZFfjQz/YE5HmjMKI7f0U/WGSFC2E6t
	4W85Ls3UhdsJuFsQuBqkCNrFpA06FCD3T2urfvQTxx/v8ZjQvOuNW5MK9KUqYRKVUYbE6pSOI5e0q
	b4jQHAVSrZJ4D6U/Z5nALMW/pX3tFGeTYcTrz4rVrg+9by1pGN8EPD+Q73t7nABGXOQwGK7q6EmTy
	EdAIrIJQ==;
Received: from i53875a2d.versanet.de ([83.135.90.45] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ut2G4-0001WA-0G; Mon, 01 Sep 2025 12:59:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix USB on RADXA ROCK 5T
Date: Mon,  1 Sep 2025 12:59:28 +0200
Message-ID: <175672432552.3612134.7877143457779148852.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825-rock5t-usb-fix-v1-1-de71954a1bb5@collabora.com>
References: <20250825-rock5t-usb-fix-v1-1-de71954a1bb5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_035939_736213_B8851666 
X-CRM114-Status: GOOD (  11.10  )
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


On Mon, 25 Aug 2025 09:27:08 +0200, Nicolas Frattaroli wrote:
> The RADXA ROCK 5T board uses the same GPIO pin for controlling the USB
> host port regulator. This control pin was mistakenly left out of the
> ROCK 5T device tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: fix USB on RADXA ROCK 5T
      commit: 63ddc0a75b3b071f04f4bc277b2510eb06d21648

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

