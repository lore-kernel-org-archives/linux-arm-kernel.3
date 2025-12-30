Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F898E95A77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1snltsDxV+ytJEneWUq7yohHenCMNfAO6GgsDzcizc=; b=dMuYGX1G8c8W9yr8S9PtuXIfds
	RyuW9dI182gi2JmuL+ZVlH2+OWuRGvASmkxv5QJ9+wKciS1PoJwW755jitIJ4WNrBb09PoPJlGd0z
	erX9NZg9lyrUaOo6x8oWAt9L0otVP42vyNj/hGu39YGLrfGLETO15QHzW8x0GvWE6jZnt+/Kq7Hhp
	zGfOl0U29pDuw6CvX8gsW1EoCZI6nkamm+ivz9/E8qcNHNhm2tDg9itcx3N3n5Bs7EiW/f+9tWpeD
	PSq7WDO+491Wu2I0IhpyJaGS50oh5PxIAzdNEoEC3UxeLJpiVOIDTOwqZDhqBRZIYadsBfAsHwuhB
	WyDy9cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXxr-00000004lLy-0bmN;
	Tue, 30 Dec 2025 11:32:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXxo-00000004lLc-30Kq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 11:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2EC942DDF;
	Tue, 30 Dec 2025 11:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BCCC4CEFB;
	Tue, 30 Dec 2025 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767094351;
	bh=1wH3ZPxPRehzt76eXsHKSmF14QWef8nqajbMpVN7FTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJoVs731GixdCVTUbjmkQfw5Lom+AtRheYjXhRYYzis8E8Xo/4Ko8stdzG/yjG4ez
	 XMpXvpsvlrka/pjpmYNysfd5B6InMlFl9AKY4NUdeBXFKdN9zHlJ0yfwmu564u7VCA
	 J1dvjoUgfoSMVXQ2zsV61b/gOtz4SolDmpKEnC+RwEHtSlT0fF4kDDoU/pt+W+O45y
	 snXYpfz0Km3MUVLamraTR2M50QiOIoRvJCzyJ3/ufBkTkc4JaKS+WWSccKYp5uHEzS
	 bvfzFI+gOemVmxo9Y0XNxOmCjV4v6yMQHzpNdGeruNZOoiwVQBgTnuD9+LaPcLG0vH
	 GlamK/hBL75Xw==
Date: Tue, 30 Dec 2025 12:32:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua.mayer@jm0.eu>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Andreas Kemnade <andreas@kemnade.info>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Josua Mayer <josua@solid-run.com>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: netronix,ntxec: add reference to
 power-supply
Message-ID: <20251230-defiant-frisky-bull-95ecd0@quoll>
References: <20251227-kobo-aura-battery-v1-0-328a90ef5122@jm0.eu>
 <20251227-kobo-aura-battery-v1-2-328a90ef5122@jm0.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227-kobo-aura-battery-v1-2-328a90ef5122@jm0.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_033232_809880_FEF876E8 
X-CRM114-Status: GOOD (  11.53  )
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

On Sat, Dec 27, 2025 at 05:28:14PM +0100, Josua Mayer wrote:
> The Netronix Embedded Controller supports monitoring of battery voltage.
> 
> Voltage monitoring functionality is self-contained and requires no
> supply- or battery-specific runtime configuration.
> 
> Battery design characteristics (e.g. voltage-min-design-microvolt) are
> useful for users to understand the charge level and are commonly
> provided by a separate battery node linked with monitored-battery
> property.
> 
> Add reference to power-supply.yaml so that power-supplies and
> monitored-battery properties become available.
> 
> Further drop reg property description and replace it with maxItems 1 as
> is common for i2c devices with single bus address.
> 
> Finally replace additionalProperties with unevaluatedProperties to
> allow properties from referenced schemas.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

This does not match From address. Please use consistent identities for
both.

Best regards,
Krzysztof


