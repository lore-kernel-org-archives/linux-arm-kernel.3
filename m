Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32234C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZUtALimkGNUKlUwR7kPhpseRi05QXADRgqaJLwDiF8=; b=MHiqDmcXkFrlOA+awH1YvDk/0U
	F14vSMTWWBIQqYsDSkTDTyXRIl+J3BK9hhMTHYUKCukS+dqxod/uxpdg/zEKMWNiSVEKslBuVwvWx
	I6HLJJPflD3Z7KpCrtu/2FT4gO6SXHvDYQMEa2MWZ1oxcGAVDaIrdjVEw7uoPy2I5Hlz+kTKOLcEw
	CFGZEC3tfoj7f8MklMt3l0q147Aa44vFEUPtNS5PZWMqkvFR4O/OJ5kBn51pQTCw3PdpW7nKmYMAr
	dsPpH8KbwpMhfClRL4M7M5s0UCp7X4XrKNZ/GMFA+ETBt/vJJc8Q7NRuc3Fi3em/s2koK90ceZwEp
	h/qB9nhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcdy-0000000Fn2h-2dNs;
	Sun, 20 Jul 2025 22:36:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcZx-0000000Fmim-0J48;
	Sun, 20 Jul 2025 22:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFCC743EEF;
	Sun, 20 Jul 2025 22:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FBFC4CEE7;
	Sun, 20 Jul 2025 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753050740;
	bh=wz7il3rwlqXu346/86AuP/gL4vVWy8HvWTyDbXEfd+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzxscFhd0jBwdrP8BdLUpLCEV/5haQsKJtwx1EREM9FtuWJXFvgVVMTuo8SrziUhK
	 78WI/ciGnSqFapKHjp8J2m9AQFrMpEYP17zFmRrlLIeSQtknBtZFKvTVu5DJa6lgU1
	 iHMeoKINlrRTUjEPc06ZqcgdL+lT2babDFnxoA6glnjPOCW/BtDkYVj5Cw4OfgtasM
	 KhJyD6Caoapavce3AHqBn2U/f9Y1mR5h/gHniWMVz0hGAdERUaCz4DTRcCoRXM6tcn
	 EFkXK1zAdq+QBkDY8CvRiYzL32+tQny3w1k9BsUZ17Gc5tPZdBRAjp40bu+Yz1CFO2
	 IT1wcCUSaYyWw==
Date: Sun, 20 Jul 2025 17:32:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-kernel@lists.infradead.org,
	Flora Fu <flora.fu@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6789
Message-ID: <175305073930.2915534.16459259911268975205.robh@kernel.org>
References: <20250715225746.1321-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715225746.1321-1-me@adomerle.pw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_153221_134262_34226C3B 
X-CRM114-Status: UNSURE (   8.90  )
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


On Wed, 16 Jul 2025 02:57:45 +0400, Arseniy Velikanov wrote:
> Add a compatible for the PMIC Wrapper found on the MT6789 SoC.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


