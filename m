Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ig3mNz2cheWdXRa0cEaI1NEjXM1NYmX/2zCvx3pS2c=; b=r86XNmlJl4brhI79qD/krphXww
	puKWJZq7zpf6zeSRo+vPIsfeIuweWPuyi0qtjPskxQhvqmQxPDL/w9htoHHTvdkZ0kfGmUKWQHQe7
	QEVrRTmMCC/sKawwBUR9ZpMERJ+y73rdnT/3smwEWdqyA66tWW/3qoEFbrSHYZ9kPVNSXKWgimo/C
	7175vZFndJOzotBIY/G1Mpdr+iD6Yc96JEUqANYCcdz3ng4w3fjLhh4zSeug1C9Bvr5rxZ5y3S564
	UprREchHOkDVnlIdH4hJB3UAzf/Vw4w9saXJeYYjZbCB4rY0oUG76Hnjs8rMe9zNZKkXYnr8LNHV6
	IuMkF6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDH7F-0000000DEJk-30Zl;
	Mon, 27 Oct 2025 06:54:05 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDH7C-0000000DEI9-19Ec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1Ig3mNz2cheWdXRa0cEaI1NEjXM1NYmX/2zCvx3pS2c=;
	b=FYn1Hudf6ZDELCRyVnzshezFUNPcDA/bBhg5NDYmrezNvvtySQhpMVX67lmbOh
	sTznv8a2r4/p1P1F6SU2VVMw4QSB2QWu0c5TGskGdi7C6KID9eyVR6iMNyxJeewR
	kv0SKy3jz1IMK3Ds0HUq0aI5TFSXiDAbft2moKNVg85xM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn76jtFv9o8hu_AA--.25236S3;
	Mon, 27 Oct 2025 14:53:34 +0800 (CST)
Date: Mon, 27 Oct 2025 14:53:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp-kontron: Fix USB OTG role switching
Message-ID: <aP8W7CE2rpLIbcDx@dragon>
References: <20251020132155.630512-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020132155.630512-1-frieder@fris.de>
X-CM-TRANSID: Ms8vCgDn76jtFv9o8hu_AA--.25236S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWxAw4DXFWfKF17Ww1kGrg_yoWxCwc_ua
	yrWa1DC34xZFWkKFn3KF18KrWvqa1jk34DKw4a9w45JF95AayrGFW8Kry5Zw15u3yDC34D
	WasrXa1qka1UujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbo7K7UUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg-aQGj-Fu9eXwAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_235402_661152_E19F0D3C 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, Oct 20, 2025 at 03:21:51PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The VBUS supply regulator is currently assigned to the PHY node.
> This causes the VBUS to be always on, even when the controller
> needs to be switched to peripheral mode.
> 
> Fix the OTG role switching by adding a connector node and moving
> the VBUS supply regulator to that node. This way the VBUS gets
> correctly switched according to the current role.
> 
> Fixes: 827c007db5f2 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied, thanks!


