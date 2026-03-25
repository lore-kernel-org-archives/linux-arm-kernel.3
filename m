Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837C1109E521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3lTfbT0nJDHwJ1grHQdMNGWaZalhIx1nvID0f4t1l0=; b=FYdXxPuIEKFuIJ94AxBLD79zfH
	e0kARaxz2HTVwE8bBpOUb5R79nuXdX65oAXdYaShl27x1ESIPxUixVMKeTEVZfDT0oxETPOtSC9Zm
	eilL4I154XxsSG16+kxLIe+ENEK8/JYfEAXKCESWV2r6OsfLksff1rUonS6b6Sh2XSqVZqG+mEPtV
	tD0zn/kAmiU5QmJWZl13RKuY7/kYAxFxDmPLcfTFYnKXXnLiYHIFTz2BzqEai2gS5dskTjepGFHgb
	Qh3uLnwX3aV/N/ydmBGfp2OEA33r8p42axLMsMkNZ25YinPrNWrQfOFVrxm7WF6IxhGpBHslWUcxI
	WoHXe+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WDK-00000004ItM-1pjJ;
	Wed, 25 Mar 2026 21:56:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WDI-00000004It3-3LBF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 21:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BA2040729;
	Wed, 25 Mar 2026 21:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B268CC4CEF7;
	Wed, 25 Mar 2026 21:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475792;
	bh=cDsofzUExbaRruhadQQdIGevP2H5+i7XAF8lJ7eU7k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNuh3pJPrMQV1aXwLfXOsQdPoh0jfs/9+LKenDgbmzr2ascfU/cuPw92VYPa6n72V
	 QDN96c2K2UnHjRiOwJnyab/LwQfqq8oAmhaPAPR6/thcW6EVeTd6kFTdZj0jMHe8jo
	 EJn622al9O3VhzblYDbAq7vHzWqY3JdbfJ9DXw8/Q/lBjeQVqnSvfgumYrEJi18ZnP
	 H8zopvZ4spCuUK/7QPYMiWMAKhD101LLND52r5KNE1+5DJdCzyqCBOI283h4TegEKp
	 7fz43EYMfYpcuMXF8MzZ8W6VhRj2NuF0l2gkVN9h9H0OqPRA3moCuAwGCeRd6EH8W7
	 CV1EjpVBNPg1g==
Date: Wed, 25 Mar 2026 16:56:30 -0500
From: Rob Herring <robh@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260325215630.GA6513-robh@kernel.org>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145632_872565_0037E151 
X-CRM114-Status: UNSURE (   8.76  )
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

On Fri, Mar 20, 2026 at 05:29:58PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
> 
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the shutdown fan speed to be configured per fan output.

Why not a common fan property in fan-common.yaml?

We generally specify fan speeds in RPM (and then map RPMs to duty cycle 
for PWM).

Also, we have (or can have) cooling levels defined. Perhaps we should 
define the cooling level for shutdown? Maybe other things with cooling 
levels need a shutdown level too?

Rob

