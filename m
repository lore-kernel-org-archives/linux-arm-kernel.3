Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E45BC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UjVzdA3ZiJV2WD71DqQ+LTR9g0cXUEs5gtk+/y0MpM=; b=ek4eoh8dgd3RVm+Z9OsYsGIjRO
	q0sla6qlOdnl6+egHWXGFu6wKhiOP8209C3hKIBWtcbpIKLQN1o5zk8Ea+4j2wBG8LlfHoNvAeDSE
	B2At/vODuqhbaAruFtBsr3TwwwHhfXZuK0itb1WT1uf3YtoSyUrKejn166bd2mjiSUj6ZCEkftwtm
	6HpIhZKT+SyGXjRGrXTZjBFuOzkrfA0MDire6LH49CJCK5FC+Pej9eu3enjrjope5fm/QRpEPrDua
	6KGYLc8egJj/sbKNRlGRXvpfctadoW6gAx6jBNNhEw1GkSm4NxMI99RK8HJRBO8XR25J0j3aJkaGH
	UMqrvn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvBl-0000000F2ya-1aXo;
	Tue, 11 Aug 2026 22:43:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvBj-0000000F2yI-15IN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 22:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4302600AE;
	Tue, 11 Aug 2026 22:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C67C1F000E9;
	Tue, 11 Aug 2026 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786488194;
	bh=8UjVzdA3ZiJV2WD71DqQ+LTR9g0cXUEs5gtk+/y0MpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHJlg6/ZExNylL+Soss19nqRu/AB3XBp1DEb/igjvoDkEyLz1Rh3ZyDFUQ/GovR3B
	 0KjDaRkvhVeW3X/rhxl4A9wYfrHbNSjaB7tyQUQVWQRLBNzvrqW4yVsSOOENsW+f4H
	 GX+lf83pstlgco6v0+9Thjgw2XkRr8VpMJC0OzGEQD7s+OT4Ok4riG5zYAbDU3xJoJ
	 oIz2rK0brROJjOWrwLC5lrVoIrvMHhq3jfqfj/K3r072OCoUmYoikcg2LXwjaju3DU
	 b3unrs1s9O9Vjz71P6fr1TESc0Toy4MHZpzRMBl33fre4TCwLk8AYykYATh/K1uNQP
	 qCqn0LBDEDE+A==
Date: Tue, 11 Aug 2026 15:41:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
Message-ID: <20260811224110.GC1905@sol>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com>
 <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark>
 <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 08:42:55AM -0500, Bartosz Golaszewski wrote:
> On Sat, 1 Aug 2026 19:12:42 +0200, Eric Biggers <ebiggers@kernel.org> said:
> 
> > Well, that again brings us back to the core issue which is the actual
> > current functionality of the driver, which is to register crypto_ahash,
> > crypto_skcipher, and crypto_aead algorithms with the crypto API.
> >
> > It isn't useful functionality, but rather just a footgun that allows
> > users to misconfigure their systems, an issue I've seen happen multiple
> > times.  CPU-based implementations of *every one* of those algorithms
> > already exist.  On a typical SoC that has this hardware, the CPU-based
> > implementations are ~50x faster as shown in tests.  Pending patches make
> > the difference even greater at ~100x.  And the CPU-based implementations
> > actually use significantly less CPU time, as well.  There seems to be no
> > path forward for significantly fixing this issue, either.
> >
> 
> You've repeated your point about performance several times. Nobody ever said
> you're wrong. Performance is not the only reason for choosing one provider over
> another.

That isn't a very practical viewpoint for the in-kernel crypto use
cases, where performance tends to be critical and users will do a lot to
get even a few percent improvement, let alone 10000%!  But as Demi and I
have explained, even if the performance aspect is ignored the driver
still isn't worth it, for multiple other reasons.

Also, you did give saving CPU cycles as a reason earlier
(https://lore.kernel.org/linux-crypto/CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com/).
That's one of the reasons I actually tested it and responded to that.
It sounds like you've now walked back your claim.  So great, we seem to
be on the same page regarding that point now.

> > An alternative we could consider is dropping the cra_priority further,
> > to further decrease the chance that these algorithms are used.  But I
> > feel it's hard to justify why they're there at all, if the rationale for
> > keeping them is "we made sure that no one can actually use them, so they
> > can't be causing problems anymore"...
> >
> 
> No, the rationale has never been this. FWIW it can be that it's used for
> testing of the crypto module on a supported platform and that is already
> enough of a reason to keep it upstream.
> 
> As I've said before: we don't just drop maintained drivers from linux.

We definitely do if the drivers are not useful or appropriate for
inclusion in the kernel, though the policy varies by subsystem.  Even
just last month an entire filesystem got dropped despite someone wanting
to maintain it.

- Eric

