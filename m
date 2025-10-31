Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369E1CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 22:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vACZFnTE1bFSK6RsWKOJ3s4+2BvKyHRqatrbxMl81k=; b=IpBhXCW9QR/w6db2r6IRkocmtS
	dBsnvpC0C1oIGaVZgVwvgAhSaaUAms7CZJsyeJ/PGQejJg1gPa50ejwE7GwpKFpCupHky/xhbqv//
	nR6khV/8dCE9/tpRMa+pWYesyEJcjQH8K1DZXWYRgzce6+COVZvJRs5isHi4Xmy0BTQlkvT2GiQDy
	kSz6pT7y7zIsroeF189s8DGumqZh+ewOpfrwXmoGjOq4onaOjM440VBI9XEbDRxHckfGkzRynnv7s
	YZrZehjBq+wJ6eK7DKW7QNxiP4NGIaXeIyeMaUd9dwgbOvxrAqisfXDP/1ZBgU8/YqrG+8FUqHJ5X
	xocXXJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExzy-00000006spg-3fQ0;
	Fri, 31 Oct 2025 22:53:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExzw-00000006soT-0jl0;
	Fri, 31 Oct 2025 22:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0vACZFnTE1bFSK6RsWKOJ3s4+2BvKyHRqatrbxMl81k=; b=HU7EEj8qL6B/gNydI3tA0ju5Cu
	X83feZ/yfAG2tn2ObEDKc1T85bWsn4a6rYnPpDFc6XT7o5QFTqvAMbASE3jjHi3cnTKrddRLN1Uv0
	ztoIpS8/t94sZfWx+IlXr2Jn0SUlg5Z6Zj75+MqGQeDoLGN5V5ZJj29cR0TL+czAwUWu6eyYDweRs
	eJzKmsW3mMVXpp/iK4ediMhKT/3mDbeUCcZm6MMYf5K8a0S153OcPEcr/e0U0gkz+jwyYsk3o2dM3
	1G10CKxm1Mc14q91acqkd7pZYVYAgCLq7cjGeUAJevgQw6Zs6PoctGoTgnkv/qWR3ehTKNzqA5Ls0
	AZVAEyZg==;
Received: from i53875bca.versanet.de ([83.135.91.202] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vExzr-0004vM-Vg; Fri, 31 Oct 2025 23:53:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm: dts: rockchip: rk3288: remove mshc aliases
Date: Fri, 31 Oct 2025 23:53:22 +0100
Message-ID: <176195118794.233084.14651345764669751687.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <3e461bce-e8e6-48f1-a296-34040447ff25@gmail.com>
References: <3e461bce-e8e6-48f1-a296-34040447ff25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_155332_207981_48C78C5B 
X-CRM114-Status: GOOD (  10.66  )
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


On Thu, 30 Oct 2025 19:20:42 +0100, Johan Jonker wrote:
> The use of mshc aliases is deprecated for some while,
> so remove them from the rk3288.dtsi file.
> 
> 

Applied, thanks!

[1/1] arm: dts: rockchip: rk3288: remove mshc aliases
      commit: cafaf99e4a790f8492a034a3470f878779c8c535

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

