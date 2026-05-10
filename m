Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAC1CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYAG7R75yc6zXsRkt40wga7rICfJV7guJ8L5m8Y4nNM=; b=mqEZpQ5sVx98MQOhQlSxCoPL5C
	1k4g+c8t68KQcKm42Hz6GILO1bF/2zjUHUwhvcZHPZK1hKc3lAB4t3/hnADMBZ6ABcTbG+iLuqVnf
	SALk68JL03kQsIJ/40YcXFsGjFbiN8ZlYkwB5U81rLnLBU0isNTkd37/dLAqO72CDoKHvpxN8HSVW
	GUemfz7xiQULJYkm7USMUn4Ua3nkiNdPYeTxhgEfkjWxndelbtFhnJ4ZrgF9xRAunHNLkCPhWPHlu
	ksmgWXWE5MMipaEWTUvQDqBEOjujS6P9lWFk2EtIfJvo4sno0kScabeAyKx0YIMsK9qlOTr+cXOsL
	FWIwAtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Kg-0000000AihD-1mNC;
	Sun, 10 May 2026 12:32:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Kd-0000000Aig0-20mo;
	Sun, 10 May 2026 12:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E32E44483;
	Sun, 10 May 2026 12:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3617C2BCB8;
	Sun, 10 May 2026 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416347;
	bh=t7e25Wkq29joVUcS4ay/9eBhaqMriKfIr+VgmjLvpY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mvVNBUMSAdNBJf3lsAC4leU+XCwmWDTZlR3zyRZkyzM4/VMu4vXs3+w/YfxBc+q/a
	 7JzHvzQF2ztfVlC7tNjkEkFbx/BG5H5w68foc7OJGTDNTn1CXmbAj5SpHh9JLAO2TP
	 AWjq5vTBt9KLq1mdz/3Xgb9RwWwz+QvWHIU8dMBf6RPuZ/DgtKUQ5rcU/LzNQVZtx7
	 OfT39JWwjMF88XcsFWM0rdDQ3o0+GAwnK1QnF1XG1Pe8iP/ACoDnmSKecyeiSNojr0
	 m/7WSa7VwKm2DCdsHs6i4zr1aqM1dlhTRflaGOLV74QJt/s+d2nqTqOM+s5TJp0eh+
	 1QqTzv/AHDevA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
References: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Message-Id: <177841634355.434434.16023748532751572136.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:02:23 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_053227_613230_536BD87F 
X-CRM114-Status: UNSURE (   4.81  )
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


On Wed, 11 Feb 2026 15:49:48 +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '5f1a0000.phy' already exists in 'regmap'
> Fix this by using a dedicated regmap config for each resource, each
> having a dedicated regmap name.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: imx8qm-hsio: provide regmap names
      commit: 057c81a17fffb17f66e5b4524d49b7caad3fe627

Best regards,
-- 
~Vinod



