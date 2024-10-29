Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00410D3E2D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV11eMoNV00Hu3MJ+8oOZcI4Ofz5uVBV4JQmE0jdXAk=; b=0CbNhtVGrtJb+/lHTa266a6dDx
	6nJnsXdE0ECw0hoHfXCmUHxT5aTIZmBKazTHQVcZ4fDVvP4Xb5Ubb8L5UsGfWN49OV9Q+jRSBL4IN
	+Cor8bwOfTTlofdt1eXo/iSFoeg0aH5W2HbvXMshbGqGiKpWp0YmYi6F11W7l0/yTPr4S+FEDS6cu
	Z/YJzo00nqeuaAvAvcHjYkKu1ba8jFp27QSKuMPqdMXfjW91bIfq5P0OOr3UurkW4VGCSRCmcEIvm
	O82q3rcA9qB6yLFxRfjmFqeUOiXUGXjmyioEM/b2BQS+U5FnhAfvkF98vh2Ylr1u1MQWXfeLXQI7S
	A/SLF/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gve-0000000DYvP-24iq;
	Tue, 29 Oct 2024 07:46:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gr3-0000000DXal-1Atl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A96EA417DB;
	Tue, 29 Oct 2024 07:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1BAC4CECD;
	Tue, 29 Oct 2024 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730187687;
	bh=dQdoHjYKix9NxkdsPSPIypxxVG1/H8SfWBxYkXryDjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ez6nP3iqZQTsPf241ir7dtSE9lL1vmhYLvrdkYP+OCvwE3erGeV3qQ6ZU/zYjDd2M
	 jqN17iLPTy87YUwpgJdosY5TqlHxxXJKV8LW2+16UtkNl4p/bmMyKJxwm9ikEjH3Tu
	 U8OPnDoHEmL8bMgxAHQ+CjKd8lSFn2rSghtsEr3c51t9cNE8yllOahMCHi7UFXXFOa
	 Io0nCb9Io5dSOWYJIVX0BXDYbA9ztsmxl8OYBIOJzb2PXxO8arx9DdHWBNUVVxA8oe
	 Dv9YKpZ3XYwmLbfwXWantWblaQOZdaBaZsnTKGIJuei98V5QO29TfvHxP9SgWLyq85
	 b4Gxv3qclmd5w==
Date: Tue, 29 Oct 2024 08:41:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH asahi-soc/dt 01/10] dt-bindings: arm: apple: apple,pmgr:
 Add A7-A11 compatibles
Message-ID: <wpwa22u5z5hamvme7za7dqe7kjl5bap2a254w32yyqrohz235g@hk3izcckbdqn>
References: <20241029010526.42052-1-towinchenmi@gmail.com>
 <20241029010526.42052-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029010526.42052-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_004129_406973_7071CD4B 
X-CRM114-Status: GOOD (  12.61  )
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

On Tue, Oct 29, 2024 at 09:03:59AM +0800, Nick Chan wrote:
> The blocks found on Apple A7-A11 SoCs are compatible with the existing
> driver so add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> index 673277a7a224..5001f4d5a0dc 100644
> --- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
> @@ -22,6 +22,11 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - apple,s5l8960x-pmgr
> +          - apple,t7000-pmgr
> +          - apple,s8000-pmgr
> +          - apple,t8010-pmgr
> +          - apple,t8015-pmgr

Assuming you keep the existing order of entries in this file, which is
different than usually expected: alphanumeric.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


