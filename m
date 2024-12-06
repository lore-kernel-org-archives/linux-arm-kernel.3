Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C36E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3RxeqK7CqHHokJngVX41Ld9afG2rhiQiWUDXuAXS/k=; b=IBxyCRIh6HCTjwFODe53FTgang
	C/g12hSDVcbclM64H3HI+1ND7P3uK6U7RD7YIQZKoEHJO8LxKxySQt/+UTQ7URxqxkAJXwd/AboIp
	K0VIPpxY2j++kCa27AslQL0Wzdzev7LFOVoG9JnKqOoG2fXGtz05RIyWy1edqwVKPuYbavRjgQ3Sq
	yOw6uvr/rEdSPpJ+aHda4RxsBFHT2RXYgCPxggT0jkezBs+uLBo8lnBOev5pMiPE1ye0N+Rwfz456
	ml7wsUsGVYqtlzdxNtRmlPpS4YlF+vGGxJ7lx1TM5ubUy+TMDAyHSODl2biVuYN4XWrqwzBQ0jLI8
	IhWLAGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJawy-000000026Yb-0W11;
	Fri, 06 Dec 2024 16:13:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJavw-000000026Gq-2jmh;
	Fri, 06 Dec 2024 16:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9AC0A4437C;
	Fri,  6 Dec 2024 16:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC63DC4CED1;
	Fri,  6 Dec 2024 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733501519;
	bh=Lt+SQSnBA9wnvSKApsndBQdYloKh5o8e9F3rbhths+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d8ukGMjUHk6PkzMdwsDHJk25IJAW25BZLurKOFFGTVT8de4gyVGMxe5CQKDjvgpWP
	 mri+WBEwInVTwZIkags5zCF6nySHtsmH/VsljHe1aUunJM3s3Gurwm/vakaPhXjV4y
	 Qj1Q9rT9vEFrTZ1of0fc4KxeTVl7t0b0XDDh/jX7RrmrHrekJJBWUK1mEfxOFkSXjh
	 YsU+cTpyGdRDGuWyZQHM4gEApjXjBgAJz7OpMexnKGRqy1Z611UnRccEmqgm2LOqAJ
	 JKbWSpZYuSDmLw+xpMbbYiM2Db09YNbLuH7NU+kdXmLxZrr0wU5Le7AyOR2emkjN3M
	 j5ym0sDbLLGlQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peng.fan@oss.nxp.com,  m.felsch@pengutronix.de,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  shawnguo@kernel.org,  s.hauer@pengutronix.de,  kernel@pengutronix.de,
  festevam@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,  Peng Fan
 <peng.fan@nxp.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org> (Tudor Ambarus's
	message of "Mon, 11 Nov 2024 13:19:44 +0200")
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
Date: Fri, 06 Dec 2024 16:11:55 +0000
Message-ID: <mafs034j04wqc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_081200_753370_AFFEE0DB 
X-CRM114-Status: UNSURE (   5.31  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce optional vcc-supply property, SPI NOR flashes needs power supply
> to work properly. The power supply maybe software controlable per board
> design.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Series applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

