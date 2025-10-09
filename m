Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A60CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 00:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91ErEGRme/WZlXGVAnAV4jF4+ub59KPNi5FICRJfnJ0=; b=MIRSh4vab5cokl/wRI0lolAhbw
	rpyg97Y2we8zzi72si4NOxw5odEEkapGfHMBbMnUM8hglwXFi/e1l/qWPBHfpDHXb/prPJ1DYMYp+
	0xDpEehfmHY6//5oJKOEqM0eYzDLHd0dMpNlP4uPDaaLNXdUYUAXL150xCTfJ/frRhS1W/dUG9gsH
	oRwXadX1N9SxoVuasmZhGkYAc3W3HkHjy6oesniWQBOsZTaWpWj4hx8KTdDBvGHlCNARHhzFIsPr4
	K7knOt2eQzTiBijgp8d3hCo3HbRE57yPf6brZFZjLrnEKZV6sYCqETH6c4CusV6R/FP6fafs3VxhA
	HSgO4A8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6el0-00000004tFs-3eCV;
	Thu, 09 Oct 2025 00:43:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ekx-00000004tFO-42By
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 00:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F8A740BB1;
	Thu,  9 Oct 2025 00:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE24C4CEE7;
	Thu,  9 Oct 2025 00:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759970623;
	bh=dX0f9NNc3ev8nYEkPBXLQP7xHQwnM4V0kjsg1TcaF4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/miDTD6rOtxCuQvVhd0sT74JQnWl8xOws2qjCrK8PTGimCO/Cih2WPRfelX3vUrC
	 dFpxSVeBkaCVvgpZUq4wW3XUNYyXwet85zHxnSqCrshdZa5/j+uLXmn1wIYQzOTXWt
	 Sj6X8HpuLR91VXM7yzkuSrAW/xLiet20fPM2ncUH7EEZC1pwhNc/KXWgX8ta0rg5En
	 Yt7VBXXwwivQ3Y/p+vHtjPtQAKinE4o7qERQVfdgxCShMcUfCoeEgAZie90AK5YOIM
	 ycMOijxSoKMVwCNqp0jxYvtFOyodh2z1foXA/7GDpwPskLtQ1uoA4vHjIUQW/7Q+OE
	 VUrpGpn+Hhreg==
Date: Wed, 8 Oct 2025 19:43:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-rtc@vger.kernel.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>, Lee Jones <lee@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v3 02/13] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <175997061547.377977.15400204653916198003.robh@kernel.org>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
 <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_174344_026866_0F778EAC 
X-CRM114-Status: GOOD (  18.65  )
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


On Tue, 07 Oct 2025 21:16:43 +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


