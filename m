Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5E5C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZM15aJl/IiF+ko6tAqrikn0vE3IWALTGs5YFH4xitE=; b=Zp79RwwY+rv1G1Rtzdy9sFLN+r
	OtsEL38GOIJQU7jVCKm20Y5bt+FxLwGfF6D/j84l52dfxhdbfQ4dgyythqj62Gz8qZnl/6Yeci2Gi
	qUc9uaT8h4it5Bn8E1/TFsGTKALyWOZ4Fv/oC/PQflH0yfUV2yLNx4OTkEea/4sYNEpxWSUK4Rh0U
	XFjIKVsXaLhxXl1SCypQK4y/XQTrCvNZPg8pngHVGrZrEc9YzKn94K6X3NfHF+f7DsUZci6QvyOBj
	tt2J6nZNfsvPFJSnRYHVXGIH7Qd2LJMFUPsREY/+dw+UBDyrfbdHS54UTBteNc7Vc7JBw8tWe+/nb
	eTnRYzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH8p-00000007kZP-1bgL;
	Tue, 18 Aug 2026 10:33:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH8o-00000007kYj-1iq7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 729B3601E0;
	Tue, 18 Aug 2026 10:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82101F000E9;
	Tue, 18 Aug 2026 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049237;
	bh=sZM15aJl/IiF+ko6tAqrikn0vE3IWALTGs5YFH4xitE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XRrBCzA1/25V6ScR6VDocxj61aZ0LB13yx9J5vVmkRZNCoyAknKZwvurJG05lqxYN
	 pryFy4Ljaf3tLH/Rh9F+Slko2hSg6UjUjxinWJhmnzG4tscOFmsYaqLtbLfgtgNPNO
	 2VBstL9ueAMHnHitbRxMkoA4GNBgQWVHfpfDRFhzKiDeMnfSypmhDwcItD8I4Wbb7J
	 W2RYH2JwzXjluGgsZvqaMfebcrC59l9swSpeTLb5Fsxhe3KWa4ojJDD5a6i8frITwG
	 44W80b7Q9OSLgLUvPbw8H+wI/80TfYP4+4ja8Etd0uvWO2Vct6AJ9GrfpGz1KK3wUn
	 8aEp2bY5z9PqQ==
Date: Tue, 18 Aug 2026 11:33:51 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 00/12] arm64: Remove unused big-endian support
Message-ID: <aoQ1D9xT8BZ28KLD@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
 <aoGHINU1DWOHXgYC@willie-the-truck>
 <b14ee6f2-1b90-4254-822c-ad352646005e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b14ee6f2-1b90-4254-822c-ad352646005e@app.fastmail.com>
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

On Sun, Aug 16, 2026 at 12:15:44PM +0200, Arnd Bergmann wrote:
> On Sun, Aug 16, 2026, at 11:47, Will Deacon wrote:
> > On Tue, Aug 11, 2026 at 05:11:47PM +0200, Arnd Bergmann wrote:
> >> On Tue, Aug 11, 2026, at 16:01, Will Deacon wrote:
> >>
> >> My suggestions there was to possibly remove arm32 big-endian mode at
> >> the same time as on arm64, but that does feel a little rushed if
> >> ixp4xx only has one release of supporting both, and removing be8
> >> but leaving be32 for a little while longer is probably not worth it.
> >
> > Yeah, maybe give it another LTS on the arm32 side? I think arm64 going
> > first is ok, though.
> 
> Right, one more LTS for 32-bit is probably good. We'll see how the
> OpenWRT/ixp4xx conversion goes for users.
> 
> My feeling so far is that running ixp4xx in LE mode is probably fine
> (there may still be driver bugs), but flashing a running system
> from one mode to the other is a bit risky and BE32 mode makes this
> more confusing the BE8.
> 
> >> > I've broken this down into fairly coarse chunks, as it seemed a lot
> >> > easier to manage than one giant patch (even with the Kconfig being
> >> > effectively disabled already) and not all of it is just mindless
> >> > deletion. Despite that, I'm anticipating the whole thing going via the
> >> > arm64 tree.
> >> 
> >> I would have done even larger patches, this does already feel fairly
> >> fine-grained to me ;-). I had a look at the individual patches to make
> >> sure this all makes sense, and I found nothing wrong here.
> >
> > If it was just a sed script or similar, I think I'd would've done a giant
> > patch, but some of it is surprisingly error-prone (e.g. when you have a
> > file with a load of '#ifdef CPU_BIG_ENDIAN' and then an '#ifndef
> > CPU_BIG_ENDIAN' hiding in the middle of it all).
> 
> Yes, definitely, I've found out the hard way during other feature
> removal before.
> 
> scripts/unifdef.c should be able to help with this, but I never
> remember that this is a thing.

I didn't even know about that! I'll see if it spots anything I missed...

Will

