Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6342C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tAiFAnsyrWJGE+RD+wA64ME9Lj3q0oWf2/OfXP6G3A=; b=N5R5BZeaVbvxjRwWUfIw8HzF6b
	Ysu7Trjphw+xbyh2ERlj01DkwmAeHHoNLkFe2QPq+5cp4poED4OgJvcbUNLmI7xivxVG/gM5JUrMQ
	/d50OI+dNnA+Tu1T0YZmbiz0leO/afDH3U2Ukfz2co9qAmOmBeN3j5MuRhjNgxKYS762fNEiSVkqc
	FJZ1/lFEyL7wyE5+N6cSwTvVrIE4XMgdOZZ1rcgcJ9/JpMTh10EuvFs7yleL3Ltk8qr5gDFYWGytq
	0jLHBxedeM6hL1+1hrgE0buAQZQAypdszfwT+JyAceNggp3HeSw+lGFhz1UWKyX/bD+OElWAB9pd8
	5AwvfNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJub-0000000CRUj-3cps;
	Tue, 06 May 2025 15:08:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH53-0000000BqeP-1u4J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF4AA61154;
	Tue,  6 May 2025 12:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD1FC4CEE4;
	Tue,  6 May 2025 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746533244;
	bh=kF4ClozlXaTiubCjpTTMEwshEsW50rfjVmdWRfDGDeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxf3s2km64f58FDljyrwyNDQ43gCDGgojAM4e272PJErdAA6l5da5MWROl1XuzgCQ
	 OPmYeikt5idn+iLBNg5+6ApyCfdxK5CQDfYM4Ld3WSTeo8HMCrs+g5VhehFEtitnax
	 4tQkIQ9XiMTGGa+JcQwNYeMwdirMwudx9YBMuj8OeiF0XkAxNs++bJxnGM0OLkCcRq
	 xiMYPpLA97hzrjMmcFBgeYxREFIXhgq0DzJHp8tKlMuFxOmOCXX34/+ewQF4kKzYzm
	 eNgVqB6wV997omjY+WgeOMVUG0FwxWHeHtVbtJEHuu2qr082DNj7liOgS0kUiiY9Ei
	 mawoeyzn+im3Q==
Date: Tue, 6 May 2025 07:07:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Philippe Simons <simons.philippe@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add Liontron H-A133L board
 name
Message-ID: <174653324210.611292.5461572856849949158.robh@kernel.org>
References: <20250505164729.18175-1-andre.przywara@arm.com>
 <20250505164729.18175-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505164729.18175-3-andre.przywara@arm.com>
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


On Mon, 05 May 2025 17:47:28 +0100, Andre Przywara wrote:
> The Liontron H-A133L is an industrial development board using the
> Allwinner A133 SoC.
> 
> Add its compatible name to the list of valid board names.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


