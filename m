Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1D4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mH7c45eSfL+b4MqS/CU4uB/SYh3Jq2So6ySOqYFG+4=; b=eJ0WGYqX1jcItQB2jgB+XU8nWu
	2bot9YRy+k0eWJ5HZ6op/ckzYIklwNoF8bQn82Ap/Q67RZkK5VAJ2PCD4vey2Ok5ZUjIFZEB0kl3Z
	LaVABH3wFJyL/JQIe9z23o64PErMkLwvdIIueuIq8Dt0PR2riNLPIqCIHObKCVafQ+HJxs8vJtSjw
	+pKRk5FY9OGxq9VNaMge2CxiWJPsoU78tXeXZtl9Z7qQcaqyqMfCfhSYVSdgo6e+DRgtmOCr8y3I7
	1O1hcrHwbgk78GIy6pWEJsAJ4zQfeoJABuseb8Z3cuIUJGFmByXZunUzKfgY6Ryfvsuc8uBiyfUJ3
	gV9v44Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6mi-0000000BzKJ-1Wp4;
	Thu, 19 Jun 2025 04:21:56 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6e6-0000000ByTt-0cKR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7mH7c45eSfL+b4MqS/CU4uB/SYh3Jq2So6ySOqYFG+4=;
	b=EfB0CD/5usDHBil636l93NHjNoxGqOGsvbJ1iKPna7nEh8WxcJO9xotH3n5i54
	C0FWUjv3btrdYM2t1a0pyrKp1VjzHVIVnQv5JNsnPLyjo78ToApYoBSbrf047v2t
	dX2q2JTYGXp+IjX4X1Amrdr8Wf27N59b2GblJ3rsipBPI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnl4A1jlNoj0T8AA--.46928S3;
	Thu, 19 Jun 2025 12:12:39 +0800 (CST)
Date: Thu, 19 Jun 2025 12:12:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: tqma8mnql: Add EASRC support
Message-ID: <aFOONKOejLcYOyLQ@dragon>
References: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgDnl4A1jlNoj0T8AA--.46928S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwhF4DUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRefBWhTjjdxrwAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_211302_494947_85432FBC 
X-CRM114-Status: UNSURE (   7.38  )
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

On Tue, May 20, 2025 at 02:08:18PM +0200, Alexander Stein wrote:
> Enable EASRC support in tlv320aic32x4 sound card.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


