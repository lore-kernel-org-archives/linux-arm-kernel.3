Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FF2CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czSt1NsB0GvY9kXEI6C2H8lLt1I9DM1teM133Tj0WUQ=; b=XCooVqSlshkiZhRHZNmEnWas5v
	0HE+ZDSSiVjOMa/M2fRZbzr+e8ETSFNhcf4tsZs9hqa86HZeHDBrfdP/cIedDt7IZpzBzx7JVVS8i
	9h8+XDj3SOVm8qrDOb/pq1i1Uq0Pt3eexltxACCQ4SCm7cR5+I41vaPsBJTU5/J+pZ4zdV3H0MahP
	Y7R9ldzAELe5LD4wZPKP359uMM17IlRAv0JMqvoISXp98pXE1buwVCvzdxgIChVwCnkfp94AwWGC5
	v7meqavIcPeYZUGKPpkhCFs+k8tF9Xbta8VD5I9vyPq5heaVAdGQ+I573L3BQ5A3WyZY/i+9+bsu9
	q9Lq7mQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7E3o-00000008gLx-1SZv;
	Fri, 10 Oct 2025 14:25:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7E3m-00000008gLf-3yUx;
	Fri, 10 Oct 2025 14:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0432C6266E;
	Fri, 10 Oct 2025 14:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727E1C4CEF1;
	Fri, 10 Oct 2025 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106328;
	bh=2cqoklTmnWcMBIxfli3d/ARO/y0tQWg6ESZXPMf9q0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpzpcZ/dKsdtgEk2sydCmYgvR99u1H5iNfrZ6WIpCTfgdKaLAtChsAxBatdre8cI6
	 mpqUg3lak6r+Pb1sJ1/kWOKdj75Vz6tsnHq1KQ9FfQTAJH1v0sLcqaPwXfeN7z//GV
	 Z+K8aiV1pKme6p7fSxbEAy/lwmQJFJdjOffDf5ThZ6ISFlJ2apU2Sp3BhyeV3Fujuo
	 tSX2icvdUoZ2pz7Efhc8TA7bpOYqvuEffH+yf2W411C7fW3KFTaycjCzzN7IzkXXk9
	 IxXn7gPwybpY/E8CL9ry/3lwDr9gun4ZrVUQ8jsh3v4zTNC4y8JVXqbJuo2SJ7tdfi
	 YO4UPHzhl451w==
Date: Fri, 10 Oct 2025 09:25:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	linux-stm32@st-md-mailman.stormreply.com,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76 v3 1/3] dt-bindings: net: wireless: mt76: Document
 power-limits country property
Message-ID: <176010632601.241034.1894010503665386462.robh@kernel.org>
References: <20251007-backoff-table-support-v3-0-fd6e2684988f@simonwunderlich.de>
 <20251007-backoff-table-support-v3-1-fd6e2684988f@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-backoff-table-support-v3-1-fd6e2684988f@simonwunderlich.de>
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


On Tue, 07 Oct 2025 10:11:14 +0200, Sven Eckelmann (Plasma Cloud) wrote:
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
>  Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


