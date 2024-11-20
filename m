Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E37D6E2DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hoz2rjJPiJI28RwPRedme3YnclaiihMgxotq/IbOaYQ=; b=zEKkcBqKgrF5P5CChDWpSCpeMb
	UA0DyiqhsFOOdnrBDGOs+yg2TB2/oYx0yKuwD3Z5CjmaOTEqZT9GeH9WXYKbHaEq2/RmvmhFC3xob
	7JoCsSZNDfzvVJAlJU47Xh7N0ZabqZtzO9EEumj1UX3GjnjdoiSGK3Vhyyy1EYNCxaZejDeoEG8sJ
	bJP3MNxlUCGErUrnShDLVulDQ3DUYFx5n07ZgUHTQL7/MVq/x0IuGJvcQbYbReWo/WJk66pnisLiL
	R0vThsdVia/ADsx+aQkA2PfABtXkS9xkLSm0Od511a0HLIqgmyqGdiKLXYGHuHY3fjRKpbcZXjjO/
	mg6Mkwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgM8-0000000Enk0-3rt2;
	Wed, 20 Nov 2024 08:46:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgLD-0000000EnfQ-2bgm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 147F45C4E71;
	Wed, 20 Nov 2024 08:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B2CC4CECD;
	Wed, 20 Nov 2024 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732092338;
	bh=o708dW0zpekdr4qHK55sfqdl8wG5Nu/+g3DIktqbevs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENQOLDc9QlSnqdhpi5D3zXCMMfPjp+W242ba0E8V20RP4FD0uAEbL1XjgeTcXw5rR
	 ZMp+mkKdTDwaJb+uuhLbkI46ajEPAR0PxWOa1Y9DBLiZwYLDxmgm3aVHjRuUJgJ6cZ
	 HH0Y146jPZ/3JXkBZq00o7riCQaKfAlKMv/kealJDq7YwCkng/jvMRZwe00H5ALxcy
	 q4XVXfT7XYRXqF7hWjeRbsKFRWXxNAxv1eQduNpqx7Qv2G0DjLSEMSEDUoXKvGrKNo
	 ob7Yi6O+uC6vp4o+QggxaLzv+gAUjuy8A39xd2Ji1AdUisDBgDv/9cnXcugH6FL4bH
	 bw3j4mq4W04WA==
Date: Wed, 20 Nov 2024 09:45:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH 4/6] dt-bindings: arm: stm32: add compatible strings for
 Linux Automation LXA TAC gen 3
Message-ID: <4t2tmuntv24lffk3ikgbsz7tbvkqosmd2xwurnzvk346daah22@wegcc3wreqpr>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
 <20241119-lxa-tac-gen3-v1-4-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241119-lxa-tac-gen3-v1-4-e0ab0a369372@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_004539_704781_76EEB7DF 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Nov 19, 2024 at 12:35:01PM +0100, Marc Kleine-Budde wrote:
> From: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
>=20
> The Linux Automation LXA TAC generation 3 is built around an
> OSD32MP153x SiP with CPU, RAM, PMIC, Oscillator and EEPROM.
>=20
> LXA TACs are a development tool for embedded devices with a focus on
> embedded Linux devices.
>=20
> Add compatible for the generation 3 based on the STM32MP153c.
>=20
> Signed-off-by: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


