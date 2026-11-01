Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADC9606F2E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDKt9hyo;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=OGHnGUhl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QEO/sD+c2E6Sj9HbxkWZHgx/K/Tm9t/CRYMgnWIcyi4=; b=iDKt9hyoe7Su/2
	uRw49M7PPdC6TdBwwVkW/siLp6Fyf4QyGm7wTYWmVPseO37Nz8NNLAZUd/EJ0uTUFqCpkCBlTY6fu
	qMUyF9YpKfrGGo/lWH8RtxCk3VotBc2/YKpV+rPgWITZbHzCkCZSR0fU64/56Vx4yvHjDC97bz9By
	zKrOMNIkD1hkT+P2gKlKkZsSvRoiuQ2mALq5p8SSu+4VIJAUFh+77dyYeygxv4uYORXQJd594tfn4
	fAvwWox9xr/Ul2+fxB9d0L/+Y0py0trSavQV9T6CFgQWXVj4MLRND77yJhxbYhWYyki9otpzurKya
	mCW2tjdSoQANqdC2QXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrY-0000000F2r1-2pl9;
	Sun, 01 Nov 2026 22:17:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqr-0000000F0Xu-36pt;
	Sun, 01 Nov 2026 22:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QEO/sD+c2E6Sj9HbxkWZHgx/K/Tm9t/CRYMgnWIcyi4=; b=OGHnGUhlMmiOtpmvL99Ph1+mni
	z63rLqlPa8OBDtvz7NqL+zjcSpTL6MKJLpwlKD+A2mHYv4b1+jFRZG3HDrv5mmNeVT4vIWv4QJZQD
	b/cBIqOA5LSUWqr4JdxO+31FAhazjOeawWF9JbvvE3YaDqTRnbGer5PjzJJubyoJTTWIAx+wlLZ0B
	P0RM9mmF54M5n8fkf9CJ2eSA70oNQcOFSXWtI22N0exrS1YVCbJTRr/Va57m1JDgASa70s+gsxD+o
	AbWTx4V5KSEeQl2BrDO5xHC3vh0SRnZjAt4QHWsykiS4wXc7j4WK54hXa+xRu7eGpaKWK80/Kx7mX
	Pd3yIkFA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Miguel Jesus Seron Gonzalez <info@gluon.es>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
Date: Sun,  1 Nov 2026 23:16:10 +0100
Message-ID: <179357136499.4108155.904162787901062784.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192254.6933-1-info@gluon.es>
References: <20261019192254.6933-1-info@gluon.es>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141633_870626_AA222BD3 
X-CRM114-Status: GOOD (  11.65  )
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


On Mon, 19 Oct 2026 21:22:54 +0200, Miguel Jesus Seron Gonzalez wrote:
> The gmac0 node uses phy-mode "rgmii" with the MAC delays
> tx_delay = <0x4f> and rx_delay = <0x2d>. On some boards this TX delay
> does not work at 1000 Mbit/s. Dongjin Kim reported iperf3 throughput
> below 200 Mbit/s on REV 1.0 20220613 boards. On a REV 1.0 20211112
> board, TX from the board stalls completely in iperf3 and ping loss
> grows with frame size (5% at 56 bytes, 20% at 1472 bytes), while RX is
> unaffected. Other boards work with the current value, so it seems to
> be marginal rather than wrong everywhere.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
      commit: 781227c237f16eaf14c57124cca854a5faf8a121

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

