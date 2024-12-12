Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E73CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20V7nlMxRIPgn8gbsCqWSYtbK0Q1Nzz5HC5t3wCWntM=; b=zsGHTx+BNuGy6pszF5oTwpeAAN
	Ma5Uq5L2HGheqB/AqjYmhpVwXTA1vLHUlrwBi8SCkz5auhaPLNSGv+tX8ULcL7mO8kxijtZXogBLF
	vKUSswcpzMwjjO+liy/XMHtjcgob1JVQ48vKGRsL/dEomEALXfgKdEzNIP5wTVhuvTFOZ0mBtAobK
	fjQ49bV5ycPdbRyH6ySST+lQ7as/actWskBhXkw5b48b6PmDggfMsueaG+KZbfm3Qc4GWjrV93dHJ
	PKsfB3bsoYSC6vcwi6r/aWikm5XNJ93nTSseDc6KULdPpCp2hph4ekujBoLL16HbW1VAgRrw/+7KB
	/SY2WlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLsK3-00000002ADK-03W0;
	Thu, 12 Dec 2024 23:10:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLsIy-00000002A28-1rFK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 23:09:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1131B5C69A0;
	Thu, 12 Dec 2024 23:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F7CC4CED0;
	Thu, 12 Dec 2024 23:09:10 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id AECBC10604FB; Fri, 13 Dec 2024 00:09:08 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, sre@kernel.org, p.zabel@pengutronix.de, 
 mihai.sain@microchip.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20241010120142.92057-1-varshini.rajendran@microchip.com>
References: <20241010120142.92057-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v8 0/9] Add support for sam9x7 SoC family
Message-Id: <173404494870.2565720.7657048690139336001.b4-ty@collabora.com>
Date: Fri, 13 Dec 2024 00:09:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_150912_529734_368F6C9C 
X-CRM114-Status: GOOD (  10.12  )
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


On Thu, 10 Oct 2024 17:31:42 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v8:
>  --------------
> 
> [...]

Applied, thanks!

[2/9] power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
      commit: 2a16675e254a35f13203c6738a1137093c773056
[3/9] power: reset: at91-reset: add reset support for sam9x7 SoC
      commit: ef4f3ac4be990511a2c958443744d0c0c97deb5b
[4/9] power: reset: at91-reset: add sdhwc support for sam9x7 SoC
      commit: 250bbd612bb1103745ea6c891a2a1d5f5e1576a3
[6/9] dt-bindings: power: reset: atmel,sama5d2-shdwc: add sam9x7
      commit: 2d656827a0fc9ca4982c245f1bec3b606fab30d8

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


