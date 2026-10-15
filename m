Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF348CCA466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjuxcVNkrpGx/wj0HdomDPX683PeD8aNSzaXEvZNzqE=; b=s7GNsakxukClTEGlaDOUlBhDCy
	Vder4Klc9RO2pCH8DMF9LJH7bXyKlm4KapyuS4EPSKKjkvmMvnDkq6eyY0XOwU6iex5VntLkGqoeR
	vHDf5CKFAxNpkv0k+VrUBYJAbczuYYnwHa6fNV86uP3GOKNstWy/8YSG6RBO4bYYEdT5n1v1Eqcqo
	lDJ/PZBqwitH4RSV6ODGGxkHeB4V52nxk4MKYt2b1BUSyOttn37+w8EjLrl9KN+j2NUVRg2z6Z3Cp
	HvSrfTv41lKJT2dLg8vzCCyIv7INAf7VuCA4W9FFXms/UyJ/N+LVVVkv7oQJ+T/sUFO+MTWccNeao
	inm5pAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN6F-00000000WiK-0RmF;
	Thu, 15 Oct 2026 15:10:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN6D-00000000Wi8-3uUH;
	Thu, 15 Oct 2026 15:10:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E2A7403B8;
	Thu, 15 Oct 2026 15:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC3A1F000C5;
	Thu, 15 Oct 2026 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792077029;
	bh=bjuxcVNkrpGx/wj0HdomDPX683PeD8aNSzaXEvZNzqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C0SiRam/v5sF8z2A7JVUrDJQeex3O3UCt8+Te1bdfLjW5z0az5Y7Aonu723Xb5Jzx
	 f2y/evPdcMvF6XSZ9OoXagy6JOyW2hx7VQYx+yEnMZeR4EWtKtwZ8DKeS1ZV306DCa
	 BLMGmH9YuSHKPxtxWESzgShD94o3yTCcM/K75SJK8F4gJ6uZvj10Qo85FVJOzfDfcI
	 Z754EzS0emuAdR1JWWppEp0BubbQdL/ux2YQqUw8y7JLzC/C2DgGZz+4je573kR8U/
	 a1arCEq+7kD5m/F547xVUXNS3tPP83MuG4/cgDcqkg9Gu3MdbyyuVyDrCL3CyieQ+5
	 PqzOHVMEYK5PQ==
Date: Thu, 15 Oct 2026 10:10:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: power: Convert mediatek,mt2701-scpsys to
 DT schema
Message-ID: <179207702584.621839.15589697887509592009.robh@kernel.org>
References: <20260928222552.1118609-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928222552.1118609-1-robh@kernel.org>
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


On Mon, 28 Sep 2026 17:25:51 -0500, Rob Herring (Arm) wrote:
> Convert the mediatek,mt2701-scpsys binding to DT schema. The mt6735 and
> mt6765 don't exist anywhere. The mt8183 is covered by
> mediatek,mt8195-scpsys.yaml schema. With those dropped, the clock-names
> are trimmed to drop mm-*, isp-*, cam-*, and venc_lt. The venc_lt and
> mfg_2d supplies are dropped as well.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Add per compatible clocks/clock-names constraints
> ---
>  .../power/mediatek,mt2701-scpsys.yaml         | 184 ++++++++++++++++++
>  .../bindings/soc/mediatek/scpsys.txt          |  79 --------
>  2 files changed, 184 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> 

Applied, thanks!


