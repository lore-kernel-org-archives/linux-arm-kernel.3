Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ADEC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWfg8OCHZwiNqDkkK48E9vc+cPo45rhMU6Y9Y5fN1E8=; b=1CRtPc6ImjhLsW+88rcjf4flAm
	ccMW2ubrebGnjrbWLyfiO9PI+Q5RDMdK+7klPK+p5qsuhpbQ3/AIDJQ4KOZyZ1N1tf/sPg4DwpCmK
	0GjYrNs8vzy8ltvExgk7bGQtmCu3yS9SJr8HMCU1daATKtw8O5VDxwyKr8SCHKeRi7MWq+QoOglgV
	tFORNgpjt0IJzAhPDiHb89GIzkf8jwUfCktIKdPxsV0IE3G1GI+j7SvszfzfmohSCmlSLq899LruA
	8PqhcfJbOgLpt7umVyJ3Jh4R7LqUhnLzqD2lcRxz6xCpJiBdnSf8ze/JleA9N3+bFgUz636/LkMve
	USr/BnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYg5G-00000001enu-3Waz;
	Mon, 07 Jul 2025 07:16:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfz7-00000001deX-1oRY;
	Mon, 07 Jul 2025 07:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E412043CEC;
	Mon,  7 Jul 2025 07:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F0DC4CEE3;
	Mon,  7 Jul 2025 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751872192;
	bh=AFV+TeABv8Zk5XboOQaVyDGMa4C8DLIZ32be/SwRorc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URk79ekVOVynmozM4nJAdmxw+sXeyVljNAqmn12VBB7z3qV30kBwHYnlTvasx7zXs
	 oGe/SaYzqePdVFBZGEsGH7Zviy+qrvKiOMiMNYQWmSKcDsMl7ANFmYa2b01ZBv9lQI
	 WSyPfoZ2Kl1dEGs1J61hQ/OMm9qdL9izv/2phoxSIdDMbu45ouWIW/HlSCN9dw5H+s
	 pWAOccOx0kqbLEg6ATcC0MMZnrFN2f8mC6GKKo5hDWqu07iBkzfaNnZ7+5JKM/KYlE
	 nrMorvOeYSowD3+s3ZgzBaE/JrUHaH+DvCxmy0tZ49LX23Q7yNxPHEylixzOVUjRML
	 PLr28mGM6+AQg==
Date: Mon, 7 Jul 2025 09:09:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: sunxi: Add NetCube Systems
 Nagami SoM and carrier board bindings
Message-ID: <20250707-vehement-daffy-worm-0cc8ee@krzk-bin>
References: <20250706183601.157523-1-lukas.schmid@netcube.li>
 <20250706183601.157523-2-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706183601.157523-2-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_000953_491977_C7E67CCB 
X-CRM114-Status: GOOD (  11.42  )
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

On Sun, Jul 06, 2025 at 08:35:54PM +0200, Lukas Schmid wrote:
> The NetCube Systems Nagami is an System on Module base on the Allwinner
> T113s SoC. It is intended to be used in low cost devices which require
> simple layouts and low BOM cost.
> 
> The NetCube Systems Nagami Basic Carrier Board is a simple carrier for the
> Nagami SoM. It is intended to serve as a simple reference design for a
> custom implementation or just evaluating the module with other peripherals
> 
> The NetCube Systems Nagami Keypad Carrier is a custom board intended to
> fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
> and Status-LED all controllable over Ethernet with PoE support.
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


