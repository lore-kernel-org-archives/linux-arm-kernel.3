Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60E1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fegrJucts4h/Wh/12yvX28tz83l7qAYaODgwjDKH8Nw=; b=kHvOuUSgtdoU2qZ0fThJKm/X5C
	c4MHd25/sxTlCyfcMU9lOtD44LzvL1Oz2QC/sEbBMXZ0EV6jDEzDk3yJaTkpL89s/dOlLnRRJK19D
	R57ZrdyvKQgbDXfJSqGXDd3IPMaPt7URTC0G9flW12qlGb2fU3HV5MlR6Kl8KU7cw+BPNCLVQ0fFZ
	iXdks8sqO3joNox+YKry7PNOB922k8tSaGgQDQ/xUz7XTrHa44X7KU5hUXuTADTfsTZsfM0Dr4jyG
	AFY7xq9wnTbcA6oMA9RZ7stNRXztoV32GO+J6rYl8F1TShQfY4FPlJvxNvyqbNh79qT4lzrjO8xML
	ScCHNqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU6B-00000003o4t-1iqs;
	Thu, 31 Jul 2025 14:17:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTR7-00000003iBC-2YCC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FFE6601F0;
	Thu, 31 Jul 2025 13:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E516C4CEEF;
	Thu, 31 Jul 2025 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753968907;
	bh=JlgjnISOVlbMm171G0UqLCdsAqO+LwlJ2wQNnZovLEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n62DkWJI5QDzlSFj4I0ZZxFbWRpzaHmiyzX3/mXIv+bAD973YvFciv5FfgfDDdfy3
	 g8wvomrxmJ095KgSDtLbd8toTpFS6e9ZZjIHS30te5ucGfNGQ+x+oa5w3NUn5UCdEu
	 i1D5AX5tXpnVOc9/SgA4vGyGdm9wB/rkVqBUdjc9YNukoEhPQmNC3NaxO79vYFMPDS
	 S/+V15V6uMBAB0eoSFQRlSXzgG2tWk8cBgm6tBKhLuNFbKGg3I0nIgzpG19QV6bXnT
	 pkiJ0icmE5bjGGDxC47KnVLpgUdZCRtUYVV19Yk+82WJmxd0Txsa5Bay9lhYfVHut1
	 tTCGBWuAZjSiQ==
Date: Thu, 31 Jul 2025 08:35:06 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11.1 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20250731133506.GA2114146-robh@kernel.org>
References: <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
 <20250731071151.997550-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731071151.997550-1-dan.scally@ideasonboard.com>
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

On Thu, Jul 31, 2025 at 08:11:51AM +0100, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Resending this patch with the change that I had forgotten to make,
> actually made.
> 
> Changes in v11.1:

Creative versioning like this and sending 1 patch of the series doesn't 
work with the tools (i.e. b4). You're going to have to send the whole 
thing as v12. But do that after rc1 is out.

Rob

