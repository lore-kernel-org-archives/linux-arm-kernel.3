Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB20CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 08:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AazmqOCsIEL5KCNVAXGwQMB3xg1S6nNMzvoIjmuhVPM=; b=WBdVYzH7kAoAlYzpn33mPLaMAN
	tJRhTfKF+XINKRigPgiOAXZ7jM0JhRfTYkIKvjDXzB7bwuAGYjvM4NdrRHjHJL9tClcQDcLvBPhqo
	pNB0/Lc+g6o5eHlcsrjTBFcd5+WsWeneQumtQUmco9nBVeEgUYniPNu9wQ7t6akBEhMNN8cajV3Xk
	3hsiigHYDLJyUD1GzXO+Oszw0DAJ7YcucgIVwdIUdj8Mvq77Zt1BIS04XrNeBbaeYe0SBGHUm2qps
	ANh2DeRM9K/sWWCH1M0aANv93wZvGMWxBpqF+L4M2+8R5l38k0njiSdLCzgMvzRzeE+LVdAGMNg+4
	z1mk0Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKudI-0000000FgQC-3SIn;
	Mon, 17 Nov 2025 08:30:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKudF-0000000FgPk-0eAA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 08:30:43 +0000
Date: Mon, 17 Nov 2025 09:30:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763368235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AazmqOCsIEL5KCNVAXGwQMB3xg1S6nNMzvoIjmuhVPM=;
	b=dYK88HJ3to90X5P7NmvOyNGu3y8hHlsdM6VkkOd5BcERgG3MVl73G6oG/Cq/OXyrZXHIOT
	ltAKWxcna4Noastx64wOa2TciOTQ2DYWA0S+8jIciBsmwr8K8mKZtynvbV7ydRYYmFGQBR
	8wZATDUYIFKPl/KslbQoCU9UCVNlUyT09exyflkOez0nvEPezgIDFEWVm5f4z16Usm00kb
	EjefXVq1AO9lfhHT9PoFHiC2jSfuonxC2jQ2/Na+BvBQ71VwxLHIEf8eiJxp82nLaPUVRj
	/OGjIJiA6Gqiw6uL4p5dKAqgT8UElr38e3iFAjEEPUgiShRJUr9HOYIlJbsVAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763368235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AazmqOCsIEL5KCNVAXGwQMB3xg1S6nNMzvoIjmuhVPM=;
	b=oL9Zoo9XM/40CebKLq03imDb2w15RJ1tzlK1s5T170fm0CDPP6+3wMCnPetuWTBoPnTAZv
	MNyCDAgy9kh+qPDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Parth Pancholi <parth.pancholi@toradex.com>, Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251117091609-d41b5c1b-5781-41b8-aba7-d671a2f58be1@linutronix.de>
References: <20251114142741.1919072-1-sjg@chromium.org>
 <20251114142741.1919072-7-sjg@chromium.org>
 <20251114162255-10e006c6-dadc-44df-a8ed-ab4a00fc6402@linutronix.de>
 <aReIA8YuOM7JIXIe@derry.ads.avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aReIA8YuOM7JIXIe@derry.ads.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_003041_340733_E365774E 
X-CRM114-Status: GOOD (  19.09  )
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

On Fri, Nov 14, 2025 at 08:50:27PM +0100, Nicolas Schier wrote:
> On Fri, Nov 14, 2025 at 04:29:33PM +0100, Thomas Weißschuh wrote:
> > On Fri, Nov 14, 2025 at 07:27:32AM -0700, Simon Glass wrote:

(...)

> > >  quiet_cmd_fit = FIT     $@
> > > -      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > > -		--name '$(UIMAGE_NAME)' \
> > > +      cmd_fit = $(if $(FIT_MODULES), \
> > > +		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \
> > 
> > This will include stale module files. You can get an up-to-date list from
> > $(objtree)/modules.order with a bit post-processing.
> > Maybe kbuild can be extended to also create a list of the .ko files.
> > (I would be interested in that for my own usecases, too)
> 
> oh yes, thanks for the pointer.  This is indeed quite simple and much
> better than calling find.  For in-tree kmods:
> 
>     compiled-modules = $(patsubst %.o,%.ko,$(call read-file, $(objtree)/modules.order))

Tiny nitpick: IMO 'built' modules would be more accurate than 'compiled' modules.

> But as we need the list of modules in a file, we can also add a
> $(call write-file,FILE,TEXT) macro (cp. read-file in
> scripts/Kbuild.include).

> Thomas, is this sufficient for your use case?  Or do you also need a
> make target outputting the list of kmods?

For my usecase I need it in a file [0], passing them on the command line will
likely run into argument list length limitations.

A new file 'modules.built' generated from modules.order would be useful both
for this patch, mine and other tools like scripts/package/builddeb.
(Or 'modules.loadable', matching the scheme from 'modules.builtin')
On the other hand the modules.order seems to have quite some special logic in
the Makefile, so it may not be straigtforward to add such a file.

[0] https://lore.kernel.org/lkml/20250429-module-hashes-v3-9-00e9258def9e@weissschuh.net/#Z31scripts:module-hashes.sh


Thomas

