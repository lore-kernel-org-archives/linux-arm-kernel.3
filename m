Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF34BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YDm2MEhblHeSTo+p97BhcoDmU/H9pfWhKKQjOGcjQA=; b=dqKmlEkaQ+mNkodyleeHQOBshJ
	P+/JoPiA1eipCwE95d56SljMF6fCVUCCwVW0LHdOrWfXHdKtQSnemyhwNcGSBTdVZB5xhvVHfOezY
	hM2NFfQFC5zDuhkhZoFrQ87ABXGVaV7+vBMoNBE01gmBXyxoADD/xkcWMV2OmoDDYxHa9I/yjd41K
	3nUeRJgoo9fBnsVVvH/ZCs/A35ypPgeGYxiSLplo1Msghwzq1T/u1AGo/Xd1nVVrvbysWtmxgKgvF
	LG6I4jYLeEvUvMIcUwMi6kAcCGjvRCWSWqJmS9Bwg59tMOGr5cbZvSX+MduiznJBEUy6bkSZ69kSC
	FQF9Hp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvAK-00000005zcP-0JHI;
	Mon, 17 Aug 2026 11:06:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvAJ-00000005zcI-0rEY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:06:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 374B2600AE;
	Mon, 17 Aug 2026 11:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463AE1F000E9;
	Mon, 17 Aug 2026 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964761;
	bh=5YDm2MEhblHeSTo+p97BhcoDmU/H9pfWhKKQjOGcjQA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=I0znWLArMuZUP6BdPh9ceJPBudigVPdyHP9unmmQ3yUEI36ROGSuALVz0IBdZejns
	 NU/GYsmCm7CNeh8EgFq6ieWECKiQqPSNKxy7jS0JtkVstEWKCRRGLU5Qfsrrn3t7Oc
	 B14yuqTS9VjaQE47UQDFUm6DRaaAfDy7K2v+oGiYxBYpTaK69YXSj4betyY5QU6WJf
	 gG6rAcr508RL7I+VAKfygZ/g9xK5ZE/hDOgpbRV0CfFLl83jLvhZuB4pQ3C3WQBtoR
	 e5a87+tWUux9PLKRkx0qqYZjhxMvs8Hm4gwHLREx4ikGvF4apHzHJjewqPJqxEvkoF
	 bCi0G0uLPDsUQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id EAE1D1980062;
	Mon, 17 Aug 2026 07:05:59 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 17 Aug 2026 07:05:59 -0400
X-ME-Sender: <xms:FeuCalPl3nblAg5cLX2Sdy9YMy-qJ_OEri82lyj4BmpAN8qR-E_0QQ>
    <xme:FeuCaiwKAx3Nghd8c6xu9MMl23Zmx5VnpWk4vO16BRzxSqVRAP6g9cO6WvTnKen5b
    jWbJG5LclKcruDGJA26P6CxbiM5h77xc4HgvwbHQjl3W09NRPdamkX->
X-ME-Proxy-Cause: dmFkZTGQTHdWnJJCE22d/zqJDKF+JU5EHgBWnubh5cfMqZ6YpZC4QRyAcPIogwmsD7ZFvV
    rpjOfIO7lr1q9eqfc3+CiXePGWFmdsM14RQa6WX2LKGHS1r/tHa+O1ao3urpQREtRewSHc
    95m/2eg3vmA0WPhirsiFjG9t1Tj3PRGHDWnebRQFHUi5zIzq4Mfnkao6G6YiF3iP7bZRS8
    IHR8yLciD4LE4B6OfJXkjWTT/ZczxC8BLxtrr+PGPg4KmcNAxm19G5CJzDoapvlrSbEybn
    saX8AxbVSnMbpLAjW28JIQNo+itVuegoqNASFwyfn3u5IeUtYs4ZxaV15k5DHxvqzhiHew
    cz5fUSxiHAKmlFd/EfY3HXC3PkP0TpK1r5YG+JJqNkzVG0pVmRgz3y+F5Tp7sIVMjXLc0Y
    n27yPSeTCjuMXiCb/2OOAF49v8nDGcfXApjhVVEC/s/of89/B3uOyeRYcDPvbVaENbrk39
    fwxgd4y5lndWRdIQ0jgR5PkbVnS0rtUAYJ8qwrGdZNYqEMsACbIvPhbVtbbOIh1OCMxcM5
    OJmXnxyHbCdmfXCtNaBFWhVns2A2XYtv+o0ppWnUGTOol9ryIPzlk7cwHlxOanFvVlpI8/
    qbcEcUqtr5+QPmT1lTIFC8PDIBfpi59InZ0g0Ru+ckDtGOTgosh8s6avroNw
