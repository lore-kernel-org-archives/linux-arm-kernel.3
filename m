Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4369C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJzSvffykzz4KpBF67EvSr407WyQ7fUBSQHgOIRPsn4=; b=U4AamM1AAWPwNBFKbR4PIY+D5h
	GaDnONQQTRD/Lx82VHRJ9VjgDe/HfDuheBWp6qAJBuAbCpQVrQwc2K3RHZOBGbHTe11pf4cWMOgK4
	7zyZ0miEXKxNfATU+t18lfNn/liWGwaYhwEGxyTznM88Nbu3gkzEeuAMhPScnHsxPdIIZF++EhupW
	4HrUB9MbaQJtzdlOj5KFmU1i/wMxDMycy45OVzGcIv+2X3m4PUhtl0CWpX4WLEIbzjzfo6QfrEqtw
	KmtHiI6toGGcAmmmLnDGVLimpvmA9+clsRRZIIXPitUnq9p8HLcnnnIGYo7aXTTP8mkt6rk3csDLn
	TLHX/58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2uVT-00000004IkM-1aCx;
	Sat, 05 Sep 2026 17:48:47 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2uVQ-00000004Ik1-316N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 17:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=yJzSvffykzz4KpBF67EvSr407WyQ7fUBSQHgOIRPsn4=; t=1788630524; x=1789840124; 
	b=sbcSmV/YSvOEK3+eP75AHQ04Hdigwh++/DE6WlT6c4KvZAZir7FupSn61ko6p+P8bPnEUEjCRsm
	n03wMD00k1Ia2QbUCKf/OvYzLmtQ+DazXB2jp1X4Bt/fqJJN/k/72srwOb7UL0uIbpyFMA6MeOqaM
	/0BvGk+R5hKyJ0g8UVD44TDq/5RKCaHiOJpPrlrv+h1Owg0sObxD8+hgbRvFEW7iYQsMES6wXvcqb
	MpcC3Ex28DWlbBmanvHhmHxVRxdbmstH4qFSilLfbs12YmTal9yGYkgChcVUloN28c2JwKAzHkjik
	qCbH/UBUnKT0n2xzBYeMr/LZbx1nDyy7qAqA==;
Date: Sat, 5 Sep 2026 19:47:20 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, Tony Luck
 <tony.luck@intel.com>, linux-edac@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <20260905194720.7033b956@kemnade.info>
In-Reply-To: <apxDtqM8UMN5KNjs@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
	<20260905094649.41996-4-kmehltretter@gmail.com>
	<20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
	<apwzmSr6b0WEkW86@gmail.com>
	<20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
	<871pb7zn36.fsf@trenco.lwn.net>
	<20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
	<apxDtqM8UMN5KNjs@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_104844_765949_3647F42E 
X-CRM114-Status: GOOD (  25.01  )
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

On Sat, 5 Sep 2026 18:45:07 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> On Sat, Sep 05, 2026 at 09:27:42AM +0100, Borislav Petkov wrote:
> > On Sat, Sep 05, 2026 at 10:20:45AM -0600, Jonathan Corbet wrote:  
> > > I would like to emphasize this - slow down a bit and maybe you won't
> > > overwhelm the system entirely.  
> 
> Got it.
> 
> > 
> > I find myself telling more and more new submitters to slow down. Sounds like
> > they don't read our documentation before submitting patches. Especially if the
> > file is even called submitting-patches:
> > 
> > From: Documentation/process/submitting-patches.rst
> > 
> > Don't get discouraged - or impatient
> > ------------------------------------
> > 
> > After you have submitted your change, be patient and wait.  Reviewers are
> > busy people and may not get to your patch right away.
> > 
> > Once upon a time, patches used to disappear into the void without comment,
> > but the development process works more smoothly than that now.  You should
> > receive comments within a week or so; if that does not happen, make sure
> > that you have sent your patches to the right place.  Wait for a minimum of
> > 						     ^^^^^^^^^^^^^^^^^^^^^
> > 
> > one week before resubmitting or pinging reviewers - possibly longer during
> > ^^^^^^^^  
> 
> That's for "not getting any answers" which is not the case here.
> 
> Sending a vX update sometimes feels more urgent because you don't want other 
> people to read your buggy old version. But yes, some patience is also good
> there. 
> 
Well, here it is a bit border line. You do not have answers on all patches,
so technically it is some resubmitting.

But if the main maintainers (which is a bit harder to say in this series) found
time to review, than IMHO (also seen from my maintainer perspective), improve
as soon as you find time and submit the improved version.

Regards,
Andreas

