Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EFBC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggVdP5WB7dmKeqoWnaYejxWiD8uyj1cRmz9hIWSjxgI=; b=iC1bG4KoN1PIZAL/FwAYXITiZC
	hodYRgmrF6JMTwTvtY/DJtXo59gPfask2j0xlj71Uq0Mc0hp43YjZi60/hKHQ4HoDr3e8GL9kr484
	6sxgCvDxRPaqd5ZOt6wIMt7xN+9HC2rJpeEeFl9dlWDGbDUVrCr+CANqJNxh5cuB7+6yWyG1MHPTW
	iorajx5caXpxxrToc4LiQqvNGgcOR+hGhApKnqkLE4LXlKLrz5TzhQrsYYRN2Sv1E5xy6rkPTALO2
	RZHgOx/xgbF6myxkwDt/w78jgUil7Q+h0g3O1UrAJm0ER8uo996w6Y42STgLptP1jMuWdpYyJBeGK
	Za3iuGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMeE-000000015Y1-2PtT;
	Sun, 09 Mar 2025 19:49:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trMca-000000015Mu-0Kuy;
	Sun, 09 Mar 2025 19:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ggVdP5WB7dmKeqoWnaYejxWiD8uyj1cRmz9hIWSjxgI=; b=XdEDtKemwiyOxfou/xXkzu2wSA
	uKIzI70rg8yVmSfOgB8RBcPiosdXczqgBH73d1ahIJBBvkP+/1JjO/qyqGMAydwIU7lr4mg5G+9Il
	3y7wuWg3MwoRAJE3XVTeIFK8nTEBcArjAd3iKTPPZCeg4h7sKH9S9C5p4+uq4NkwQLdCX7eSQWvky
	MT5WgaV7NViv5skVp5OzZ02U9I5Ybm5BZ96WzfM5fZVJwolqfTS1M+h928y8hBhuTuouXUyRblC2p
	ErII2wchfWP4o17/z3iLG/tO2L6LM/AwEH2t5br5+Hc35gI/F5ppGqGsRMgdWG7RfE5qUSulXjFNQ
	0Vb3YEeg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1trMcP-0003bO-AZ; Sun, 09 Mar 2025 20:47:25 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
Date: Sun, 09 Mar 2025 20:47:24 +0100
Message-ID: <1914308.tdWV9SEqCh@diego>
In-Reply-To: <20250309070603.35254-2-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
 <20250309070603.35254-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_124736_133076_004C3424 
X-CRM114-Status: UNSURE (   8.31  )
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

Am Sonntag, 9. M=C3=A4rz 2025, 08:06:01 MEZ schrieb Yao Zi:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



