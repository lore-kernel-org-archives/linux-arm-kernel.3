Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E4D3A67D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hisw5ieYkqzn1NRZL7F74ibhzAvrAfnC7G8H4VNcj1I=; b=huU7p+5Y4m0R3mOf/VDvlD7lqs
	gDEq0Jkck7KkBrtUfPQQqYRywr56Mtcit9fZCVLFAQOKuufb+Fux9q4Rv6lk8aYhTfSu3IJ807u3O
	QHtmMhppBFq96tMEBI0JfoPHfquhHJlRJ9LzBl3d7QWSHEnoLBfE34HEDunNjUx/3EedetdV8Njrk
	Pj60nMZXxkl1UYr53y9jiz8vBg2P2CaIz3fLRfZHZvym6X48t4zZc4LbzF/Qj9kBHGTPVY+1B467v
	A4xbJQk6Km3j7/UlNP6ounp/otWHbhcCQDKAH+hSW6TE74C74wDRjkAVDwSNTjZIskWR/dVh5CloN
	JAkFVnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6504-0000000HORF-2rQu;
	Wed, 30 Oct 2024 09:28:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t64vn-0000000HNv2-0YZO;
	Wed, 30 Oct 2024 09:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hisw5ieYkqzn1NRZL7F74ibhzAvrAfnC7G8H4VNcj1I=; b=KTPms5k8M8jMZJkCdocaT5J4wk
	NNtPnpxMuiUvqlxZqyMKPGzQcdpldANfZBuUXN3KLKREjmsnoIYnFfUu1esLVPYRR8To1D13BRZbp
	/sgI8ULRQaeSKTko7SR5Qi+UurM9RBQEQH/VMOtuYttQm7fA3m6sTT5xTo3JcRUYR1T0UuaoAd7vj
	pOQ+tE1Fb4jPQLKP/ayS4RJ9sHP58HkuExJssqffErwPML9xOJfMBZWtcPWhXOZsNraqPLB39xR28
	dEjjFSSY4Ai2wDoPGLgagI6q4STcAd+X9Jk+fG5+xf+BaSFRglsOH9KWAUHF8Oq+ZuhnkGt+t7Eyz
	wI3YnyJA==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t64vl-0000lm-Qb; Wed, 30 Oct 2024 10:23:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.13 #1
Date: Wed, 30 Oct 2024 10:23:57 +0100
Message-ID: <4605658.LvFx2qVVIh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_022359_203793_A3FB8461 
X-CRM114-Status: UNSURE (   7.24  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-armsoc/drivers1

for you to fetch changes up to 22e027cc74488dba49f19f943c2da02726261f08:

  dt-bindings: soc: rockchip: add rk3588 mipi dcphy syscon (2024-10-27 21:28:05 +0100)

----------------------------------------------------------------
Compatibles for some additional "General Register Files" syscons

----------------------------------------------------------------
Frank Wang (2):
      dt-bindings: soc: rockchip: add rk3576 vo1-grf syscon
      dt-bindings: soc: rockchip: add rk3576 usb2phy syscon

Heiko Stuebner (1):
      dt-bindings: soc: rockchip: add rk3588 mipi dcphy syscon

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 5 +++++
 1 file changed, 5 insertions(+)




