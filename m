Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C61C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqS5xprZ1U5Arbi7YgzpA2BfebN8jEZgfl8jpD4S1Wk=; b=MitPfb16i5XcFUOErIwGjKt/Ie
	lg9kgVJIFWSkTE7QWyjeERucCo9qbTkBNw6dkYqSOBnBPz7j6s3NzbmelZws1rL3cZ9dQ5MVRFe10
	bCLhwbt7hYo7a66iIDIyNes9xm0qiB0FE/5qZDCdhpwVSDTVbPvZXLGNa4KSMnhVINMW9jX+jiX6h
	UZJ2dl1q89HEOg6+yruEIyxYOrQwx2VaSateBYeZXlnXEKxmU1dEX0y6TrVQmU26o6FKY96+xPOI/
	1L8FssE8LTbukSSsQlOTiYn8EN0ozsrGdC9oaPowKbkY6WY1JWnvQkpZSsFZzRLg9jCTDD3VCZmW/
	YoT+n2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzscJ-00000005PFs-3Srs;
	Fri, 28 Aug 2026 09:11:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzscI-00000005PFg-12go;
	Fri, 28 Aug 2026 09:11:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F645601FF;
	Fri, 28 Aug 2026 09:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB831F000E9;
	Fri, 28 Aug 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908277;
	bh=oqS5xprZ1U5Arbi7YgzpA2BfebN8jEZgfl8jpD4S1Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EjXDMy0BUaJF6KpLrd5Rotxp/xOauthE6dyLWOxY3IuHpFOv2nJret1pflBEH6x3p
	 9AaTMXtAIsMHM0rA1W/IBvRYOywj0iFWcN9D1OLt0BcH1TPUE9vdsURAg85HXIrolq
	 DKUMkryLBZte5PEu7MII7XUi0ufjdl7WdZ3/1vE6IdUMFtu17nM7tdRYQHEX7aRrD+
	 zOkutv8sqNbUZTYZxM4nrO0caaDLSxT4r0x/dZXzA9GlUyPemI2NaPesg/ULddTVR8
	 jIQoJNOSCN1+qj/lpciftdAbctGKJVvI3KCxHGCX9KXjIbCMrU4WEdG6GsIGMM1JsA
	 SE3Jgrtd+AOtQ==
Date: Fri, 28 Aug 2026 11:11:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20260828-sepia-vulture-of-glamour-ef861f@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-2-marex@nabladev.com>
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

On Sat, Aug 22, 2026 at 09:46:34AM +0200, Marek Vasut wrote:
> +  resets:
> +    maxItems: 1
> +
> +  vdd33-supply:
> +    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - "#phy-cells"

reg should be required, usually. If it is not, please explain why in the
commit msg.

Best regards,
Krzysztof


