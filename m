Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E71CEFCEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq0CqoMxGePRdfmtZq04yvid4QxViZV6z4QHN+0Dl7E=; b=tmJkUa/J4I3/0+WxTv9rU5CRdk
	g86fz9eSIhMXyvXbCOOLSp37LCANiIjr3tLGXUnlZtGtX3zF1A3/5ac1b7lJ2pmQ57GYrooOOaYTi
	YknG/op6hspngACyusbE/8wElY69ASDDcf6xDBpwJXSuGMSfLDW435MhWGvW5LDvpfuhUzvlDZedW
	r2I2V+AubyDhzXMs5MP1qYVf/GqXo5qPZzO/po/sneawqiO5PHJjTlG0eiLKcSilhJs6mKyaNu6ZG
	O1C+85ANG6ZC+fkAWf4fL7LNgr2lMmjlMsfi4qcweeQhL3W/oYJaEeP+gA3NgpFtUyo25LqLIoYgM
	jXtNqdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0X-0000000DhFA-14jk;
	Tue, 06 Jan 2026 18:42:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0Q-0000000Dh9k-2hgJ;
	Tue, 06 Jan 2026 18:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Eq0CqoMxGePRdfmtZq04yvid4QxViZV6z4QHN+0Dl7E=; b=JRsFOcWCmtPqSgsEcxqmLuPnBE
	8Ev6MrkfuUr2Y4Ns67l0eSsB0qrLnUeCxiX2f4PhPzbVVEyEaE3hzACd220AdcTLbdwqJudKeIiUL
	5MG6EM5KrwlSkNk/Pm/JCjHB6xz+YSvcZE3cUk1dho93K6S12VztK0V/R/rxeB10hKpuTrZjMPSPq
	FjJYthoJAM2Naqqw0pJZqSSTGIaVk5mz3ECqeSZa6l7Y8Gk4wrmAHWIXv0Aakp1vCR4QVBqt+L4NY
	NDfxLgdNJe21fzWyhF2A5hJp5HOl5vkKvzRudBLT3OxlnRu+YlAr3+eqFTeHMMMKIPiiJPQf68X3d
	5hrjh08A==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdC0N-001Hfs-CZ; Tue, 06 Jan 2026 19:42:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>,
	Pavel Machek <pavel@ucw.cz>,
	Martijn Braam <martijn@brixit.nl>,
	=?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>
Subject: Re: [PATCH v6 0/2] Upstreaming Pinephone Pro Patches
Date: Tue,  6 Jan 2026 19:41:58 +0100
Message-ID: <176772487191.3029798.15593519528724659699.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
References: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104210_737722_98CAA1AF 
X-CRM114-Status: GOOD (  11.45  )
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


On Thu, 25 Dec 2025 19:43:18 -0800, Rudraksha Gupta wrote:
> Throughout the years, many have contributed to the Pinephone Pro (ppp)
> development. Unfortunately, these patches are scattered around various
> repositories in different states.
> 
> I will be attempting to upstream these patches. I will start off with the
> following small series:
> - Add light/proximity sensor support
>   - Link: https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
> - Add magnetometer sensor support
>   - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
> - Add mount-matrix for magnetometer
>   - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      commit: 2b8cd99c8cf489d539e1347adb5fd39548c53f19
[2/2] arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro
      commit: a3e4bb6c9a2262c87a842d9fa42bdd65a1671edf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

