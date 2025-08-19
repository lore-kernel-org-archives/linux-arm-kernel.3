Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0885CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbRwUwSVxIDKaU2ICHfP9PGzrzs5sHm6FHEsPrlF9D0=; b=Wra7j9uZi43jkk52Dgdd4N2Eiy
	xw20tSWIazf4YmwPX5uLfi/3rFKFp5HvRSPs6pfWHots8C8q5t+QiXs9w1p16LUb6zu+Z/l3CjkjM
	3AEWUvbaBsQswC0uoZc55pKt/3B5WriepJQ95cwpR/Pd74f4WceIucNrPNgKu0zohrB2Fdkz3Krl+
	Ph+2qfp31YcF/rTAACyEX2cSDnY+QPUUrmLj5Mcno1qTvWiedVGawjqXcPEDLh3lsO3j5oRpuMw2S
	cY2zypecOWS/25QtElfSU9iLATE4zTT51MZvALOYlqx7EHzE/OQJg/j13vjUtRrCyxVh5cs5GnEP1
	RMAqvbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoITZ-00000009vUM-16RM;
	Tue, 19 Aug 2025 09:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHwx-00000009qD9-3ax8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CC22416A4;
	Tue, 19 Aug 2025 08:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BF8C4CEF1;
	Tue, 19 Aug 2025 08:44:09 +0000 (UTC)
Date: Tue, 19 Aug 2025 09:44:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] MAINTAINERS: exclude defconfig from ARM64 PORT
Message-ID: <aKQ5V8iWQ7tqSnq9@arm.com>
References: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_014411_911717_DB3FD540 
X-CRM114-Status: GOOD (  12.91  )
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

On Mon, Aug 18, 2025 at 11:08:04PM +0200, Sebastian Reichel wrote:
> Patches for the arm64 defconfig are supposed to be sent to the
> SoC maintainers (e.g. a change in the generic arm64 defconfig
> required for Rockchip devices should be send to Heiko Stübner
> as he is listed as maintainer for "ARM/Rockchip SoC support")
> and not the ARM64 PORT maintainers.
> 
> While we cannot easily describe this in MAINTAINERS, we can at
> least stop it from giving false information and make it behave
> the same way as for the MAINTAINERS file itself (which basically
> has the same rules), so that it just outputs the LKML for the
> ARM64 defconfig.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

