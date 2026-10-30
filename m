Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F7606C6D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FEEJGXW9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikPeZdZ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0taBla6Au0NPXTfxydAuOM5k4uhyp86nch5CdGgj+dY=; b=FEEJGXW9ghLNkmGwrEg3qUGNDz
	4ww63OmJ6nilRNr+i5YNR+hTNniQheiwzLwqJXs974o4rfFFPXMCT6fcXR1zX+7cx7rGiAIBBQqtJ
	QfeVfZdygOk8HxyYLTBNKZQ6ruLYu/YiQsFBpCNq/OQGjOFdDuk9L08leP9WjI0H6PaVYAKtTE93g
	+f0g/xHHTyO79fxARoyTg/95ENUD39T335aMeQB3dUIghuucak9BRYI/K1FwKBWJ+DRRbTTLhN733
	peS5zgtpDeWoJt+OXBWOyIojXbYjt+U62mFVtpZwmsNzt8kPrDI9VAnNDkqz44UZLqQOoxnt7P06l
	Z3GghYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkEe-0000000BSdA-39Wm;
	Fri, 30 Oct 2026 10:53:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkEd-0000000BScq-1gzf;
	Fri, 30 Oct 2026 10:53:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D548605C9;
	Fri, 30 Oct 2026 10:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD66E1F000C1;
	Fri, 30 Oct 2026 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357601;
	bh=0taBla6Au0NPXTfxydAuOM5k4uhyp86nch5CdGgj+dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikPeZdZ0w7So+JoNXmdih6mg/9/PKY9qx672IcmqqNXaKkdadPL6ZxS+bUVgkLb+g
	 wwW+ewMWIuO1keIPlmWubacwdfEF1KNxPMMFXb2CbculHYztB50R8K/OCXDHWpzKC/
	 yWEkqN7YMMDRXgE13Q+X9rFAuJYOijcgrTH3bd93a8v4dTTSBqyDEAtSDwS7ghBH2q
	 pQMIe8rLvz0ZuxrFcY+/qAFSu1aXgA+xzxAQLKwzOJkEHcljmbN4h+haNF0YyjUxbu
	 pV93aIdYmOkGLWQwPBdcGDvccs6Cfe12NLhdogAisppAIQepRFD20c+Aew7XeRDUQs
	 PXU+MBNmKp53Q==
Date: Fri, 30 Oct 2026 11:53:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chris Morgan <macromorgan@hotmail.com>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Coia Prant <coiaprant@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hrushiraj Gandhi <hrushirajg23@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Message-ID: <20261030-loyal-bizarre-stingray-4f67cd@quoll>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
 <20261029082541.469999-2-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029082541.469999-2-liujianfeng1994@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 04:25:20PM +0800, Jianfeng Liu wrote:
> ArmSoM purchased the CoolPi 4B hardware design from CoolPi and confirmed
> that the Sige7s uses it without hardware modifications.
> 
> Document armsom,sige7s with coolpi,pi-4b as a fallback to reflect this
> hardware compatibility. Keep a distinct board compatible so that the
> rebranded product can be identified as an ArmSoM Sige7s.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


