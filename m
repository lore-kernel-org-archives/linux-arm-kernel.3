Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C59AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHYcB9t3xdewnnIczmKnI8R/grB65gvC4oenUZzbK7c=; b=1edkUz+bpqr/2BGKImfJYn7zn7
	J7mvRgnaLkjIl7jQHNO33nI6sTPiE7BQK1Mzzoy9ozV/aBRMvheXlGW6sY1BJAwnRNKgR9ZP6y0wo
	konN0Y7o95EQIZ1xFbFTgYnNePN0u1goaN/k5JQ42Sj5/RoQeSMKlmktzw0ccdcnAtMcX53xOe9zH
	fP1X4+lBCp5yOh1hmc0kjrvA5ICJTALbQ07YfxUqvrpe3qMda3c3axnE95B/u2BDiwAdpGC5Rsvr8
	MZFAJRHJe5p1LM81No+pYMBOsIFRGe/ouutYpE6tN5yv+d7wlrDLqt4+/rSFRVYJECIW4ZeErhf2K
	g6P0B2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GaP-0000000EHbD-42My;
	Fri, 11 Apr 2025 15:46:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GYa-0000000EHHp-1neY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 15:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C08814A3AF;
	Fri, 11 Apr 2025 15:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7B6C4CEE2;
	Fri, 11 Apr 2025 15:44:38 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id A740F5F863;
	Fri, 11 Apr 2025 23:44:35 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250409203613.1506047-1-robh@kernel.org>
References: <20250409203613.1506047-1-robh@kernel.org>
Subject: Re: [PATCH] arm/arm64: dts: allwinner: Use preferred node names
 for cooling maps
Message-Id: <174438627562.2569515.5719390722381962161.b4-ty@csie.org>
Date: Fri, 11 Apr 2025 23:44:35 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_084440_488178_5507490B 
X-CRM114-Status: UNSURE (   5.64  )
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

On Wed, 09 Apr 2025 15:36:12 -0500, Rob Herring (Arm) wrote:
> The preferred node name for cooling map nodes is a 'map' prefix. Use
> 'map0' like most other platforms.
> 
> 

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm/arm64: dts: allwinner: Use preferred node names for cooling maps
      commit: d94a1c93673728e6c2bc678fcb047a7e730f2e06

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


