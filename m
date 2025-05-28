Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D75C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve9zlEhyAeIJvFh++9HwCNvy/GoFzpwAhVVWMjKo3bE=; b=EPOmGg25HHEICk4F4NADPw3c7f
	HY7g9rYP7RvY7aAtEgTxjIomk921OkU77Ev0FyeaOiVvfm0m/9tUfUPcZhFcjv0u0sIKjh2/sRmPa
	zJBfobYJnH2wUMH1/FTxqU9jI35lPYiHg+liDCqi+o8YtVqMMK6xrVLu9tYbpEwx6+WNIGzQ46+jN
	tj4QncaYyIDz79rmwy69WbMoII1yGSZ9vNsxqX5sR0hC+fvl+yW8FzNVxSJ4NEuGPDxnUGF4E149M
	vd6TNY/RNG2nNNMlkkKmH2OfxgIvIzu4srtx7FowizddVihyz/sTtRRlxg4uYzSr9gOVMTW8Xjl0Z
	ox891xKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBdc-0000000CU8R-2g2z;
	Wed, 28 May 2025 07:55:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBbU-0000000CTwb-28AN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 07:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ve9zlEhyAeIJvFh++9HwCNvy/GoFzpwAhVVWMjKo3bE=; b=BxhS0FZ5P9KDXBIuaA2hPCfF72
	kQOc+zam/61pRNAjeSCEDHXcETAjwY5InAkIrntfRtDixw/t8lP0638gmI/JR8kWHFDfLOOXpi/Gm
	pWz4Gkuma2cqnwp+70Osyffe0NV66c2sAGngS1k6cNP/fJDk3xULr+kI8L+74EYw8az0Bd1xmGHcJ
	PbJue0I+lPkoL06qAbKfO8VXR6n21brNYIrFenE9dDocepHHHkGTEddAsFwejmNBBw2AzoHYR7aUr
	P7aPxwZ8ueOHujHeLD6T9b5p78EuLX9EByQMobwH2cn/IhZCPUZtJVG/AD6unO95Fxpjz6edFovbj
	7rgRLdxQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55976)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKBb9-0008NH-0j;
	Wed, 28 May 2025 08:53:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKBb4-0002G5-1v;
	Wed, 28 May 2025 08:53:10 +0100
Date: Wed, 28 May 2025 08:53:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
Message-ID: <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_005336_548862_D0495C6E 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> On Tue, May 27, 2025 at 2:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > Sure, that may make sense to do as well, but I still don't see
> > > how that impacts the need to runtime select the PHY which
> > > is configured for the correct MFD.
> >
> > If you know what variant you have, you only include the one PHY you
> > actually have, and phy-handle points to it, just as normal. No runtime
> > selection.
> 
> Oh, so here's the issue, we have both PHY variants, older hardware
> generally has AC200 PHY's while newer ships AC300 PHY's, but
> when I surveyed our deployed hardware using these boards many
> systems of similar age would randomly mix AC200 and AC300 PHY's.
> 
> It appears there was a fairly long transition period where both variants
> were being shipped.

Given that DT is supposed to describe the hardware that is being run on,
it should _describe_ _the_ _hardware_ that the kernel is being run on.

That means not enumerating all possibilities in DT and then having magic
in the kernel to select the right variant. That means having a correct
description in DT for the kernel to use.

I don't think that abusing "phys" is a good idea.

It's quite normal for the boot loader to fix up the device tree
according to the hardware - for example, adding the actual memory
location and sizes that are present, adding reserved memory regions,
etc. I don't see why you couldn't detect the differences and have
the boot loader patch the device tree appropriately.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

