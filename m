Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE28DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFw07fr2ZHTHQ1OxZdHWHwwKYf6d287kHSdQtvQ/Umw=; b=RDrEYGu5R4UP06+JyUIaMn89FP
	e/UdxJBAcxKmQKTNiWn9CuHrUbh/1AstJHo4gb0EWVXwVQEfPCBU1crk0eYME0Nd/xcSXnAmZSq7q
	hd6YNANClDg+Lusw3sDplie1lPPBO/y2s+N6EV4ye6pxtOhYCdjw9wWd0K/j093oTXDKHaAfZhsV1
	KfcovA/o4v2P7xaFLPiv6qaadyGg/Xausnhr9ziBVim45fehDRGJbfm4GWfk9YgoIrpxmKbYT7IFQ
	RCiOLOFB3IqcAbHJK4Qhb82RvDEoTPd5na5l6LO+XsmcD45A9wDjyNo8r9wL+em/cBflCYdiqFhgy
	H3Eb3Odg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeLE-0000000HG9B-1CHz;
	Thu, 12 Dec 2024 08:14:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeKB-0000000HG37-1UfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BB975C5AFD;
	Thu, 12 Dec 2024 08:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DBBC4CECE;
	Thu, 12 Dec 2024 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733991210;
	bh=yFRZ+IH3VruDCKluh2Mfy3YvjHuvC7u/oBOqXdHG/UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X403YC3nzX85sUU0gMsuEEhNCgIEXOUpGQE5pbSXbWlnTW9NCHbM8Q3f9cGjpt+hA
	 6Y0s/H8FcFTkbkCLs3YHflvhtK8mzxgctedejqkte9rAG9l195yutRCvrB07H/1szj
	 MzwgVw8v+V34GvVlDRYINKQRhxlICRxQ/LPaCE19SlwBah4IFu/Dvp3ceFu4tVsTYk
	 IsyjI5WujSg7PLnlEPJVoZDu33oE6xjyVdqhXbFdKzpb8PS4LZmhktymYDJPtgF/3a
	 DFSFEWTPpsPCAH2wrAFpSFXRgFSjQeTuVIUunj7PaQ4qY1R/9VNZPoRkx0yWHb67Fc
	 X86sGlmel0fiA==
Date: Thu, 12 Dec 2024 09:13:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 Apple DWI backlight
Message-ID: <6fazyksxkcbhugivwgozuyjdig37vnshbwtdmzjcbrqywgszvd@sm27uhqgsma4>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001331_437963_887E21D3 
X-CRM114-Status: UNSURE (   8.76  )
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

On Wed, Dec 11, 2024 at 07:34:37PM +0800, Nick Chan wrote:
> Add backlight controllers attached via Apple DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


