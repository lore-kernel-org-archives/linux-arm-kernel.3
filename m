Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F8D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqwcSwO3JBiCCsxJGHAQHaMfK3kpcQ2bm2ScoSSNakQ=; b=DqP/mPHUWOwXRa2jfE2oRDvQRu
	iIuMahQDkgui9MYlbafdwE/3M62RuOHgYLIkKNDxCixqTv3GuVx8PhQgsSaEPV1K0Dn/LuyWIIAhJ
	4riEi8SKXFYDQYCmiOp3G3U8JWnKTwQNwVBslViUFgoDJIpB5hjW8THXV3k/qWpJ7qT4SpLQqSy0F
	5g9BVgrvSFDckfxGpTGomXapdWiKDAs8XAN9kx1tOyMcVXzgYtQX+Dc9WmkOeDSjvYX43AZxlscEw
	Zt2rTMb/ZhOhVwvkAXePHqVEnrVLOn5AqFPNLPCAA8jPz8gTb0vwnNhkcTNynQ8d6TqYxZlXEsogq
	3eUgqHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ntv-0000000ATkV-3FKM;
	Fri, 08 Nov 2024 12:15:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nkp-0000000ASHK-1ELv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76C97A4261E;
	Fri,  8 Nov 2024 12:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37874C4CECD;
	Fri,  8 Nov 2024 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731067577;
	bh=k5V4h6BxNiZ+5GYsC8AtHJH1Y19abwPsT5oODrt+aKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/AHMdy9/JzZBChFnHYv2tNmzP3nyMNnbQOOIQoPba0k9deXm2DApl+QKXgIkcODQ
	 rNanJwJ79m6P7dbg7aKXjMLgEHBPiDAhIEGiOuHuo83nR6LIu436pqquVvQSK1L68+
	 uihqNx80DI4cE993ukfB3koO6d3O6L/G/4ex+R9qcsQOecrwWeWHmkc7/J+NKIhSUS
	 T7WDxS5A3kdguO+eeM99p6cyaq/NKSRZD7QGHzZwv0J4FY+gz6NJ/KUx1gKfwIOY9Q
	 PSL93Ga0y2zSKBpY4F+ZEzxk//NTuJA6wFUerc4ku1L0gL0HxiE5jardhgntx7adlI
	 ebK7SCVRHHFHA==
Date: Fri, 8 Nov 2024 13:06:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: James Cowgill <james.cowgill@blaize.com>, 
	Matt Redfearn <matthew.redfearn@blaize.com>, Neil Jones <neil.jones@blaize.com>, 
	"robh@kernel.org" <robh@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, 
	"rafal@milecki.pl" <rafal@milecki.pl>, "andersson@kernel.org" <andersson@kernel.org>, 
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "nm@ti.com" <nm@ti.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"johan+linaro@kernel.org" <johan+linaro@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: Add Blaize vendor prefix
Message-ID: <bxihsbvuj5yvasexkcjjlyz6q2uiotfsh2utwkcogkww33cgpy@wk2dbb5yhnzc>
References: <20241108103120.9955-1-nikolaos.pasaloukos@blaize.com>
 <20241108103120.9955-2-nikolaos.pasaloukos@blaize.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108103120.9955-2-nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_040619_429400_F65B7243 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, Nov 08, 2024 at 10:31:55AM +0000, Niko Pasaloukos wrote:
> Blaize, Inc. (www.blaize.com) is a SoC manufacturer with integrated
> programmable Graph-Streaming-Processors for AI and ML.
> 
> Resolves: PESW-2604
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

This has checkpatch issues. Your patches claim to ignore them
intentionally: sorry that's not accepted.

The checkpatch error you have here is very odd and points to
misconfigured system. You must fix it.

Best regards,
Krzysztof


