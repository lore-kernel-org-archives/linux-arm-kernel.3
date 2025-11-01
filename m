Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3657CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/+Nze/WxYiePnoauR8DL7uQ8un+Tc8QVxtrh0Cr7cg=; b=MsmxY8X1EsyOVr517oZL0Kq84s
	+3iKvxzOQL3m+GWtlzmw2Agj3bUJiEHlzdaXyrv1M0LeHGHUSbf4ohnoHweVJ3rQPbYylFK4XCpX8
	tX/jhs/QL0ySgubLhR4YDHe+kZxY6QuZfZlRyuwAA8lX038wgr8e4sQ/JoCx1bzhnSAagMo+IDnfh
	not0RROhsVInhVy+4hKix2onntqu3JDlbnNJebcC6KhQ9qVJYuX7RrFgJywiuc+XIBiBGIUYKHFFg
	eNW4JovzZxl1L6KPSkF+PojEnRYfuUinyRqbBdzbZBsRhLR6W6LSGzb2rmyEtF+JdEOS5/WRf3qdE
	prgKqQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEz9-00000007xdZ-238F;
	Sat, 01 Nov 2025 17:01:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEz8-00000007xdQ-1GlS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 17:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6262A601D9;
	Sat,  1 Nov 2025 17:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA4BC4CEF1;
	Sat,  1 Nov 2025 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016509;
	bh=GP4gDrHyamNc1MWJlGO4DRUHbfFH0p+wioFnu0kmRDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j7N0Y46bpWBWILdmwRBfx/EieWyWKblN8vIi6YHFx9y+MnJTYHP5UMYH923Ey8YAU
	 vEtmaDKrsmAxUTA87sAJ3n0eNCFihZeW3tpkB/hnrYu7MpK1YoMt70FJ5M3jPITPT4
	 XCwDvqmuxXYLeeISsKUTFKL5j26hCpuQ12QFJyKaTHuzReUsm5q4Nul1fi3RGAa/2l
	 aM18xxV+l/u+iXiCSvnwzMJm8QG6okidZIIhOMNZQaq+JZv/X+gYVXqYsc7Vcxyv42
	 jfrjvOmssQYCZRilrAz179zuzRn6A2sriUYsZEX7SdovhxPb3pAE0o+Iu0CvtlkEcG
	 6pLXEB94bqeEA==
Date: Sat, 1 Nov 2025 17:01:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: imu: mpu6050: remove interrupts
 from required list
Message-ID: <20251101170141.103d6689@jic23-huawei>
In-Reply-To: <20251030-glorious-nano-muskox-e37d49@kuoka>
References: <20251029-qxp_sensor-v1-0-e97ee1de96d8@nxp.com>
	<20251029-qxp_sensor-v1-1-e97ee1de96d8@nxp.com>
	<20251030-glorious-nano-muskox-e37d49@kuoka>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Oct 2025 09:23:37 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, Oct 29, 2025 at 03:27:18PM -0400, Frank Li wrote:
> > Irq is optional signal to make sensor work. Not all boards connect this
> > signals, so remove it from required list.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml | 1 -
> >  1 file changed, 1 deletion(-)  
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Applied. thanks,
J

