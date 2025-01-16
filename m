Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CB5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFH2QkUAPYArHwVFoe8AUQOmWzIhaJml0s+bthS7xaI=; b=uKcQspep9KO2/hmYwHEtXAak+P
	mnmgULLXTRcf8Oh+MZMzsmqf5vuO63EfaAXSTqcg1P8DkJP7wvu4GqjAmSoiqawMioAkWri7jo0tC
	g+1SOyQrB5UpoGkfq0IxqQAiuk7pK0grN+3lTOj8VllycD41b+2QlwRRXJQzaVuQK0MqTzSyawpmT
	Uo5cPn1jc05VTKM6LruCbmX5JAw2+1x/j00oXMclILERNJcpI7TrW2bO+7GeMKcOKosVW0TPZXlXI
	HvZnVE4GhVAlmOTiUZMejDWSqpirIAxEQCju56gziFNJc+yvwJ7HWzn6csgbEFNnOrvw9m/uxPC53
	g9sHQB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNHr-0000000EYUK-0eLo;
	Thu, 16 Jan 2025 10:39:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNGa-0000000EY1h-0kbF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 10:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D95AF5C5D20;
	Thu, 16 Jan 2025 10:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1225C4CED6;
	Thu, 16 Jan 2025 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737023903;
	bh=FxvjYb2DWjhqzHI2LNTmYl5TuYZ4ikMl0bpGCml6Q1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCw1Hb3JaeryBSelmXm/W7aZWkrxne1V6qJTMbT5wzUB0FLJb1HDVSxQs7L3Adk/J
	 h1jIgU3u8NtUtpMZzt59EKG6jWvD0UFM2aGmmMBywcxN0mvUC+SXnoaH6zwC9Y8ixV
	 0N4sgYOyBEb+mBtiV6qFripiT9i0WVcjWmKyFdexG6GtbzLRzdX7pr3N2gw3m2GYKm
	 KUjby//nop8j6RYVyZYzhQPJKQF5s/6tiY5a33mt3i5ohcQ1sJcIIXpLXXXJ7TjgDw
	 0tf+1KC5DkK6Yirs9t9kyDLWGwGJtBzwIga4CdNopnGWlom31Q/lmyG4CVS+r875GW
	 56144sKuxFylA==
Date: Thu, 16 Jan 2025 11:38:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Rob Herring <robh@kernel.org>, minyard@acm.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, 
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	devicetree@vger.kernel.org, eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <oezohwamtm47adreexlgan6t76cdhpjitog52yjek3bkr44yks@oojstup2uqkb>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
 <20250115142457.GA3859772-robh@kernel.org>
 <a164ab0e-1cdf-427e-bfb7-f5614be5b0fa@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a164ab0e-1cdf-427e-bfb7-f5614be5b0fa@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_023824_261955_FDBBD2AC 
X-CRM114-Status: GOOD (  14.51  )
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

On Wed, Jan 15, 2025 at 03:53:38PM -0600, Ninad Palsule wrote:
> > > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > > Choose one - suffix or prefix. More popular is suffix.
> > I was about to say that, but this matches what gpio-hog.yaml defines.
> > Why we did both, I don't remember. We could probably eliminate
> > 'hog-[0-9]+' as that doesn't appear to be used much.
> > 
> > Long term, I want to make all gpio controllers reference a gpio
> > controller schema and put the hog stuff there. Then we have the node
> > names defined in 1 place.
> 
> Which one of the following are you suggesting?
> 
> "^(.+-hog(-[0-9]+)?)$"

This. The second part of pattern.

I'll send a patch for dtschema to drop the prefix version.

Best regards,
Krzysztof


