Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E71FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75/Y50MbWPH99fdFEghjslLxRAkqFAeRqL6IT6jnU+E=; b=EOTWON1AodL9UVDG+KBcc42u++
	avQAjv9yiy5MrDcZGEsSpCXEf6aGzJcz8Vat3btKVnq1kCb95OdFtT3uE1x1WG1Qc1CYadAYzYZC6
	to/W6fQw6HAKp+YRAT3PJLG0J0q41WHVizK/Y1rWKlGT7MTz6VWBhkAvXslRgbgHTntXxJ0mMeed0
	VgDzY4kOQBsVKTJiMI5+tUmgHPyyGDLwKThcY4oo3T7BiPBJd/uQyPvxgupmPx3Agz3GbGf5wXQu3
	AC77qqnMBpdf2U1KLx80E6qQ5JxfCGzYJpWzlB6x4lK/vDj9m7+r8tE21Q3HPuJHDtNEQ0qcKn5Ic
	PQllZ3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUBQ-0000000ACai-2Mnq;
	Thu, 13 Feb 2025 08:02:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU6L-0000000ABdR-3fUK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0C445C4D0E;
	Thu, 13 Feb 2025 07:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563A1C4CEE6;
	Thu, 13 Feb 2025 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739433457;
	bh=zAmZ9xhiq8AXtyaFiGG3zq+eLh9vDaybujcV5FJePmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YuCe6YmMraQeOLhCTzFKEp7FsiwxtYMnMqqqQczqDqPoZfQIIGYw4rWgT0XHnefHM
	 uJzMxTRF7rAdEDhsQhWUbnHzUfwhexTt1bQ6gI5sQc4FBDcS9znLTeOlbpNP6mo/qv
	 HGb5lJI4iw3u/dplus1e1lwAb103VFGxntzBF08kjwymvR+NLO4Vv7OCuIbGdObrYH
	 kArN1GuZWIP20JbAanqGNj13PEcqHyMs/NWgKXTZ+JKiMSx9fvm5KBbuTiDE4Gx871
	 4yJNcxl8388GkxH5MCTOJiW1ouB4Sg57ojJIfHQZUsUfvv9KYzLFFYYFuxf3A30i2s
	 85XLrVRZt02lw==
Date: Thu, 13 Feb 2025 08:57:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, christophe.kerello@foss.st.com
Subject: Re: [PATCH v3 1/8] dt-bindings: spi: Add STM32 OSPI controller
Message-ID: <20250213-tuscan-coot-of-enrichment-5ae952@krzk-bin>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250210131826.220318-2-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_235737_953713_A912E3BB 
X-CRM114-Status: UNSURE (   7.53  )
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

On Mon, Feb 10, 2025 at 02:18:19PM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Add device tree bindings for the STM32 OSPI controller.
>=20
> Main features of the Octo-SPI controller :
>   - support sNOR / sNAND / HyperRAM=E2=84=A2 and HyperFlash=E2=84=A2 devi=
ces.
>   - Three functional modes: indirect, automatic-status polling,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


