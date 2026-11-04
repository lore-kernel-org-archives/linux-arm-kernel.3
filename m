Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E667606D819
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L4kJbDIr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGYEVKoG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7JPjenQFeEsZp71b+iGe0lGbAcckPwZVykttqOk4x5Q=; b=L4kJbDIrPDE/GzlizsB5S+Bbm2
	x+js65EOEc55lsptPWEA4tL3WrQjh9YSC70gtYDlqk0GAsGvZ0S0yIxdpnQJ8XR8TOWE3ydhkc6xq
	O6MDk4246Yi151XnG6zWvYg246S4TU/5ZoDom63RT1xFkzblBlAGyxF24SYpqIw22LcpFRAK+zNCK
	SV+tJTt7j9EM8aOrFtGOW/VutDz36qD67wzJq9V3PGt/IA+FJvdZFmNVBHEX6COhWc6TASZRd7zEZ
	Bw4QXmGNBiSgWn3LHp1KKSm/25Ymxx8KWFtUqaWVwg3SV5+HmO2iCf/BG5leznqou4e3QPO7GZTYq
	aIVWO74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWD9-00000004gVw-062Q;
	Wed, 04 Nov 2026 08:19:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWD8-00000004gVl-1Wx1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:19:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A655601F6;
	Wed,  4 Nov 2026 08:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C59E1F000C1;
	Wed,  4 Nov 2026 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780349;
	bh=7JPjenQFeEsZp71b+iGe0lGbAcckPwZVykttqOk4x5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VGYEVKoGNwFuMJbTOlO7VKVvGlToA5A1xtt1tUQu/WGB1i1j9NttWJM/9bq4oTWXW
	 YZVTVn1SAkFb9cnjEgZA4Ox5ZZDmKBJ8PO155G/DBT52C1wa6Ulq19x0nZprUah0Mb
	 ne1LR2560+AP7QCob8LSk7VejOfbXRsijZN1KCTZdFUNfq6hNch6sFesuGt/uVP6+e
	 9CK/EoculLm9BMAlQPK2Y7oNZ34vt7qKV4AnrKtNqoVber3PRzcgsUhEWrFZI0DgNh
	 IHPjWHTdjMgkO8vGJrvcFTFM9rujxlckBOq8SMHdvX2D8z8+i65qNanXxGjDKNXvQ+
	 JWcHHnkEVQ3qw==
Date: Wed, 4 Nov 2026 08:19:02 +0000
From: Lee Jones <lee@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v5 00/15] drm/tidss: Add BeagleY-AI display support (and
 some more)
Message-ID: <20261104081902.GC792264@google.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[...]

> Changes in v2:
> - Add Rb and Tb tags
> - Drop "dt-bindings: mfd: syscon: Add ti,am625-dss-dpi0-clk-ctrl

Looks like I should have been dropped here.

Please can you remove me as a recipient of this large set.  Thanks.

>   compatible", which is now implemented with the below changes.
> - New patch "dt-bindings: display: ti,am65x-dss: Add ti,dpi-io-ctrl"
> - Modify "drm/tidss: Add external data and sync signal edge
>   configuration" to use the 'ti,dpi-io-ctrl' with offset.
> - New patch "arm64: dts: ti: k3-am62p-j722s-common-main: Make main_conf
>   a syscon".
> - Modify "arm64: dts: ti: k3-am62p-j722s-common-main: Add support for
>   DSS" to set 'ti,dpi-io-ctrl' properties
> - Drop generic desc in DT bindings for power-domains property
> - Fix pm_runtime_get_sync() return value check

