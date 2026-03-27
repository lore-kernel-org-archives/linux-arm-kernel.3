Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E389F10ED674
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr4NSViTa8nYhT0ecpwsrkeNiNlBrQA4PsuFZgiUu24=; b=N+Drvk2ifkOXZZs5gYfdzDdqv4
	wF4/epqODHjKReNrD065XsHNl3gnbL4e16+hihGWM72lEuUMh+V2YHB+eaxRJmfsPB8eKfQZmwwUQ
	GfOSYNuCw7Lwc/bnTEbPNxjtrjd/AJYY1sT5AaQivxw7xuX1mZ06eSnmRxursTqZen1xi/lNJ3qvX
	SDfBXDneTTCM0J/yHixHIZiptgtfGPuHcHYvtZzG5HAPTuP6/XyvxbmSm6MPTHRBPoCeOdFATUCh8
	f1g2Y3kGVUfR8Dc74RmuZRf+hVelfnhu4nTeIqaMk8QoThYFvJofcNJ/eHj2mGgLj3UESUYZrY4HG
	3gREmXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67xw-00000007a7o-3UWl;
	Fri, 27 Mar 2026 14:15:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67xr-00000007a6J-3tIz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D50A60054;
	Fri, 27 Mar 2026 14:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1671BC2BC87;
	Fri, 27 Mar 2026 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620907;
	bh=mDiN3CwDrGxYxvIHxSISwYWQtGmSr6sfXYIrXdbxyiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTf8wCOK6X4yKAzSc2f24WMygbSUxlO57UzYhNphUBfRxXyppdBQZPlCUkxVBdrOH
	 Uz7Fy6/0e/piqICij9fRz59LwPCoxO2IYxFt44MX1kOvlyXOAyWVSIgVYoaEjuqxvB
	 YzBs49DByqBIFT7nak/Z27n61HyH242rT17TM6XQT9J9wKU4KIqZ1aTnNwf6CG0Qix
	 pFPU+3LblCGigprhujlOD6nTqkJNOauA70GNtaJ/yMa65pqG0tlyxT0zRi7ohsCnli
	 SIBsi0U3OQMzFx1cCKCEA6wKSgDde+8q71TS+q4Wb6NZXBw6V126ULtEalLyTs2lFc
	 PJhb2lAF9csyQ==
Date: Fri, 27 Mar 2026 15:15:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 6/9] dt-bindings: i2c: apple,i2c: Add t8122 compatible
Message-ID: <acaQ0tDphJH1OPH8@zenone.zhora.eu>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
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

Hi Janne,

On Fri, Mar 20, 2026 at 01:23:24PM +0100, Janne Grunau wrote:
> The i2c block on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-i2c" as SoC specific compatible under
> "apple,t8103-i2c" used by the deriver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

