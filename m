Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99503C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKzZ7aDNWizqFinjby7eN75XuZwB3tcRiyDroxHPPUQ=; b=TuPFErjpwQ06QzwTKbr2VdgeH5
	ah0v6OpOUCxIBaq2k7Go6taO9fNsUeGPtl5wLdPszPm5ycPfZ0zJN/uVBYIgCiEc06OOdV0zN2Yak
	wNIYkOliPzzJdfeLy4FnVTOZl9pif+dYtK4QC204ezkg23dKlOb2GXFYGw2GX83393VCQ9G6qs9S7
	gKbwqOO17i9daHTtH7xFR9JYk4m8AjZF1IvQP2n7GY1gm9qjA27g2WAQONQiDulCw9SI3Nu1vzq6x
	UnKDsmtzybiG3WEI2ZtiKXmhhQbfIk+MMJZwuYya7GLNp2rXHbqY2+HUfFZhLc4K/fnwaW3Iv720S
	thlS+HOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Dtx-0000000GFea-3kFc;
	Fri, 25 Apr 2025 07:55:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ds7-0000000GFT8-0NYN;
	Fri, 25 Apr 2025 07:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59FB05C642D;
	Fri, 25 Apr 2025 07:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4B5C4CEE4;
	Fri, 25 Apr 2025 07:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745567598;
	bh=l7QOCZ0FTnoIqL3IAQHuGX5QYfEofoNQVC+kGrb1dgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXfg3GjUm7kkZfv8Nxu1cZ9PYuvcY6KsHEhTIRLFRjp7ETT8W36C+dTDaDYD9B8P9
	 yTemlV9QT1ft3U54N7PjlxSWMO2rFIpJ/UWN+py/hn6l+S3VCocOtmtjB6hewdx+Vc
	 cfVluke3ktbeNnxgQONgIvR2FTqkmCbMViCy+yXQbFxwniYRDz851EFVVRemp0fdpX
	 ugUbleXaD7Iyg1Fmj4E+hpnplHTr3OWTy07drUZyj83FIbQg5GUUTtk+40UKpPqrDQ
	 FQLbos2Qhs55L0CdiDgehyRYijsvZTeJt+IkoRphDOEodi8zfRxCm7qp9xxakzG07Z
	 w82gJSuIC5O9A==
Date: Fri, 25 Apr 2025 09:53:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_005319_168315_09DDE9A5 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on th +maintainers:
> +  - John Cox <john.cox@raspberrypi.com>
> +  - Dom Cobley <dom@raspberrypi.com>
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>

> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>

Drop, no mailing lists in bindings maintainers. These must be people.

> +
> +description:
> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> +  boards respectively.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - brcm,bcm2711-hevc-dec
> +          - brcm,bcm2712-hevc-dec
> +      - const: raspberrypi,hevc-dec

Not what Rob asked. You should use specific SoC compatible as fallback.

You referred to file "raspberrypi,pisbe.yaml" before, but there is no
such file in the next.

Before you reply that there is a binding using different rules: well,
there is always poor code. Above two comments are repeated, especially
this about specific compatible - all the time, so these are not new
rules. These are given in reviews since some years.

Best regards,
Krzysztof


