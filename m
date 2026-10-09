Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5B9CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeTS903UniSorg3O8uRqhtVLu+zdRHCgvqD8Aqg8dOc=; b=smbiJPpGFSJ26Vj/HKnnrqK6sy
	St1Jepndt25AbWJ6aOGxhr8GNEDujLoqeSC5juxxaaM112GpvSverD8NmPcWrPuUnmHTEJ7oJustN
	Xl9XlLIMm37CMIM5uvOJGM7U262Hy5RShep82hUjub9N2DEXmQUqpWLcYXrqMbHq72UlfwayKEp7q
	0cjy54BQYWA7g9gypJ7DE7XHhLreNWgby/9isncjMMNqtiCNDmRuzIlK+q1JwNQOf5y8YBzSl5hqt
	crubK6BOAMe3o0rn6XZ8TmKvF/lB5ty1dEyOgZH2R0zn6krfOLpTT+TR6DiJLUfRj+8QB5l54vaOT
	6hyJCCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAV8-00000006MtN-0tPh;
	Fri, 09 Oct 2026 13:19:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAV6-00000006Mt5-1VcY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:19:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE4A0432C8;
	Fri,  9 Oct 2026 13:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5371F000FF;
	Fri,  9 Oct 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791551943;
	bh=MeTS903UniSorg3O8uRqhtVLu+zdRHCgvqD8Aqg8dOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KG+fv9sO2cWKt4tryxYl9sx9h2ufhePBXN76r4zzjyrBgFguj7pOE04vRVGxCyv3v
	 JQ1KqKdSFTGzboGMuYlxUQv6VlXRe85zzx8xT1/rUlDLjDWMbkgXMKVA2or7ZhmdmM
	 X14KqQGpWaQYMngsSJr3moRRB+VeF+GU1Y8imhiRq95bKVHnqq7WIv9yQDeOk9IftP
	 kGfvxewAtGzUleRXZHE/nVc8Gd9N5rCPcL38QFTjeH7q8biFEAbk3EbjfWOpZZ9DZm
	 QpaS8zmz7zl6VuAJGNqjMHhNZgEd0LWeDSOcMg2gIV8C3BtYDy7nzJyGogT3dsOsEV
	 6mw4GowjjDgFg==
Date: Fri, 9 Oct 2026 08:19:02 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power
 domains
Message-ID: <20261009131902.GA1195061-robh@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
 <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
 <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com>
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

On Fri, Oct 09, 2026 at 07:05:46AM +0200, Linus Walleij wrote:
> On Thu, Oct 8, 2026 at 7:41 PM Rob Herring <robh@kernel.org> wrote:
> 
> > > +      power-domains = <&pm_domains DOMAIN_B2R2_MCDE>;
> >
> > This patch is in next, but the define is not breaking dt_binding_check.
> 
> I screwed up, I forgot the dependency on the new define :(
> 
> I asked Ulf to merge the prerequisite which would resolve it:
> https://lore.kernel.org/linux-pm/CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com/
> 
> Is it very urgent so I should just revert it? I could also just merge
> the single patch adding the defines into the drm-misc tree if
> Ulf is OK with that.

'make dt_binding_check' errors out. That kills my bot for anything based 
on next which is most patches.

You could also just remove the define from the example.

(Note that drm folks require a revert be posted and acked or they will 
revert your revert. I learned the hard way.)

Rob

