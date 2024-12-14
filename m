Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC19BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAvFo4B9xeAbWfzauXAxpZ2NpPI3rl8NI6umA00zduA=; b=njZAwMJgH6w1VhqwkmH0AXfbKI
	Xxu9dNEoFqH+k+QEYeoFUwhSGDWkLMVfyAISAcgrmgKa1JyqfPDjGe4149XsNb1gWoV0vw5PedyFj
	yNDPLexP2jfcs1YgNbDi7K3w5ZfbFmUX3OGkIukulU+Q310GqyZInz40VqpJnAqsD6ivcxHpTa119
	iZooMetRKVyS+6cjAqD1ep2dr9QJpMNGp/WNwwZuNoX0/5jqDo0aVQ8dBOA26v2IsfOnMb9LWhNTS
	JL754XLSCB64bu1eF5TLUJZAKu5SFmubSLHzFyUyLLMQFuaFfbVtheyVVQX89JVo5VtDzrQdIr7I0
	mCxYwfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMUaQ-00000006bNB-3p8d;
	Sat, 14 Dec 2024 16:01:46 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMUZI-00000006b8V-3BuL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 16:00:39 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 63DBA1FA3C;
	Sat, 14 Dec 2024 17:00:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734192030;
	bh=NAvFo4B9xeAbWfzauXAxpZ2NpPI3rl8NI6umA00zduA=;
	h=Received:Received:From:To:Subject;
	b=xJYOmTSXu2e6untE2uCAon9U2SPqLIY1jbLP2oZ13DSKQyY9E7ET9X8yW0l2TKo0z
	 ral4rx6HC2bW1Y1C//mvocH/6RdlG6hK1ciZu8zggBo13q7LsB1uZL1RKDab2xeczi
	 Wg8EVCCyPQOPqMNemv5lYRE1JFzH2vFM+wkDwxuOrG3a1Ocj+Lo+HUydwi9p/j7dz5
	 85yNVa3uzsDKQPEyZmXmPUrb7kq5SjGFQIdSJsOh/dMJvDorMcOUf4oDdY3EoRsVEl
	 EIhyTlQDrM181893LOe0B2mVeKKQIbPiG/u/mjezjKQfqUYLsTVIQTQlIeP68Lbn3i
	 +twmHBxxEBDmg==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 0B7277FA6A;
	Sat, 14 Dec 2024 17:00:30 +0100 (CET)
Received: from pivi by livingston with local (Exim 4.96)
	(envelope-from <francesco@dolcini.it>)
	id 1tMUZB-00028R-2o;
	Sat, 14 Dec 2024 17:00:29 +0100
Date: Sat, 14 Dec 2024 17:00:29 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
Message-ID: <Z12rnZiCXQxtMWlf@livingston.pivistrello.it>
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_080037_836968_31D66508 
X-CRM114-Status: GOOD (  13.25  )
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

On Sun, Nov 17, 2024 at 11:34:07PM -0600, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial infrastructure needed for the AM62L. All of which can be
> found in the Technical Reference Manual (TRM) located here:
> 
>     https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
>  arch/arm64/boot/dts/ti/Makefile                  |  3 +
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
>  7 files changed, 252 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index 18f155cd06c84..b109e854879cb 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -31,6 +31,12 @@ properties:
>            - const: phytec,am62a-phycore-som
>            - const: ti,am62a7
>  
> +      - description: K3 AM62L3 SoC and Boards
> +        items:
> +          - enum:
> +              - ti,am62l3-evm
> +          - const: ti,am62l3
> +

can you clarify the differences between AM62L and AM62L3? you have a mix of names in this series. I assume that
AM62L is the SOC family / product name, while AM62L3 is a specific part number.

Francesco


