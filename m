Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84138CEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elxD612I4m45t7J0D+rGSJ7yVJFgP0gza1D7Xj/N7eY=; b=vbe1EloeikrEceKQfntByIlWih
	ElAvgNr4VfYvmk/68kqUkgXt5UJNEVLjHFTy9YBJBkmsCu2FVb3mS1zcXrLzqDSHnZ8wW4RywhPJp
	T6kBZIbOzj4MEOVlR1UPHgsC2J3YmyFYTHDzmCX0ynXKrx242rnkLVyPrLblZs8e564engoqVVQXU
	OujDF4avq+zbwtEeueY3Y81pvg3rRJWpMoO2V5UrNtU/6+dV7f3yxM0THbiIyNyL4GV8rv9P/Ll4D
	gXGBn+wRmGj0A+ueebeONlM3/WsB/0QPNDf3MBbVbQZ61/h3lHcDFcGXoxtNdrBp/YNWu7wEEv4+H
	PcVF3q9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBIr-0000000Ddf2-2qTy;
	Tue, 06 Jan 2026 17:57:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBIq-0000000Ddew-3C5l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B41746011E;
	Tue,  6 Jan 2026 17:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3422BC116C6;
	Tue,  6 Jan 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767722227;
	bh=hQcVkxR/o5ATUWcW4CuQXwOu/rw6WdzBdJ24sxfFynw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rbXdr+70VG7WegNXGbgtvzz3Hdi4UhZ+S8QqG2bFZdG5khjaOy2vfDgKeya1MP3qp
	 yiwpkemEeOVn+qtMkZYlV4S6hvTb6s2PnWfhn52QU4/1u2TNskkzQ2oQaPaBb8xPif
	 XbVy2+JlbvLQFPWRp+T/rUjmkWp08r970AC3SARu/E6WrtdsecznTfnOxL58bx2Meg
	 lm57eJEV1/C5VnVNdDZTtVycThxkrPLJACd4iMpwZjQ8lxCKGf83NwUpuXD4mk3tsE
	 nKpYCo1HZOgH/6Tzr6nndDVsaEEBXDgeDV+HHI2o+/FnJog54h48nImOH91AEKARmj
	 xTd/k3ML+9JPg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 758D15FC25;
	Wed, 07 Jan 2026 01:57:04 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/4] ARM: dts: allwinner: Fix remaining DT
 validation errors
Message-Id: <176772222440.2799087.10450816532517235383.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 01:57:04 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Thu, 25 Dec 2025 18:36:11 +0800, Chen-Yu Tsai wrote:
> This series gets rid of the remaining DT validation errors for Allwinner
> (sunxi) ARM 32-bit device trees. The patches are self explaining.
> 
> I plan to take all four patches through the sunxi tree.
> 
> 
> ChenYu
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
      commit: 0b2761eb1287bd9f62367cccf6626eb3107cef6f
[4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
      (no commit info)

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


