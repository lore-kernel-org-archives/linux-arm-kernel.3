Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFC7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uVpYxLKgfz2XvbYZoJ8wzUbrjvZJR0Y4MBIqOJj0J0=; b=AKWPpE8Qa7875oV04vCMoS7aZI
	mtepconEaHB3fKY/fLJ3f8up4oIdnhjBYFhrbwnnntRo24myzRZ5S4ctAWdGBx8YfVCpf9BzRhGVy
	VkFgpAa/Xc1opm6viDUMt47/GFdwMIcDeyMn00oR9CiolBOJLmVIaya08B7Gx7aED+rAYWCY1HEeB
	Vew/NPiGTr7/N46W8sXKYIbfK69WgRecsOPDqpNMhVbLeScXDCBqMLGZTadD6QdDcNYA9ZNMCZI/V
	k7mLz0SVPDtTGMMh7JJb348Y49RYOctjfpMGCaQnNsra7NAnSIAiOUmfRlmOOYOALWxBMrEzpoion
	p5/TcCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFiI-0000000CitM-2k38;
	Wed, 10 Sep 2025 07:57:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFiF-0000000Cirz-1VjI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05FC54078A;
	Wed, 10 Sep 2025 07:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41744C4CEF0;
	Wed, 10 Sep 2025 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757491074;
	bh=6uVpYxLKgfz2XvbYZoJ8wzUbrjvZJR0Y4MBIqOJj0J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQ+7M+e8mrS/qUabUDxQGA+IrOlNrJ/W1e/kVNdL2rEOx9xwy5R0VZYrC5aKWmoN0
	 CFlRAkOhoJl0/qGhK75yDnQ1nmMpzrHL05fQvr8Ex6EA1HFx2t3MRamt8EcGv0wzbE
	 zsB8nSvKD+dQ7hyH6b2v/bs3POgOGyWqDgOlmRFbinttriUvWAUYF5hwLoVS5kUtI+
	 c6/hrqv5mVWzzmHUaTwalsO5jeGyG9DS4AFuJQHLVYQK1D+gCZ3bZYqIdEXA5hj/Dk
	 mJxUw5rUzCSLkV4Ayzz4Mi+U+N6J8JDprluIx8uja7fPPNfuE/9FvgKzGiPW1/OzV1
	 6wGhQ70VBn9xw==
Date: Wed, 10 Sep 2025 09:57:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Julius Werner <jwerner@chromium.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v6 12/20] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
Message-ID: <20250910-encouraging-masterful-dodo-3d1f60@kuoka>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_005755_417770_F517D9C0 
X-CRM114-Status: UNSURE (   8.86  )
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

On Tue, Sep 09, 2025 at 12:12:19PM +0200, Cl=C3=A9ment Le Goffic wrote:
> From: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
>=20
> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
> It allows to monitor DDR events that come from the DDR Controller
> such as read or write events.

Also:

A nit, subject: drop second/last, redundant "dt-bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/=
bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


