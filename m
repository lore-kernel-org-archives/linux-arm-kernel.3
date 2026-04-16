Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F069F8A14D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEk5LMSdObaEX3bHnYTn4K0ZqqQUmPLr8EtxN54Wbzc=; b=yEjvxZHAXTep+IiKXeS3iMOLWl
	vtpFcNe6IWcN2pA6nfsEroSfuYiMUYwm0ZZnufagCJzc7fvBh1pc6nwuiaLEYoQA0RjxwO1snsu2Z
	bsKiIB4lYGSIGM9UnbBoFq9LAm6yhcsCdbYmjiw4154MG1K7R+aawl3wNLRdUFPis7rYzxjSCxAY4
	2H59t1GYPZ21ZP2qgHRxIszBNJolkzyu/YKDXUFMlt3Kz5L3XafhBDPgZCJ0b19YowlWyA7ZXdPVj
	3WfZyGxwFey4+guP3NuqbvC3ZR7Z8YpX8B8rjmTx8PDsPvlt0lLGTQMVZXOuUoDSkwUAFPjvxvDrx
	KdoqVUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJBA-00000002Fh6-2qzO;
	Thu, 16 Apr 2026 09:38:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJB9-00000002Fgr-1LNG;
	Thu, 16 Apr 2026 09:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD4D260126;
	Thu, 16 Apr 2026 09:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1D9C2BCB0;
	Thu, 16 Apr 2026 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776332308;
	bh=ZEk5LMSdObaEX3bHnYTn4K0ZqqQUmPLr8EtxN54Wbzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzPAa+USsIfvntejjAejl3l1C+DskMzWVVdijjf1YRUCpeRSRxETPTYWWYMaLLtGz
	 9/MVI3DEV6eXiKlYFhuSAYW39V1LOecYUAWbZYezTs26xapIfjLANLgdxjErKLb3lB
	 3pYr+OjAAlUlxIE+chRtTHTeKJ5vmWbhXuqMFiYbu8tJcmeJ8SWoQc8LTkl/a+Rvlo
	 Frn+/cOsThi0QFAW5TgHrz6uW1tJL3N3Z1p7PKoDq2+6dpZ2zrAEP7RBAQ/WbEk5hy
	 XLZ2joQFmh6LVtw1WaqvadEB2RtqEYnX/OfHeUPO2nNi7OmUrBD/XmNkulaNA/x9dm
	 bkTxFOMp6YmUw==
Date: Thu, 16 Apr 2026 11:38:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: sound: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <20260416-qualified-violet-salmon-4bec7e@quoll>
References: <cover.1776265610.git.daniel@makrotopia.org>
 <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>
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

On Wed, Apr 15, 2026 at 04:23:27PM +0100, Daniel Golle wrote:
> Document four additional optional clocks feeding the HDMI audio
> output path on MT2701 and MT7623N: the HADDS2 PLL (root of the

There is no MT7623N compatible in this file, so that's confusing. Does
mt7622 have it? If not, then it should be restricted per variant. If
yet, the model name is confusing.

Best regards,
Krzysztof


