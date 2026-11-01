Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5858606F69C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xYCjEemm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=liG5gMK2;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JtzFVbFA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D/8ujQZQqA3V4KDGStCwEnZN+ncI+5OkOUdViJ1Jw74=; b=xYCjEemm6N0gXX
	8q5m1feGu5l0b5G+rDjW4E7q6+rZjdHEy43f0OVd/jZAu5ztBA+8cCccOCrCxEAb7Ep4ydRX6T3lr
	PP1jto8LBrYw1bZ+wfn+LPyS+xbd9gQu5o5kQEWwxudwWDoU8Qhgk8vAaI55Qh9tdskM779+Qzwdk
	AsJPFPUWzsAHVNm0LGWHblt2c+qaaa80+0TvQJEvEherMQz7lg3R7MSqB94ZBspQEQpoKO59jf/kN
	ZzxKbNGUFXlZIRUtqAitQogEBGVAdJjTh11yn7EbxtGhQuGcKq7PvMngwa9Y/QZfqI28gS26VrVp5
	c2fO6BLXJ0khnOW2HHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrO-0000000F2F4-222V;
	Sun, 01 Nov 2026 22:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr0-0000000F0vm-0uaR;
	Sun, 01 Nov 2026 22:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D/8ujQZQqA3V4KDGStCwEnZN+ncI+5OkOUdViJ1Jw74=; b=liG5gMK2zloew0fPjD95F0yE9J
	l6n/ZZ9vJTeGQPO7B7t15r54QcuWP1VcNFWGkdE9HeTy5gYUDSQZ8SiykWbiRhXiiH+Wtiy4eOL3l
	8zqMyjyIvuQs8XQgLwYKgjRgLBzmu2Tag5IxQrJCpS0Xz3ny+HOKjHLWcNAdHHzRGURwsJ1J47OS3
	014scoCCiEn2uppTin7Y9uJbOq7Uy+AAfWGPAcXWpVxRfzOGjcVFoxY9xo3Vh01VuEtrqFb8c5x6+
	3G4+hJPO0fINtzsruyITYgTKY2P55TfN18N61X9NnoTL/6ndwQCVc3SLZebTYinIuOFc0MSclATzj
	VVQcxBLA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqg-00000001sem-3dh9;
	Sun, 01 Nov 2026 22:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=D/8ujQZQqA3V4KDGStCwEnZN+ncI+5OkOUdViJ1Jw74=; b=JtzFVbFAof+H3fhSP83ULkadMA
	XFFLc/PIYLWHMwazH8l7OFZjRL7HWSgxDx1M6KYo4yyOxwvEeBmetFRJk45EQi3PDWeHa+akf3Gar
	0fP7eQbP+4n/4sPeel1LSHGA8dVneA0OTVw/ksDHrJwKTl2pkWhI5170AXCldzLhL5Y2Frho12qZo
	x90y4HdI+3c8aUZ85kIvK+8Dyrm9vfzWKabz95wIVdSMgkes3oNDsON19TwXooG93xXv0eKAyOecy
	sDyqbGgbVtpmNSIfHNof3eFhWK7JZob89HlteTdCBhlbZZ9+vWEEsWRpCXM7XHXB2ds/i7fs/5HmZ
	pZFkjhOg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pragnesh Patel <Pragnesh_Patel@mentor.com>,
	Akash Gajjar <Akash_Gajjar@mentor.com>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Ethernet PHY on ROCK Pi 4
Date: Sun,  1 Nov 2026 23:16:07 +0100
Message-ID: <179357136487.4108155.14582392361457902889.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025-rockpi4-gmac-phy-v1-1-69ce4d677189@iav.lv>
References: <20261025-rockpi4-gmac-phy-v1-1-69ce4d677189@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_221625_477430_F7575845 
X-CRM114-Status: GOOD (  12.81  )
X-Spam-Score: -0.2 (/)
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


On Sun, 25 Oct 2026 22:55:51 +0000, Igor Velkov wrote:
> The ROCK Pi 4 GMAC node has no mdio subnode and no phy-handle, so stmmac
> scans the whole MDIO bus. The RTL8211E answers at its strapped address 1
> and at the Realtek broadcast address 0, so two phy_devices are created
> for one chip, and the netdev attaches to the one at address 0.
> 
> On system suspend mdio_bus_phy_suspend() leaves the attached PHY to the
> MAC (mac_managed_pm) but suspends the unattached one, which writes
> BMCR_PDOWN into the same chip. With s2idle and a MAC Wake-on-LAN magic
> packet, 17 of 40 cycles did not wake.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe the Ethernet PHY on ROCK Pi 4
      commit: f8d406e3435ca62299cab6975248e17eadc7166b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

