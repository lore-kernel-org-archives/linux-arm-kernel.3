Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D78C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGfVJrIs+Pij/SWFkdNGobNKoCD6jqjK+ey/0S2BwBY=; b=IDzzD25rgePDIot+x7C7CNWKyG
	m6YX7rQa3TywlBUmPp6JHv7uD4VQGrdaRfXcSguXsg286ju8nORITNGRzZOgOyZu+yctte+Xk4ZCr
	9kP8cMAZsZiK6Bxh5PG7JYjVWjkUzJMF2h6jvKDVIB1JtinLLi0xcyrypAI8pw2uJ0soBClHwRu9o
	wKT1tYUZAUVL8/OdyELF4wRwDsxJE24IFNEWEAKv2aAefbY6vRrbfLjJqj8lRZXYqpUMstG58pFgf
	ezCBfpuZtYFHMntUIHGIs6MW8nx5uLBqIIMd+u4qMzjFJn/9gNsgBa77CnGFio7txr/fwQ21Tyz8i
	wuEZ80tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6lZ-0000000DoBp-2b2m;
	Fri, 11 Jul 2025 05:57:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6iH-0000000Dnoj-3856
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IGfVJrIs+Pij/SWFkdNGobNKoCD6jqjK+ey/0S2BwBY=;
	b=JEOHwPFK3FtaliTRrTP5o4Cqu5ZfZCa+gFJwL4S1tbP2OKpX9u0Q20KeDXG+GH
	LtoaIm8kpOAWLfQXXIldIj75eZpmfT9+Q5rhuj53yiOHuurlyhMaEDgalIoX6f4H
	lGksK+Ydj27yG6QYfbjOASlv5/r1Cr7/bIJeKVICSdywQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCn1rL6pnBopvJQAA--.25092S3;
	Fri, 11 Jul 2025 13:54:05 +0800 (CST)
Date: Fri, 11 Jul 2025 13:54:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 12/13] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Message-ID: <aHCm-sAwdHHlbzdM@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
X-CM-TRANSID: Mc8vCgCn1rL6pnBopvJQAA--.25092S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5l1vUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB6HZWhwjvpRUwAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_225426_165972_42C96498 
X-CRM114-Status: UNSURE (   6.60  )
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

On Thu, May 22, 2025 at 01:56:50PM -0400, Frank Li wrote:
> Add linux,cma node because some devices, such as camera, need big continue
> physical memory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


