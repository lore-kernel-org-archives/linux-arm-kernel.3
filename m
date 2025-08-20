Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE24CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQCY27HETS88mYpeAA1qcXlD2j1Duhq4kSIRXaFyJQM=; b=0KIzH8BCkVWkD6DhpKNdvOKueq
	VI9KL+BZU2SBrWUznfjQAO0ub+VdiLKABmpBlx3KcrEjjtfxwppT4JFPPS3LnZu2b3k5U7KmP27Je
	2Fzz/aq2sffJ3xtxvpIPQFEs8wbs63UqnStyriYmyggI5CbKbtUiDkwxn4ewsakQt5J7hdjHi3i9n
	DZhCbwd4xyVo6duFrXqQi+MKpZAOXIDpnY8JUv7wTi3a0i8TuvYV5dAMFpWfj/wNU8AzENMlCOC29
	FXDjEFkTpzc+1qTzXhlQYLV8Vm0qlz+cdKvaGw2B7Lbl0SnrcBWku+p0Yv3dylwYPhIGCh0PjUrns
	psHj7zFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqhq-0000000F24K-3Lcv;
	Wed, 20 Aug 2025 21:50:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomT0-0000000EW9N-3apZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:19:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04D2B5C6315;
	Wed, 20 Aug 2025 17:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACD8C4CEE7;
	Wed, 20 Aug 2025 17:19:17 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 84EED5F870;
	Thu, 21 Aug 2025 01:19:14 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250812175927.2199219-1-wens@kernel.org>
References: <20250812175927.2199219-1-wens@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
Message-Id: <175571035444.1649720.10442215373072294834.b4-ty@csie.org>
Date: Thu, 21 Aug 2025 01:19:14 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101918_936160_F4C8B37B 
X-CRM114-Status: UNSURE (   9.93  )
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

On Wed, 13 Aug 2025 01:59:27 +0800, Chen-Yu Tsai wrote:
> The Radxa Cubie A5E has a 3-color LED. The green and blue LEDs are wired
> to GPIO pins on the SoC, and the green one is lit by default to serve as
> a power indicator. The red LED is wired to the M.2 slot.
> 
> Add device nodes for the green and blue LEDs.
> 
> A default "heartbeat" trigger is set for the green power LED, though in
> practice it might be better if it were inverted, i.e. lit most of the
> time.
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/1] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
      commit: 4184f0190792aea06553af963741a24cc9b47689

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


