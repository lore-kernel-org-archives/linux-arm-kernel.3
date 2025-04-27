Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274DDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCR3JOoDL9T3zMMdWOkeK1FyrIaD8T3VgkijTBh1Y84=; b=mSfBhXQn6V6Ue9hos9lE7gHjVo
	mqHlqAJS7AAV/a4gNq0PPDqM+qyxbOwgRey66Hzoukq7xLWRfrn4P+gdxJBkKB6Zup31sY1Jqdt2y
	dTfRQHAPt1WF/pabIH/OM8TvrzLNuQUloGb5bsF+tDy+BoAIoqFIksTMVzAK0aY/UVcxm9jHTqXSN
	BGLIsKywvYRyqLYqcda6W+INXGLEYGoYUIdvliBYxwDsy/T2m6Vy7x9UFqvA3zm8iI9Kr12DO6OQh
	ovjB9uASCM0InA0FvR7B/FAgNoyUu+mzFIRGLW3k/4AO0Ew0LxwTwb5LwTBmKGtjUTQiu0QzR9tu1
	RQmYhRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8um3-00000002vz5-1Swn;
	Sun, 27 Apr 2025 05:41:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8uk7-00000002vss-2h5S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 05:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D25661157;
	Sun, 27 Apr 2025 05:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD91DC4CEE3;
	Sun, 27 Apr 2025 05:39:51 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 3D4EB5FA0F;
	Sun, 27 Apr 2025 13:39:49 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250413135848.67283-1-jernej.skrabec@gmail.com>
References: <20250413135848.67283-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] Revert "arm64: dts: allwinner: h6: Use RSB for AXP805
 PMIC connection"
Message-Id: <174573238919.922936.17995587846709082958.b4-ty@csie.org>
Date: Sun, 27 Apr 2025 13:39:49 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Sun, 13 Apr 2025 15:58:48 +0200, Jernej Skrabec wrote:
> This reverts commit 531fdbeedeb89bd32018a35c6e137765c9cc9e97.
> 
> Hardware that uses I2C wasn't designed with high speeds in mind, so
> communication with PMIC via RSB can intermittently fail. Go back to I2C
> as higher speed and efficiency isn't worth the trouble.
> 
> 
> [...]

Applied to fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
      commit: 573f99c7585f597630f14596550c79e73ffaeef4

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


