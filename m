Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72199CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IN3NFdrc14uXt12CxYGdLvKSeFnCWmr06lwae8sC5PQ=; b=ZhVvTEmSyPro2oMWgpgG6/NtBo
	EMFJTWSPRI8xDWjfqZ7OiDOkyuS0hUzdbtw/KIe2UdSCaX+7LJwq2jCort070shbbiP0jbT+iyLfR
	Cm6UIJvbJmPuwKb0+l6Z9zL85Hh72UUK6aZs1KLw1Ycu2vro/8TdmDLZ63/zedLOvbQnao55bbzU2
	/DPOy2uu1sRaV2+MMTQHJlaBzZo2y2pf5BWJZZ5QdlKRlw8Kxe9UWJo2gFeAqS4xZC9Tu7vu/TnIC
	R09rcKuDdN7q6UsZBSjULe3zP/oco68DzKywnDt9Tuz9Rzjk6y6pRG6HX4UJDFUNDs6hViv4XdTqJ
	rD51HZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYA28-0000000Be1i-1nRw;
	Fri, 12 Jun 2026 22:07:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYA26-0000000Be1b-3dnS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:07:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ECBA438DA;
	Fri, 12 Jun 2026 22:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1701F000E9;
	Fri, 12 Jun 2026 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302042;
	bh=IN3NFdrc14uXt12CxYGdLvKSeFnCWmr06lwae8sC5PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eSeH42147TIqEamoqMGijR7mxIS4V3VFsHwhimWdPwNNtSUKeyvlWgLd8MS9WZAAH
	 /GU8SoIi0KbUr1+vjmG1SphztmEQwL75hCu2Eb399lVwUaPOSj6IsrDX6RzaSPlAGw
	 iRNDVY7mR1Mo2yjBAnV5aaLOKMG5zP4KLHJHO9qjPDk/pX4dmWhfSuqLiR+mOf/lt/
	 zg31BRI2ixfhkVcxPOECcak+LgDtoHUlyWQVCfU5gtiGa/9ickcR4bJ+TjD1nwN9ax
	 kklPeAovejBrzj7S0qSalz76zg10S42g4ZHMnqqXLeIXn9gOTWLo3xoLozQQHA4ice
	 rwcQE8V7io5dw==
Date: Fri, 12 Jun 2026 17:07:21 -0500
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <20260612220721.GA1901304-robh@kernel.org>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
 <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
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

On Mon, Dec 15, 2025 at 07:37:45PM +1000, James Calligeros wrote:
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
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)

I fixed up the error and applied. Please ensure all your patches get 
applied.

Rob

