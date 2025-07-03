Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E2C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmA8bVal2Hq4dZItztEdk4ggAtE0aJ4wXcp60+8ZC3I=; b=dsObiIaaKttT34ZLoy+4PMkzCq
	fasNR6pLCUJ8qopkycBbPoke8hv9GCps38vjLUEkVqSfQYzdVOClsBvETVQ1Gj3mFc5MSKn1YDuC7
	0+jQBVQqVYWMe62nqabVzboT/kNOAeJcVh9QwVeCEf/dQYonpbUArnoo1PMMBUReUM6Q3OLKVci8D
	S3thn2B/nmD3fmiWCvrWYoR4Vs/+xcywMz6YpscZFdmcclrqcXiBQihFKNk0PrEI2QIu+SVQraC8T
	Bcf6Y3qBp3p4Xs8Bu0KXCZoQFPfX+RhT7rlGSVjKGAU8bKIVJJwZHKGBOx8jfuGKz2S93KNPvQsGi
	Inysln4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEjo-0000000AZQq-2sHc;
	Thu, 03 Jul 2025 07:52:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEft-0000000AYek-2EYY;
	Thu, 03 Jul 2025 07:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDF66A53716;
	Thu,  3 Jul 2025 07:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3CDC4CEE3;
	Thu,  3 Jul 2025 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528884;
	bh=s9ykGtfs0LX3ujSHVCs3mx6zSWxs7c6uLiOZIRxMw1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUuM5KPMjzdteL2YobZ83lISj54WI3hx/7p6Y9OFk/b9TRhVpFerjnep5fby8I/n+
	 bbuIpReZ9qRj6L/6xRZGU8T3hMd4ldO0jaMEcRBNZdvdDycyVFZ30R6fe+vv0ZlaWq
	 doXZpPbxKiHhZEp93N6OAHQOa0ow8WbhVAdpNNyC/FRsc/DDOC7dHZPZwxJryewY+D
	 zcAEItZBbSGG298kslLneC3FlmokV24ffsP/DdsIPmLOZ++8L+0jY3ys03ly8PfUoI
	 c8xV9RFcUhhQxOCjmZxLYwJmAd7cMTqhMlF/vT+VaQf56K+xEDma7JTcHaJ5rydBgP
	 4V/DEDhyQ6A5w==
Date: Thu, 3 Jul 2025 09:48:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	zhiyong.tao@mediatek.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add support for MT7981
Message-ID: <20250703-impossible-determined-hamster-88da20@krzk-bin>
References: <20250702214830.255898-1-olek2@wp.pl>
 <20250702214830.255898-2-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702214830.255898-2-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_004805_634550_78F5B589 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, Jul 02, 2025 at 11:48:29PM +0200, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.

This is not what your binding is saying. Binding is saying it is
completely different.

> Add compatible string for mt7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Please drop and request a re-review.

Best regards,
Krzysztof


