Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C64CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aqmgc5Maa6Q2Pk7fEnEANlT5qVe35sSswczh8wZEZ+k=; b=VogkPbUhuNCOxg6qIL205UcrlK
	Orlu0d2WOs0oY34TTi3qRuINSZjor6DLBRlNpJD8XT0eayWZN4QnmNj8GGRZQaMVfjWUtCouLDbFT
	TX432wtKaL0UPB4Q0rGrgh895wiWjY9LFAwiLCnDrphxv2nYvGxHFZy2B6HlP1oyiHSAfPu5e9P4r
	10LNFBa0vvSqHOXAaP+pyCH6uf+JeW1d0TWDQ6CZv8gMdGKTXylG5B3xpGa1L/UTRJHug9Lw3S5AY
	OC1c7IlDy1biwj8lAaV5nLZCepUZBvEpfpAS4DywLJ5zeW1Wk0a4gzLuju19jmJGn+wqtDHP6oiNi
	ObHGWQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENwc-00000003guM-2iDg;
	Thu, 30 Oct 2025 08:23:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENwa-00000003gu7-3jlX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:23:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 106FB61D0E;
	Thu, 30 Oct 2025 08:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58805C4CEFB;
	Thu, 30 Oct 2025 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761812619;
	bh=gBVwjjZuRmmTBdFscwrvsDCkSft7hllufmJNPbvi1Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8twPJGwfECe8D22djcRL2xzNGe9HJW9Ge8u5E2dw24wTEfxKv6mU/uiurjI7AU9d
	 V6VzYsBCtbofa8uG1H3Z1oQ4Cs7BVeb2BOoVZ6rpIR+kHfC9PTgYlfwjBXC81XAw+W
	 3iRFppajzVYbF4rwhwQqgDVGFMRa2CMPbjZRAs3H+uiD7LzOB0TtDgl647yoiKyp+W
	 ycYiQ9Lx1cnAPvJ9ojkj74AQIaMwGFjJmU0N0YFLHXD59mV2KuO8eHX3vyqOdL3NQj
	 eSs+oeRfUl1yVb0qge6YM9TecNr4wJw0Pfy9o6BPASBVoKKCrV0OLeEdXGRTxShWMQ
	 zA4kcqHOB+Ykw==
Date: Thu, 30 Oct 2025 09:23:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: imu: mpu6050: remove interrupts
 from required list
Message-ID: <20251030-glorious-nano-muskox-e37d49@kuoka>
References: <20251029-qxp_sensor-v1-0-e97ee1de96d8@nxp.com>
 <20251029-qxp_sensor-v1-1-e97ee1de96d8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029-qxp_sensor-v1-1-e97ee1de96d8@nxp.com>
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

On Wed, Oct 29, 2025 at 03:27:18PM -0400, Frank Li wrote:
> Irq is optional signal to make sensor work. Not all boards connect this
> signals, so remove it from required list.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


