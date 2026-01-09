Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72425D26D9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P1BZ2S3ppg4BrswMFpKk0YRpZ+g22ZUu1DsWyom+wc=; b=K70ifgVbPuynkVeRA+H6QDTePF
	zjVRWnljmPLoP6cVkoZ2KRKIIz+8fBeiTVp0IrCLYfjD/jnK4rbW5HMGJaWiTn873BN5EczMBdIGH
	RqeFFHsS+6Q45T6mTnVazlY3bLNCmtrH/sykDWBmyolWpIdgnnj3rho2EnSfDzI+GTygdjLczAXSQ
	iIn8oaRmfiA5flqCA3WYwSf1XFdTwimmcukcjQS2sPSVhuRbYOP1mfDMINmfnWvynBTHB8s+a1/Dx
	OLHe9x4a+LunlZS3+XH10TXvKwZD3cT7akPHectpowBoaMQcS/tPlOC8VYNvkxobmZG5AqShrZkFa
	FF2o5WyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWu-00000002xKC-0qGk;
	Fri, 09 Jan 2026 19:52:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWl-00000002xCc-3vFJ;
	Fri, 09 Jan 2026 19:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4P1BZ2S3ppg4BrswMFpKk0YRpZ+g22ZUu1DsWyom+wc=; b=k0SIetiyKlkNC85ie9wDPucjzi
	ev2Zp2p2s13okdxtHJ1dtRs3/iyP8xpwMUHcb6tcV4U42RoUmQpp1k8FpWK58pYpcOaZ4HwnP+4M7
	fkkk3fgJj6NP6fbSfNf0Qq8RDAvarieMXEsp5tyFaGe7SK78iMzrUQJXFdZHbNcZI+R4c/xsEVIuB
	LDG5k2RwBmfY2TAs5FtLUlvuMRE9WQtL6/Wmazk0POWH4lT2N57e5BzMcRYDthGKs331LHmd2tB97
	MZ+WE0/hDgNFXOFw43xqGu6wUDWsT9YD+Vhgsz1aeXxWEN8/QIgoj/VPnKjeS3n+jKl4ZIcolTUxS
	zOiQkuPA==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veIWj-001fth-ND; Fri, 09 Jan 2026 20:52:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3568-wolfvision: Drop "sitronix,st7789v" fallback compatible
Date: Fri,  9 Jan 2026 20:51:58 +0100
Message-ID: <176798831391.3446147.10313596091782977499.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260108230600.1348699-1-robh@kernel.org>
References: <20260108230600.1348699-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_115207_969859_52017B5A 
X-CRM114-Status: GOOD (  10.03  )
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


On Thu, 08 Jan 2026 17:05:59 -0600, Rob Herring (Arm) wrote:
> "sitronix,st7789v" is not a defined fallback for
> "jasonic,jt240mhqs-hwt-ek-e3", so drop it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3568-wolfvision: Drop "sitronix,st7789v" fallback compatible
      commit: 3ea9fe578d1d2c1fb88410f53e378561d1531e45

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

