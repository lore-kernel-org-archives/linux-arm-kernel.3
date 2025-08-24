Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC9CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBMwXOKWo3H5shr3lU27LMOukqdPgtvWMNq4qyPQjsk=; b=BXLAk/s8Dfm7M0emvUC2Ej2Zsq
	2Jds1cx6HlgMyVJNtLCkxvO5+djz2LhTt0SWkmNSb2MThtT6s7AShNczH8FjAkMhc5d/44Q8grnul
	Fjc5ywNgi/GuGclrFQfM+1AZYltBu4DgZcAjvi92eFZK2Kyz/G0NdSWlY7lTWBGb9fj34KSwBR90z
	a9ItsMqRDVzpjkUXsmV9DeRgiu9Y3uUDz43tuTQWyEkpbaMpspPeF5TwVDudgMm/gkkNGGtmoz77e
	GxHPOmQR9Hx3maPFiltFLS0Vys6EjA8sIcOsxEVLyvFVPX80P5uoo2tX6CkNRosynbGhWTtCIbPMU
	BfRWNj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDg6-00000006M2h-3eKz;
	Sun, 24 Aug 2025 16:34:46 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDdT-00000006LkJ-3c65
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 16:32:05 +0000
DKIM-Signature: a=rsa-sha256; bh=KBMwXOKWo3H5shr3lU27LMOukqdPgtvWMNq4qyPQjsk=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756053033; v=1; x=1756485033;
 b=ORwhDOb+RWlGUXOku+owQSOhL6+X82KxUA7Z8ZFg5fhCgmduoWGxsKTcBmv3lOTUn3v7b4cz
 nbH3hcwLCQietNt4EG2Aj3ekxB1uaV+mBb4/A8ZlvM54c4cXvpwBYRz9+XbrdxwtSxu7sFDhyWI
 eABzqalZo5qYsnrIAwDxIJzcXrK9a/v0GBCYHk2wkDqWU1kA4Dgrsqz64gM4BGV4lnWO+eZE3Dk
 9o9PpBa2l7u74pRLS4ENbH/z1gwWdmt35IKaNKtCks6/t52GoNykON5cINHmTFH18r+4fqVqvDK
 qojvQVU7GVehloturu99MMSlwA+3/5UWl5Yuxrrt1VwUA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 3921b3f8; Sun, 24 Aug 2025 18:30:33 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>
Cc: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH mmc/next 1/3] arm64: dts: samsung,coreprimevelte: add PMIC
Date: Sun, 24 Aug 2025 18:30:32 +0200
Message-ID: <4701387.LvFx2qVVIh@radijator>
In-Reply-To: <20250824110039.28258-2-balejk@matfyz.cz>
References: <20250824110039.28258-1-balejk@matfyz.cz>
 <20250824110039.28258-2-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_093204_045184_BA6B8B3B 
X-CRM114-Status: UNSURE (   6.52  )
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

On Sunday, 24 August 2025 12:53:43 Central European Summer Time Karel Balej 
wrote:
>  &twsi2 {
>  	status = "okay";
> +
> +	pmic@30 {
> +		compatible = "marvell,88pm886-a1";
> +		reg = <0x30>;
> +		interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;

Use GIC_SPI instead of 0 here.

> +		interrupt-parent = <&gic>;

Drop, root node already uses the GIC as the interrupt parent.

Regards,
--
Duje



