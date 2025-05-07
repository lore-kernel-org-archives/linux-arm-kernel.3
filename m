Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760F6C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh1Ax+79urOihrTf+frzyudruYuijX+G+RsUCOtrxR4=; b=H8Ct9kZXjkXYRxuab4A1UUQuzf
	tQ/OfcPaPxVjRBPHmtDSxXxYEu0DruzcCVMpOTuIFwg/OzvsmOeDQt4DOk4LV300Sp2Tw/Y7jivzc
	+xosRTqCTkw0Qhp+Whua9J0fKWcQWMuIl3QNqGXFd1aFAsg2Bx4W0nDQ7+sown6BtPjxg+kEpoEKd
	g6UWpt2TvJtnN32dkGcPHWf4X/HSNp0r1en6KHvWue1WJrDt46IyVmcCrpdsSgxDeCPPOYktscPuX
	0h12LXowTTue0JmIh2iUWvJI7Hey0NfgA26NG0OGu81q58A6L4jGSxDZZcEl2xhkX87+N+e+Hbh1t
	YqoIK0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCae8-0000000Eq2O-0K2q;
	Wed, 07 May 2025 09:00:56 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZf8-0000000Ed1J-0ETa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:58:01 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 31F241F949;
	Wed,  7 May 2025 09:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746604666;
	bh=Zh1Ax+79urOihrTf+frzyudruYuijX+G+RsUCOtrxR4=; h=From:To:Subject;
	b=bp9/PJqDfYkHIwO7r+oExaz/LOmHOCYbtrw7u8McQMGBwBEBzefL8rw1+uhHO9H8V
	 KsxoETq9zRTZIj7jKRr6hFzVI/sXYCGlb7k10JDhkdpcH2ncI31Xu6xqs9NecIamkb
	 5/cPThsxaK3iMWAstY52ZvvSy1waW4gewOfNaXVPYS2cesx7sMNyrtcDMBy/PX8hnc
	 ML6uBtSPxKAgQJWtSZiOZN1p0yFQVhUj1zHkhtaOjCqqkx+ESG56c24rrQ9F8SbtNK
	 b1hc0Gy/NpD2LD1ZjPOUpB/0ttCXco4YCsYsdqLqhgeXj1URNRA5ssUCSUsXTaK8EF
	 uTo1SBb6IAxjg==
Date: Wed, 7 May 2025 09:57:34 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robertcnelson@gmail.com,
	francesco.dolcini@toradex.com, upstream@lists.phytec.de,
	w.egorov@phytec.de
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am625-*: Specify Temperature Grade
Message-ID: <20250507075734.GA10198@francesco-nb>
References: <20250507050847.912756-1-d.schultz@phytec.de>
 <20250507050847.912756-2-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507050847.912756-2-d.schultz@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005755_170750_DD9E0850 
X-CRM114-Status: UNSURE (   6.98  )
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

On Tue, May 06, 2025 at 10:08:45PM -0700, Daniel Schultz wrote:
> Specify the temperature grade in the base device tree to ensure
> correct trip points are applied for each board.

At least for Verdin this is not correct.

Verdin AM62 is available in different variants, the correct
thermal thresholds should be set in firmware/bootloader, see for example
in u-boot, arch/arm/mach-k3/am62x/am625_fdt.c

Francesco


