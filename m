Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5FAC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bPdVfAtocz9IJuP4lWPc9+AnBop7s4nhEuFhT6VnJo=; b=kqM2vUnkpjIxL8rhDoCVbwdzRL
	wM8/+0wpaLufGgDXUr1J4iYCvHuKyw1UAS1K0wFFm1jzM30pLgbCIk5MESdCBMO3Qa7TSDHTHO60Y
	lQjjWB3ef8ASNAXcxM2Uo6XHbkBZK/nnjccG/+WY0JUNqrDlYSuAghXMSV0IhG3p9R1MaKWQ+avJ5
	+7BD/9nG0e0mzK2E8YQmPScgC5dSC9wN0LhuydgXvUsq7eU0NVqUTpee6VgkrMFHvr1SZy2zb1SO/
	dOXu0VTR8O0MHJ9w9/Hz0CLJSpGYs//dsoyUiDaO9zg2WbEXOhe2kVXbfaiueBrw8ZhHxjBzLLeWL
	NyUxG8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmaN-0000000GTY6-2n3L;
	Mon, 03 Aug 2026 06:55:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmaM-0000000GTXq-2rcU;
	Mon, 03 Aug 2026 06:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FCAF4173B;
	Mon,  3 Aug 2026 06:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043711F000E9;
	Mon,  3 Aug 2026 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740142;
	bh=0bPdVfAtocz9IJuP4lWPc9+AnBop7s4nhEuFhT6VnJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9Dj7qMxbhs9Fo4BnCZp2LhB2xTUJNEMEK2A1WKeqhC8EIFF02YR7xXFnnEvOXn6u
	 Dqbs5zG89lfenbQV/7NtA+UGOE01NWjQvwlt89iQKSTBQuCHoLd8j0xocBbtJtentZ
	 DlVIS56SsLOjjq6j6G81KyX8bOraVcLfB/oJs4dE7iEYzqP8wupMMHeYHy9Sy+8S1I
	 f849PiLW/EyPVRw92zo72gK3hsoPnRakW7Pn8b7ALVtNOih+Dk3uC8Q0kOvTVSkjGk
	 zF1bv2ZOWwxCaapMYi04isP3+pPDWphzihsOFdpvaM+P4RpoIf4prjD+iWp7vmQoat
	 ovNOGZ117xdpQ==
Date: Mon, 3 Aug 2026 08:55:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Darren Ye <darren.ye@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, Rosen Penev <rosenp@gmail.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with
 WM8960 Codec schema
Message-ID: <20260803-faithful-ruby-bumblebee-17ddfc@quoll>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
 <20260731064326.2284228-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731064326.2284228-3-ansuelsmth@gmail.com>
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

On Fri, Jul 31, 2026 at 08:43:22AM +0200, Christian Marangi wrote:
> Add DT schema for Airoha AN7581 Sound Card with the specific WM8960 i2c Codec
> and AFE as platform driver.

You have unwrapped commit msg and should drop references to platform
driver.

> 
> This gives example on how to define and connect the AFE driver with the
> WM8960 for full functionality.

This is not necessary. You desribe here hardware, not example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


