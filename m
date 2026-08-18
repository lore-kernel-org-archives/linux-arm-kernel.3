Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CA5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 00:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QFJ/p1h27E0rbYmZGx77WBf51SQtMNCefM9/aMMHXk=; b=rtLBWIOuS3DWu90x9KPyO2Fk3e
	BGQ2QBFvieItPAmu8PikNuFDU5ukMfbEP1a4hngFzyyK03ByMdY+pW5VyE4VIz1LYcwb3PLjWezy4
	aFIqKhLN6G32o+aAHyUAu0/axlodXYM549HEXvKZDvVjUYgNksMQoFXlwexolqFxQb3fps03dNdrq
	4mPMEKkXa/iHpRwyEJ3gd2icj3pfTQc2lR2sHFU1mMRsIKTbKIIUskrsFjI8s0J9MxoH/v3vGiV6G
	2yIRjOeP5jPMp5binY8JS90rNryElVpSBzS6B+VMyOCe5kVI+zaNxJA2++1yzAVNtbkKxCP0IJroY
	a3Xk1uAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww85b-000000071vr-1Trm;
	Tue, 18 Aug 2026 00:54:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww85Y-000000071vH-444X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 00:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8QFJ/p1h27E0rbYmZGx77WBf51SQtMNCefM9/aMMHXk=; b=H1Mml4HquhsM2CPxkO7Ms4l4rJ
	pjHk6fSGGu4JlXV2jSBZdY0ytUyK4JYMBwUX9i/y/JruLy+Ba76EVjvQOGcZEkRpWg6vZ4djxkbMZ
	9O3k4x9qMagKNeg5PYLMvcT/IeNhzxvzGuInoFTFlPC3IYsD9lVGp56/mCxtzWVXeR/k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ww85E-000Owx-BN; Tue, 18 Aug 2026 02:53:40 +0200
Date: Tue, 18 Aug 2026 02:53:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Georgi Valkov <gvalkov@gmail.com>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, krzk+dt@kernel.org,
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org,
	miriam.rachel.korenblit@intel.com, wenst@chromium.org,
	rafael.beims@toradex.com, avraham.stern@intel.com,
	error27@gmail.com, s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	chunfan.chen@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag
 marvell,ignore-regulatory-hint
Message-ID: <c10c5132-1bac-4bf7-acd5-1319ce072eaa@lunn.ch>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817215428.84740-1-gvalkov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_175401_018599_FF793B94 
X-CRM114-Status: UNSURE (   6.85  )
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

> +  marvell,ignore-regulatory-hint:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Ignore an incorrect regulatory hint from ROM,
> +      so userspace can set the correct regulatory domain.
> +

Maybe this has been discussed in a previous version of this patch...

What is Marvell specific here? I assume any vendor can mess up, and
make a US only device, but ship it elsewhere.

     Andrew

