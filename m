Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W67eMTfc1EUhyH5LMz7dYtNTmFg2IWl15wR2G9kYiv4=; b=sGmWPs04vUmL9QEywtNfxnJAAX
	6H2CnrdO7dlMpolimo7kVVXOyCKL4WZkreVIUDBLsRlCQv5SpKMDOEU0Nc0bQkkPFkAtvloLA+wqZ
	E1QAxxHW76fvJgzH/4w3StJjerOQ+EV4wjtWMD27E1wO7tDIH9WI13M+CGQjfA3o/YWDbeI07N/ug
	NB7nswhJNaO0HXnpjJugOIzgpqkTVaVX1zZ3MC1fCEXCpHohDHjN2zyc8F4ljXAKSSGMQFjblpJWG
	Q7RXpIzZcM5ZqfKvZfN4uWdd+/WwsExs2Psps8hc2DITRZk5y7PogEbhN6CIUN4Dt6pa7aZiYJHVS
	AIqzg3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzXz-000000082nt-13Kz;
	Fri, 12 Sep 2025 08:54:23 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzXw-000000082nT-1eKz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:54:21 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1B21F240028
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 10:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757667258; bh=W67eMTfc1EUhyH5LMz7dYtNTmFg2IWl15wR2G9kYiv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Sh8J6B20oeFAmAXTBpqgLBSt7FFx/2/8zXOrMBeAoq1HBFYvMp2N+aC7ZbNzjpUjy
	 XL3WBAs25prAIJQ7U5+1YJG3SR4KCK2NJQ+lmoDJmTTtW0ZITxBov8ju8S83fQoh9m
	 DNKrgRWGo/WHjznAma7cmJ6SY75y8jWqejKxiyznFfACwSCNhASXmUxTUX3R074xow
	 5jAfUj2LT38i63kDwL1TlrRUuhssWtI562Fp9lmCcAtlCmlV2ePOXw5FBLuvzg5XLz
	 BY+p/h7tDsYgKsbj+G/wahm94chil8ZE8eyQRYPd8YXUn8xNeWzxfAbXEVLcBXep9k
	 ieF+ij21BNHlA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cNSsL4ymLz6v12;
	Fri, 12 Sep 2025 10:54:14 +0200 (CEST)
Date: Fri, 12 Sep 2025 08:54:15 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
Message-ID: <aMPftsaf4x61-bGY@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912-x96q-v1-2-8471daaf39db@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912-x96q-v1-2-8471daaf39db@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015420_579629_0AB80C1E 
X-CRM114-Status: UNSURE (   8.99  )
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

On Fri, Sep 12, 2025 at 01:52:10AM +0200, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> output, and infrared input.
> 
>   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
[...]
> +&gpu {
> +	mali-supply = <&reg_dcdcc>;
> +	status = "okay";
> +};

Note for v2: The GPU gets stuck in probe deferral, and I forgot to
investigate why.

