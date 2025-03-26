Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC948C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKOd4j1t74rlaXbctW4uta67o0YN3LITaSJsnrWbc38=; b=z5lbZnRVfLq6R+jB+GdSdGWjLp
	Y7ydlMB7IP54LUkCogT3bPvfr+EMC9xTTCo4/gAQD901z77GsONi8joaEbYoz6FAr9q8KXUn4h2g9
	bXGLBLbIOvNErGmr/zVOOr1OMuTfNiEOPZmwyof3IJTzKKglL4qL+0aj2UmzaJI5Ijz5tPL8kmIJJ
	fvFRMca9K2oDqlu4C7o/RSBqvLu5Ji/qG1Za4NFCZIOuE4OC3EuXGO0FNHLyJPvLmlK1NeHFmaMsS
	zVZ380a2GjfQjsOu3/jxsOFLy5Y9xwc3DEFacUKXY8l3aZf/+ffKVGfqyM/YpWOF3DgR58FUlu3OR
	I2tvoN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLYS-00000007pTh-3IWQ;
	Wed, 26 Mar 2025 07:52:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLOf-00000007oRT-2Wf5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E6A66112F;
	Wed, 26 Mar 2025 07:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B77C4CEE2;
	Wed, 26 Mar 2025 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742974916;
	bh=rKOd4j1t74rlaXbctW4uta67o0YN3LITaSJsnrWbc38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TIxxlW39PQQqRFZ4v6Bj1eF/al7IN+zt+cDy8kyspl19eOj5XLtOWj7htTrZvJi7N
	 aE/lZxGA5EszkpdfxtD7k11lkvQr0g1/+J5jyoSLYKE0SxCLAOgIqXCMc7PrGMHnyB
	 yt8cwzZlBn5XrPmDoDGZCsZyNlEMWIc4778LGMVRPvPvxSe0jFUTZbqNgor+n4RRMB
	 fSnHnc767b/nUtVW34ZGg6ZuXCh51oo0Zh/154dZ4KqAcKearMCt2mngjjhBSDBT/q
	 1wnNxzRgObQErJrhcEo9fAXP7ViDzhvuBamqptBTFLN1m9/eaXt1Ncmd1td6FUaKmC
	 r48TymtjCPb8A==
Date: Wed, 26 Mar 2025 08:41:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
Message-ID: <20250326-lumpy-spry-alpaca-ce087c@krzk-bin>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
 <20250325110409.2323611-4-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250325110409.2323611-4-goran.radni@gmail.com>
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

On Tue, Mar 25, 2025 at 12:04:07PM +0100, Goran Ra=C4=91enovi=C4=87 wrote:
> From: Goran Ra=C4=91enovi=C4=87 <gradenovic@ultratronik.de>
>=20
> Add support for Ultratronik's stm32mp157c fly board. This board embeds
> a STM32MP157c SOC and 1GB of DDR3. Several connections are available on
> this boards: 2*USB2.0, 1*USB2.0 MiniUSB, Debug UART, 1*UART, 1*USART,
> SDcard, RJ45, ...
>=20
> This patch enables basic support for a kernel boot - SD-card or eMMC.
>=20
> Signed-off-by: Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>

All patches seem to have same issue....

Best regards,
Krzysztof


