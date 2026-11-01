Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A11606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zOoO1vVY;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=CgMIMrh0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H4mpy8fCxgcQpV0HEH+hde8VVOated1fMyKTSDNaznc=; b=zOoO1vVYOHVvJf
	HWMaeitxZnx3dIo2GGNv+Cmf6MtwUBUomyywN0HyuCQ9Zl4zNyOgfJQNzTG6UlU/CFMQ3taylee5F
	HamYfxre1Y83O90wHTBTkXdoIb7zXKS/SHrRMWneV6tYeaakXTDxkhrU+8/9La3xEuNw0Jml0OQMg
	5EM1lmJtLg/m1EWnTQ5s92b0MWreVTm7nB3NUF0qO5UHM4jR2KQm+icprRBuTSCC0Nqo318bcIYAA
	R5LunWaYmleXDuUB2d/CGhWvlrWy7phtYcb8Gd/Bgarg8rjvCJ/CEv3aXnBysjEy4UG1VcMeWAyFU
	wC9XACEBaD3WSnDEVyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsH-0000000F5Py-1wpm;
	Sun, 01 Nov 2026 22:18:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNds4-0000000F0Xu-3iwB;
	Sun, 01 Nov 2026 22:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=H4mpy8fCxgcQpV0HEH+hde8VVOated1fMyKTSDNaznc=; b=CgMIMrh0QhPXvK4FzOvve3dYJG
	KueWhP6x49zS87OwPuWjIJH9SM0CULldhoM3Rllxx9b1iSgNeWpQ67Gf/WqqHr59WzdF6KREjDG6j
	qS7ZCDkuY6+ybfVues2Rcm/8dAw6dVPGKSDBgr7j3J9BzdiWOmuCGZNngOSMQok8E1p5NQ9vQtEZO
	DKfdn5duF7A/C2U3rKvcsOS7X3W6ivpB3UBcjx0lXoamo8lFGaYLGJc0keTnjZdilxMFUViE+sCTr
	Ypy5MHC2ceJu6EF7DLOJ771IcXVde9IZ0IaLJAjjNRSgXQnGjTEjVCWBXlmlOOIES1usTaFDHXu4v
	O42RxJdg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Leung <untilscour@protonmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: add maskrom and recovery ADC buttons to NanoPi M5
Date: Sun,  1 Nov 2026 23:16:38 +0100
Message-ID: <179357139350.4108484.2629575162026110096.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-nanopi-m5-adc-v1-1-822edeb1acf4@protonmail.com>
References: <20261011-nanopi-m5-adc-v1-1-822edeb1acf4@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141749_028830_4BA84E58 
X-CRM114-Status: GOOD (  10.72  )
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


On Sun, 11 Oct 2026 06:27:42 +0000, Ryan Leung wrote:
> The FriendlyELEC Nanopi M5 has MASKROM and RECOVERY buttons connected
> via SARADC (sheets 6 and 19 of the schematic for both the LPDDR4X [1]
> and LPDDR5 [2] versions). Add the two buttons to the device tree.
> 
> [1]: https://wiki.friendlyelec.com/wiki/images/1/10/NanoPi_M5_LP4X_2411_SCH.PDF
> [2]: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.pdf
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add maskrom and recovery ADC buttons to NanoPi M5
      commit: bc2e69f575631cb7b6528ad25990406a6339e8a9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

