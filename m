Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24706D49232
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOZVGOIgHQO1fbsk1a6ryzZvj2S5GXoMQI3inerOk7k=; b=BN7kkRV450phY9oaPsfmT5wZd1
	F0LLnfOZ3JfogubXANzD8ObqTy96ouB+yF3TQq+Lf2Qzgezs8PsH1u6Pfi9M4IpxLtDdNZr0OGmMi
	SXYoxsMD+iKdgcbrBTT1QNbRnOWjPV2TfbInPGZeOqNkQcc3SxEcIuUyb91T/Kcpx7KiolBQ9bkr9
	OZOSzavUcI8tDJnOfdNFVpPk1J6QXEBfHntW/nVueFWY+ijBMe9dXeE85lGoz32C3knLm/n5LbraT
	InGsNyzh/OQIE6ieHBDyu7VNcGpnwHdPRpnR3oFM9T5JBvvBct+9djjKCx6wiHOI90T9bR/8uqpPl
	mZgrKsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4j6-00000000eTq-30w7;
	Fri, 12 Dec 2025 15:06:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4j5-00000000eTk-2Gwb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:06:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9363C60008;
	Fri, 12 Dec 2025 15:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12611C4CEF1;
	Fri, 12 Dec 2025 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765551994;
	bh=i6MeqSZJJ3hHFz2r4+e4b3P7T9WrW1v1WkoNCvc0ZZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNpBb7ZGqIVlmaf47k6ev2T4JjXdjAO+tcbKShFJsIO55k3KtGbE03/P7Svf3km2w
	 N7HxOvFwRaYla6WM589pL2VAM0U9dkquInkkqDc4rd5cwldPZhGPVk6YjPrL5BfTkw
	 OMrXAPXy/3HJ9MxzbyS7SeN2BzR/tFLC1uSU6dV72zAX6zZq+182FPtOI7Ulu6JyaQ
	 v6Hl59jMGME7mGMvO7nAvG2EoQDbMGCC+PLsGJXMz0B6b2YoQJQQDJMgWrF++vtmBy
	 mh3LZTJwv+O+R+frS4ZeyU+/czISRuySQ/llWCRnjLNvM+tqiSK517M7+UjOikTVk1
	 r8da6U0nOJsZg==
Date: Fri, 12 Dec 2025 09:06:31 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600 EVB
 devicetrees
Message-ID: <20251212150631.GA3997751-robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
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

On Thu, Dec 11, 2025 at 05:45:42PM +0900, Andrew Jeffery wrote:
> Hi all,
> 
> This series removes the remaining warnings produced by `make
> CHECK_DTBS=y ...` for the AST2500 and AST2600 EVBs and their related
> DTSIs. The tidy-up has the usual benefit of making it clear to
> contributors that any warnings are likely their own to fix before their
> patches will be considered for merging.
> 
> I've framed it as an RFC with all patches contained in the one series
> so the goal is clear, we can see what's needed to reach it, and we can
> decide whether and how it should be split or merged going forward.
> 
> As it stands there's little in the way of code change, except to
> pinctrl (though also not much there). As such I've included the
> binding maintainers and subsystem lists as recipients but not yet Cc'ed
> subsystem maintainers directly because there are quite a few and I hope
> to avoid mostly uninteresting patches being a source of irritation.
> 
> The patches fall into several groups:
> 
> Patch 1:
>   Rob's conversion of the PWM/tach binding to DT schema with fixes
>   applied for the license and typos identified by Krzysztof.
> 
> Patches 2-5:
>   Fixes for the warnings related to the LPC and pinctrl nodes, touching
>   relevant drivers and the devicetrees.
> 
>   I expect that if this approach is acceptable that we'll need to split
>   application of the patches across successive release cycles, with the
>   driver changes going in first.
> 
> Patches 6-8:
>   Fix MMC/SDHCI warnings, touching the relevant binding and devicetrees
> 
> Patches 9-10:
>   Clarify the relationships between the ACRY and AHB controller
> 
> Patches 11-16:
>   The remaining pieces that eliminate the warnings

Don't you see warnings for at25:

     89 (atmel,at25): 'size' is a required property
     89 (atmel,at25): 'pagesize' is a required property
     89 (atmel,at25): 'address-width' is a required property

These are due to using the deprecated (since 2012) at25,byte-len, 
at25,addr-mode, and at25,page-size properties. I think it has been long 
enough you can just replace them with the new ones.

Rob

