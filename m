Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BEC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32y7zK7mxRKRK8BpV2k/iqVirK9pyzxo96caziSN9Ns=; b=L8H8DjhVGhbDvp5yIe0/ux71j7
	jZGgjo6qT58Oynt5w9gFLOBGh1dHSgGf6jtEuHCLjD8i5hCf/ScmxBc6tteF+syYDrA1rVcUzsFgY
	Imf7DsOiAQzK+OONdwPz4xcfCx+hHoZlhdEH9TV+ZZwFRzu+TM+JhNIe6mHh67ZmZGclwfXZs6hc5
	RUbZ/IfLtpA9qhaakX4PyNo7QOLEu5CbKTB/WMDEO9vzB3nrEyhQ1yUzXqeEGVt293bD+ksodOm9+
	aYdSy6+hvb0cVi0OhSTAmoSwkc6TP8TsflnKE7KbNmF49d3O4Y6XWQcrXi1S6JZEazZ7aHWU2OEVK
	itxdMLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBdS-0000000627H-24Uc;
	Tue, 08 Jul 2025 16:57:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB85-00000005xqu-2VMH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA6C6A53F6E;
	Tue,  8 Jul 2025 16:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55564C4CEED;
	Tue,  8 Jul 2025 16:25:12 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 398055FA91;
	Wed,  9 Jul 2025 00:25:09 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20250628054438.2864220-1-wens@kernel.org>
References: <20250628054438.2864220-1-wens@kernel.org>
Subject: Re: (subset) [PATCH net 0/2] allwinner: a523: Rename emac0 to
 gmac0
Message-Id: <175199190916.3345282.2851662318368432777.b4-ty@csie.org>
Date: Wed, 09 Jul 2025 00:25:09 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_092513_717350_77E66F32 
X-CRM114-Status: UNSURE (   9.49  )
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

On Sat, 28 Jun 2025 13:44:36 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> This small series aims to align the name of the first ethernet
> controller found on the Allwinner A523 SoC family with the name
> found in the datasheets. It renames the compatible string and
> any other references from "emac0" to "gmac0".
> 
> [...]

Applied to sunxi/fixes-for-6.16 in local tree, thanks!

[2/2] arm64: dts: allwinner: a523: Rename emac0 to gmac0
      commit: a46b4822bed08d15a856966357a4b12273751cd3

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


