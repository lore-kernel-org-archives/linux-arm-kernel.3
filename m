Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3B8C3ABD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUACwQMdDJ75lG0pGjfTnKwjnJF++bZxZNoTnQ2fhcI=; b=VM04r0++fltfE7vJIcNIWdnn/x
	/uFhPydevb5j1h1zB2BD0e60m4Avw1mfxpHxJIeoBMUabpQHi7PWejhLDpcDsDaSFJziNjob+45dS
	8RkXS3s1F4GgbvXlbN42XBP5AWaIZXc0KMgz+kgrfIunq6X9oA8D93BIQZBqOiHNpTLiOzusylTI2
	AuRb7OgIwC9IAr3kEWb6zA5SS4VTWEq43kJw3ZFT5L2PMUXrecJJZkQS33A9mx64u13QZRcj9jyMa
	mcNMvgbwNSkoonvptGWcvELq0uQS6zV61tV7zwJpx0rvMDSzpffxltO46V+pnXq0i4mQ7PJ+tigfz
	NQZiSvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxk-00000004udn-41wi;
	Fri, 09 May 2025 21:08:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTte-00000004i60-20HB;
	Fri, 09 May 2025 20:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sUACwQMdDJ75lG0pGjfTnKwjnJF++bZxZNoTnQ2fhcI=; b=TYRuy/vqOjUpiRaH09BEgokIQQ
	PsFDF5hMwGNEdTqks5SLF/5XSbnIT2Pb2w5I3pqagDPpgG8AF2xjG2m0l9GFNorzEXTunkye/Qejg
	/w1T/hGQ2kkjtLdE75Na9jKMZHxPaPGdZn2P+Iu4KKNW1IlEpElTszk5x4ax/POSWHPe80cq3sZkl
	jQPUALICeso7KIr7hcq31YMwJnIH711JlJZgHRQos2Ju5hAKiSdApSD5BzjiSzFvwAT6ELUdrbcm1
	qiKJN51269Gxllfs8OWjIqsu6BYk5gjEkKkAaJVhimbSKUyhK2Xa3+vMJfyUBGhckcEbSU/kDScAB
	WI7ZfXlQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDTtb-0004Jo-6g; Fri, 09 May 2025 22:00:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support
Date: Fri,  9 May 2025 22:00:22 +0200
Message-ID: <174682074870.2029046.8482000655658409755.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_130038_533917_1E1923EA 
X-CRM114-Status: GOOD (  16.51  )
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


On Thu, 08 May 2025 19:48:49 +0200, Sebastian Reichel wrote:
> This series adds support for the ROCK 5B+, which (as the name suggests)
> is an improved version of the ROCK 5B. It also adds initial USB-C
> support for both the ROCK 5B and the 5B+.
> 
> Changes in PATCHv2:
>  - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org
>  - Replaced DT binding patch with the version from NAOKI
>  - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
>  - Moved USB-C SBU DC pins to board specific files, since they differ
>    between Rock 5B and Rock 5B+
>  - Added pinmux for SBU DC pins
>  - Rebased to latest version of Heiko's for-next branch
>  - Disable USB-C on Rock 5B for now
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: move rock 5b to include file
      commit: aadfbdcf7e1e7f3892e0e4bdcc3c9c7c9adfb723
[2/5] arm64: dts: rockchip: move rock 5b to include file
      commit: aadfbdcf7e1e7f3892e0e4bdcc3c9c7c9adfb723

The two above squashed together as intended and talked about
on IRC.

[3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
      commit: 874c1117621d441e0ef4a609665f228a4b8a1932
[4/5] arm64: dts: rockchip: add Rock 5B+
      commit: 376cb9696298df2028afb620a9dc6c4b10a18605

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

