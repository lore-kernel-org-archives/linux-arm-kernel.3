Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9960A2611
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shgGwqsk;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=P2n/NivL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Ksm3b1KyTjB0vWXpeTrEa3XgjkfnjwTkmMUnW6CK3U=; b=shgGwqskDomnbC
	Q4OWGDspYm1Y4CJDNuXAZQgyGI2Dkqsi6bbwHuh9SXMOGx3p6gZQVya4fSXnrV3Brd8dFfHw+ctff
	uD5FoemJCQ4Ct2czFJ/rio/60kGnVPd13gCHH3iH5j4+CJEQP+eTrMtATG9r5K1bzl91dlS5PHkjV
	d4bRq9uKhy7Ii/kDS4qK1g7C+iHzpA3P1Y3/5AC0S2wg3So9SqI6Nnf16qIrZK4U0uE90I7g6SJMi
	fKmEer/ep1Mj+6RWHYlcKvdBtfLnBm4IW4fVPT6stZVFfWH4mLWsp5bPf3x7nH31LfSlDewGsEDSM
	2kMdtZLuwUsd9w0z3QBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqN-0000000EzI8-1jG7;
	Sun, 01 Nov 2026 22:16:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq8-0000000EyoQ-2sC5;
	Sun, 01 Nov 2026 22:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0Ksm3b1KyTjB0vWXpeTrEa3XgjkfnjwTkmMUnW6CK3U=; b=P2n/NivLQ4gQLjSQ+ENADKpxfy
	+ahd6N903OIwRWIkgrCcqE3QtjnYl+1mJBGeYGLYPo0thnvWijddU/jivqzPd+4nbByjqeaDWra7m
	2bTtnKasxF/PaNCgrZTEyNWVOLpcAOG1j5quo2dIL99u2BseviunqoU/xhd6dxdNTMt/XUI/YsPdA
	xw4BvcezZCeorxYO0F0/3287SbTFT6vPAHn7vxF0BfyGutAlHstq3DLtlYwOLTwVfG0Fi4oEmStHy
	MfY4puZzqDfm9cEqEO/OgLuiddmSDlMPF9KicZm/4R2eyM189VhShib31Go7pTlNpGynJ1DKYXrF5
	q0iJ+dgg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO
Date: Sun,  1 Nov 2026 23:15:22 +0100
Message-ID: <179357131399.4107717.10715553647759854309.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024083942.148860-1-gahing@gahingwoo.com>
References: <20261024083942.148860-1-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141548_855123_8B72A0D2 
X-CRM114-Status: GOOD (  10.99  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 24 Oct 2026 21:39:42 +1300, Jiaxing Hu wrote:
> vcc_5v0_typec0 is the switched VBUS of the USB-C port. It is the
> vbus-supply of the FUSB302, but also the phy-supply of u2phy0_otg.
> The PHY enables it at boot and keeps it on, so TCPM never sees
> vSafe0V and a sink partner stays in SRC_ATTACH_WAIT. A USB-C dock is
> not detected.
> 
> Drop the phy-supply and leave VBUS to TCPM.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO
      commit: 1b0bcdaa4de9725870c9b0216acbd373b5faebb7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

