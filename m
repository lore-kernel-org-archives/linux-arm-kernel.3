Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uTQ6p+V1jTDw30/bAcPN/7+p5TBcCgK8gHCjb8Oz0Q=; b=gauZVLz7qIvHusk2zAgM2Hmx+r
	eRj94VTKPkp+s/i3o8jEwOaM20hNYNXrefv+AJKFgcmiWeVN+FjL7c/UwNwNkNK9sKMC5P47I/XnL
	kMdSXWHnmYWRgA3KHFeCIjikgvYBLmJfpI4dV2+vzVJjAl8wH33vtcPRw1imP68t2RPaXa+2d5gEZ
	PnELFN/8Ir7lbJS20KcElQ2D+rahS8rEoxjMp/2pTCIP8sd0pOPctDqoOSGANg5HKUrxKXTLowuj5
	9bYmhSkOFD6OLAx6OFAPouXabOfgrSR9KAwPypmD9A1Tj+qSVd3oIXjCVvpq873l9tSosTyPssTY0
	swh3Sq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8Y-0000000BNYq-2hr2;
	Wed, 23 Apr 2025 17:43:55 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cJK-0000000B0ub-0A3c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:46:55 +0000
Date: Wed, 23 Apr 2025 11:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745423209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uTQ6p+V1jTDw30/bAcPN/7+p5TBcCgK8gHCjb8Oz0Q=;
	b=g0He3GFFtIeA0y+TZSb8ZM5l4SKbGuwYGKGOYwdpzty/lxLNEiXCOv5K3IiaArEH3gZOvC
	OUvGYNJpg0LXfJ2XzYkLKJon6mmOe1XmPjKBaULtWsbZsRORyC2xET6NZT8ygT4vr88qAa
	XaBvJ9NiJK5TMMpTlEEhA1szOHKYyBWBZaRHg1MxwQ4RAzncmwmaGy31MtV4ZdlRi5WqtO
	wuz+lTHuyiOOFi0dwmcpXei6JAzKQHxAJ2Ismpak5mxi5Z1Rb7YuFCAd9LRZPEvjsyW4W1
	Vncv3A1dF010GrnpFagFy6liYg3iWr5UB4K8ypp6HLgTRZrK51KOvKVl75q/mQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Herring <robh@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
Message-ID: <aAkLY3TYIPG7ojwx@blossom>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
 <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
 <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
 <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_084654_413759_779D7DE3 
X-CRM114-Status: GOOD (  15.95  )
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

> > >> What makes this generic?
> > >>
> > >> A generic driver is great, but "generic" or "simple" bindings are
> > >> generally a mistake.
> > > There is nothing apple-specific in that driver, just re-exporting
> > > several registers as cells. If you think that it is a mistake, I can
> > > rename it to apple-pmic, or something similar.
> 
> Like I said, a generic *driver* is great! I'm all for them. We should
> have more of them! Generic bindings on the other hand are generally a
> mistake. The problem is whether a generic driver works for you or not
> can evolve in either direction. You add more things like described
> below and then a generic driver doesn't work.

It sounds like the path of least resistance here is then:

1. rename the bindings to be apple m1+ (at least for now)
2. keep the driver as-is (no mfd, etc - at least for now)
3. land just that (at least for now)

Evolving the driver to share with not-Apple, or evolving the
bindings+driver to share with pre-M1, can happen in future series
if/when somebody wants to do that work.

Is this a fair understanding of the situation?

