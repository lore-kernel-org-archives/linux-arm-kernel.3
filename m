Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B62C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6lFI/iw8VttnaUykqGDhlFSTUICpXN2N2OorKYkdrY=; b=EpHmagBZn0MXK9eD0O2ogg5SXQ
	zdb2iHfesQ4tMNlQ2rP7vbloxZ0sqOeyS45y9CDpld+2lvW7WnTUUyOXs+fQIREH+4uyLaucNDlcp
	TFBRBEVdJMzSByC+1Tp4ufqnhgfnc0L7wGirId+kUAiloYCnwhRfiRr2n6W2sVRv4v+xripjJjNtC
	3bx2MOUGusMY9sRu2K60oXhml74XM/RSCqyOMzhW4lFM1XxDTcttHb0kY09j56vVaVS3NKtM00clI
	kSXyEvk4CRWD3vExXDEwLbQyUia8hWZ+PcW9t5LDn4dKf2OAYggMP5qx1EHDXrVWf9PsA7XRipIE5
	Z4wRS56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Po0-0000000DEmv-22Uj;
	Thu, 17 Apr 2025 14:01:28 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pm9-0000000DEUM-2Api
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:59:35 +0000
Date: Thu, 17 Apr 2025 09:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744898369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c6lFI/iw8VttnaUykqGDhlFSTUICpXN2N2OorKYkdrY=;
	b=yoB5yeLFZ8Yl4YM6gcZS0vPgo2wR9A5XvWX9lI0+bHVyqRNaFrJuuINLOt8hgF4TLd7QNw
	I4FPl4ECF7TArfmQlaTmejGOgoWELkGl9/DTPMXtjS+olzmwARHts7o1PWKyf41WEcSP/0
	oZLnfNry5exku3QKivOqnj/ZmNqHbg1gnI0Mbalol0pI89ytRvREC/DGj2XOKdwo1/ttQj
	UwFY0i3kA/YNpPiucEoTiM3GL6rs2kvK3EI4sD2uQLgFhGizVPLoLcQrI8yEPBLwcZoaHb
	JIZ1Kx9azJo9uOHJlOF8fghKxYkwL8xCZyIr3I6h+YnrsjCGD5ELdwGdkGhpxQ==
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
Message-ID: <aAEJPMotHxguJzC_@blossom>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
 <aAEG6D2hjtVOlhS4@blossom>
 <20250417135702.GA30334@srini-hackbase>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417135702.GA30334@srini-hackbase>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_065933_696197_BD1F18E9 
X-CRM114-Status: GOOD (  13.57  )
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

> > > > +config NVMEM_SPMI
> > > > +	tristate "Generic SPMI NVMEM"
> > > > +	default ARCH_APPLE
> > > Why default is set to ARCH_APPLE?
> > > 
> > > This will endup with y in arm64 defconfig, means increasing the size of
> > > kernel.
> > 
> > I mean, eventually I think we /do/ want M1 properly supported in the
> > arm64 defconfig, no? I'm not sure what the criteria is for any other
> > driver to be defconfig or not, though.
> cat arch/arm64/configs/defconfig  | grep APPLE
> CONFIG_ARCH_APPLE=y
> 
> Criteria for other drivers default should be not selected, 
> and should be module if they are part of defconfig, rather than
> inbuilt. Not sure how most of the ARCH_APPLE drivers ended up using
> default ARCH_APPLE.

Oh, I see what you mean, module vs in-built. Understood now, thanks for
explaining :)

