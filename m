Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C100FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QimwBK0cgXjaimRuuz1Y9NRWVe3Ak2Ys2b42kdgL50=; b=u88Le7FRWqN0wsu9VxDxvopsMs
	6v0kCXzDC7gRoBbgqA8ZnzrnTN2iXAH7+7Fs4O3/SdETWQctBQ9uwUDQhLQAen5slb0yvdc7s5Fm+
	4rKcfdDmQS2F3PdNVfRQmC1a0wRaVgY/mdZnryFCjxI/uBe00yOmunQPulwGa77RAqeZ4vU7pLF+/
	3CFnrAh/aBqbqaWapMJWCV1GJjX09MdOl3/t4H6p6HD35vxCj6Eo5hfKpgEsm+kjoM0z5KCOk5vTg
	3pDsrCxqEnn5iyokWHZ5qzjxrDM2GzJU1tRNCHKCBFXXWf2FSJpGAi80TljxjnolixkhVKwagil1S
	a2vVPPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadOY-0000000AgK9-3qQT;
	Wed, 22 Jan 2025 16:15:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadLE-0000000Affl-2u8g;
	Wed, 22 Jan 2025 16:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADDA15C5819;
	Wed, 22 Jan 2025 16:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AEDC4CED2;
	Wed, 22 Jan 2025 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737562351;
	bh=0QimwBK0cgXjaimRuuz1Y9NRWVe3Ak2Ys2b42kdgL50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAkyegvAokUwR3nsoFLgsH1aCXyo/6LYy2MXL6qpKG3JT8SFPCfkovFZLGbDEdzqN
	 4Q60r+Epz91fxYVYEYtdebaXcq+dsy1tRh2dRLECJkykB7Rbqw33y1d4t6vzOgSNMt
	 2DBjjDWE1x/PTNv0lMyHYf3J2e9LxJhR/ox3DdkOWn2VS09J/K4Sp5fAEBJhJ3rNNZ
	 ihwPzcgVWyQ2aA7zdGlUWtH24Tqtutj74PV4NvPLgr20C0Jish1IbxbAiE/vUJDK6e
	 WSKcuG+BMJM5Ap2XbZnWFAB6oK4JRYq6KCS769eMk7QmCxnWkUJQH3mTrE463aOekg
	 Ep0Nq3WeRi6ow==
Date: Wed, 22 Jan 2025 17:12:26 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@edgeble.ai>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Message-ID: <Z5EY6uMmDCgfOzGO@ryzen>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <6dd64754-fe72-4288-9724-b3cdaf193b3b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dd64754-fe72-4288-9724-b3cdaf193b3b@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_081232_774749_F50D2959 
X-CRM114-Status: GOOD (  16.23  )
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

On Wed, Jan 22, 2025 at 04:38:16PM +0100, Quentin Schulz wrote:
> So essentially, if SPL_ATF_NO_PLATFORM_PARAM is selected (the default for
> RK356x, RK3588, forced on on RK3308, enabled for the majority of RK3399
> boards, enabled for all RK3328 boards) the DT won't be passed to TF-A so no
> issue in terms of size on that side.
> If it is not selected, for TF-A < 2.4 (released 20201117, 4 years ago), a
> DTB bigger than 64KiB will crash TF-A.
> If it is not selected, for TF-A >= 2.4, a DTB bigger than 128KiB will result
> in TF-A not being able to read the DTB (for Rockchip, that means not being
> able to derive the UART settings (controller and baudrate) to use, and will
> use the compile-time default instead).

Not everyone is using binary blobs from Rockchip.
On my rock5b (rk3588), I'm building the bootloader using buildroot,
which is using upstream TrustedFirmware-A (v2.12).


> In short, I don't know where to go with that additional piece of
> information, but this is a bit bigger than simply moving things around and
> adding compile-time tests for overlay application.

This is significant information indeed.


Kind regards,
Niklas

