Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB02C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRUQX8SKFHkN4O2Ha8HmekyApp+kOMZ426c2WqKVZy8=; b=UO9cF0Yq1v2FDVCN3eDPlhVGga
	7+pqHqg/9Y+vexcsovLg6w/4ON5QL8NMkB9/KPeA0PlprVt0US6E5k4Umpuro5b93fh8roxD8JMkO
	2fgw73bqi0SQ9YXExqstRKawtxG4GVZhrVScQ1i/pydqwb67gAcUHyK0MCV39My3QxE5rz6KQO1NJ
	EodWyBenwHMY/TD2pbqZ/TzHboEHrWnH5TIHz/nMigQp/B6cFeqtvM03bRiYIg2t5fLJnmIiVL9hd
	C965NP6hhXxe2NTFSbIQBqt5zJICuZzCxBn9r1gFu4eYhSl4Y2NnxBRS6Cu7k/j7zQQ7v1d8tDtlp
	46opkqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS0C-00000008Imu-0Wuw;
	Wed, 09 Jul 2025 10:26:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQCq-00000007ySE-1ItY;
	Wed, 09 Jul 2025 08:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70B32A5472D;
	Wed,  9 Jul 2025 08:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2EAC4CEEF;
	Wed,  9 Jul 2025 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049867;
	bh=/ZESWwyTJveRbGr5oE29xvj9PEV+f3vsHTfROkLMirQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/kyH0k+HWpffxiF3SfpqdP20X9KOdB8hawYaETGYEnQUZkxlrjWmdS/ERDyQpRYx
	 n2dS9DYUXi/9ke89e0Pi2czneorKNGp+mKdVrQqds06QZEIfSEHMjy596QjW5xYyjv
	 2RrrxglASIxVg3OmZC1ZTKSnrq0G+OdGbuhpSlQqcxatgxZ/SbBHsYO/2vatCLl+Yz
	 E+zHCFVRb00wUEYz4zj8svDY3SPG5LVx9CMcHmB1hf9pZOzRIyv0ZITJAGGL4yDpI6
	 5UlGbwlpGp3M6/RdZhtTtRLEnHtnC3VcnWUAAdi9QTGj5vux2ikBciBugqZdKv4J0L
	 HelRFwtRA2gBA==
Date: Wed, 9 Jul 2025 10:31:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, s.hauer@pengutronix.de, 
	zhiyong.tao@mediatek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: thermal: mediatek: add falback
 compatible string for MT7981 and MT8516
Message-ID: <20250709-spectral-friendly-frigatebird-bd80b6@krzk-bin>
References: <20250708220405.1072393-1-olek2@wp.pl>
 <20250708220405.1072393-3-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708220405.1072393-3-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_013108_451584_E497EC85 
X-CRM114-Status: UNSURE (   6.25  )
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

On Wed, Jul 09, 2025 at 12:04:04AM +0200, Aleksander Jan Bajkowski wrote:
> +      - items:
> +          - enum:
> +              - mediatek,mt7981-thermal
> +          - const: mediatek,mt7986-thermal
> +      - items:
> +          - enum:
> +              - mediatek,mt8516-thermal
> +          - const: mediatek,mt2701-thermal

Groups of lists usually we order by fallback, so first goes items with
mediatek,mt2701-thermal fallback and then items with
mediatek,mt7986-thermal fallback.

Anyway:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


