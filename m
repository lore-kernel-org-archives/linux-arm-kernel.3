Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6642BCA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fFNT/jIRKqZt2GOjyGpl20xr+ofqYq34um4V5iP/PE=; b=oHN3Tvsx/4BrS3vg250s9Bgv+X
	faPlYRbqzBNSRbCNszWheiegDwRtCZRv1H4mMEl/PUs0zxvkL/WnZYm+/LKPayOMR4X6nZD3DRWGS
	Vui+vWwSi/CD2BCvdNNlB5ffV76HOROoF9C7hS/lTP7dg9oN0FWPqctA7zdhfP0/P948V1BGgbNSI
	bQoPfEghT29yLXEFvJ6ujfCZFhwGMgf/Rz8kG96/ugiyqCp6RXuRIC+MwIgCmHNRsqn/b94alPyj1
	jLTfKAmtzVcfysTWfeaYoEipyiWpRsq7wGbJ7p4nStsi7ETei7WFemG94Fkd2UKnGpL94TzPZX/wF
	uO2d0okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvr7-0000000HZ4F-1TKS;
	Tue, 06 Oct 2026 03:28:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvr6-0000000HZ3s-42kd;
	Tue, 06 Oct 2026 03:28:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B08C3601F1;
	Tue,  6 Oct 2026 03:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B3C1F000FF;
	Tue,  6 Oct 2026 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791257318;
	bh=+fFNT/jIRKqZt2GOjyGpl20xr+ofqYq34um4V5iP/PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aByZ6N+YfMd1MiyIZ6/1T1tjY/eJ1fZTbSzo/IVLDJQMDO8GJDiCdje1+5mQxp5Ow
	 yYm7chlF3mA4BoO6CALulEVdLLMexr99QBUGZ80/MoHofmM7/JBRY7qaIYF6SWas5r
	 4uC1PhnR8+okcJc8d5/otaL4oDHINC36ZahDe5K4h4tJ0j9snR5LFatqdt4Rgh205Z
	 Y3hVgMDMfi5pSg1vPcJQKCpNgiflAVG54+yFF+LRqgjLZsc/CDPQDxlNJTXo2ydBUb
	 0qL6SIH8rwXndTfQgd5SLfRdqCIUmCO1Xxo5JOMSExil+YL4HoZaOHIPlN59qPVzUI
	 TOs5gRnyhatCw==
Date: Mon, 5 Oct 2026 22:28:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Andy Teng <andy.teng@mediatek.com>, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v10 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Message-ID: <179125731179.3556841.9854336212355847521.robh@kernel.org>
References: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
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


On Fri, 25 Sep 2026 18:53:10 +0000, Yassine Oudjana wrote:
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  72 ++++++-
>  .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  | 236 ---------------------
>  2 files changed, 70 insertions(+), 238 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


