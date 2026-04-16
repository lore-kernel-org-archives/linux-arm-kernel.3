Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3091F8A15F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEhhMsJS+Xwg5OcJOdGV8rtWdnWqs6FYlhVDF1VB5bs=; b=Ts4ePgGzxOtaJBByy0hik66/Is
	mnSvzgxLKXM6zkDArmMStCp9CVnlI9Vn7sz/aUQTfZ2Tm+jXL5xBGV/E57CcW2apA57htv85sMc3E
	2lsEzxjAXUktyduNfNzKBpTgkhS8NZeQrgFJAvZsaQn7fiZE2fBHhO8P0uwkXEK4XPONBYLT3oqXd
	JMP9RbU7FcKNLI0WvOVyNk7EvJ/ngYkqzFGfpXtAN6fSA9iz1CvosTA/YWaagV0DeEpfQJjI/B/4H
	slBM1Pzg/slYk+SwMNQFRMMU6g+CwPC943lNC8bOtzS4I4ALB1FwaqcDj+BU97a4DFCsTsAS1OOKi
	c1Eh9LhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDL6K-00000002Ok8-3u2Z;
	Thu, 16 Apr 2026 11:41:40 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDL6J-00000002Ojj-09Nl;
	Thu, 16 Apr 2026 11:41:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wDL65-000000001iW-004L;
	Thu, 16 Apr 2026 11:41:25 +0000
Date: Thu, 16 Apr 2026 12:41:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: sound: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <aeDK4Ta4BJEQ-7eA@makrotopia.org>
References: <cover.1776265610.git.daniel@makrotopia.org>
 <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>
 <20260416-qualified-violet-salmon-4bec7e@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-qualified-violet-salmon-4bec7e@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_044139_098005_C4413691 
X-CRM114-Status: GOOD (  12.12  )
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

On Thu, Apr 16, 2026 at 11:38:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 04:23:27PM +0100, Daniel Golle wrote:
> > Document four additional optional clocks feeding the HDMI audio
> > output path on MT2701 and MT7623N: the HADDS2 PLL (root of the
> 
> There is no MT7623N compatible in this file, so that's confusing. Does
> mt7622 have it? If not, then it should be restricted per variant. If
> yet, the model name is confusing.

Only MT7623N (which is apparently identical with MT2701) has all the
multimedia features (ie. HDMI, a Mali-450 GPU, ...). Neither MT7623A
nor any of the other MediaTek router SoCs got any of that. So it
should be restricted to that variant. I'll fix this in v2.

Thanks for the review!


Daniel

