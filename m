Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC2EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 05:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvSGnzTuhnZ+H8t1pm9S1YvjOlXKSK3E9FFBbD2EyyI=; b=MH86C3stuZi593jVF4d/2Jnl1b
	6NQ5gSyQggxXOfCSglxeVPVy6wzWa6FIZqgzMdekmoQd/c7A4qj4HYCZRMAqE//hJFI5KotHEpYym
	NN1ufhN25UZvMMPsWJFLGTD0nq10bLNodJoJnc2oBctqaH/NhVUgAfCrsjFZvr1AJ0lBp9HbQ047M
	Zp7D4OnfD5HfAb+/ESonmf5rOZgfth4kW6sf2AGnFxD8MY40adFNTtnLpud8uARxOUYq5tQim4+LP
	PDkOXxbiiTn6aHw2OYhH9UdE/clkcKgnfWYk5yNACpS81sy460uVcLX1uqGXKMjE9EJo9L4sUiSEk
	OumW79HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8uu6-00000002wUD-0Fdi;
	Sun, 27 Apr 2025 05:50:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8usB-00000002wN6-12he
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 05:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62B624349B;
	Sun, 27 Apr 2025 05:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00EAC4CEE3;
	Sun, 27 Apr 2025 05:48:12 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 81FCF5FA0F;
	Sun, 27 Apr 2025 13:48:10 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Dragan Simic <dsimic@manjaro.org>, Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20250420094823.954073-1-pbrobinson@gmail.com>
References: <20250420094823.954073-1-pbrobinson@gmail.com>
Subject: Re: [PATCH v4 0/2] Add support for WiFi/BT header on Pine64 A64
 devices
Message-Id: <174573289050.925869.16225701473400266329.b4-ty@csie.org>
Date: Sun, 27 Apr 2025 13:48:10 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_224815_315342_96F06339 
X-CRM114-Status: UNSURE (   9.73  )
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

On Sun, 20 Apr 2025 10:48:03 +0100, Peter Robinson wrote:
> Add the BT and WiFi pins on the WiFi/BT header on the Pine64/SOPINE boards.
> 
> Changes in v4:
> - Remove the pwrseq section
> - Tweak the device descriptions in the commit
> 
> Changes in v3:
> - Explicitly disable mmc WiFi section in DT even though it's already
>   disabled in the SoC DT.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
      commit: 91fe4b2e69419d5477c7776cf38df1970ad162d2
[2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard
      commit: d3f6af8473a06f66078dc7833c8eac25c8d2b929

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


