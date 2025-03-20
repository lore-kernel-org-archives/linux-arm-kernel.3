Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15233C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceYxrZZMuc4n+5tM5lq7gH6TjwifruisRKfZYi2gswU=; b=1HohkqFqbORf8iwvp0cdhhvfJ8
	t6FLuh8IB4CvgOPKsbRqX1kBW9dw2+ldDvE6K3GI+mzdo3WJIfO3t1TEe7X4HkRGMjZHVMbCgpw6i
	ILqt0X3gyyXw86SetZfZ5Aksmsj5To/K+ifuQGVrWjLc9Bz3PUw/NBBe6NrXxzzroMA0dFR1WdQ/o
	toUiFZjVgwoEfuulaU8WQuzicv/6N8hm5SUCiC6cUzCFomp7tPa0s0+rylk/+R5UshzX8lYJHHe9q
	zgPUI6xHR77dEFe/hyAWFrLH3cwZtSmCkm0BzK9GEVYTIBaK7aLcq+SfYWNLFVab5t3uq69pnKm3K
	pZdrnN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMB-0000000Cbuv-2sAo;
	Thu, 20 Mar 2025 16:02:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHpL-0000000CXtN-1vdO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:29:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11CA3113E;
	Thu, 20 Mar 2025 08:29:04 -0700 (PDT)
Received: from gentoo-vm (unknown [10.32.114.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 438423F673;
	Thu, 20 Mar 2025 08:28:54 -0700 (PDT)
Date: Thu, 20 Mar 2025 15:28:49 +0000
From: Kajetan Puchalski <kajetan.puchalski@arm.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl, 
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add CIX SoC maintainer entry
Message-ID: <zsmeh4ukuspyetowryqi3blcquxlua5wzy5ibgy7lupryr5txx@74ic6drtremv>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
 <20250305053823.2048217-7-peter.chen@cixtech.com>
 <7419360a-abc0-44cf-8d55-8f5fad8e9079@kernel.org>
 <Z9vyy7f5NOPyzUES@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9vyy7f5NOPyzUES@nchen-desktop>
User-Agent: NeoMutt/20250109-134-7b7c50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082859_542151_68974E3A 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, Mar 20, 2025 at 06:49:47PM +0800, Peter Chen wrote:

(...)

> > > +ARM/CIX SKY ARM ARCHITECTURE
> > > +M:   Peter Chen <peter.chen@cixtech.com>
> > > +M:   Fugang Duan <fugang.duan@cixtech.com>
> > > +R:   CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> > > +L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > > +S:   Maintained
> > > +F:   Documentation/devicetree/bindings/arm/cix.yaml
> > > +F:   arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > > +F:   arch/arm64/boot/dts/cix/sky1.dtsi
> >
> > Instead:
> > arch/arm64/boot/dts/cix/
> >
> > or if you think there will be more different architectures coming from
> > cix, which you will not maintain, then useful would be a "sky" subdirectory.
> >
> Hi Krzysztof,
>
> Thanks for your comment, CIX is Arm SoC based silicon design
> company, we may have different SoC style for middle end in future.
> So, for that SoC series, it may not name sky.

I believe the idea is that the file should either say

+F:   arch/arm64/boot/dts/cix/

if the two of you intend to be maintainers for everything under cix/.
You don't need to list every specific file.

Otherwise it should say

+F:   arch/arm64/boot/dts/cix/sky/

with its own subdirectory if you only intend to be maintaining the sky family.

> --
>
> Best regards,
> Peter

