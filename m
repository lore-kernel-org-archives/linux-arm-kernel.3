Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962BFD68B09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UL42DfD3zdkirn/MlnMaCuJCLq4Q3YvSc/R+n8i9e4E=; b=f1XBHclhIYfgA19Mu45lmay2Vf
	t0mW8xOANUSUAz5n/OO00aNUlBm7c0dfq/eJiX3lWHRGhKyNdVGJHgZJMCHocekkLnDvJ5KH4Puv4
	6BYXaa156xWygd1jEwMqY3YSg1n9eDlX1Xnql80zoko+jcyb147s7WjrU/0V/csZwOlF2/+cEe7AT
	cT7Qi5NRpsCWc0fHfSKKbqxU1gpY9/rlwWSZKT2C6a1Tag8MzpHZm5xk67hhyJxZNvvuBN4mutD1E
	9KWx2pF5Sl7CujXorC3hIVTXNQx9fxMnhMnjp1aVTDBcAhWfR94rhmJfvfU0Ba+cmy7E4ZyeEvhJH
	ipakXJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZj0-0000000A26V-1ZAd;
	Thu, 14 Nov 2024 13:17:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZh9-0000000A1uw-0V1d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:15:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tBZh4-0001vg-QQ; Thu, 14 Nov 2024 14:15:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tBZh4-000kPq-1f;
	Thu, 14 Nov 2024 14:15:30 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tBZh4-00BZfu-1O;
	Thu, 14 Nov 2024 14:15:30 +0100
Date: Thu, 14 Nov 2024 14:15:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: Don't mention the full path of the source directory
 in mach-types.h
Message-ID: <20241114131530.texa6lkfmm3ukh5d@pengutronix.de>
References: <20240213092835.754462-2-u.kleine-koenig@pengutronix.de>
 <a80f1cc8d5dda405f5af08eaa33d21598fa31d14.camel@pengutronix.de>
 <7occ3sqwoae2gjhvjun5c5auinas3lwhugfqjeta5pcr2gv2jc@dnzl56imqvbr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7occ3sqwoae2gjhvjun5c5auinas3lwhugfqjeta5pcr2gv2jc@dnzl56imqvbr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_051535_186190_47B7775F 
X-CRM114-Status: GOOD (  28.03  )
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

Hi Uwe, Lucas,

On 24-07-25, Uwe Kleine-König wrote:
> Hallo Lucas,
> 
> On Wed, Jul 24, 2024 at 03:45:17PM +0200, Lucas Stach wrote:
> > Am Dienstag, dem 13.02.2024 um 10:28 +0100 schrieb Uwe Kleine-König:
> > > To make package building reproducible independent of the location of the
> > > source tree, the absolute path of this source tree must not be mentioned
> > > in the built artifact. So strip $abs_srctree from FILENAME in the
> > > output.
> > > 
> > > This fixes a warning issued by Yocto:
> > > 	WARNING: linux-lxatac-6.7-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-lxatac/6.7-r0/arch/arm/include/generated/asm/mach-types.h in package linux-lxatac-src contains reference to TMPDIR
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  arch/arm/tools/gen-mach-types | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
> > > index cbe1c33bb871..9592ceb8a102 100644
> > > --- a/arch/arm/tools/gen-mach-types
> > > +++ b/arch/arm/tools/gen-mach-types
> > > @@ -21,10 +21,21 @@ NF == 3 {
> > >  	  num[nr] = ""; nr++
> > >  	}
> > >  
> > > +# prepend a \ to all special chars in a regexp
> > > +function quote(s) {
> > > +	return gensub("[][\\^$.|()*+?{}]", "\\\\&", "g", s)
> > 
> > gensub is a gawk extension and thus will break on systems with a
> > different awk implementation.
> 
> Oh, wasn't aware of that.
> 
> It seems for Debian the only packaged alternative awk implementation is
> goawk. This one knows about gensub, too.
> 
> Other tools in the kernel seem to assume gawk is available, but
> explicitly call it as gawk. gen-mach-types is called using $(AWK) which
> defaults to "awk".
> 
> So I guess the easiest fix would be:
> 
> diff --git a/arch/arm/tools/Makefile b/arch/arm/tools/Makefile
> index 28b6da8ac5f6..84107bb7ddf1 100644
> --- a/arch/arm/tools/Makefile
> +++ b/arch/arm/tools/Makefile
> @@ -32,7 +32,7 @@ uapi:	$(uapi-hdrs-y)
>  $(shell mkdir -p $(kapi) $(uapi))
>  
>  quiet_cmd_gen_mach = GEN     $@
> -      cmd_gen_mach = $(AWK) -f $(real-prereqs) > $@
> +      cmd_gen_mach = gawk -f $(real-prereqs) > $@
>  
>  $(kapi)/mach-types.h: $(src)/gen-mach-types $(src)/mach-types FORCE
>  	$(call if_changed,gen_mach)
> 
> maybe together with removing the shebang line from the script which is
> unused and (then) misleading.
> 
> If we want to stick to plain awk, I'd ask for someone with a different
> implementation to work on a patch.

I wasn't aware of this patch, therefore I send a simpler one which drops
the filename mention:

https://lore.kernel.org/all/20241114130021.2802803-1-m.felsch@pengutronix.de/T/#u

Regards,
  Marco

