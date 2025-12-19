Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80668D711D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoLYdeLmo7rfiHpzkNKsusNIjMZB/C+j1jN5jbOHhw4=; b=wamRTj5sME2zWeklU2czORHcPb
	fOxGBU6OX8/08Dlql5C19PCp+mIIpuCh79DCvE0bp8+WPH0NAklzUQUQGLsvhyJ+wkcJ6pONZXkvr
	G6dnIERCGL4qZzRkgJfDRj6GsKT+i45lFejB8sQmhKUPTzOLgM/BK2xR8FaUQ9d9Ae8PRcOFioH2H
	8M9yyYDuyVxnqE8zJly9Dfqt1EmMvDOkmkjXfrpGgbVHFa/+15dsiF6fhzbHPcOId0yaclumYDH0s
	lrhRbq7CptTMTCtbJlBl4QD+14qDviyMn5IXjR4JpZxuAAQ36cQdYRRpV5yD+/yfHWc8KbNolBWlB
	vculkVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQOu-00000009VLL-2fCI;
	Fri, 19 Dec 2025 02:39:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQOt-00000009VLE-1lNZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 02:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49C426001A;
	Fri, 19 Dec 2025 02:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A750C4CEFB;
	Fri, 19 Dec 2025 02:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766111966;
	bh=7IUOjAyePqdykfhXMd4t09CcOZEG1knBtCabVjaugCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg90TfVcIDApYeayYlZMvkaOmOzHV0fVZRyDovM7aS35LlqbmF5m6xTT92DDTOFLt
	 TZRTGu5zbtmX9ZxgK6MuutgX2Ktfj2Ux4txQEdReEdWMoqepjkQYu7y/d/yiP80yFd
	 NVSdfhhp86r74YeXIF3jN2wrXTRGU3OOYNyPKQudjX2eNU3hR/aVlwCrV9DUHljsKj
	 LpwlKL4py/vpy/cbsQUN2zTp1Q/JXpqUJJGN8RG/Sfv+AK2Q8OaXrlCX3BLk6SqeUg
	 YGPpFHvo3IC05Vg0a2B7ehvVN3CZkWt3RTvIdR4nx5D5j474jNFTvRWlLvC31VbLn9
	 +lKv7CK0nb7aw==
Date: Thu, 18 Dec 2025 20:39:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Doug Anderson <dianders@google.com>
Cc: devicetree-spec@vger.kernel.org, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, William McVicker <willmcvicker@google.com>, 
	Julius Werner <jwerner@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Simon Glass <sjg@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Subject: Re: Proposal: document where SoC info belongs
Message-ID: <qjpukes4etbgh4ncapec4v6okkiohlcqqdfvjfinyrj6olaryc@l3vspbwze7ri>
References: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>
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

On Thu, Dec 18, 2025 at 02:56:03PM -0800, Doug Anderson wrote:
> Hi,
> 
> To try to move things along, I'm picking a small piece out of my
> previous discussion [1] to see if we can make some progress.
> 
> Right now, the top-level "compatible" string in a dts file usually
> contains one or more strings to represent the SoC. Examples chosen
> semi-randomly:
> 
> exynos5250-snow.dts:
> - compatible: "google,snow-rev4", "google,snow", "samsung,exynos5250",
> "samsung,exynos5"
> - SoC: "samsung,exynos5250", "samsung,exynos5"
> 
> sun20i-d1-clockworkpi-v3.14.dts:
> - compatible: "clockwork,r-01-clockworkpi-v3.14", "allwinner,sun20i-d1"
> - SoC: "allwinner,sun20i-d1"
> 
> sdm845-db845c.dts:
> - compatible: "thundercomm,db845c", "qcom,sdm845"
> - SoC: "qcom,sdm845"
> 
> I propose that we DEPRECATE including SoC information in the top-level
> compatible string and move it elsewhere. I propose these top-level
> properties that should be used instead:
> 
> soc-family-compatible = "vendor,family";
> soc-product-id = <0x1234>;
> soc-product-variant = <0x1234>;
> soc-product-description = "Something";
> soc-major-rev = <0x1234>;
> soc-minor-rev = <0x1234>;
> soc-sub-rev = <0x1234>;

So these 6 properties defines the soc itself? And the rules for how a
bootloader matches against these 6 properties is defined elsewhere?

What about "PCB" name and version?

How about the case where my product has 5 different components that
might come from a second source?

Are you proposing that we allow adding arbitrary properties matching
some pattern in the top-level node to facilitate matching? Presumably
defined in some combination of vendor bindings?

> 
> The family-compatible would be VERY high-level and is not intended to
> be a marketing name. It would be something like "samsung,exynos",
> "nvidia,tegra" or "google,google-silicon". The ONLY goal for this
> string is that within a family, the other properties uniquely identify
> a given SoC. This is a SINGLE string, NOT a list of strings. There is
> no concept of being part of multiple families.
> 
> All the other numbers are hopefully self-explanatory. These values
> could be absent (assumed 0) if they don't make sense for a given SoC.
> 
> The soc-product-description is designed to be some nice name that
> represents the family, product-id, and product-variant but _not_ the
> rev (since that's easy for anyone who cares to represent it as "rev
> X.Y.Z")
> 
> 
> The goals here are:
> * Stop trying to jam so much into the top-level "compatible".
> * Make it one step easier for bootloaders (or code packaging device
> trees for bootloaders) to differentiate device trees / overlays. This
> isn't _enough_ since this proposal doesn't include board info, but
> it's a place to start.
> * Make it easier to deal with "socketed" boards where the SoC can be replaced.
> 
> NOTE: if a set of devicetrees is provided to a bootloader, it could
> not just look at these properties to help it pick a devicetree but it
> could also change the properties to be more detailed (it could fill in
> some of the minor/sub-revs, for instance).
> 
> 
> I think this is a positive change for everyone and a cleaner way to
> represent things even if you aren't dealing with the above problems.
> 
> What I'm looking for from people is some responses. Folks could choose:
> 
> A) Yes, this is great. We already have something like this and we'd
> switch to your properties if it became a standard.
> 

We have qcom,msm-id; qcom,board-id; qcom,pmic-id; these have met the
needs of some, but generally it lacks multiple axis.

> B) I like the idea, but I need an extra property to represent my SoC
> and then I'd use it.
> 

s/an/several/

> C) I like the idea and I'd use it, but with some changes.
> 
> D) We don't have anything like this today, but it sounds useful.
> 
> E) Why are you wasting my time? This isn't a useful problem. The SoC
> belongs in the top-level compatible string, period.
> 

We do have functionality that relates to the generic soc name,
(qcom,sdm845 in your example above). Extracting it into something else
would imply that we need to check against soc-family-compatible?

But when it comes to bootloaders picking the appropriate compatible,
I've seen plenty of cases where basing it on compatible would be nasty.

E.g. how do you write your string matching routine such that it allows
all the different axis, where some are optional, some allows fallback to
previous minor revisions of the chip etc.

Regards,
Bjorn

> F) Other (please specify)
> 
> 
> FWIW, from chatting with Rob Herring offline, my understanding is:
> * He doesn't think that using the "soc@0" is the right place for these
> properties.
> * He didn't seem enthusiastic about adding a new node and was more
> amenable to adding properties, which is why I added a pile of
> top-level properties.
> 
> 
> [1] https://lore.kernel.org/r/CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com

