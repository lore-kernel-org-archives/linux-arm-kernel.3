Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB20C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvwwnPsW3knLIltBIEoiitBnipa0SwOi009wD+wqp4Y=; b=Vpg5HkUPU8hPwYUUinqHnogFmD
	K9qKlPhZLrSe7oDpMjP1bZkMSK1kUKKa3qIjEaHEnv/UyQPuNHzpIk6Jv3D5aDwnwTl97Vc/gmOIq
	QyjuRfUZcR79vS5yxyviwXWIln1thKuzROXlDKLLYaj1i4eT2cI5zVwwCQ5olFjuRL0Xg5TeMayvB
	+2XHcBQoCfjYoQn+6O02xzgSIKqXejwfgsGrK6JVkCg6aNP9hjehLGiQ5F3HTJVit8vDVLuS3muUA
	nNpi+DW/mQe00sVOpLx+7iXFOouoS3MxaFIw5yABWawBf2vh1esjhLti/8r+PXiUeCZQ/dGbW3jdY
	ZE/iopTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZql1-0000000Bpeg-2Ca5;
	Thu, 10 Jul 2025 12:52:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpH3-0000000Bc1p-36J6;
	Thu, 10 Jul 2025 11:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QvwwnPsW3knLIltBIEoiitBnipa0SwOi009wD+wqp4Y=; b=BzgOQ4wH9LxFHFXobmsfZMf6m5
	Baa4elG56mrwz+nWPNi4kTSrOuSdhD/tW1ICcxbzClt5fiGocQj2RDWwHETI9eHJJE3ofyDGDu4mx
	xOTaWyL49oBdUUZ9X0ojAD997KZGLalsYIMG1m8BFVwvzUBMB1AGJFiSVa3OVbGCJ4KlkqJijKuxO
	h7hbRCJitCLvy+AL9rpKHc8QmMDu9RbY3gUhkk0zXTP9oDFcR1E2447W5S1MJcomFgdbOlYHP8HOm
	IXWiaeNqH89hCyM2aB4EF+JXX5hYpScQxft1pvZKcLaCbXw5q42jT2S9wbfMtHyioywKZwMwg3xFY
	d2verbrw==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZpGv-0004Ql-5M; Thu, 10 Jul 2025 13:17:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: rockchip-thermal: Add RK3576 compatible
Date: Thu, 10 Jul 2025 13:17:00 +0200
Message-ID: <6689502.31r3eYUQgx@phil>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-2-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <20250610-rk3576-tsadc-upstream-v6-2-b6e9efbf1015@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_041709_772402_A5EEDC37 
X-CRM114-Status: UNSURE (   7.54  )
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

Am Dienstag, 10. Juni 2025, 14:32:38 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> Add a new compatible for the thermal sensor device on the RK3576 SoC.
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



