Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA9DD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMd64CShUEZr+qMjmqnfEJZKUprzSxa99OitiXiFU1I=; b=qR8dmNFOidZ7LoGnW89fZcfTaB
	NKP4cW/LEQvGELAHJdPRvMyVHJ2IPUyNx5U4bLT+JJbBvhMqfEnOmz0HchtpRJqeH4/bPzkWNnQA5
	RUjGXVJvopDTqqOY/y1hvVfCKXEFONsaakxmaKY/1O0QysPptsDg0jVAgbotyQKW/0TNa+xCXNDK+
	7ayxOFXunJ2pC5w+fI3l/5zZ4Dm7NZCqISXM/Q/DzS31DhKyC4E6cJ9EmIhBuKaEX/TouoC461PRn
	zhytqnTbvQcVo4B809UichYt5EkNKo8AiN0Fny352rfhPVvfAhSWx9hmWGi7BLs6l24niHlC8W1c4
	FaWu6fug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5wN-00000003Szv-3KyN;
	Mon, 15 Dec 2025 10:36:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5wM-00000003Szo-2yc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 10:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B269460129;
	Mon, 15 Dec 2025 10:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4F1C4CEF5;
	Mon, 15 Dec 2025 10:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765794989;
	bh=VnZ9AI+OcSYjRRCKYpKhQNADkzDfaUzJNzcsasS8Vos=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ULVZ/usPznXq3DhQThXZBO4aMJjHoKA+pwX75G7MAXzBw0Wn1zC2vrBwOvcFA41xC
	 ULin4X7tqnkgmW26HZnJ3w0CgFKGu1o842V2AKsmaCVLYtjRr8deodkKtvtpbLAB1l
	 BEPLvuLrRahuZ8yZ4hhFQJOueLxi+TpJys7JJD1MzdspYT/rdSbN/T7Hm8dPlfWAUc
	 7uiTH4lWg2NjaobkqgPiCeIXHfXmqCW+JXsiareBFSVyW/48VNkWqhb5YB0qL1QL/H
	 Mq5xrxiRn9uudLeKLrKnWbi4tz7L+Tpcplc9ihm39Uuu8R93Hk4JoreYdKqSS22u5/
	 8gzm6RHv/C0/Q==
Date: Mon, 15 Dec 2025 04:36:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
 Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
 <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
Message-Id: <176579498664.1749225.5193965875803198793.robh@kernel.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
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


On Mon, 15 Dec 2025 19:37:45 +1000, James Calligeros wrote:
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
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml:73:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


