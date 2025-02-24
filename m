Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E859C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb2exU8QC7Sc/2+pBbZOOQIwxvwspOiOa+qNHnsQ8Sk=; b=q1AmwuGWcRcxCQKmNKWzBva2n6
	XpysIj63/Dv7uWFIycxp9klB6rD4OqPbKWn1Iv5Sq51+whIWVI6hYktzttg6tuaQi+2mrW31V1pQY
	vQYDN2WPWJmgYBTr72PdxIpATn4xayDZj8rfp5eY3VEde7Zxon2AAqvxVXterXr9LU9nIRvtQZKdP
	kntc4+1M47lI75RdL22bkXWjC3GEjLTZ41OC0g8KZsQEFbz+ozv0L6q6woSHk+QmZTcazBK6F99E0
	eckJRay5VxcX0EOVOG8XcuQyacKPsEqbt8dlyhim8emGt0IOxMTNUuqaCmYujsCN1JxdmoAcaIt/A
	HeL3GJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfNf-0000000F90y-0b5K;
	Mon, 24 Feb 2025 20:48:47 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfJX-0000000F8PS-3np2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29099611F7;
	Mon, 24 Feb 2025 20:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165DC4CED6;
	Mon, 24 Feb 2025 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740429870;
	bh=6ZQ2uzFiFhD7gkzk+n7hLxToXvw9f/qLjNwvw3IN058=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwWbpNhCqwW2+IaFJM8s1EadrnggVS8HGVSkSAatxVKhTW1CDmZCPuIV58P2ejefE
	 9fFCKKpdviw7OhuqtW474AqL9TJoMz+idxN5Dg1PXNJ2HAJs/aJP2T2Com9JjsU/WN
	 ccOvcuOl8SzV1MhWguZaOXc2gHGBy2MZfmB8pjl0yWZLUKRgLpAgoxCgkJBeAPKcV/
	 6Mkkpf0jw2ofTdTGrB+rw6+cpM20zOg8/7qHNCeg+WOYOaTA1nymb9+I6nhpR0oc/f
	 UM9JJvk16LHop1JdTSdslzTFJrIcugsdLECkKsvah8C1ZpSmpEWHx+fpN/InM+TFRx
	 2YaKffluH7H3w==
Date: Mon, 24 Feb 2025 14:44:28 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Message-ID: <20250224204428.GA4050751-robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
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

On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:
> The main point of the Moduline series of embedded controllers is its
> ecosystem of IO modules, these currently are operated through the spidev
> interface. Ideally there will be a full dedicated driver in the future.
> 
> Add the gocontroll moduline-module-slot device to enable the required
> spidev interface.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c7fb46f771a300926f05 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -107,6 +107,8 @@ properties:
>            - fsl,mpl3115
>              # MPR121: Proximity Capacitive Touch Sensor Controller
>            - fsl,mpr121
> +            # GOcontroll Moduline module slot for spi based IO modules

I couldn't find anything about SPI for GOcontroll Moduline. Can you 
point me to what this hardware looks like. Based on what I did find, 
this seems incomplete and not likely a trivial device.

> +          - gocontroll,moduline-module-slot
>              # Honeywell Humidicon HIH-6130 humidity/temperature sensor
>            - honeywell,hi6130
>              # IBM Common Form Factor Power Supply Versions (all versions)
> 
> -- 
> 2.48.1
> 

