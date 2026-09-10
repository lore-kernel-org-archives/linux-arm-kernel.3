Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145C9C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twqHB2sSjyRayKyZEYerIYKyvTil6EVw6/BmOMMck6s=; b=a3AGuAOl7f2w0ZVYrj/iMzajmx
	gDnyu3rLJyXcENZteGXwodDruImAaAjPTfqCpZdwP4hf43nO3G6q2H+L9Wntcrz7jw44n8i2+IQaO
	pKg4bOjocRYbSybhM7xzzRqDu7P17bb6E9lX3/W5nw3vQhxzeXcQBINato84KJ/D+tLxfW5Vlvwi5
	YyBj5RrZ6c23ExIicgWMt8tDy9iscl6KYSXQxcUd2MLNqJtS4ZqNzqbqGG07EzdJG3lamVaggHib/
	CtKO2kdF2QKZuCbHlL+MP6L9tdpuy9AZk7yZzQnMzY6C6swK9Cm3R9/KqnS4JPk1mz7xLsnKpDetI
	uy+wOTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gM1-0000000Eign-0gpp;
	Thu, 10 Sep 2026 15:06:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gLz-0000000Eige-0lZf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01BF5601F1;
	Thu, 10 Sep 2026 15:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C651F000FF;
	Thu, 10 Sep 2026 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789052777;
	bh=twqHB2sSjyRayKyZEYerIYKyvTil6EVw6/BmOMMck6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IeVnbC7AJwprYTf6t2/ugFBEtKwKViK5asM1yNgZkibHDsCcjQ4vUpcEizaiqPOcD
	 zNxKDjUPQLKlruFwaHTMJAX3laUuP/pPpQgbk5wYU97jawwVdU3fY/m4ytY/R9jXKQ
	 nxNDfXmzOkeAMYtBpODpd6G6jeTtLnjTkNu8zm6I=
Date: Thu, 10 Sep 2026 17:06:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v6 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Message-ID: <2026091051-gizzard-sandbar-0e24@gregkh>
References: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
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

On Wed, Aug 26, 2026 at 12:52:56PM +0200, Sasha Finkelstein wrote:
> Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
> variant that wraps the tps6598x core register set with a SPMI based
> regmap-like protocol, first appearing in Apple M3 devices. This series
> first makes the core parts bus-agnostic, and then adds the new SPMI
> interface as a custom regmap implementation.
> 
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v6:
> - Fix rebase issues
> - Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Can you please rebase again against the usb-testing branch?  Patch 2/3
doesn't apply :(

thanks,

greg k-h

