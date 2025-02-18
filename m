Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7567CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3fMzBJebQNIRjSFhrkn3Nco0yM5oWO/CqrM0qFlFXY=; b=o+NDM4zvpZ6Xuoze054wwKRXQJ
	5OzU2PemA6rD2Ax8TFBkw7lYpVt4bj1TSDXMNputwuOcr+dKf3F/K2wtlvC9Oq1I67eJhet/749/3
	iOpEjCisORKuUI/2lm6sSkdI7dDqCvR3O1AoXWLJqqIozlWPXsoVTyYgzUtOzjTtIbeFyb4iYvCBF
	LOgPYUq7b0o4SMyy2WnztoxfXstbIjB6LxSXzTLFjc1w7/QL7McCyElrR7PyYiPWpFG1HESy1bBMb
	Ej1HJvzySBHumlEXtbuqu78zxXdi1FC9dSSvnuUJsilz0rfWQIIRzJqIxOipF/B5MtBoJl/HqL0EJ
	T7CQGz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPH5-00000008iIq-3GWu;
	Tue, 18 Feb 2025 15:12:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPFc-00000008hzo-0cW9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 15:11:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2ED13D5;
	Tue, 18 Feb 2025 07:11:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA19D3F6A8;
	Tue, 18 Feb 2025 07:11:04 -0800 (PST)
Date: Tue, 18 Feb 2025 15:11:01 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: arm: Add Morello compatibility
Message-ID: <Z7SjBWme-HhNYwtV@bogus>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
 <20250213180309.485528-2-vincenzo.frascino@arm.com>
 <CACRpkda-J_NHC7Te=Shk0A-35qWms3xeM2MggdGM0ze3Gt0KMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda-J_NHC7Te=Shk0A-35qWms3xeM2MggdGM0ze3Gt0KMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_071108_237203_0B0AC17D 
X-CRM114-Status: GOOD (  22.83  )
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

On Fri, Feb 14, 2025 at 11:38:54AM +0100, Linus Walleij wrote:
> Hi Vincenzo,
>
> thanks for your patch!
>
> On Thu, Feb 13, 2025 at 7:03 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
>
> > Add compatibility to Arm Morello System Development Platform.
> >
> > Note: Morello is at the same time the name of an Architecture [1], an SoC
> > [2] and a Board [2].
> > To distinguish in between Architecture/SoC and Board we refer to the first
> > as arm,morello and to the second as arm,morello-sdp.
> >
> > [1] https://developer.arm.com/Architectures/Morello
> > [2] https://www.morello-project.org/
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 4 ++++
>
> I was thinking, that since the .dtsi and .dts files are not reusing
> any of the Juno .dtsi (correct me if I'm wrong!) this should not
> be in vexpress-juno.yaml, instead perhaps you should create a new
> morello.yaml file?
>

It is me who suggested to put it along with other vexpress stuff as I
wasn't sure how much of vexpress bindings will be reused here when
Vincenzo started this. I agree it can be a separate binding on its own
as I don't see much commonality now with the vexpress bindings.

Just a note, though the file is named arm,vexpress-juno.yaml, it also
carries bindings for all Vexpress based Arm Ltd boards(both 32-bit and
64-bit ones), but they all use common vexpress bindings in general.

I just thought of highlighting that so that the expectation to reuse
this file is not to check commonality in juno dtsi files but to check
the vexpress binding reuse. Hope we are aligned with that.

--
Regards,
Sudeep

