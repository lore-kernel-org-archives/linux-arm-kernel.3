Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB760A262A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QIqB1ef8;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jGdv0HbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cX02P8ZnTabknV6WIxatZgPYI8Lrd5opy+28EBBQ4Ww=; b=QIqB1ef8IB2AKb
	Lu1ms0BHgpXOrYue6ucSWm1FUvlqE1+vhz3SOzBLslGr+GBO1xvgPxEFRKBpeULvtpSLAK5RodNUF
	G6GcxOdgNGKhIE7uQojgLU5XGSfOlWfM0vB598lQzvSqgK9Xp1XC1H8413e1FWIcaY59GUYv+JfSz
	vwG3dXwgTFxw3kJpatq8AYlrkUt0BrZhEx2i66SGPd3oeIaiOpuHi0qbCgRpoOscsNVDPhE+5ZGVS
	e2OwvrbubY5ojApp2SjbZhGr+oi72pXiAUYU4L6ijDT6FDQjuOcy9ZgX/ewG4dgkjunSHAKktqZlb
	6YisSsmUV486jKL/xf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqG-0000000Ez0i-0F7j;
	Sun, 01 Nov 2026 22:15:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq6-0000000Eyn8-4BHP;
	Sun, 01 Nov 2026 22:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cX02P8ZnTabknV6WIxatZgPYI8Lrd5opy+28EBBQ4Ww=; b=jGdv0HbMp5Ar1mmZcemj62b3Bz
	IqfKVoQq3Y7uOoh4nesoe0YPrEQ8KHBKnCfNpSVz5ieRPsZtJptJdEV4h2VGYfxtO9Edkz+xcmyfU
	+M6Om0aXubmbUPOtvsbCcGt4ljvkq2uC0kMN2DDwCrJ67/kyV2jzBr6cs3116CJfvJJtrqrkrPD5i
	lHt5grw/apXIEJQOOD3NmupJs3IetHJnXvhm8kVxsGsN7/EWtu/8CVAaE5xEFSLlpk4F3+0PFrOi+
	3/Jq6G2F+7NeTrymp7vJggcYEC6MD5MVuc9O5FZBe3aJOA7FICmeTc5Aa8E+dQQn6CWwvNUdeQ8yf
	R49CAPSA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:24 +0100
Message-ID: <179357131398.4107717.5871351415650721805.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
References: <20261009-helios64-leds-v1-1-6c58a66bf0c6@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141547_067695_BE55CD8C 
X-CRM114-Status: GOOD (  11.08  )
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


On Fri, 09 Oct 2026 03:40:48 +0300, Igor Velkov wrote:
> Besides the system LEDs, the front panel of Helios64 has a network, a
> USB and five SATA error LEDs. Each is switched by a MOSFET from a GPIO,
> active high: NETW_ACT_LED_ON on GPIO0_A4, USB3_ACT_LED_ON on GPIO0_B3
> and SATA_ERR0 to SATA_ERR4 on GPIO2_A2 to GPIO2_A6. The Kobol wiki
> gives the colours: activity LEDs are blue, error LEDs are red.
> 
> Describe them next to the system LEDs. The panel labels the disks
> HDD 1 to HDD 5, so the error LEDs are numbered from 1.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the front panel LEDs to Kobol Helios64
      commit: f78fc7aca073241b9d477bc0190ac02f3242e45d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

