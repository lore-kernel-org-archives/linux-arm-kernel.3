Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6F8D3569E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ls6lQ8h9xsQ33EtNja3RPbSmj6Vry9dJFwMxv4NbtU=; b=C/tQVql/3waBWsWoykAAx/4ie0
	YoML5Z1UN+2hzZaiJUmrwEdIWtrShVY7GoabVS05UdPkddSju0zKomNCOyYyAQlK4KfaU3ZZrB34u
	P+NqEbJGVBMjguXT4R5xNcthzMe5QrpC3y2bVEOXdFXCQdlB8XaaWtW8+cyx0sYIhQf975K+3M7RP
	kxHKW2tewU4bzsoHMtIEWRxrGCtbDWZWiVJFivaYxcKX7pv8vajKU8fUsrDqdDjLjyCQVpy8Vw3b+
	3tVEVrwsevqGpDqts480ey+AkLkfG49IzijDjNREexhK1H6gCHAOI0Yp/NBfW+mIeucv2YLWOR13c
	k2cJJj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2vR-0000000FqId-34TI;
	Wed, 28 Jan 2026 10:37:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2vP-0000000FqIE-1hYo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86D94400EE;
	Wed, 28 Jan 2026 10:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70CEC4CEF1;
	Wed, 28 Jan 2026 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769596646;
	bh=0ls6lQ8h9xsQ33EtNja3RPbSmj6Vry9dJFwMxv4NbtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrkHLkKp0QVXBgqNGZzUMhDtL3A8NSnd5SYm80EIy7t0o7y0ox9HX9imYtmDWJp4j
	 70AmSJVG3tkOxRbDDjXrfeJB1F14qiGLpYD6lmk7GunOJcfkgEZAgUqyG3kap0HU2I
	 cpMMvMxUUDozz2jSeOOD0TaXfQc+5AVfkMIn9L6MqCDKnAEEZMzY/tv53hOOrMaMdP
	 yMTcNMN0LTJ6rlwszCzb/gk9YsJhmasPvPLeWwOz7MZiEx/exW38vgsVsZf3hQTuX6
	 SbXH2Vhl0UUta27+PuFZwYh9kODSxGcCUa+6Uk/QG+txH4vDxmg30+6Y436hAtYjP/
	 zB/bb4xDeGCjA==
Date: Wed, 28 Jan 2026 11:37:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_023727_461280_6600FBA4 
X-CRM114-Status: UNSURE (   8.08  )
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

On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain wrote:
> The xiic driver is designed to operate without explicit clock configuration

And if you change this in the driver, then you change bindings?

You miss here explanation based on hardware - how does the hardware work
if nothing ticks it clocks?

Best regards,
Krzysztof


