Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AD5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DQhD032yUxWhpfiVolklh1GLZPrdAqG2TjXNvm6hKw=; b=Hed7oD8fYVPjrrlity1dPEbl4/
	RxipOcyl1n5TEHmWgCmBzYpk/pU0vcMY6ccy66zwmrTRk/rawjCofBdzWGSElb1+8uyhsXiIc5Ju0
	Ld/C+urNYBC0XuhbPIJTlfGPuXbBI82zTE4rKvAb2Cbrrb7xj2f+x2nxinalp0v+PiPQLyqJOcAxf
	4hljyP9txMsTzcGDZyH1KNdSiXMbwf62X69n/Py07dmUj01HUYQLB7j+WzSU0iJ5v2mU2FAxnEkyn
	C0sRHFzBkeVROSuijFe1GBW1nG7VlUH69aTeJMNLkwbKW2MphcjskOtqt/CMXJ0WfKNmE+1y9tsTE
	NF/K2TDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5s5N-00000000kps-1Ojj;
	Mon, 06 Oct 2025 20:45:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5s5L-00000000kpR-2aCi;
	Mon, 06 Oct 2025 20:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 035BE43A6E;
	Mon,  6 Oct 2025 20:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05CEC4CEF5;
	Mon,  6 Oct 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759783530;
	bh=Msplel+2vngn0wszovGQc3AienJz2287rwZ/jQ5RlKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY8ueBp4USjv/gu/UnTqZMG68tY83xRGMo/6KwFUFSiB7ZHymiqy6+FGbDlOosqd/
	 jUf6llB99AsWoXliaizf7WLEnpJV7/8nDASOPfyjfzWgznS+cJepG1T7AflpjDGxVE
	 iH0fRjGfBAEetLI4RmqCzLUxK4K7OlcG2Vlu10NgJEEFocL1zUdYEr5yBsYIrn3bVR
	 Mw0tXM5mzGlVDwX3NcGbRgQOKEf4EmAMb71RYnH9sPUKPiDRH9edifCvqVOTCIAoyr
	 B5cJmodEifygc6Hk7cYt3zIrjUyc2d6mkKjN97cupcmbIbJQjJdaZkWDXS5Po3W+Eo
	 SXRNrDIkUgnkQ==
Date: Mon, 6 Oct 2025 15:45:29 -0500
From: Rob Herring <robh@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH mt76 v2 1/3] dt-bindings: net: wireless: mt76: Document
 power-limits country property
Message-ID: <20251006204529.GA549972-robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_134531_701007_B292DC92 
X-CRM114-Status: GOOD (  20.61  )
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

On Fri, Sep 26, 2025 at 12:04:52PM +0200, Sven Eckelmann (Plasma Cloud) wrote:
> The commit 22b980badc0f ("mt76: add functions for parsing rate power limits
> from DT") added filtering of the power limits based on two properties:
> 
> * regdomain
> * country
> 
> If either the country or the regdomain matches, the power limits are
> applied and the search is aborted. If none of the two is defined for the
> power limit, it is a global (or "fallback") power limit. The last
> "fallback" power limit in the list will be returned when not matching
> regdomain or country was found.
> 
> The idea is here to allow to specify "overwriting" country limits in front
> of the list - just in case a regdomain is shared but a country has
> additional limitations.
> 
> But this property was forgotten to be defined in commit 2de6ccebe0e7
> ("dt-bindings:net:wireless:mediatek,mt76: introduce power-limits node").
> 
> Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> ---
>  Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index eabceb849537c418650697da86682ef04c979193..f8f72f3f1b1dd185b4797be38b87c621ef3eac08 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -151,6 +151,11 @@ properties:
>                - ETSI
>                - JP
>  
> +          country:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description:
> +              ISO 3166-1 alpha-2 country code for power limits

This would be constrained to something like this?:

pattern: '^[A-Z]{2}$'

> +
>          patternProperties:
>            "^txpower-[256]g$":
>              type: object
> 
> -- 
> 2.47.3
> 

