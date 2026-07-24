Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B247C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4jA95NvxlnIR1Hi2g9Z6FkmE9n79P+Ej5d6GEWovXQ=; b=yyZRKeO/i45NS/9p/dmZLhOAqt
	d7q7a6UWJtO6uEnT2BoVMPUi/4tkO0CNnBtMVK90+vpi2zGWT0g5TB4BnqDVhJ0cnFhGwW6YfhGaq
	RCuzW6Pn3Pv6/fnqPhVWsQruJvV4WE2rkF/FhJEhUtykt/LKFQ0zeM9NAWWtiJ+mEfwyhs+f+X22k
	i9yXfBxSrh2xinZWVO4VAbK1J87l3PUy0IP2Svl6r3Rnt5cpR+BoQgDU3/2nuA1Wxy/EkotSUfFZ+
	d8xIGkdQ0ETtQJceABFuYH4gaW8fsdy/9E1JTVl1MsSGFZhM7oQhoBoSGY0PPsmWsRhzgVFIezdvv
	jJ0CNarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD0k-0000000G3rh-42HT;
	Fri, 24 Jul 2026 10:20:10 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD0i-0000000G3qk-1qR7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:20:09 +0000
Date: Fri, 24 Jul 2026 10:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1784888396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4jA95NvxlnIR1Hi2g9Z6FkmE9n79P+Ej5d6GEWovXQ=;
	b=cKwoBgnE+DhdTJU33w9R9euhKma7trvL516xwdFrdSR280gx3pYzmYPoL2PzO6zKg4lL2r
	dXR5nwK2R6UctttWiJOJDOtg2Sm/nRqZo1Tt5c2TZB04ZfQJ/K90Z7XDJXjzFzrsHxK+3a
	Z3TnFQWnO6jfg05+Gc4FrGCA8hgPGJzaYI2QSvfYRUZhKHnvUAqVMGggj7RhoTdFS9r/WS
	VyzzYyLKEYOy8x78w4xTGLIiq6P2Pp+aaPkDjXuZmnwxw1J8AOJDZGnW4nxsBUoDN+ns5K
	zI9qoPXU6n5j8jAKW20dD9+fsMcLSEuvTnFrnW7G3Lne3gCPK8cQUukJvHlCRw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH v6 0/6] Add Amlogic stateless H.264 video decoder for S4
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
Message-ID: <tiocog.2cefvi325on5y@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032008_622191_D42B0AA3 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Zhentao,

On Fri, 24 Jul 2026 07:04, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>Introduce initial driver support for Amlogic's new video acceleration
>hardware architecture, designed for video stream decoding.
>
>Compared to the current Amlogic video decoder hardware architecture,
>this new implementation eliminates the Esparser hardware component,
>enabling direct vb2 buffer input. The driver is designed to support
>the V4L2 M2M stateless decoder API. The initial phase includes support
>for H.264 decoding on Amlogic S805X2 platform.
>
>The driver needs to work alongside with a signed firmware. The loading process of
>the signed fw is as follow.

Is the firmware still signed on devices that do not have secure boot
enabled? (which means none of their boot chain is signed)
Do the signing checks take place in BL32 or elsewhere?

>Stage1: Decypt and decompose the full firmware package when the driver is probed.
>  +---------------------+                        +---------------------+
>  |  Decoder Driver     |                        |  TEE Shared Memory  |
>  |  (Kernel Space)     |                        |                     |
>  |  +---------------+  |                        |  +---------------+  |
>  |  | video_ucode   |  |                        |  | firmware      |  |
>  |  |    .bin       |  |  Copy payload to SHM   |  |   payload     |  |
>  |  | (from fs)     |  | ---------------------> |  | (Secure RAM)  |  |
>  |  +---------------+  |                        |  +---------------+  |
>  +---------------------+                        +----------+----------+
>                                                            |
>                                                            | PTA Invocation
>                                                            v
>                                       +-------------------------------+
>                                       |             BL32              |
>                                       |  +-------------------------+  |
>                                       |  | Decrypt Firmware        |  |
>                                       |  +-----------+-------------+  |
>                                       |              |                |
>                                       |              v                |
>                                       |  +-------------------------+  |
>                                       |  | Decompose the full      |  |
>				       |  | firmware pacakge        |  |
>                                       |  +-----------+-------------+  |
>                                       |              |                |
>                                       |              v                |
>                                       |  +-------------------------+  |
>                                       |  | Store decomposed .bin   |  |
>                                       |  | in Secure Memory        |  |
>                                       |  +-------------------------+  |
>                                       +-------------------------------+
>

Is BL32 strictly needed to load that firmware? I know on at least older SoCs
(sm1 and older) BL32 is not required for booting and amlogic-based SBCs are
often used without BL32. So once this gets ported to older SoCs, would
it have a hard-dependency on BL32? And if yes, can upstream Arm Trusted
Firmware-A BL32 be used instead of the Amlogic blob?

Best regards,
Ferass

