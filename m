Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A80D767F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLnYQfdr8NyxggDtyRx5yaVqi2owvaQFbxe2uSIzQDY=; b=FprZd+OqDYhOeZx5VitXfsb1Hi
	FjSKlC3c78GCbJtq7eUR0tyJmuBYxPVmzb5v6nvpSGrE2rfZIgFBVHPORfQ+Sr5+clHzfkbkGIU0n
	MDM+06sl3rfxJWeS+SnFcSmypO8ksTURv8bdAi0IeT86eZAXmXlvSEzf972gifBpVyV6Si60RXkGG
	FNF9poEtNhzgWfNGEEt3i8nSOB5t8PHgRRHFesD0JC4VGpqfLmZlxblUFUVxsZHBLNPXqk7BFxuXe
	4J5NN5vomaNJxcTx4lhDKXR8myuVEzcq9y69dbcJ2IdWVbdZjyYhE7vNXtIEnRRF1VJY03K4hFB6x
	n0pGGpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oDx-00000006Rf7-1d7L;
	Fri, 01 Nov 2024 09:45:45 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oCG-00000006RJy-3Ttc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=XLnYQfdr8NyxggDtyRx5yaVqi2owvaQFbxe2uSIzQDY=;
	b=fy66hohrsCdw8c1rLOwe1R3p0cESVr4sM7Wg0sz6gnvpaC9gbGWQk5cVrOeMfp
	mQi10MAUzS0dyf+eg3+BZ06Y/hb6Cd/rM0jE8JyTWh9ooGrAxtCT9ENGHpEalrjr
	5Lma9nkUb2nzst601UrIUfobJn6qGNGXXM9O6pOHulB2Y=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXf8lroiRn8dxjAQ--.13888S3;
	Fri, 01 Nov 2024 17:42:05 +0800 (CST)
Date: Fri, 1 Nov 2024 17:42:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add Gateworks GW82XX-2x
 dev kit
Message-ID: <ZySia6Jaie9QvcH4@dragon>
References: <20241022153031.1231934-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022153031.1231934-1-tharvey@gateworks.com>
X-CM-TRANSID: Mc8vCgAXf8lroiRn8dxjAQ--.13888S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWFUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx+KZWckj-02owAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_024401_202138_328A52BE 
X-CRM114-Status: UNSURE (   6.08  )
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

On Tue, Oct 22, 2024 at 08:30:30AM -0700, Tim Harvey wrote:
> Adds support for the Gateworks GW82XX-2X development kit
> based on a GW82XX baseboard and a GW702X System On Module.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!


