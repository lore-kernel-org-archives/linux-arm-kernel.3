Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D064C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEAXvMzFV1FVFVMZ3IfVMsNAWfHuN1F5zT0O6OvjfE8=; b=lOKIDdgGAppfLFo3gIQ9KPJ9Ix
	Zzcn5j0nedrB8uWRBjXrm1Rs5df+dt6GcrPfRp2TDXNt8A3c8m4mW0GB0xyEgqKovK5D38IQkLpQz
	thLpgO3nWt4aHAAuMFwRJ+JAY80t9+uHvaUpLrEnamthV/oucN0L0e7fps3lLDHf23Vs/ZUX9JeHa
	CZ47b7As4z50O+JYm4PFL8ppxVpg+uqhznheLPL9MKEW4zCY1u9ed1u0XIVNZeRwuN2kaZVzg/SgH
	BI4xCD44cSdmhgd2SUWhSIOX7Ze4aVcZgzHWIbySeMjU3bBzavJ+2kc43egycQ0kOQd+hM/h4dRTv
	r5jF6T6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4Ty-0000000GR73-0XSv;
	Fri, 14 Feb 2025 22:48:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4RC-0000000GQe7-0Gbo;
	Fri, 14 Feb 2025 22:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LEAXvMzFV1FVFVMZ3IfVMsNAWfHuN1F5zT0O6OvjfE8=; b=xH39de91My2e970+JCQmw54UlN
	03DzwjTEVPEofRCZWVPBtGZvNnVvrvOiU1SHRxjWe15O8eLee0sgEhFFJcPRPfLsXUnkA92UV9cux
	8eS988mLty8sBhj+RhIKD9IBosm9DlCjm0uDZlyaJvYdlaVzSQFn9ivi3+c5pLzy1zPyN9+TMZIAF
	HVo92OusmjAXW51WvGxFsXnMNx5XghsbwZQemZ6dPMURosY2/ayCmaEe37Q1t2OOZ0L4yLnKUK9cl
	gmfwyO6fAVBgK8+Z13qGaCR3mgSIQJ08S3CwAmq85LAPdRUcdW6jY1PntfLHe6BqSRWpTllqSx2hP
	sfrw26+w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tj4R5-0003TH-Mj; Fri, 14 Feb 2025 23:45:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Niklas Cassel <cassel@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/4] arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar + add overlay tests
Date: Fri, 14 Feb 2025 23:45:15 +0100
Message-ID: <173957310723.1747676.16443023437911911043.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de>
References: <20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_144534_099090_9B6DA899 
X-CRM114-Status: GOOD (  12.08  )
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


On Tue, 11 Feb 2025 15:02:49 +0100, Quentin Schulz wrote:
> This adds minimal support for the Pre-ICT tester adapter for RK3588
> Jaguar.
> GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
> rails and can only be used as input and their bias are important to be
> able to properly detect soldering issues.
> 
> Additionally, this adds build-time overlay application tests for all
> Rockchip overlays to try to avoid future regressions.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: add overlay test for WolfVision PF5
      commit: eb439f16861a8f1fca2c6d021cf7fce0a7a0ca8d
[2/4] arm64: dts: rockchip: add overlay test for Edgeble NCM6A/NCM6B
      commit: 91abdc6b36e12a2c3a477bde90e9f1dd8c2413bf
[3/4] arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      commit: e95b72390886f5b4127417e4732cae57c8d89b14
[4/4] arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar
      commit: 920ceeedeb00eef0c3c4f5f0276882b4666dc770

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

