Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED52107BCFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LORI+6tt05VNG/ZoZ4pE374DOGPkUVVVoWXhIhiSfk=; b=E3iepunv8bfa6612WVsmBFGh/8
	CNm3Vt4YgvWbWFT8Oi4gfklg+gjyH9HJk98XB58UM0uIFoTgjJshitfvAYFbrEnU98/CCZnpC0Hro
	dwdK0nsUwidfP/CAt/bdHmNfdKfnDsY3qj4St0HdwJR5tFymZV1JD+F4P/0ATkSPNEWxF+e7VZpCi
	/PPrSquEr+hWmOZLRKRWbFRFLxAAeIPpKrUyx/0yl5043VIyHhOM0fMzk/rOujHJesSvfs0tZOLVO
	SyLy926YsbBw6gNZD1bc4iB33KWcV8l+A8KxocqB8PA1dUTGvFWq1iRDbfTwft2PbFotaPxC10wsw
	vXoVAGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JSI-00000001aQp-3Bu2;
	Sat, 14 Mar 2026 07:30:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JSH-00000001aQg-0FMd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 07:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB42E60008;
	Sat, 14 Mar 2026 07:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829D8C116C6;
	Sat, 14 Mar 2026 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773473433;
	bh=/r7P63vAzuId1FJu7Wx90EZmySB9sAz0wDy3fGBNv4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t60OkyTn7wfBA1/DrrMu7aRTpp4k6minF0VVXbLhFstWqShJAYlYymEnFfNx0Yo7n
	 UnwpsrP+XkzOs6EL1Qh0IktITu43JhiG27eom1zjTXorlC7hg2unAci74EFwXGkkXX
	 MRA4iEKOd0sqEdsN56ErTUHu1R6AhvzsgD7+RMwsUJh5GRZDlsCLKtBlOLwTXRuyAR
	 dQ5H6pjhEsudK2b0U4TLoKapU5/6n95yosXcg9aHic7vp1gyrT8ufPpEC+TURzN9Fd
	 ibw1mSpvyVdskSI0EM3kokAZFz2AXVNxIPu/G8+qIzLfMx9FxU2k9qlNh6GtFNynF9
	 xCzGUWFdshCvA==
From: Chen-Yu Tsai <wens@kernel.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
 andre.przywara@arm.com
In-Reply-To: <20260304073430.438835-1-jerrysteve1101@gmail.com>
References: <20260304073430.438835-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v4 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Message-Id: <177347343121.5222.10454445952676916581.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 15:30:31 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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

On Wed, 04 Mar 2026 15:34:27 +0800, Jun Yan wrote:
> This series adds support for the TaiqiCat (TQC) A01 —
> a set-top box based on the Allwinner H6 SoC.
> Originally released by Ultrapower(UQSoft) as a blockchain terminal,
> the device has been discontinued and is no longer officially
> supported.
> 
>   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
      commit: b4137a75e1e611f37fcdc74c1d41696c7971e0b8
[2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
      commit: f3208874f32c09dfc9ee330204f9fccf26e15b57
[3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
      commit: b912e48bee355b6b1faf86efc4a23191324ffecb

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


