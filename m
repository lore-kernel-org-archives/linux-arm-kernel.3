Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1297D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVzUZKOnYfE9oyVG0Mch+C01xy4EbMA3CVd3naZWzg8=; b=lQ6ObqlMYIZPQzElIsCN+dKAq5
	mBtH6a5CITsgrF1giA0wUcf35Xj/cxgaTPMzqb4hbH4z8uyhhf2DhZKwB9ucN0l810aH1mXNfMf1f
	zI0goTZxIPQ03KlRtweIIfZIpxNGfgV9naZPbd2ZbuYuZ+QyrHmtwnOmTsCLAgi7YyDt1uTTLgCTO
	dJtJeNJI/eHOs7GhZIApcQbo3IVegjM2Ih7+WkOoMwwzCaSxtgMpeo7F7Qv1cqId60C88lig3Eqjk
	rZfst/RNZkBq5abkvTrAIVOr75n04ycXwwHuviK/4kM6e9ZD1yNjlO6aWhW6vbPFkoroOqai5FwP8
	zu0uTGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vespJ-000000048Gi-1zXs;
	Sun, 11 Jan 2026 10:37:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vespI-000000048GZ-3C4n;
	Sun, 11 Jan 2026 10:37:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E185460122;
	Sun, 11 Jan 2026 10:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1642FC19423;
	Sun, 11 Jan 2026 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768127859;
	bh=9UpBDNHe5jcoYRtrv4gn8uXXwDp4yiBsR/f8enh8Hyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xzq9hh3MT9GZEifu4fhQWEdPRgrFYoGfUw/Mq8y6aLgmNrR2+0GaLHljvBgfM8oJR
	 9jhngsGNLPJRNF4O6ih3LAGfUT8aU2xTusklouJdDYjWG7BtghzqGA49HJ0Ry3m+e5
	 pkP2iGldANmKazxyiE2e7rCOeXUFx9JAFKiEPJbwwi8LISnBFe1IzGHb/pT3cx66AB
	 cfj+Bst1f7ujbj0Li/YO7hgNbiNpGNfF0g4cjHd5L8UtX2EYvzRDyN0WN9qF2jbVN5
	 B3eHxP1EL81ClisWyH7VbgzGaIgc3d0rxBT8p6LZhzqSDdtQeUFm3gheMUSuUDKuna
	 9P0ihrFiF3kqg==
Date: Sun, 11 Jan 2026 11:37:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY
Message-ID: <20260111-camouflaged-shiny-wrasse-796dbd@quoll>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
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

On Fri, Jan 09, 2026 at 05:43:29PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC host controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---

You did not bother to test your code...

Best regards,
Krzysztof


