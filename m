Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E1BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0szaTJk/2IIh92wT4SYepDsVV45HTf6oeyD1uk5eFNE=; b=HWj3EQaCil3MJ/LVd6i2Z4Rphq
	Dj+TnMQLAO82+IaERVpkuKqYKLkiceAv5zzkVODkRAvhfR5ffLyBFFCB3IjCvmCILzwY+IAkBFcet
	DFzw9i5alKekUBaWZud3y8mftBGd34+NbW6ADG0GgmI7DneoQ7guMVqUZpjLWE/+z2x4qO8g7CZEL
	u1AP/wLDqG9CFX5voBGPOP87osDpWK1F8KUeLfod/bjSUlbxqJsreNQc/2CgvlZ6zGfjYKWnfWhLD
	92ZgTRbCy84YIhqhe6m6jYzR0m02sv4xFZJz0awQ2HoidFNT8HKL4JeZLwX05G4aO2cBxVC8i0WrF
	xxYqq1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv9e-00000008298-0v5Y;
	Wed, 02 Jul 2025 10:57:30 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuPf-00000007tuB-2OXO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0szaTJk/2IIh92wT4SYepDsVV45HTf6oeyD1uk5eFNE=;
	b=ivh1EUqD5vaLYJTdTkbxM/9LL+gDCtSiyyqjWax7fZYIWhMFfOk6AVZ1AxETZ/
	Zrstmc87LCEp+hHlA6MTYt8Q2sYASbKCJdqtJvc/VTz1Ek6/RJ4SUElNo5MHOdHz
	AzLaeoJ+jQhKglV+oyZezn1C3R5EgsFHgjqp5yd454e4s=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD39w9aBWVoE_ApAA--.52421S3;
	Wed, 02 Jul 2025 18:09:32 +0800 (CST)
Date: Wed, 2 Jul 2025 18:09:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Message-ID: <aGUFWiXuJ514HlDV@dragon>
References: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
X-CM-TRANSID: Ms8vCgD39w9aBWVoE_ApAA--.52421S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYZ2-UUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRl+ZWhk3iqGNwAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_030959_957753_667B7F2F 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, Jun 13, 2025 at 01:35:04PM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> The fan controller on this board cannot work in automatic mode, and
> requires software control, the reason is that it has no temperature
> sensor connected.
> 
> Given that this board is a development kit and does not have any
> specific fan, add a default single cooling level that would enable the
> fan to spin with a 100% duty cycle, enabling a safe default.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied, thanks!


