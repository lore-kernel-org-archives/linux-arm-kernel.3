Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00CACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7XkqfN+8GpCV5L4wKsX6gnozkYn7FaRolU1z5Ae4FQ=; b=tdW4tRXSgJBRnWzZOgrOO2drl/
	MF8aDCSxzNWGhMC92szGqvzNdoUHVQ1oImb0XDvxpKBi7Pr9ptdB0gXO6box/2W2tJcDvkm2NaegM
	IPj1e+xmxb0MMruwsZJWWCvZRyzphGEG2NYyYeq5bidyXeoi9lulCemTTyCptBEm4Dj0I0r9MWzpP
	UmG3V+umplp1oEpZNQ43/IIAjlYYt5hzj1u2xzOH83fmdZQcavCkMmY+u58mDOx6K2YcwJdA5geMS
	Fw0zW1HF26J+iec1UTPT05AE/a725SbR57ZNv1nKLCWu6Tg09PqAKwO3nhJXeDeu6UMVF5/5BgB1l
	xkw5zyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfUX-00000000ayA-3hfL;
	Thu, 14 Aug 2025 21:28:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfMA-00000000a3G-3DIs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 139DB5C6813;
	Thu, 14 Aug 2025 21:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942BEC4CEED;
	Thu, 14 Aug 2025 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755206369;
	bh=Rp5HHClNCs4aOkUL7sssHUYQCKwZAsLIt4TkTxZMYCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+rQbFKVXCy3Sn8DBpesxLjl6NFd1ScybynS/VPY7zsautaMPzoRADvFhi9FNFQJY
	 TajrqgMT0GWizoOGGVulu1WBdho5MadPbUiaGFxUgn1A07BooZCYtZpoB6jo4IioYm
	 zaPWxltuzg9r9dsujVY0P7Z3V5UQGO6h4PAd0drh9OGiZh+Zu9wxlcJQe/LhF0wBeG
	 58pgSRfIKRs4U48cEwkfqqNLdVNz9oy2gTjrINuyiiluHIJiTjBcwIF0T3+LcF0pH+
	 eEDx9sZg1+uchZpXOqP0yxPOWPmxdsLXx3X58wQq/V62JB4eAAhGgUA8tpsDe8lwif
	 12xBuCBuPxd+Q==
Date: Thu, 14 Aug 2025 16:19:28 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
Message-ID: <20250814211928.GA3922106-robh@kernel.org>
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
 <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
 <074fcd4c-0da8-42c4-a567-64fa7e173894@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <074fcd4c-0da8-42c4-a567-64fa7e173894@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141930_845697_907FA199 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Wed, Aug 13, 2025 at 08:14:51AM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 20:25, Sven Peter wrote:
> > +maintainers:
> > +  - Sven Peter <sven@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: apple,smc-rtc
> > +
> 
> No resources except nvmem? This should be folded into the parent. Don't
> create device node to instantiate drivers.

Well, the reboot node has nvmem entries too, so probably better to keep 
this as child node.

Is there more functionality planned/needed here (for the mfd)? If so, 
please send it all at once. One child node at a time makes DT 
maintainers grumpy.

Rob