X-ME-Proxy: <xmx:F-uCamR3yQ3UVMcC3FBLKa86uKdnNdCGhaZugOJXDlCkift2hjSaqg>
    <xmx:F-uCalL5oXnNVuUoeykyhNvQgRpFUnAtMM2wTykZ3aR_5rar7o_pHQ>
    <xmx:F-uCasURjhNqoi7z8gj46235HXGKnvmh5rgqe7W8yRRxnyouJuXYKA>
    <xmx:F-uCahgNSWu-nM8MqIbUnmZmvTFeAo2bKqp9gpzLlVMrZ4c5UziwUQ>
    <xmx:F-uCagspqxAsWBDGMykXhxBbnCdtTVM5pchvScjv7hvAyLUvfcz6wkRv>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2C96CF80070; Mon, 17 Aug 2026 07:05:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 14:05:36 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 live-patching@vger.kernel.org, "Song Liu" <song@kernel.org>,
 "Miroslav Benes" <mbenes@suse.cz>, "Petr Mladek" <pmladek@suse.com>,
 "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Kees Cook" <kees@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, linux-toolchains@vger.kernel.org
Message-Id: <73bdec09-a2dd-4693-aa30-12fab36e7a18@app.fastmail.com>
In-Reply-To: <a9662e64de17882d2ef2401bad0d8172ef48bc4b.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <a9662e64de17882d2ef2401bad0d8172ef48bc4b.1786768375.git.jpoimboe@kernel.org>
Subject: Re: [PATCH 03/12] arm64/bti: Fix BTI linker failures with long branches into
 .idmap.text
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Josh,

On Sat, 15 Aug 2026, at 07:45, Josh Poimboeuf wrote:
> On a kernel whose text exceeds the +/128MB direct branch range, the
> linker inserts veneers.  With BTI enabled, the veneers' indirect branch
> targets need a BTI landing pad, which not all functions have starting
> with Clang 21 (and for all versions of GCC).
>
> In such cases the linker can emit a second veneer close to the target
> which has the landing pad along with a direct branch to the target.  But
> a long branch to .idmap.text never gets one because it's missing the
> executable section flag.
>
> With the LLVM linker, it's a silent failure, presumably only discovered
> by a BTI exception at runtime.  With the GNU linker it's even worse, as
> it dereferences the missing stub/veneer group entry and seg faults (this
> was how I discovered it).
>
> Make sure the section is executable by adding the "x" flag to all the
> creators of the input section.
>
> Also manually add "bti c" to primary_entry() and enter_vhe(), otherwise
> the linker-generated veneer page pushes the .idmap.text past its
> asserted 4KB size:
>
>   ld.bfd: ID map text too big or misaligned
>
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=34525
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/arm64/kernel/cpu-reset.S | 2 +-
>  arch/arm64/kernel/head.S      | 7 ++++---
>  arch/arm64/kernel/hyp-stub.S  | 1 +
>  arch/arm64/kernel/sleep.S     | 2 +-
>  arch/arm64/mm/proc.S          | 8 ++++----
>  5 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
> index c87445dde6745..9943a7c70f6b0 100644
> --- a/arch/arm64/kernel/cpu-reset.S
> +++ b/arch/arm64/kernel/cpu-reset.S
> @@ -14,7 +14,7 @@
>  #include <asm/virt.h>
> 
>  .text
> -.pushsection    .idmap.text, "a"
> +.pushsection    .idmap.text, "ax"
> 

We've had issues in the past with this change.

The problem is that the ID map is restricted to a single page, and
[some versions of] the GNU linker concatenate generated veneers onto
whichever executable input section came last in the input, which was
this one at that point.

That resulted in the ID map start/end boundaries being placed further
apart than the linker asserts would tolerate, even though the generated
code in question would never be called via the 1:1 mapping.

Not sure whether that problem has simply disappeared by now, or older
versions of the linker may still trigger it. But it is something to be
aware of.

