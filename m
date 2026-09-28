Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDED7C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjWZf1auWciM0t/tzIaHilDCX2PzkzFuO2fqxNX40f4=; b=NaHOJK9s7fP+sbxb3WRPq2SPlI
	fK/gX67XTrbHFeDPKNuq0I4Pjp+8cKPP79rBBqqD/IrEw65bSTE8FxebSPWKORT2EtUdg5RhAwf1o
	rSN1qWCZEQ0anpWVSfRPwRc538+zC2tZT+SoIt2pss+PBonmN9Wx0Pd5RmVNEhCZx3B8ity6Dt5EM
	pugjBMK2JUIMegZ6axmWCoCJkiVPw5W6tRbOM8tYNZRKhlcZkpKTS+DMTSDnkfGkIN3206vxW30XS
	30NLEJF3EOwhYhx5XMafc1Gmuj4MCLxTL1g4aAHe0Mks2QWzuTRsBiNQm2UhIIk0P7VvWg4gVxrL+
	SdOoIFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5gW-0000000HXYm-33YB;
	Mon, 28 Sep 2026 07:22:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5gU-0000000HXYa-4A4t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:21:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31393600E2;
	Mon, 28 Sep 2026 07:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5654E1F000FF;
	Mon, 28 Sep 2026 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790580117;
	bh=pjWZf1auWciM0t/tzIaHilDCX2PzkzFuO2fqxNX40f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D0d0H2O+wFox1vxz6GaXraMUjdFc8oPkr36VVt6syNwHz/vZlkVRokPyWTEmotW/g
	 TgXiL4DlgHlZNWD3/xrpuxrNQzgVcRCV/aMwU3yDoPdmrZxeIMNpBPpoZdSlicRPFT
	 IKCdyvLZBNC1my1UYL4ucCyEptyXeNB/R5nPSiq9+ETo6NWHamBPNAkY19r7ld/YQx
	 6wlNjpTwndog4VEYnINiQ8G4RV8Gv2Xs2lQfQFi1BIIK5PNNX/lBvWY7znynafAFre
	 0fhVjI06rIwYbLte3+pZSjb1OmxJcAaJBanGwtj5pxgiJlEgpo5TQwEB2SRtzvwPC0
	 HRv0DfAsiZbkA==
Date: Mon, 28 Sep 2026 10:21:53 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <jypj45gex4daonopod5slfuob2dzbqjysbfanbybt33xu7krlg@muhrmrczdpwm>
References: <20260821083645.200344-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821083645.200344-1-thuth@redhat.com>
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

On Fri, Aug 21, 2026 at 10:36:45AM +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to at91-soc, thanks!

