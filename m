Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720A3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i179p+qdZ2+KrAUDiAAeGJP057hLaGH1bH5xSwDIdR0=; b=zn/mQKzQMAxGEqc259A54hCnVm
	8hOUxx/xmcyBidC5PeAb/U9cRyd2ZQHzGnfs7eYP3OSsdaIn4b3jYddNmA0o1wcg++6RHietMSLL2
	+uaPQIGRg1ywSwDGvUnkifUoG4oFbMDLCXCFl42biLorOdupMBfsUZwsuwg5F8kv1+6mzSyKMEDhw
	Et3Qgt3I22rBhM2RbyZ/7Nak8Vi1SQlYujxNUFnpM/vshIWQcYkq8Wp+nMU69J3ae9OuYfXe1gqfw
	QJymLw+cihxmcumNB16jPfxuHb7+3sAahcw+3sgawguoL2RteAwp1rjitWL4d9bPqUoaxpRnbj31b
	Suto6/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkenf-00000001pRQ-464v;
	Fri, 17 Jul 2026 09:24:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkene-00000001pRH-0mYN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:24:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7B9741222;
	Fri, 17 Jul 2026 09:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4631F000E9;
	Fri, 17 Jul 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784280245;
	bh=i179p+qdZ2+KrAUDiAAeGJP057hLaGH1bH5xSwDIdR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LmGX2+aQhfxSIbGXPpuazumaYERS77FkVW+MVgQnURQ0r+InE+e/n/9FrpO23zOGD
	 HtbPoq063IxzybRiw3ajVUpB0OM1bsuwxX5kOz4disYEoHveCsbMKGWkmb70ADXPE6
	 A/dS1S7zpdfLaXCp4qmjPJlc4loAaTewnyWAv/fR+OWPSC13qWabhghgA0jWtbQNyO
	 pz4cqmAf67I7o45OQA7fcW666WcwPx+UAF0H74S4FoB1C8/vmDI1U6EW1js39qppnj
	 li2EAh4WRzCc8jIdaxztlCUFMy+trp8OCB13hM2fYNPKHZnmX88Rvz0xzxWEBZiwkn
	 oA1xrkLsvC6SQ==
Date: Fri, 17 Jul 2026 11:24:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
Message-ID: <20260717-generous-grinning-cobra-14f0cb@quoll>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
 <20260717-imx93w_frdm-v1-2-0cca6c0ba2f5@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-imx93w_frdm-v1-2-0cca6c0ba2f5@nxp.com>
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

On Fri, Jul 17, 2026 at 02:11:53PM +0900, Joseph Guo wrote:
> Add DT compatible string for NXP i.MX93 Wireless FRDM board.
> 
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless FRDM board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 FRDM board, with some minor
> functional and pin connection differences.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


