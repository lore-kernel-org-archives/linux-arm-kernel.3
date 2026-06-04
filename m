Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94317CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2as4PCRWsv024ZlqsXEqA3VU/UiipqE5hLi9l4v3VV0=; b=0q1jus4o8cNnBBdzx+1owivAoE
	2HQaZvwyn4/ri73yyX0lDc43evRgBX+5W3KZhyp0JbUt41f/UOyn84b5zg1dbu6q3y34mssxzRU78
	1x+RB0AAosEvTxAtKaC1zMQhoULGMaM3fDD1Z9xBV5yPjq8AyrflDvaXC6sYpil+D2o+0etoQac0A
	lZMyq8960TEH0286/07BVeidFUfdKNHE0ZrrmAiA3pdfkSkLNK5UfouRW7am9P6RwWnjKSDPt1vpR
	AqNnEInKCCc1MqdxfsKZPa2YIL4f+qiVSR8AxsCb2pdX329TvReC85hUmFwNUrvCURShe77Hzuwl6
	FwVfJP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3vB-0000000GS4E-3xdF;
	Thu, 04 Jun 2026 08:59:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3v9-0000000GS2e-1Kl3;
	Thu, 04 Jun 2026 08:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2as4PCRWsv024ZlqsXEqA3VU/UiipqE5hLi9l4v3VV0=; b=tpOKHMCzOlrTYuEe6r9BtA84Uf
	HE3p6z9xrQ9DgQUtIys9Xr0eyg6UBq1xAwd82I8kflHagSdSQH58knxLzSnde24ThZve7tCiUqPoy
	85Ybm5DcoDOs6fHpFfp8pyZ3mM7OIAM5CvZ0S1ekEFbQ6bU8jRXLHWec+0tlKH0k0x1XRsjgmQg5b
	NCgSpv/4KZnY08KejmmGp49UI7vnNNMxJiR59N7hN3iDrGFtYgaxYrb6DsoA1KLhePOkdoNQwizWO
	uox35V31a8Ql05pPuUlBSAtp0NV0GcS94CiW2acWw0s5KbzWy3njN6OdDsOoXGmn7D1UB0cVpiu9U
	mtHS++tw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rosenp@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: rockchip: don't COMPILE_TEST builds on M68K
Date: Thu, 04 Jun 2026 10:59:19 +0200
Message-ID: <36034140.aRNtrjHk3s@phil>
In-Reply-To: <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
References: <20260603213726.1025094-1-heiko@sntech.de>
 <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_015923_354951_24E28B3C 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Geert,

Am Donnerstag, 4. Juni 2026, 09:56:04 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Geert Uytterhoeven:
> On Wed, 3 Jun 2026 at 23:37, Heiko Stuebner <heiko@sntech.de> wrote:
> > Rockchip clock drivers use hash-tables with enums as inputs.
> >
> > M68K does interesting things in its __hash_32() implementation, casting
> > that u32 input to an u16 and therefore triggering warnings like:
> >
> >    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through i=
nclude/linux/hash.h, include/linux/slab.h):
> >      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates=
 bits from constant value (18720 becomes 8720)
> >      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates=
 bits from constant value (1e8e8 becomes e8e8)
> >
> > As M68K should never ever need Rockchip clock drivers, simply disable
> > compile-tests for M68K.
> >
> > Fixes: 7edfb7fb58ee ("clk: rockchip: allow COMPILE_TEST builds")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp=
@intel.com/
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/clk/rockchip/Kconfig
> > +++ b/drivers/clk/rockchip/Kconfig
> > @@ -4,6 +4,7 @@
> >  config COMMON_CLK_ROCKCHIP
> >         bool "Rockchip clock controller common support"
> >         depends on ARCH_ROCKCHIP || COMPILE_TEST
> > +       depends on !M68K
> >         default ARCH_ROCKCHIP
> >         help
> >           Say y here to enable common clock controller for Rockchip pla=
tforms.
>=20
> Obviously this is the wrong fix ;-)
>=20
> I have sent a better one, fixing the issue for every user:
> "[PATCH] m68k: hash: Use lower_16_bits() helper"
> https://lore.kernel.org/b55e9bd0532c0cad519809c86e0a8400060d75a1.17805595=
61.git.geert@linux-m68k.org

oh nice - fixing the actual problem instead of working around the
issue. I had no clue about m68k and thus no idea of how to test
anything, so went for the easx "fix" :-)


So thanks for looking into that
Heiko



