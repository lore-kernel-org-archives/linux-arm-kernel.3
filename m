Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4921CCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sw1opRUXcAw/1NhWQ+DjHthGw6A5mSCQCWdmv0WppA8=; b=iKQQ2wgZ9FzOkdd6ldhpd7H2gB
	7mBr98TikW6kETNo/3X5X75Vyl9Ejbh7F+NOuK/5O0R3yMvwTKYt9LqOcIP06+JlX/dFqibIrwusc
	mTT0amjxtbshNIa/oyr1lUqft7Ur4dnGHHOZxU9Mmo7fjJzdi0Ga6/rBfGEr7Jd+kjT+YwOJhKd9D
	SZ5z4A8o2MtQex9cGUYhRJfHzcO9S+Ginf1osByInb0cvEjz2FJguZl9EuZ0BzQpH5exoz7b62fqG
	13Q49cVt5DAVYmuC7MYx1/B1E09ANLF2PFpIYB4IG/WquR8w94k7i/qT+afEyD7WI/8mz9FRuUMNe
	wb6KduaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt2v-00000005Etf-3l4A;
	Tue, 09 Jun 2026 09:46:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt2s-00000005Es7-466P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sw1opRUXcAw/1NhWQ+DjHthGw6A5mSCQCWdmv0WppA8=; b=rI2a0MbTWMwB/3rZkDrP74q/UO
	i3TT9fSM3f58ih8ydJ6Ch4Z18EcAsceHJaRcSitWe9Huvmzcnzmhcpm+YsXeKjhf7jjOVUePegtCr
	hbnvvyYlpN/GDs+VpIYaSSfh+hlbgM1IW69ApQOscaGfruBO8EGhKAgjIc+BRNpkT4kr+kY7wrgEj
	T5dvAEGruxhqDBVlQ1m7bu5WLPETHgXLi4lplfFNEnDczmEbY5gFCHr7tB1frRf2TYDTNreGinGbC
	gYfsjpvi6A0kIJuLga6bad/k1qJzZnHrx8ETlk37HTKDN55Koe7D1GWHbdDpp5aAWW/4QQqgNgsQT
	CQMzCRmw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43128)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wWt2j-0000000063F-3tfB;
	Tue, 09 Jun 2026 10:46:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wWt2g-000000002ua-3S77;
	Tue, 09 Jun 2026 10:46:42 +0100
Date: Tue, 9 Jun 2026 10:46:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] fbdev/arm: Export acorndata_8x8 font symbol for
 bootloader
Message-ID: <aifhAn2RMdxQ2p86@shell.armlinux.org.uk>
References: <20260609091056.265794-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609091056.265794-1-deller@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_024655_306403_97F897EA 
X-CRM114-Status: GOOD (  15.67  )
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

On Tue, Jun 09, 2026 at 11:10:56AM +0200, Helge Deller wrote:
> The text display code used in the Risc PC kernel image decompression
> code uses arch/arm/boot/compressed/font.c, which includes
> lib/fonts/font_acorn_8x8.c, which further includes <linux/font.h>.
> 
> Since commit 97df8960240a ("lib/fonts: Provide helpers for calculating
> glyph pitch and size") <linux/font.h> contains inline functions that
> require __do_div64, which is not linked into the ARM kernel
> decompressor. This makes Risc PC zImages fail to build.
> 
> Resolve this issue by defining the BOOTLOADER symbol and use it to avoid
> a static declaration of the acorndata_8x8 symbol. That way it can be
> referenced by the arm bootloader, and other static math functions and
> symbols (like __do_div64) stay static and don't get unneccesary included
> in the ARM kernel bootloader decompressor object file.

The decompressor font support has actually been broken since:

commit 6735b4632def0640dbdf4eb9f99816aca18c4f16
Author: Peilin Ye <yepeilin.cs@gmail.com>
Date:   Thu Sep 24 09:42:22 2020 -0400

    Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts

which added extra data to the beginning of the array of font
information:

ENTRY(ll_write_char)
        stmfd   sp!, {r4 - r7, lr}
...
        /*
         * calculate offset into character table
         */
        mov     r1, r1, lsl #3

r1 is the character, this multiplies the character value by 8.

        adr     ip, LC0
        ldmia   ip, {r3, r4, r5, r6, lr}
        sub     ip, ip, r3
        add     r6, r6, ip

in conjunction with the data table:

LC0:    .word   LC0
        .word   bytes_per_char_h
        .word   video_size_row
        .word   acorndata_8x8
        .word   con_charconvtable

results in r6 pointing at acorndata_8x8. We then index this using the
modified character value above:

        orr     r1, r1, #7
        ldrb    r7, [r6, r1]

This breaks if extra data is added to the start, and thus has been
broken since the above commit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

