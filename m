Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A643BC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DZZBoO1L1NubxqwTsP9P0S1RvNFFvaVbeuY8SW7vA0=; b=f6EcpeUffp9cKc+Rq+gyvwSj2h
	gMmP5sTLtZimq2w60IEvYQ5f3br66sNOe2ovTuo9xrd2XAyj5czsJSnV4jTxjeoYIaTtJ44v2do3P
	ae1WPVdDRMO7c47DuFJXVhyQclwIB5e1AAvlJwuUAVi84EN0U0T6g8cQBKmzkMeju0s+6cIaAKCup
	UPvILpuTsi7Z++xX2DkeDXhkHgzYthTo+4PgJqqG6hxPjlVDi/wTiJ/ODn1w5tKf23WoqZjtnDTA/
	1Gg1bU98yYj2pGkvD6nJFIZdQkZ1Y/Yv5Do3fYj0zMYO+6Wd93mJXBTKA5k16JS+25tFgsoUHOBfe
	Jg65Rf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa75-00000003x5X-2X8F;
	Mon, 09 Jun 2025 10:52:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZfP-00000003tYk-04Tx;
	Mon, 09 Jun 2025 10:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9DZZBoO1L1NubxqwTsP9P0S1RvNFFvaVbeuY8SW7vA0=; b=xQTOOOFmh/dtLrEjDsctBH7j/y
	pD1laDGhi64UEgCCd9fITSym0B9M9yimLcFc1LEoy1qGYhgP7yMkdpwnXJfjFIiE0DjlRszbv4/BP
	V06HVi1GaisKeh60uyJpgvd7WR1zKyKUfAvxkl2do4AafBOnMX8c+1oLoFsGXChYxhUiw8ymWDHZy
	Exv1L9b5/96KAjNZisfLiNVMHZ3yE6ks6/3D75ZvGSszuMw+orc1BoycDlV+3+IUC5a9nt34p5Cdi
	1qYrGRQRQZg8M6A6KxA4E5kvlU8HGrGgayBC2cleBva57EM+vpR5lDuKCbyQ1F29VHY04joEE1zXQ
	ry9np+Fw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfC-0006Av-Qe; Mon, 09 Jun 2025 12:23:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix cover detection on PineNote
Date: Mon,  9 Jun 2025 12:22:59 +0200
Message-ID: <174946455537.762051.11927121098980951801.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526161506.139028-1-didi.debian@cknow.org>
References: <20250526161506.139028-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032347_051395_3E8F3F19 
X-CRM114-Status: GOOD (  12.47  )
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


On Mon, 26 May 2025 18:14:47 +0200, Diederik de Haas wrote:
> The SW_MACHINE_COVER switch event was added to input event codes to
> detect the removal of the back cover of the N900.
> But on the PineNote its purpose is to detect when the front cover gets
> closed, just like when a laptop lid is closed. Therefore SW_LID is the
> appropriate linux code and not SW_MACHINE_COVER.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix cover detection on PineNote
      commit: 3f391123e2bc88c570f148cc01e923e4740c5173

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

