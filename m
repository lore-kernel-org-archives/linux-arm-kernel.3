Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D084C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHQ3vqiw7OuvvBYNY5ALvsuueTwg408Nk66Wf0qs9Ws=; b=4NRNP/XkZmOGRCwk5KhZSG1bGu
	nd2N/5ERMVgOOtYXunvT6XJMUw4L+SRW4rhj/dr2PiR9S23fl+O+Qs+6IsPUmfGNfQFvFZxoIqFEm
	K/YWxkBvvwJHdvgxZ91Zq3tvvNIx53OwWsIyGN1brSah2k2s3d3VyMpyOYMdwK0kmcd+/7xT/b+55
	nt0gB8VaqaEIoLlm+XT37DNR6wxaXFxbG645bPKzxJDiXJoy73iRFq6aQjcWYBymHq8hmQXtWaGHx
	B/mOCTcPskdH6PfBKfFhWs7xP2OLXj67X5R50BQfybBArUx2TXDPmsLPmKUbsFMSgguCZc+wBXAZY
	fj0Mo/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV9d-0000000GOdM-17VG;
	Sat, 12 Jul 2025 08:00:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV67-0000000GO8q-1rEN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6714A54673;
	Sat, 12 Jul 2025 07:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5B0C4CEEF;
	Sat, 12 Jul 2025 07:56:38 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B0B945F939;
	Sat, 12 Jul 2025 15:56:35 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH v2 0/4] Allwinner A100/A133 Ethernet MAC
 (EMAC0) Support
Message-Id: <175230699566.812115.14917196143990668369.b4-ty@csie.org>
Date: Sat, 12 Jul 2025 15:56:35 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_005639_552969_908A358C 
X-CRM114-Status: UNSURE (   8.51  )
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

On Mon, 07 Jul 2025 18:51:51 +0200, Paul Kocialkowski wrote:
> This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC0)
> and uses it in the Liontron H-A133L board.
> 
> Changes since v1:
> - Reverted the emac0 to emac rename;
> - Added collected tags.
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[2/4] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
      commit: 28e4499a9ad68129d41db10b7481c61738fdb3d1
[3/4] arm64: dts: allwinner: a100: Add EMAC support
      commit: 4e3be5629f1f6de30d3fbcdc357e7da948ccf698
[4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
      commit: 8f128f357dfe5907a6f3432ffb1f444e93f1fbf2

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


