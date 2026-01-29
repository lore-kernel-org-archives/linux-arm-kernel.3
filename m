Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB0AD6B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQUa3yIiE9h92jwfxerfgsixxTe/JKCRQVLsTmIZqwY=; b=JQ7AyQWX4iOZI5sdTQznOjkPUS
	cmNjeWH19+8zlqkABUJTdvb18i8b8mOYw5+6tFz0Dock/D4ccCwB+bwhkEXCTfVmG/FGyjjtwnXWR
	sEkDw0hu6TJgNeqeGnL+TTN+BnIWt2EPD0UlHuU+YEYzq9PlVyviX5vhuxpbo6zC3qURbNYFo8GQI
	VSI4DYP4Q8gAIfyqrszx4/pl83IQIKOTy3Fr1d7Mh6QduBGbr6DfwJ7h1TJPVi/pmee30qG0tKeBo
	i3LyvZ3E07vd0O2yYzUXORe2097FL7SpdyrmEBeLucJZmfYaSQoYOwFmKBV9UsrNOmgyx+isHUp92
	a/GhgNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUiL-00000000Kde-2EJ1;
	Thu, 29 Jan 2026 16:17:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUiD-00000000KbN-3q8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B2AB44336;
	Thu, 29 Jan 2026 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540E4C116D0;
	Thu, 29 Jan 2026 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703461;
	bh=KufZgQNtbJ6Ya6x3/R6zEkba70EXrw7je3QvW4vFFRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRpxmjrrdvCr2X0JY8D+iNKWMd0TgpUAgpcjqDJdnnHCj79z3ve+YVyGWVAl+EZ4f
	 bgZ5lzWL3umobnDZm7u+tcHgD8D42LNUpP/RgTfBu/YY7YDqi+2QSezQy/3ZOqbf7j
	 qnk+YmBc76ILBd50OGuUCF8tVvlHDs2AsuwZD0yhnEA3q83wltK/weBc/WQXeahhWq
	 KdScsviIDmU9Wd2JCBzQtof7DILvMUjedsLM/VHtm71hvdEz5dMA0uo5yVzda62Heh
	 q0VfrBCl7kNNe470XTK2RMjUFgDbc0XIftaCogzb0u3Z9MbXeJd4Y5TCNzYUCuD5qx
	 twYWoHNUlcFJg==
Date: Thu, 29 Jan 2026 10:17:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	coresight@lists.linaro.org, Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Leo Yan <leo.yan@linux.dev>, Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <176970345958.1208851.15019690954593633127.robh@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_081741_967466_5445E482 
X-CRM114-Status: UNSURE (   8.55  )
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


On Fri, 23 Jan 2026 11:39:00 +0100, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


