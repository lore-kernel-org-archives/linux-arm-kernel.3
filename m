Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4784CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t8xpC2Gxg1/a7tRUHOdz+cAWyjmba/5I1131NwRPwI=; b=kn653jmCsj7upNayB2nePD7Wvt
	Fm7I65cpk3+ivNzI4/ktMiYIS/Rpw8yFAuC1sVXp6ffdgFsHnisSNEoc6so6qvXnwoZoV6/CzY46g
	RhLAbH237Uhu4VkGYgH/P8daqmT93WkIwtBjc/rU2fGvTb7R+a05gMPkiGTsvljQ28ZlKM1PtGLMe
	aO30JSQAYZ/5oIOjMYB1OTiZaRufgrpCBFOYIZXrglH7HmfjHuf118IRTEi52DP2fvt75RGcRa2iU
	DIRa/yvY3GoF0W6GM59EiJhE6Vg2ltcavGIW24ghqknDQkDHPvNl304Mvi5xdpOJnJqmG8gJiEPuY
	kXE0TAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUAM-0000000Df1c-49Qt;
	Tue, 02 Jun 2026 18:48:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUAK-0000000Df15-3TBc;
	Tue, 02 Jun 2026 18:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7t8xpC2Gxg1/a7tRUHOdz+cAWyjmba/5I1131NwRPwI=; b=RtevXQnJEupgna/t1cryNL51nL
	QE1dJsLsSaPtEpHaoKVwHDdtSNKLrInOY0dpzA5f5y0T9+brriRqSMoKyeQl9Ppa5xgWbzbMFQ7zn
	isA2qHcGnQFLiF3KJ3wCQs08TtKaM50hvDMPJ4l6duzc+tft3ZJErZnz8iUFWCJjwQ1c4zabBnQdu
	AspqR0kJgK/TiTydibe6VnsuWMC1xxXgJiAmAVRom1E8H10fr4rbJOmM1xchdGY2efwMTWcEbRt/m
	BaOfy5uAKFfyS8i/a5OJRctOFfh1afjyXW135jcMURA6cLAT0JAbju/a5PYvNHpR21KSvutrb4CFj
	OfrQVXSA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable button for Radxa E25
Date: Tue,  2 Jun 2026 20:48:29 +0200
Message-ID: <178042610721.614536.13908287937215191728.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601101000.2076721-1-amadeus@jmu.edu.cn>
References: <20260601101000.2076721-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_114840_861631_56788111 
X-CRM114-Status: UNSURE (   8.24  )
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


On Mon, 01 Jun 2026 18:10:00 +0800, Chukun Pan wrote:
> The Radxa E25 board has an ADC button. Enable it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: enable button for Radxa E25
      commit: dc98bd71f41db3666aa8505cc8c72d02653d2980

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

