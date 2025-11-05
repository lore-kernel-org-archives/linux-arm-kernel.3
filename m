Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC673CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuFVci0OU2fN9OEAMkFdaSsZ4Y0TcQDJ7JJBOCcok8A=; b=y3VvnYR3VqoIlZmNfGE8V9+48V
	qCcWiIlINgbm9mTrs7Re79E3hCNzFdEpeNk6qcjb5E4Pg20GkBK4NyspVr/wbXjskmhgu5c/IDRjZ
	5/t10yj80WTMWtmurR/GMi4UBhSPU22dwcsUAFOXC08kvcpTPe0BGvZdH7k/bz20Bw7JnvGJ7gSxo
	WXJ+d8devX21RPFyPLHbicfLHVufqFgbOwS3m2TiMPWe078IdkweWvIMtHHHkJBJA2Wt0rVPTws36
	Isd9mHMgVtKQbtkg7dhoZAh+30rx84O+p2mH3RQ+c5Df5d5G4x0/cRsY+d6hsHAQeIFDXC9yLPRZC
	OheovFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmtk-0000000EbsU-0mYM;
	Wed, 05 Nov 2025 23:26:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmti-0000000Ebrl-1Jl3;
	Wed, 05 Nov 2025 23:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wuFVci0OU2fN9OEAMkFdaSsZ4Y0TcQDJ7JJBOCcok8A=; b=LX5iBlkRbRi0vlWqwXCQ19fKzd
	PHiS9qvugmYaEiXl/VFD5u79R8DBHhkPPU7xiwOQ/p1yMwU9ZEpGRHg5l3P9Ota3u/XbA6C7Bd6qw
	bJXdjlDsmsgpCBTbeSTB030wIhy5ryWXtcBdhL2qKqw8wrDL2GIMsIzDesWCtvredOEKixoI0RZvM
	EiXJgRTHQwko2nq8WBYtNfSAv2CW5bIJp7sYFwLC1Rr68fFJ8Yq8iu4kcFTTAlgbI78jsXo3u7LWP
	9j0qZHZtwP8Lypfsqv+cX6S1UXqH1i7M9IjnVUdgIuuXFLaclY8uNbxwU1T2D1kX1H/Bq51Ww7kmD
	NVzwMjSg==;
Received: from i53875bde.versanet.de ([83.135.91.222] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGmtf-0001FA-Bj; Thu, 06 Nov 2025 00:26:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: Re: [PATCH 0/2] Drop RK3568's variant of the CLK_NR_CLKS constant
Date: Thu,  6 Nov 2025 00:26:32 +0100
Message-ID: <176238518188.156498.3345794880564705981.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103234032.413563-1-heiko@sntech.de>
References: <20251103234032.413563-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_152638_375426_903736A3 
X-CRM114-Status: GOOD (  10.72  )
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


On Tue, 04 Nov 2025 00:40:30 +0100, Heiko Stuebner wrote:
> This drops the use of the CLK_NR_CLKS constant from the rk3568 clock
> driver and after that, drops the constant from the binding that should
> not have been part of it in the first place.
> 
> Heiko Stuebner (2):
>   clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
>   dt-bindings: clock: rk3568: Drop CLK_NR_CLKS define
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
      commit: 2a42e3210d4331dddfb04b020050bd774cf99659
[2/2] dt-bindings: clock: rk3568: Drop CLK_NR_CLKS define
      commit: ca38f0f65eefd79889b409c89c6932d7e2fe0993

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

