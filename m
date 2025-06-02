Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE6C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 04:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyI94pFb6BLEkoTZEquPEmfGVXYRKJvASIgguB4Xhu0=; b=WVBsjDxbsuGiAyXDZ/mmBU3oii
	QNrF5tyHdsDs1HiVRue0EEk3H0Jrtequ/iQB5oSe9uFyJ6hQjaIOEMyBdXovK8mFeY6MCAXxKf4Ky
	fo2zyJ5s+0qN3NWtMP6ZHPHyPrv5z4yTC4UC/94YLkYs83uy6LN+MX0QMIXThc3q4q0UAXI6HnsQ0
	USyXwia2g/gdV1ulb4wZY489Haxh1XfXapis0ZQX/faSLdqA+d268bNYdxR9MU+Aq1Vjs/5EKTr7J
	dsg/qVc+1Xg+LSC4CT3GZ6CYrhE1A5qHRHQLEHDR5ZQHBh97ICrFbSnBuNQx85uDNJWFsakCulICW
	xBO4DOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwWd-00000006f6R-1UeB;
	Mon, 02 Jun 2025 04:11:51 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwUT-00000006ev2-2y4v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 04:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FyI94pFb6BLEkoTZEquPEmfGVXYRKJvASIgguB4Xhu0=;
	b=OA/JTIcGI8uPdANyH9q/94ex8Q9Rt1o+M/hc2kvDsWsnrXg0ALJGWCXPWZUF1K
	Jl1vgWFQJq/VvKd47/m4VnIoJAS1HznKfKRfw8jGRO9W1OEM0T4eIKvEz2gbJ//V
	omPNAlc+8Q3kwZ0/RwmiEkc+wjXa/rWO8E7LQCYxkzCEQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnF_HeIz1odNx5Ag--.7355S3;
	Mon, 02 Jun 2025 12:09:04 +0800 (CST)
Date: Mon, 2 Jun 2025 12:09:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Message-ID: <aD0j3gXeD6Nn6L60@dragon>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgCnF_HeIz1odNx5Ag--.7355S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnUUUUUUUU
X-Originating-IP: [117.83.141.151]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNABqz2g9I+DgbwAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_210938_113100_251BB1F5 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.

Just out of curiosity, is there any ongoing/planned effort about creating
a framework for access controllers at all?

Shawn


