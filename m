Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFC8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 02:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmCLUNM+2cvo5GK+/crFi2DzX7qdJydKHfg3F9Tkit4=; b=GQRgnHXG3VwPEX5TMEMSsMVB5B
	BVFjj/ukRAUClHv52vMwHPfoKlyo09bawmAOl7LpavmU4APmMguppzFKBFR3gqUWj5lx0Qz3FOe9G
	F0qDIApSBdeRD5LJRyY0OtPz8cS/FDJYgFE1sRaD2aL092XwZDrZVtrMdvGRkhsME/whIeFiTsGbd
	iSDYCKHpNB/qVoE6vaQ3Bvo/6ifJ1cTlviKatzBqzbAMziwJ/spY666mX3arHq3itqH1yUlomgrJE
	B0ilfaWFzVa/1NS+VJw/JXi7aUpSYVRNzDMdY2GOqWv6nl8mHHNMzBl/uQEeezkRExh0xjZyFJpAx
	zzwaa6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLp7-00000006XWK-0YHW;
	Tue, 16 Sep 2025 02:53:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLp4-00000006XVn-1rXU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 02:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99C9443910;
	Tue, 16 Sep 2025 02:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E83C4CEF1;
	Tue, 16 Sep 2025 02:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757991217;
	bh=xx6069vxbPWWst0kLZZTmFi0B3ZWje2/BYqnoV1KdqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V34EYvJBq4WNZpwD2nlhqLaSNRVFOPAymXcnoZD3mZBPYAlBzFQaTyy5huOkWptJD
	 RKXlPtuaU9wtX7zbqoXAULqXO1r02Uq4GKDQcW2DD/rTjIrIWQBr5tYxTjbdCtLYy6
	 hZgCgOxrm0FgzT4OC5LGHrs+628L1NssKVJzBLv6i+lohJAVqHVMwN3aoB242TM7mo
	 qg9hwbglm5X12cRjKhez/OrIThGc4l41weobr5jMDVZj2qMfCaLfeWXsbxLkwmmHuh
	 Q3G9vjzjH388JEco0AkC1lwJTJ6GrVd0vPavh7O4iUfapuT5OYxWTirzINUFGVHbUA
	 4CwkP/M/jiBYg==
Date: Mon, 15 Sep 2025 21:53:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: pinctrl: pinctrl-single: add
 ti,am62l-padconf compatible
Message-ID: <175799121579.3582107.882281471207864281.robh@kernel.org>
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
 <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_195338_502015_4A656A8D 
X-CRM114-Status: GOOD (  11.28  )
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


On Fri, 12 Sep 2025 10:40:41 -0500, Bryan Brattlof wrote:
> Add the "ti,am62l-padconf" compatible to allow for some changes in the
> driver in the future when needed.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


