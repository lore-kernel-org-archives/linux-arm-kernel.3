Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71338FA0C43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blQXLrH99zxyJOFK8ecf6YpeMuev91vFywVImvzQUJE=; b=wQLkelb0wSIYCP6MsJfQFSm00F
	pb9QCHa3qd/syJ8nEBawEZsNpGJqIykFcn+hiYNSDdLrQrHhRHJsxxJ2vuN4HEXPOy/sQW2/ohTwp
	ma6sV07Z33QfprwJkvXG5FBJjxMRlzKeANDe1eDeJ+h/fFc+AKzQT83jbWqiuvXS0r2BOL4NoztEJ
	zG0fiHoH1rT5ortzMkIdaO2XYI4ZTJTOIL6FNg34qH1dcOdHbJg7KK/woGC5YnkieoxzST7rpu1X7
	EtgkFyJtS6RayCDadY2bBpc3l77evHXAFpmoImCzeAhasNYsG0c5ck0akTRLZcEZg4g+bEGG6Drwd
	4/eDGouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvJ0-00000000m8C-1uIC;
	Wed, 15 Apr 2026 08:09:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvIy-00000000m7l-2mrQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:09:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EDA543496;
	Wed, 15 Apr 2026 08:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E2BC19424;
	Wed, 15 Apr 2026 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240539;
	bh=qxOZedtYcvkdoQo17b3imz7pKUeW7wVqZFt3XuP05CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzga3cRhoIX/Xy6fevqw3Rh4JU7ZxJipK2MYLlSdC+lkmxw3xJhI2AlQfgfJxHtsu
	 TgE1gupgZ7koYlzsPqyD1oLTGECB31u/hPXcr02HieRaUQldTxxYQtogHDDiHkKB5C
	 HLGg935+d9dHpPaNezB2qKJBw5kHthR341bY/78yjxJOGpPhbYygYElHABO9qfOzzu
	 cT8CCz4eFvjvMeI5K5uUev5MUEEvSU3qeuKH3GqKeA8lLIw8Ad2VMJ6xZRdMMxmi7r
	 kIewpcXLwa0RfPos8r8JXB0uDoSpx08pSrlsWtiAZN/8/mWkBK2fernq60bbYiXf38
	 EXuEsAq6imbtA==
Date: Wed, 15 Apr 2026 10:08:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: Re: [PATCH 1/4] dt-bindings: clock: marvell,pxa1908: Add #reset-cells
Message-ID: <20260415-electric-gay-armadillo-4d67dc@quoll>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
 <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_010900_722951_D9699625 
X-CRM114-Status: UNSURE (   9.03  )
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

On Tue, Apr 14, 2026 at 09:51:50PM +0200, Duje Mihanovi=C4=87 wrote:
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20
> The APBC and APBCP controllers have reset lines exposed. Give them
> a #reset-cells so that they may be used as reset controllers.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++++++++-=
------
>  1 file changed, 24 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


