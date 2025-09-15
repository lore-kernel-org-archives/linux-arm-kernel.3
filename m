Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B832CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+qwPhZJSfWWFHa/0JQ9FLyPYdavHmaBAX9ONZmEHB4=; b=NF/Ag7gr0JboXKcnLoQROgnRjq
	rW4RdNo4aj4hVZ+eqVmePmYJC7/bjNW8kBIeccRllax+tlz74fECtC9KQRcvqjPbjZvcBpo0nU4KI
	PL/cuiy9FW8HGDSlPwOGYE8MM0hl0JXcEAkSW83JnB8HV/q8dGtIsJaLwAIj8WaSeoBndliEcdVHP
	xQTqTeYOx1SgULx7/bLa7qMCoY+0CQIU0gcOcoN9l1qqtUmMRkMIXuYn9V+ficJxgJ+dKtVFIgmwQ
	D5IOQGd59YUqyIh4Fe/vE5lycIkGI20KD1eW0HAFG4UTUgOdtYGIMCMXCWLXn9UZ7VK+DvexGhbKl
	DeI6hrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8Ni-000000049ao-0kvt;
	Mon, 15 Sep 2025 12:32:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8Nf-000000049ZN-3See
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L+qwPhZJSfWWFHa/0JQ9FLyPYdavHmaBAX9ONZmEHB4=; b=BA16kbceQ0CW2l1BGcmB7I60Ya
	QnN81//wbpw8quKuMH6/dnUkOgJEKiQRUZqo2vg5uMwODqj2BFBbDfb6tacvlyba3eyRndm4qgcmz
	m3umrb5pHfC90FqVjq/If662ZML4vhaE6WCfO5tab3MsZReSECjUY8H6hDgUxpR7uSZk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uy8NQ-008RD7-1w; Mon, 15 Sep 2025 14:32:12 +0200
Date: Mon, 15 Sep 2025 14:32:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Donald Shannon <donalds@nvidia.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Message-ID: <6b50e9fb-ce59-406b-bab6-6cfa4eb44e3e@lunn.ch>
References: <20250822203818.4062595-1-donalds@nvidia.com>
 <20250822203818.4062595-3-donalds@nvidia.com>
 <f9cd6015c47d390eef9c689d2cb4fcd301c4d123.camel@codeconstruct.com.au>
 <fcd64668-4232-4d7b-98ec-5326d40d19d7@nvidia.com>
 <f0b75151-d355-4d03-a356-dfbfb7a9e803@nvidia.com>
 <ae46aa8e57d01208deb56a8fd01f26a9a0bf359b.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae46aa8e57d01208deb56a8fd01f26a9a0bf359b.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_053227_942233_1B0660C6 
X-CRM114-Status: GOOD (  13.86  )
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

> > 
> > Our board phy implements tx and rx delay, so -id would be the appropriate one to use if we
> > decide to use it.

I'm curious. How do you achieve this? Have you hacked the bootloader?

> Right, so long as there's no delay configured for the MAC in the SCU
> (see SCU340-35C) and networking functions for your board then I think
> it's fine to keep the node and specify `phy-mode = "rgmii-id";`.

Yes, this is how it is supposed to work. But please add a comment to
the commit message about how this actually works, e.g. if you have a
hacked bootloader, please make that clear, in case somebody wants to
run the mainline version on this hardware.

	Andrew

