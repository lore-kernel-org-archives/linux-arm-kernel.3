Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 19:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=urx2rDTQ;
	dkim=pass (2048-bit key, unprotected) header.d=gluon.es header.i=@gluon.es header.a=rsa-sha256 header.s=default header.b=imJ+2XdX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6y4bY/nWKsQ0dtsbCN7wJWBo0nm0F/zcZorgUH+8wwE=; b=urx2rDTQTfMJIJZkQfiw/9JgFj
	npX5u/7+UiztWr/uHmOePCSd+o5gsULQ6cN/xCnJlGV+rp2boFSah1rpClCmeGNiqRY7AnHWbtWI0
	BlNAhpSjseK3JsNPzq3di0eiTZBHfono836Qe1DgLT4jh8b5ualybOI3gjkBY1wsFwprAhR75dYOi
	WONB22zvMJvfD2A5tgT0qMoPF+tJkIgxOz/SSMSPDhIfOLg8ELuEv1zH1l0VFGf0oJxncHba4di3q
	WpODqbB6AWx4BCFKkQXwXyR9lRkpBYKO7gKT23JKi5KPKzLomKP+Ba3Spm+SiZ29IVxbaNTxLONGU
	dsqWjUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsx5-00000008EiB-1y4s;
	Mon, 19 Oct 2026 19:23:19 +0000
Received: from nimiomail.com ([217.160.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsx2-00000008Ehi-0fXF;
	Mon, 19 Oct 2026 19:23:18 +0000
Received: from nimiomail.com (localhost.localdomain [127.0.0.1])
	by nimiomail.com (Postfix) with ESMTP id 7BD5D81E92;
	Mon, 19 Oct 2026 21:23:07 +0200 (CEST)
X-Spam-Score: -3.101
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
Authentication-Results: nimiomail.com (amavis) (amavisd-new);
	dkim=pass (2048-bit key) header.d=gluon.es
Received: from nimiomail.com ([127.0.0.1])
	by nimiomail.com (nimiomail.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNRt1Oecl74P; Mon, 19 Oct 2026 21:23:01 +0200 (CEST)
Received: from DESKTOP-2QFDG0H.tail76f4b.ts.net (21.red-2-139-241.staticip.rima-tde.net [2.139.241.21])
	by nimiomail.com (Postfix) with ESMTPSA id C5E4480709;
	Mon, 19 Oct 2026 21:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gluon.es; s=default;
	t=1792437781; bh=6y4bY/nWKsQ0dtsbCN7wJWBo0nm0F/zcZorgUH+8wwE=;
	h=From:To:Subject;
	b=imJ+2XdXhn0VS2WDx9HTbQrvF9s9vLdmSHICMY9UBHFRsfxRUFl3is6TQZOrLeSp4
	 boSvYr2/YnsU9kXbZD5m6sYIt9iEqY/fc/Iu14+7MPPg+BgGND6W6fP0efV36xZDCi
	 N1UqX79wvhq04drJ9cFJv6uaQJtEZyHZWQeKOkXiYGqe7zgc1xN0H83UaWhErrfZBa
	 hyquBUhwYGn99RQGQpYKdh4d2aNQ3HvICvv5pBlXsD/oFUiPy+lfpamfmxuzDNIyLq
	 votil1L+QVBQPxk26c6sliKTVZqcn979IOip1LggJD4fDKEJvEzHE2OaVeOD0TQVBB
	 L6Z71IEsougrA==
Authentication-Results: nimiomail.com;
	spf=pass (sender IP is 2.139.241.21) smtp.mailfrom=info@gluon.es smtp.helo=DESKTOP-2QFDG0H.tail76f4b.ts.net
Received-SPF: pass (nimiomail.com: connection is authenticated)
From: Miguel Jesus Seron Gonzalez <info@gluon.es>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
Date: Mon, 19 Oct 2026 21:22:54 +0200
Message-ID: <20261019192254.6933-1-info@gluon.es>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179243778132.1150629.14231437258711705057@nimiomail.com>
X-PPP-Vhost: gluon.es
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_122316_359432_D0AA3F75 
X-CRM114-Status: GOOD (  10.86  )
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The gmac0 node uses phy-mode "rgmii" with the MAC delays
tx_delay = <0x4f> and rx_delay = <0x2d>. On some boards this TX delay
does not work at 1000 Mbit/s. Dongjin Kim reported iperf3 throughput
below 200 Mbit/s on REV 1.0 20220613 boards. On a REV 1.0 20211112
board, TX from the board stalls completely in iperf3 and ping loss
grows with frame size (5% at 56 bytes, 20% at 1472 bytes), while RX is
unaffected. Other boards work with the current value, so it seems to
be marginal rather than wrong everywhere.

Instead of tuning the MAC TX delay again, switch to phy-mode
"rgmii-id", so that the RTL8211F PHY adds both RGMII delays, and drop
the MAC delay properties, as suggested by Chukun Pan. Dongjin
confirmed in the same thread that rgmii-id works.

With this change, on the REV 1.0 20211112 board at 1000 Mbit/s full
duplex, there were 3 retransmitted TCP segments out of 24929 (0.012%)
over almost four hours, no RX/TX errors and no ping loss.

Fixes: fd3583267703 ("arm64: dts: rockchip: Add Hardkernel ODROID-M1 board")
Link: https://lore.kernel.org/r/20250819075522.2238643-1-tobetter@gmail.com
Suggested-by: Chukun Pan <amadeus@jmu.edu.cn>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Miguel Jesus Seron Gonzalez <info@gluon.es>
---

Notes:
    Sent as a standalone patch because Home Assistant OS needs an upstream
    reference for the same change. Dongjin confirmed in the v2 thread that
    rgmii-id works. Dongjin, if you would rather send your own version,
    I'll withdraw this one.
    
    The debugging, the changelog and the patch were prepared with the help
    of Claude (Anthropic). I reviewed all of it, and the test results above
    are from my own board.

 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 442a2bc43..a3cd21aa0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -200,7 +200,7 @@ &gmac0 {
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy0>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-supply = <&vcc3v3_sys>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
@@ -209,9 +209,6 @@ &gmac0_rx_bus2
 		     &gmac0_rgmii_clk
 		     &gmac0_rgmii_bus>;
 	status = "okay";
-
-	tx_delay = <0x4f>;
-	rx_delay = <0x2d>;
 };
 
 &gpu {

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.53.0


