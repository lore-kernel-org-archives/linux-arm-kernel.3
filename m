Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FE1C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qb5qcUkVqoqTANb8er0vsrSQ+//z69cq30K77YtSYw=; b=FvEBYn0nir5PAFymfDJsMabrWN
	0pRflyOdzGTH+e7PTkzuVuOBkfGfXyZlNTEddnZEC6DRojL5iPIZGp242Ee8LIA4FLd7oscBoH6Pg
	gQU9wC5sIz62KpkY8j3phcXPfgP3G1BXf78pXWEyXQzxBQ9iNqFXGKu67GwKItGHVapqVZKrAWHtA
	2EP3FAxQH+KBtQ7SyDEMC44kX0iTNfRbHNRIFcnzoQqErIbcegxotp2OfJbm/u8ScVFjC9RXjQj7v
	SPbHgpTtoONYtiALkqCRDDlpHdlYVlpahyhXwK1vQFymaI/hc95CY8LCz1X3yn+tL0dQEcDQ+fkJK
	xe4mTGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PeQ-0000000DDUR-1kjv;
	Thu, 17 Apr 2025 13:51:34 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PcY-0000000DD8X-1lOY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:49:40 +0000
Date: Thu, 17 Apr 2025 09:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744897775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3qb5qcUkVqoqTANb8er0vsrSQ+//z69cq30K77YtSYw=;
	b=0cHKdrEI6AjJ3/G+2nZkkSZ3jBm8hhaDffU2CmEbFtCZ81mgvivxImAmK19WY+8e+r8lkr
	4O2shhmntrbpDYGuyL+OWBKeIWZqc6+rdHdPn0gyfVu1lB9NMvJxuqsTNiWUgNxwpX1OyB
	wp4aDIPzWecyklVAmjJIthheS3yPnr/KTpywWeRjPsJ9He2x2ItR6JJOVNH6W+0Bi4aBPU
	+kjCbYqVjUAwv2oYopj5mUZyPH4R+jHqc9v4oBGzPYgMdrg3rp0YnBrPvkjjAPcwEKgWhr
	01Pyy1vvTOAR/yVegEBIVzWMX2XXXNlIhWElSswXbN0PDUqZA9eV+Dx/AzXHTw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <aAEG6D2hjtVOlhS4@blossom>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_064938_935879_6BB0928D 
X-CRM114-Status: UNSURE (   8.11  )
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

> > +config NVMEM_SPMI
> > +	tristate "Generic SPMI NVMEM"
> > +	default ARCH_APPLE
> Why default is set to ARCH_APPLE?
> 
> This will endup with y in arm64 defconfig, means increasing the size of
> kernel.

I mean, eventually I think we /do/ want M1 properly supported in the
arm64 defconfig, no? I'm not sure what the criteria is for any other
driver to be defconfig or not, though.

