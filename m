Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABA1C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrjvOixqiCFATqeFkPccyskHJoKEDy+lHz7VLzXFwdI=; b=YETpwyqLH2m1bUlaNJElVQPC9G
	DuniTPTaZ6XLR/TIaTsqHiYDEY5geUHHw3DwoSBCNrpj3PcJ3vu+976gCSvHpOk3gSbEfoMRj39Tq
	VazZn/HJdmVN1dRLphjZQ3NElNpYooDeIEONt2PhDAlbjX1MBhPYtXz0NA9Ei1f40IfPgSJwPgZG9
	bGzPdi6opk66p3OQtijWnPH2S8yfO9Tv/PDqYjsyJTxfHTylbVIB6oxu8OWzu1bCj72xNWAKEnquQ
	s3Pf/feP+IniuKT6qTM9AosvRhYMV28R31XUJSDS3/E+234jimd/TIPXs++MyV3nRHZVB+xbeSpwU
	pygZyLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ClV-0000000AzJV-0Ifp;
	Wed, 09 Sep 2026 07:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ClU-0000000AzJ4-1kCH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:30:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7BF860207;
	Wed,  9 Sep 2026 07:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDC51F00A3D;
	Wed,  9 Sep 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939039;
	bh=FrjvOixqiCFATqeFkPccyskHJoKEDy+lHz7VLzXFwdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jLMaZVencp37Q1r8uUJTA/hlRecDZicUGWymfaHerZW7Q3Jy30jR7nn8Dk/nfwSId
	 Wm2HwOhmq+DK7uTUtJ/KhiIZw/IcXXUtXhY+fE6WQKE7IuSnjV9y6R1mbCJs/MhhHO
	 wiMSNVFj4fx2irXWPk2hvvWDIIfg7hinF2yAfKZABadnsrBSa+qAzb5St4ORzNEKRS
	 wEl7/W7t5Xkx0uBkPVEV27xfjpOxU3W0757hUmMsYPjs2/fHaGU3WB3vasXbryAuQW
	 BbpKftBOW9XZQ4RU6Tc/A3tr+viPY/DeW1fjOqvVTn+mPoynsW96nh9mFBG3YavarH
	 K2uIGllLdIPkA==
Date: Wed, 9 Sep 2026 09:30:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: cpus: Add Apple A18 Pro CPU core
 compatibles
Message-ID: <20260909-camouflaged-weightless-chameleon-caa088@quoll>
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-1-0c25401d165d@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-1-0c25401d165d@cyberchaos.dev>
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

On Fri, Sep 04, 2026 at 09:49:34PM +0200, Yureka Lilian wrote:
> Add "apple,tahiti-e" and "apple,tahiti-p" compatibles for the A18 Pro
> efficiency and performance CPU cores respectively. As with the M4 cores,
> there is no longer a generational codename, so we assign the core
> compatible based on SoC codename ("Tahiti") plus core type (E-Core /
> P-Core).
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


