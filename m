Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E4D6A223
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD/pNPbNG6Ga28qxloKb6nunuDvWsa+n0tWksHAsd30=; b=wui175RT4kaY1fRiWRB+LuDMrd
	5kQ7FRxNDiDjFKoaXGQtP/6HvOE0VmX0DHG6FOJYoF/HJXz4cjwbAAAGkdZeV3QzCProf7AobTc9o
	vISaHwYB8X+gGPNfGMdSn/PaiTKgRZ4Baa1riDZyQv/4deQQximTBHQWmJEjFJENrDk4Y73J5CdE7
	sda1QGU+ky/KdBuU7443ZdATDlw7GsHWHT/NcXKsMYwjWM4lR87BqRlapDi7AfYbpwPtAWQB/27M6
	gLP8CVKcS3ZdMVisIvoeFCrO6/VWA6dazWRF4R3qh44VJrTNa4LI5fdLLcratQ32hlZ/VKc/00JlR
	xzptrasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBduR-00000000N9t-2bZm;
	Thu, 14 Nov 2024 17:45:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBctW-00000000AdM-2iVL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 16:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aD/pNPbNG6Ga28qxloKb6nunuDvWsa+n0tWksHAsd30=; b=0eS4j9i9RtqrdP4VR8S7ahd47H
	5wdsBjdDMBE2AbWkB+COcUSQTbRu7TIbqyRElUkCUPDr4KvQfifiETtT1itvOqTwM/167D2DB8g2B
	JFq0f5HqlsETUdS1d6w9rZhyR8Yfc6Emu92AKMlfwIC3vyXcS9wC3y1zhrHvW8qISynRS/f91n3it
	xQNWz/qOMKM4PfY4+dadqbHaHjcbmTcisMljb31ASOjvfxZIC/1Jhi2okURFuOKdBXH/2qg7yHXui
	VSUCYOUpMQFlDocs1QJCC3rLlfDuT+4vTQL5xzVaLYIF4uJkFtohvoI5/FMeyz4AWDN+4s6+Y0/Vf
	mfyNUWyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33636)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBctQ-0008O2-1V;
	Thu, 14 Nov 2024 16:40:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBctP-0001Fl-1S;
	Thu, 14 Nov 2024 16:40:27 +0000
Date: Thu, 14 Nov 2024 16:40:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Lucas Stach <l.stach@pengutronix.de>, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: Don't mention the full path of the source directory
 in mach-types.h
Message-ID: <ZzYn-9hn5ztBQ4JZ@shell.armlinux.org.uk>
References: <20240213092835.754462-2-u.kleine-koenig@pengutronix.de>
 <a80f1cc8d5dda405f5af08eaa33d21598fa31d14.camel@pengutronix.de>
 <7occ3sqwoae2gjhvjun5c5auinas3lwhugfqjeta5pcr2gv2jc@dnzl56imqvbr>
 <20241114131530.texa6lkfmm3ukh5d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114131530.texa6lkfmm3ukh5d@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_084035_005160_808E94FC 
X-CRM114-Status: GOOD (  31.38  )
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

On Thu, Nov 14, 2024 at 02:15:30PM +0100, Marco Felsch wrote:
> Hi Uwe, Lucas,
> 
> On 24-07-25, Uwe Kleine-König wrote:
> > Hallo Lucas,
> > 
> > On Wed, Jul 24, 2024 at 03:45:17PM +0200, Lucas Stach wrote:
> > > Am Dienstag, dem 13.02.2024 um 10:28 +0100 schrieb Uwe Kleine-König:
> > > > To make package building reproducible independent of the location of the
> > > > source tree, the absolute path of this source tree must not be mentioned
> > > > in the built artifact. So strip $abs_srctree from FILENAME in the
> > > > output.
> > > > 
> > > > This fixes a warning issued by Yocto:
> > > > 	WARNING: linux-lxatac-6.7-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-lxatac/6.7-r0/arch/arm/include/generated/asm/mach-types.h in package linux-lxatac-src contains reference to TMPDIR
> > > > 
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >  arch/arm/tools/gen-mach-types | 13 ++++++++++++-
> > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
> > > > index cbe1c33bb871..9592ceb8a102 100644
> > > > --- a/arch/arm/tools/gen-mach-types
> > > > +++ b/arch/arm/tools/gen-mach-types
> > > > @@ -21,10 +21,21 @@ NF == 3 {
> > > >  	  num[nr] = ""; nr++
> > > >  	}
> > > >  
> > > > +# prepend a \ to all special chars in a regexp
> > > > +function quote(s) {
> > > > +	return gensub("[][\\^$.|()*+?{}]", "\\\\&", "g", s)
> > > 
> > > gensub is a gawk extension and thus will break on systems with a
> > > different awk implementation.
> > 
> > Oh, wasn't aware of that.
> > 
> > It seems for Debian the only packaged alternative awk implementation is
> > goawk. This one knows about gensub, too.
> > 
> > Other tools in the kernel seem to assume gawk is available, but
> > explicitly call it as gawk. gen-mach-types is called using $(AWK) which
> > defaults to "awk".
> > 
> > So I guess the easiest fix would be:
> > 
> > diff --git a/arch/arm/tools/Makefile b/arch/arm/tools/Makefile
> > index 28b6da8ac5f6..84107bb7ddf1 100644
> > --- a/arch/arm/tools/Makefile
> > +++ b/arch/arm/tools/Makefile
> > @@ -32,7 +32,7 @@ uapi:	$(uapi-hdrs-y)
> >  $(shell mkdir -p $(kapi) $(uapi))
> >  
> >  quiet_cmd_gen_mach = GEN     $@
> > -      cmd_gen_mach = $(AWK) -f $(real-prereqs) > $@
> > +      cmd_gen_mach = gawk -f $(real-prereqs) > $@
> >  
> >  $(kapi)/mach-types.h: $(src)/gen-mach-types $(src)/mach-types FORCE
> >  	$(call if_changed,gen_mach)
> > 
> > maybe together with removing the shebang line from the script which is
> > unused and (then) misleading.
> > 
> > If we want to stick to plain awk, I'd ask for someone with a different
> > implementation to work on a patch.
> 
> I wasn't aware of this patch, therefore I send a simpler one which drops
> the filename mention:
> 
> https://lore.kernel.org/all/20241114130021.2802803-1-m.felsch@pengutronix.de/T/#u

Or just leave it as is. It's in a comment, it doesn't get into the
executable, and thus is harmless.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

