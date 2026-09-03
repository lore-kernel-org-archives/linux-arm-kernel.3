Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F15C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yKUp8+OjNQuiGydyuc88xNu/ZV5JJj7ABNvGpvioNc=; b=bYo7oHv6wsJMDi9pe/cvxCavhi
	c01Vds2+s5Tqcqyd3HnEvE6yDeKn7bZO2JmGwlYmZM4MbkFjcremRuTyH05jZHKo12cGzYaoveq5X
	yog1Pz8geVOiL1AgztN0G0HLfp2xgRVVT39CfWgHjvwUu23AwnstVHHYcAx7+Zn4TpsOcFdRDBeT4
	AUYIwYUeU/2Jx02hC2b7TzHeqloW+iLGzydouNwxqFBx2XeWxBLxfJIOmqPkS4pqysU/oyPRiJZIr
	A/iFbtKUM95Zn3DCUz4jPX/ytsPaKXBdUG0ankfqdGLZZHzZY17tYUM0P2+78X2Tj7PpM0hHtnjeM
	ED2bOTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BT0-00000000Ikz-1Ehw;
	Thu, 03 Sep 2026 17:43:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BSz-00000000Ikp-0XVM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:43:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DC84431CA;
	Thu,  3 Sep 2026 17:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162F81F000E9;
	Thu,  3 Sep 2026 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788457392;
	bh=0yKUp8+OjNQuiGydyuc88xNu/ZV5JJj7ABNvGpvioNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iG3I0jS6ZHTha1IW2rCS0eScKYZtyUujA70ocylueLet1hFh+DjLNFd956URbpOE8
	 JRSx/+luzRm0armEHasBKTtiLbokj/goAb3J9bHseVU+SwUZsUg4cxDVK+FLXM6ysh
	 m9V5qce9cvT1NR+8eKrEJipUz/L9xOG+7C6UHFGRbND3mzF+HQg7+CN8/QLPnzt+9r
	 qnjwDhQmNbXpE8M/sHGbhh2k/3uut+449wzf940H7uq0yPzsjHzzSeKWPRcINcO4rJ
	 nk0tzCVgPhYhCLx66uKLWbmdey9qzsw7fM+0WHJ4kkthz9w4S44lazpYgO3QFbh0l8
	 AmbqcadSMzJTg==
Date: Thu, 3 Sep 2026 18:43:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <20260903-magical-stopwatch-05e1a8be6fd8@spud>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SpJjSe/VbDY80SOp"
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
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

--SpJjSe/VbDY80SOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SpJjSe/VbDY80SOp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmxqgAKCRB4tDGHoIJi
0j+jAQD8wrE09OV3X86Bngo1gmedxzYJrUI0492AHQUpCyME4wD/b483lktimFdV
N+9+LIBwWe0Ngow1TyKs9btPQpBogAQ=
=fY2z
-----END PGP SIGNATURE-----

--SpJjSe/VbDY80SOp--

