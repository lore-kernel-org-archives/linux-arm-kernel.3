Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D22EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHMiro0CdqfrONnpbwOiD88Ob6fIio5ilJPcZorTMkE=; b=czQnbpNzGu5hfHY9qj+RRFerjt
	o/F+AQiFiNF6TJ2p5AW2jEv/qZ2AH017qsui3O9bDCU1nQc4h8WwHPR9VI3UCDnUKoZoMBZ1EY5hM
	4/WlR0HMINOr3hgCupanaj7pYzU3jRS4+yFmmEz8uA4O7EQO6J4aAv8bMq1BxheGqkL6fWPHBWjig
	64+jO/AzAoJNgdxap83sphO9xTYQ9s4p9QKbU9pz0FuldqMFREF7qH2OxwzIkqEkYN/iv5IeL2Gju
	vRulkQC17x6r4bsVB35Wp8g5JqM7JXI8gVDaGPk+Lg3OmGQGRfwQMkv4awMNrOKjXlkFBrmH1q79U
	FjuWS+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpLl-00000002hLV-1JpZ;
	Thu, 09 Jul 2026 14:03:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpLe-00000002hI6-039R;
	Thu, 09 Jul 2026 14:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605805;
	bh=yVSnZEVcy9spm4rdo+byWkY+QKt71zHBH4RF78ncWlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q1NLO/ZzaHubJycWNSHcGpkSS3Z/RLPXQ4lJGV44i9oQRQecM1AsGOkWaecaK2Qvt
	 JEbT7GADU73edftlarYx1dwAJqsribnBdIcvJTHvssp1bGo6xeoYJqmDQ4vVlIHKXt
	 lVmvdu91UVhSRlXe/peqWwYBPvY4aDSpiDid3igeYXs1gnuazK1Yh3MCQSIGeMT+eC
	 yUZPorrQ0SzAo70CgQpfs4P/8OG0WpMifcHEZnp0E9EEviUuZUr1xHfDnAd9lE77nE
	 Xy+zctRkkJ8eBNJDDXcUIm0d1Cr7fofhaB5x+ayy4pAWTyaMwmckQv5TVDkj++rFaQ
	 jF0YaUTlCVnnA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF04517E0521;
	Thu, 09 Jul 2026 16:03:24 +0200 (CEST)
Message-ID: <7b726b55-475b-4801-9974-596f28ec1628@collabora.com>
Date: Thu, 9 Jul 2026 16:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/18] dt-bindings: clock: mediatek: reorder MT8186
 compatibles
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-4-2926da3db6cf@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-4-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070330_277965_A77457D1 
X-CRM114-Status: UNSURE (   5.38  )
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

On 7/9/26 15:42, Louis-Alexis Eyraud wrote:
> In order to prepare regrouping several Mediatek SoC clock controller
> dt-bindings files into the MT8186 ones, reorder the MT8186 clock
> controller compatibles so they are sorted alphanumerically.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


