Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E6CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBcYAWTLdVkrLU3Ay8+KUQNGx/0mRX8IDoYXQd1xcD4=; b=yFpbMJIEMlN5IhplzS9chNduQP
	dHRbXjL7KgFFdHjebPzNImhEOadFbZ7GGBQuQz4AUKt5maXTiqblQL2RfYLY8AIBsg/X22IoQ9csR
	aCMoMGf5Jg5QCxgI/5z3ZJKI1eeDcqpL0bIianuJhRT2v+O5QvTARtH4ZNe+bmApY2tkPAZzteajk
	f4xKK4Y/9plc5xmxX5Znmx6R7Sm5yzcFMa9xSRPA05I7w43znJ4sgZ9qyQRVz+vF7qc9HmlvS5/27
	Kg+lwsCyGJKbcc/VzAepniczBvQvmaMwtRTABKIyweF05QUFz4IvTTK+K9C941xMxl1M/X2Vxea9c
	W5JKjFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfjb-0000000ABHB-3Jn6;
	Wed, 08 Jan 2025 23:45:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfiC-0000000AB7E-0kNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 23:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E44C55C541B;
	Wed,  8 Jan 2025 23:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63875C4CED3;
	Wed,  8 Jan 2025 23:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736379782;
	bh=s4LvSNjHxIP96RzfdWGBTy4l/TRP9WawToXBJ3jEbDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYbEEhm1CFBpKOF7XnweDcLAexyqeuTzkSHkQExDipKQUUT8VqGRxtVRR4dh0wNzJ
	 +sdP3Kpo/GvGYKkMtl4NPRFmhDVaRlLh8KOW1lQaM5fyt3gOqXEalHIYuhCUQ9FBoY
	 WrIHnWX9FMf4cpRnH55Lwo8akkfr+n7jiarjTG4viRX93g9VY4Fl2kv/hstGRv9dY5
	 SBogs/jPPHr6sfa4Ibq0awgNNOEyTxvj7xqN1FReEhTBKgomCG+sk/ojFLE+U+YSX8
	 qM17op01B0H02HLbCp/zw7IteLZmUV9FmdzVNM/o1Qgjt/x1/sJr22ceBIahG4BaiF
	 Hy9aEoCXOGQLg==
Date: Wed, 8 Jan 2025 17:43:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-pm@vger.kernel.org, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org, lukasz.luba@arm.com,
	mturquette@baylibre.com, ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org, geert+renesas@glider.be,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	rui.zhang@intel.com, p.zabel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, daniel.lezcano@linaro.org,
	sboyd@kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: thermal: r9a08g045-tsu: Document the
 TSU unit
Message-ID: <173637978084.1245245.17902878993210680410.robh@kernel.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-4-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103163805.1775705-4-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_154344_254762_583CDFAC 
X-CRM114-Status: GOOD (  10.59  )
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


On Fri, 03 Jan 2025 18:38:02 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The temperature is measured using
> the RZ/G3S ADC, with a dedicated ADC channel directly connected to the TSU.
> Add documentation for it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  .../thermal/renesas,r9a08g045-tsu.yaml        | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


