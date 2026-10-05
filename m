Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AD9CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWApHxVAycrmj9U4cHRketIuFvl3SRCgeaBmnuVaOMM=; b=bE3mL2t5GsIy41JYrwFkoQPtK4
	Lf1n1hGJNWFs4VDpLw5xWP30hpG9FHdFdO1AR6fWEi76NVr2cEhIrPUezNw+GVDCr/uPPmZS5VRcS
	Z1au4c6rBQXu/gJvAF5YjfGqrMvVW3fNC4o2cH0WWsN5b4yIUZ0QCRJl2vKYkknCZcrAuJgNLpXTN
	/7RmumQLCQ6cK45AB4Q86UyMU682eUL6meRNkwWrGRCLqY+q9R5IPHcxUGAENG7FOLAVteMxJE/01
	5WWf/c+3hrOurnIdOy/dB5k3TltlolBx+51pVK4B4F/O51BOwxzq1VdFYRHBBMJ1vBWa2LrXND5ex
	0c7zfxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqdm-0000000HDjc-2vPP;
	Mon, 05 Oct 2026 21:54:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqdk-0000000HDjS-1RKt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 21:54:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67856600D1;
	Mon,  5 Oct 2026 21:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2A81F00893;
	Mon,  5 Oct 2026 21:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791237271;
	bh=KWApHxVAycrmj9U4cHRketIuFvl3SRCgeaBmnuVaOMM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ISVZ0fMQqwu28M13Kg5taiF5LoBT9WqHlagxrbLdj2WfeAp0CvhlBesVncVaADjA8
	 ZaTgICt8QR6QCvZgstzgzioAVjW4NcachkBCpAMtqA3jZGgpRuyH2vY+pubYnlMG0F
	 zwoHGd2TMK7JutXs/QjSSTlQ/T7kmwyoURfwzAwpeU/UD+DTNqU0o0PSZsmrDLnyoq
	 eY5hAnNyLri8mE93Vx+plEbxAizP17WrVY3ssAqfzeZTdK2dNWdSMC3kMaGn0QC+Bo
	 rf38wzNqlXIPLz8/cR/QshlveR8WwRSrrrzU/BJwI9HdNHRCyIWrDJU3nSM/+gon+J
	 zXjsmLzH6JEeg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v3 0/7] arm64: allwinner: h616: Support Video
 Engine
Message-Id: <179123726826.376978.5395078957108502245.b4-ty@kernel.org>
Date: Tue, 06 Oct 2026 05:54:28 +0800
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

On Sun, 12 Jul 2026 11:00:03 +0800, Chen-Yu Tsai wrote:
> This is v3 of my Allwinner H616 Cedrus series. The series is ready to be
> merged.
> 
> Changes since v2:
> - Dropped "drivers:" from cedrus driver patch subject
> 
> Changes since v1:
> - Fixed IOMMU ports on H616 (patch 7)
> - Updated comment about VP9 on H616
> 
> [...]

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
      https://git.kernel.org/sunxi/linux/c/d7287d940f3c
[6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
      https://git.kernel.org/sunxi/linux/c/965a49fc413d
[7/7] arm64: dts: allwinner: sun50i-h616: Add video engine
      https://git.kernel.org/sunxi/linux/c/eabc3c090e81

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


