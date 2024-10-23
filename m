Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F334BD2E027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5or8R1SrbB6mXD8S1TMwtjpI4h277xLo/2s6buUgPA=; b=vVGzprudyU691jPMYS5dppaQfN
	XpPqrdk5Rtmmb4Khn9hDCEjYAdFD6pQwqIryuZMd2uR4yImWdyrRlAtT0dpmucpURcy8EC+vjsPuh
	qDxU+NFdRnpP4FlJam4J8zbpPMxWGps8TA+FGa9GANdN9pPArOEEM+bGjy4JuTW5CQtIZ1SFAW+xA
	PDZvApQWUVDxkZlIADWIzE2hGqU1Eo1YUM2BuAtiReMeuJXbEE7WuLig7WRRYDQsaulXuFdJQTmyd
	iS2lkr0qJOwFyC9Ug/0oVXH2sD3BFwLkf4j9BEwaDrsPy8yQWBvq42IajJNsfusZiKUs4M6l8pL2r
	qcA71hKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X9J-0000000DetW-3D3y;
	Wed, 23 Oct 2024 08:55:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X1X-0000000Dcz8-17Bm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 08:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A5or8R1SrbB6mXD8S1TMwtjpI4h277xLo/2s6buUgPA=; b=bBsqstYQVo4wSV0cJnwAdsxmBq
	RjHKHIi/K28gMOtb5eHu4/1avcQEO+f4SpQ57RMDICkzzdjavvrVBzFrq0R422c7+qLTcB3O71Wyi
	agIKE1qqX7DgnmFkvsda99YpI/3AlrSD0ugLLUczz/rixiQbpObYa5MHm7JZvVDVrF366bsF6zPE2
	uB1u88iY0mlVWYH5Qpj1wa6JTh8N1Cu3+26+s/Vg6daTNp+LOG2z0UWN1Lb8A1+4Qw/OL72cHD/2i
	4XUs/HnMjT0FZ8J8dICvSyHdAvpGcDGxcLzpw/+5LlCcOPqW1INlVxvrhkdSsfSh5omcX2tqFhEEA
	zBn8KK5w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X1U-00000008MML-0bNs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0C545C5ED7;
	Wed, 23 Oct 2024 08:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508BAC4CEC6;
	Wed, 23 Oct 2024 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673229;
	bh=sQCaL8wIVaWesMEl2IuBh8yvFnEYERMyZxkVskwu+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1VlbBu3skf4BjgI8ETke0TDHkMsFdd/J0wO4Ydwx65B+gLJOzbDiuhUELm3g32uA
	 wN7IdytXIswgmShGb3dH4bMatayOTP4FigLInhS4PTYUrZ8RbQcy7av5m66uxEGhPf
	 fn0nBeGeYRO6WHBBHx5llN6eO7kIz3U1auSKhO9GHS771LdLMqNQHg6JBOiP7nLjkQ
	 3itSdsZh2YwHK/wbafbyzupDM5uEfiuAxMPqabh+I0LD5Qrcs6NKOHUFeiCtcj4ViO
	 RP9Vd6gZuVSMcRICAL1Y8cwF/APmDkq7c88DMkw8xy3GTs+LIv3Odi6IfowmWGgM/e
	 MRzRzv6Sb19WA==
Date: Wed, 23 Oct 2024 10:47:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD mux function
Message-ID: <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-5-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_094720_447482_32864D65 
X-CRM114-Status: GOOD (  10.80  )
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

On Tue, Oct 22, 2024 at 05:56:48PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Document the RSVD (Reserved) mux function, used to reserve pins
> for a coprocessor not running Linux.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml     | 8 ++++++++
>  include/dt-bindings/pinctrl/stm32-pinfunc.h               | 1 +
>  2 files changed, 9 insertions(+)
> 

BTW, which *existing* SoCs use it? Aren't you adding it for the new
platform?

Best regards,
Krzysztof


