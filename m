Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B3AECD6E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWITiL6vxHNi5rzXrRQ46OgyAvxMQaP9nIiAAW9Yb7k=; b=kcJKgc1B4iqGWNKBq8lXgxY4T5
	Q2ePqqIdUQ+dFV7EOMgUBmkarxRGZKyK3BIrLmahA7UWbv+sXPgei/5aZBGgXn9Z8F+VmXPJwIsUh
	5oKnRiQrMsRxBiyJvXWHmP/MIcuAeNLcpbbP+6b9hG3Vhs8NSptnzFg9+yLIwjADRAn78lOOXcDUM
	nu2OkXHkWpPdrCNT31PqScrPm4qTUGOMDIFerN27X1v1AlZMTk3CAbn+fFal9/u7sCCqDc5ExRnRk
	DmK6dC45jbotIw2PDL3ZRN/11KURGmdZjDVB3cxINSmFiA1I4ATDaTJoylhBlclQ39ZYv7pNmXOms
	7q05XZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHVi-000000013tR-0Am6;
	Wed, 11 Feb 2026 21:12:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHVf-000000013sd-0nBe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80B1B4440F;
	Wed, 11 Feb 2026 21:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321B6C4CEF7;
	Wed, 11 Feb 2026 21:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770844350;
	bh=ZsXDR+ZmQZgcAFLTOvK08pR/QTvXK90/KVWwSRiQC3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4gBczgv0CRF9wWjRyBcZ6sr4hzPtVjbbyR/fWi2KJF0JCap73Xh9p8TZkXVH/z6B
	 cIS5py2CePVPSyb+xh36Kw+IHHulK4SxFFhPy6vnv4bnGW5UcSvYcdpmGCRPsXwTF6
	 +9trG//gb98jf1b+MKRjoIoMWl8O3SDHUDSQcZIN2lGvas6QeTnDbCKziKkEq+TyDe
	 jDf9z8ZgWtrQplxsQReN2izQTI0yRTkD3kgAAmjrGsVyFil96U5u6denXcHrnPIqNr
	 bKyI8UwcokiGnYxz73fIkAwr3JWWYpzNkYCUIN+lL3OENK0YzAWJ9A6cXBesd2GJT1
	 uLvTBtDxxqoWQ==
Date: Wed, 11 Feb 2026 15:12:29 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Juan Yescas <jyescas@google.com>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
Message-ID: <20260211211229.GA3882182-robh@kernel.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
 <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_131231_279300_84B5F255 
X-CRM114-Status: GOOD (  19.34  )
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

On Thu, Feb 05, 2026 at 09:42:32PM +0000, André Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v4:
> - consistent quoting using " (Krzysztof)
> - add samsung,dtzpc to example
> 
> Note: Ideally, the newly added properties (ranges, etc.) should only be
> 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> as they're needed only in that case. As-is, this patch now causes
> warnings for existing DTs as they don't specify the new properties (and
> they shouldn't need to). 

We can't have warnings added if they aren't valid.

> Only if DTs are updated to include
> power-domains, such an update should also add the new properties.
> 
> I've not been able to come up with the correct schema syntax to achieve
> that. dependencies, dependentRequired, and dependentSchemas don't seem
> to support patterns. Similarly,
>   - if:
>       required:
>         - ...
>     then:
>       required:
>         - ...
> 
> doesn't allow patterns in the 'if' block (or I didn't get the syntax
> right).
> 
> Rob said in
> https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
> that this is a known limitation in json-schema.

For a given compatible, you should either have child nodes or you don't. 
The h/w is not variable. So something like this should work:

if:
  properties:
    compatible:
      contains:
        const: foo,bar

then:
  required:
    - ranges
    - '#address-cells'
    - '#size-cells'

Rob

