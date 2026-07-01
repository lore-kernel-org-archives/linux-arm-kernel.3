Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6C1C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4PTITJeaNIkozE3meEc+/LOStBuvpZ1F0k6rTLYgIc=; b=hUJYs0zSgIvGaqHNkyuqamDGv6
	6Bgi3nMfZgmOJtIeYwU2CJX62aIhIZsc1KQB74zzFgGAUA6DOki0WLGO4scgx38GA5TAk5a81rZRC
	vMgrBi6fhWMh8CNEJ2a+6FX2UrW8RiGquoIPIvi87afh1ZywBNjPxuYtvjhJcpUgYfO6UI5T0904n
	LlmD4i/cab1EGKMTazlVW2joo/TMOKoeNcczja4EQedRm8KXfawqStkQueobfhdGbI/O7+il5G6fQ
	Zljq3HPFSjDtNclQ6Z/xeA/DgC7lPYjyAX/hLjs+fst/LJKU+QB+I4GDGFWJCRRg2xtFEw1AQ8QRm
	DFfXoxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf0gN-00000002u8T-0jUo;
	Wed, 01 Jul 2026 19:33:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf0gL-00000002u8J-1Vdp;
	Wed, 01 Jul 2026 19:33:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 20DB3436BF;
	Wed,  1 Jul 2026 19:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB78F1F00ACF;
	Wed,  1 Jul 2026 19:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782934393;
	bh=y4PTITJeaNIkozE3meEc+/LOStBuvpZ1F0k6rTLYgIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MhLYFGI/EzKuP0AVdYS4aO1EMqKxNLXd2UtHw+U00joiFOhrJAEyjvIl0cvJ6T6Qg
	 fW5ng+J7F6CL6oYjPneYixOL0SNKMctoP/Q2wnskcH0qzocOhKL93CfIH1NJlFQvaI
	 E9Mfg4QqkMhtKDhW2CxtmLPxDJQvJ19SOn5+5NJUZ4xgajSqShtMk2Q40EUfwf2CGi
	 jeOK6uIld3FhNMt6Az2A5lj0hPSwl0M0Fpti4OPF49D9Nyq9bPYBXBvUmEeZoz2sF6
	 lgHBrjryZeYyqieAhnFf60lYg8NPtmjrFnD66oSKqaK6hF0Y+GgiBlCF3EsUG7zL2M
	 ekVorbgfO2pMg==
Date: Wed, 1 Jul 2026 14:33:11 -0500
From: Rob Herring <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH 02/15] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Message-ID: <20260701193311.GA1402559-robh@kernel.org>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com>
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

On Wed, Jul 01, 2026 at 03:11:07PM +0200, Louis-Alexis Eyraud wrote:
> Regroup the MT8188 clock and system clock dt-bindings into MT8186 ones
> to ease maintainability and have common files for several currently
> supported SoC or new future ones, that have the same kind of clock
> controller design.
> 
> Note:
> The `#clock-cells` property is a required property for all compatibles
> declared in MT8188 clock and system clock dt-bindings but not in MT8186
> ones.
> To avoid ABI breakage, conditional blocks to check this requirement
> for MT8188 compatibles are added, rather than enforcing it for MT8186
> compatibles.

If the existing DTs are just wrong, then I would just make #clock-cells 
required. But please update the .dts files so the warnings don't grow.

The grouping I would do here is:

- clock controller only
- reset controller only
- both clock and reset controller

That should avoid any if/then schemas.

Rob

