Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5DC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6NpiPrYTwALDtKz4Xo4CAOrnjqTcZtEQ2HVXqcTS0c=; b=UN24/vAiOyuWEFqk/2yPD/AFJ/
	UoAcPOIspgEOGFexxFtTdVzELWxjPjhT7Shu8bjj0Q7275IpP2HmHQXjN69ITzGfQL0/EzFzRe2/0
	tYNK3JdvwG4Do/N0u3PjqfthjjNOk/Vf0lN4jE6UjhxkSdg8ML3p3aShVyc6VhQpsatptrNnb2joh
	HUKxxP/qagUUE4wiXoTmtLYOEuPl8rnl1mVOoqo3mFJvatg2kJhdz0/3iBuDJPolh0xAoR9nwLJBZ
	P14wItnETfJWywi8ODARGLdfmChVMi7n4CEQAGEfgoN4qYkhccTPjpAH72AtQEEMcIBkSVy4yxHAs
	gpd97FtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZu9-0000000FSjG-1cW8;
	Fri, 20 Jun 2025 11:27:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZEl-0000000FN8q-3VJo;
	Fri, 20 Jun 2025 10:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=E6NpiPrYTwALDtKz4Xo4CAOrnjqTcZtEQ2HVXqcTS0c=; b=Gjpy6Q0sKwh6AFiY4TGtAC7cU/
	JUK0+UG0Mjnp2hEHiNtteiPOxf9cdPvx5YRDNYhTrh2Ci2Z/AYju00OGsjM1MFDXw5KpIM2s9qLoz
	4Hxc3Ld9HeT7SmrgLOUC7/ej1VJ3wHaO6mgK9zqMkAhichj9AKUuyxVLLJyyUXDBZSqkVgmRjUJjI
	3FfZSwItxTBhu8JAyI253+5EPjYrMu7ViqAwOJedra7bBNkKFbOL6LNgK3WxTsveh6A04KJnspgKI
	PyK+sUriknvtIHUiSnNPcJBCq+lFOfOfH0535EAnyrfdCqnGZSID66W1J7YepvUimT7tYz/DCkr/8
	aPVeyuZA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSZEi-00015m-Bw; Fri, 20 Jun 2025 12:44:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: support camera module on Haikou Video Demo on PX30 Ringneck
Date: Fri, 20 Jun 2025 12:44:34 +0200
Message-ID: <175041626982.1561125.14591843219943750860.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
References: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_034447_874314_5EF3FA71 
X-CRM114-Status: GOOD (  12.12  )
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


On Tue, 10 Jun 2025 18:22:15 +0200, Quentin Schulz wrote:
> The first patch is fixing dtc warnings related to the ISP on PX30.
> Sadly there's still one due to there only be one port in PX30's ISP and
> still address-cells and size-cells properties set. The "issue" is that
> there are actually two ports (see binding) so we shouldn't really remove
> it, but the binding requires a bus-type property (either parallel or
> bt656 mode) for the port@1, which we cannot know from the SoC PoV.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: fix endpoint dtc warning for PX30 ISP
      commit: 5ddb2d46852997a28f8d77153e225611a8268b74
[2/3] arm64: dts: rockchip: px30: add label to first port of ISP
      commit: 9ad8e83d8abd083c701e75d7fe664c706daf6d56
[3/3] arm64: dts: rockchip: support camera module on Haikou Video Demo on PX30 Ringneck
      commit: 99680fd394b912bf133b5b1e45aced1b7aea1d2e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

