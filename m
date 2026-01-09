Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB29D26D9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzAAm/QzdcX+CaBz0hkCJXnCthpHe5k6XsYpJKm2doE=; b=p9uIpJ2aGJzBxJT+s6zhKtIonm
	m1LaevcM7U3eeuRJiK4pBftjt0hfU1V+8lh/nFddQYQySs04CLT577IShQcWzZYWtPjyBF13jg7vV
	pp8v2kynh62GxNSVKICyOYEQJaar60lWNVVhoWaEDnUT/gtlwKlK+5DjEzFUyYg2cPfhv3mL+pDHb
	QGBpwtAgN9yRkw+hL2WvVKZdVfrXIAKXrJAVCo7Z8skb1CdayM4s+gY2jb1ZWTvNpq7HtJw4VXimx
	S2LYCciTl5+JCWxm4tzTHW+Lf1AjH3ggDcwmSCTDqYEaJQN3HENFrlhKVoZJYNUJkpKfpjRrfxUsa
	wGAA6N9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWp-00000002xGA-1tps;
	Fri, 09 Jan 2026 19:52:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWl-00000002xCa-28uO;
	Fri, 09 Jan 2026 19:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VzAAm/QzdcX+CaBz0hkCJXnCthpHe5k6XsYpJKm2doE=; b=IyUtYcgV1l5rNqcUrdl254yINO
	OxrKhI2z8EGNiqg2vZEfG383PtUU2BfFzr6Z6qg1iYYMV8v//JHxpOuf5gCXWVOIwnRiBHy4795UW
	d02Lq9TDD1sJaZ6ekFyQ/g9aqyfwVC1u4WlyT8MtznGAiEH0GGs8UgJ95TMCXxCozpcT1t+dsJve/
	2jj7Fz+qg4Qn4zgyvngbNMzGLxGDMFm7OTnB24s/se/b0uX+WTKrrAT3icEa4cMFJWl11Z1YfsSuR
	xYbmvXKOPxCobNOamp/qVZpb5ukj2UdKTK+ioQ+0atvvoqbE2bkM766YtB1lubdj7gY6Y7DM6RquM
	F4xUtNtQ==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veIWj-001fth-7y; Fri, 09 Jan 2026 20:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix gpio pinctrl node names
Date: Fri,  9 Jan 2026 20:51:56 +0100
Message-ID: <176798831389.3446147.13403203237802030067.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260108230623.1349310-1-robh@kernel.org>
References: <20260108230623.1349310-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_115207_544090_9DA8128B 
X-CRM114-Status: GOOD (  10.30  )
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


On Thu, 08 Jan 2026 17:06:23 -0600, Rob Herring (Arm) wrote:
> The pinctrl node names "gpios" or with "-gpio" suffix collide with GPIO
> property names creating false warnings. Add a "-pins?" suffix to avoid
> the issue.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix gpio pinctrl node names
      commit: 5fc045974cdeafd16b25f2c360b0cf48502dd1c5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

