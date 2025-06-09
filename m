Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC430C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3yQ0tJ0CBdLt3HO3JHLYhAu43xMtm6smkUOzO9SHfM=; b=s7fORifsQsgqgiLERDl2E9tKTR
	f40FTeO66bDH9gOTYy4CHOPpZXfwTZmJ7z+OjB0QY7hAYX+WPFhBIyf9aw6lLJ0klrljQls4jSNlm
	SGa4+8MACV57Ktn+qVmZtBwCTDipx7pyJv8Bpe5fJTNuyzoUSJtE9GTaAI15/BSv77jeEcjrmrcVA
	620c/dpMXU7Z0bCd71tqKFep6oCkSPQ+nbrJbNAiYqLrG54m7WTOXPEGWjVAcVFLxk8avPJyEu4PE
	OUzSaDiPxvbmBZ2JDAB6IaCtrtvq7/N7jKKVM+NFhxR+LezgE/IpHYm9mpQsA9KhNFGGsHHJ/ySvk
	/dAkRM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOif9-000000056Ji-4Bdu;
	Mon, 09 Jun 2025 20:00:08 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiWS-0000000554w-2mvo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 19:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=R3yQ0tJ0CBdLt3HO3JHLYhAu43xMtm6smkUOzO9SHfM=; b=MPW2cK/a3Cr/+tQ6wajfTf0PH0
	32PLU9fyua87i8J/ZhOi6jJcfaFRzoWwHFhYBqnQY176/VsX11xPNdq5rOxApMq7gS5oPfRLwfSWa
	DyVwB7nZIsljFHXjFB2m7v3l7K8Hu7f6VkvnxgqQmf76/aU5zDmtJiklVBsA77fUpwzxly1HOo0sY
	NQc6GApVgJfKRHtdYFOo5e2CwLdKPx2PMUN6nKC+sxm4AHRCFcVa5XDbevXUYFsdZ1ojt+odcCVX5
	+ruLuHh2ptiJDRbBhX9n4bLP/L5wtYDgQucPc+lLCgLGSr0TkyEMxJ38j5Ehwni/FLzOcPAbLemio
	XEiFTVHw==;
Date: Mon, 9 Jun 2025 21:50:44 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth
 <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250609215044.33ef6b52@akair>
In-Reply-To: <20250609-hacking-corporate-d53531577680@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-2-5278026b7498@bootlin.com>
	<20250609-hacking-corporate-d53531577680@spud>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_125108_708591_DBBFCCB3 
X-CRM114-Status: UNSURE (   9.67  )
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

Am Mon, 9 Jun 2025 18:03:05 +0100
schrieb Conor Dooley <conor@kernel.org>:

> > +      - description: TI bone variants based on TI AM335  
> 
> "bone variant" sounds like some shortand or nickname. Are the boards not
> called "beaglebone green" and "beaglebone black"? Whatever about the
> compatible, the description should use the full name I think.
> 
we have an enum below it listing all those variants. So "variants"
makes sense here, but better "TI Beaglebone variants"

> > +        items:
> > +          - enum:
> > +              - ti,am335x-bone-black
> > +              - ti,am335x-bone-green
> > +              - ti,am335x-pocketbeagle
> > +          - const: ti,am335x-bone
> > +          - const: ti,am33xx
> > +

Regards,
Andreas

