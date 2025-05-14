Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B1BC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT+FHDlU1iZJkcCa0Mzn6UbQckv6b/KOTgsr7yC0fFQ=; b=ZSgwV/X/Oo2K8PksIGpT9rfu0g
	txLMvgIZWq82FV7uEriWiJKpuzrw2L6+G+MiX2xgy8GVxrP8+5kFP/Uyme54C/Mp6zd1Qgk5tbol1
	JB8UL4DdnP20ONhNAJyO9h/CQeu3aNLPeAqLCoLINURoNgrwwlLa7adlITJx6piXp2uQ0bkl4TE9P
	R6InYZ8AdZgrARV8DLFP9wLOInjjxo0BpQnNzSsDpdtJV9fFlGUDSWQjrkLOu9NbHy0ersGO+FGOq
	Lgt4Q0CbCDcxaD6BBBXBlvwdsMbcmkNSLMatIX/i566WPYGEZa05N9nRpsLM9TsyqisdtFix1qzko
	2Ave1Fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI4u-0000000GCwF-1zTg;
	Wed, 14 May 2025 19:47:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHpA-0000000GBJ3-2huw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D422BA4DF7B;
	Wed, 14 May 2025 19:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6BBC4CEE3;
	Wed, 14 May 2025 19:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251087;
	bh=prqn5Sx99GKjaup3K45kEwrx2MjZ0zoK5fYZeZeYwLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCAqMPUKzRjQlVOpZ/5t8utZHHoRuBzqN48mWTHKv/Hql3kfalT1IP2AqIMb08wuw
	 aFeoNjI156ewl1VP+NztGIRAZbBI8tDQ5reQA3Up4TD5bjLCVVg3y3T0u7B7WHbwdR
	 M+ffnoViS1+8krR3rL54F5xiGyPdhOoDi7IYjzs0wGKhrymm1edipYq0OprVbK+Tfi
	 KpHGgd21AN8EKuDeo27vK9/7CZ+5TYXF+RUbMG8FI3SV+yGYTxGJgSzPq5IBa6HRGK
	 x71PcqLHusY4fBjcek1ZBdFVTyi+M6oxdtexi5RpEQ5Aex2Rg8F575I54UqEBdoYuH
	 BMHhMI2aa6ymg==
Date: Wed, 14 May 2025 14:31:25 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <20250514193125.GA2845766-robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
 <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
 <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
 <hitexxuelppvbdd3hyxf3qoncdizj6mvhiuhp63s7qpgkgqd6f@63xybk6n6dfn>
 <ca0680d6-f846-49af-8470-3fe10d4f8610@kernel.org>
 <prjmur3ih7kbf2hapdzp4vtbt5cd3coophsm24d2liykosvuda@nwxbvabp2m2m>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prjmur3ih7kbf2hapdzp4vtbt5cd3coophsm24d2liykosvuda@nwxbvabp2m2m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_123128_824122_AA0BB73B 
X-CRM114-Status: GOOD (  28.20  )
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

On Thu, May 08, 2025 at 11:09:12AM +0200, Thierry Reding wrote:
> On Thu, May 08, 2025 at 10:45:29AM +0200, Krzysztof Kozlowski wrote:
> > On 08/05/2025 10:02, Thierry Reding wrote:
> > >>
> > >>
> > >>> how much more you'd like me to make it based on that. Do you expect me
> > >>> to add the nvidia, prefix? In that case it would be inconsistent with
> > >>> all of the 8 other Tegra MC includes that we have in that directory.
> > >>
> > >>
> > >> Same story as for every other case, why this would be different? All of
> > >> them - amlogic, mediatek, samsung, qcom, every soc - move to new style
> > >> since some years, why this one should be different?
> > > 
> > > Because we've used exactly this naming convention for more than a
> > > decade. I get that it's nice to have consistency, but do you really want
> > > me to go and churn all of these files just so we can add a vendor-prefix
> > > and drop a redundant suffix?
> > No, I want new files. Look:
> > 1. Some time ago tegra-1.h was added.
> > 2. Someone spotted that there was tegra-1.h, so added now tegra-2.h.
> > 3. Now this is a pattern so of course next person, even if asked to use
> > vendor prefix, will not, right? Because it would break the pattern. So
> > we have tegra-3.h
> > 4. tegra.4 - no vendor prefix, because you have already three cases.
> > 5. You see where I am going?
> > 
> > All of above - amlogic, mediatek, samsung, qcom - had decade of such
> > convention. I asked to changed, they used the same argument as you
> > ("decade") and then changed.
> > 
> > Why this is different case than decade in amlogic, mediatek, samsung and
> > qcom?
> 
> It's a matter of principle. One convention is as good as another. There
> are no clear advantages of one over another. It's pointless and frankly
> there are more important things than changing filenames that everybody
> has been okay with for the last 10 years.

The issue is one convention is consistent for you and only you, the 
other is consistent for *everyone*. And then we'll have someone argue 
they are just following the same convention as Tegra...

If you had several drivers and add a new one, would you argue that the 
new one should follow the conventions of the old drivers rather than 
current conventions? No, you wouldn't.

Rob

