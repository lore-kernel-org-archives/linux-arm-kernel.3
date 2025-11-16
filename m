Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC696CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53I/2kcZjlKfPTnbOipCisLCf2u/EtrbHyC2OuS8iX8=; b=BF8eelU3rYTDue3bjn3JmFoPUo
	cVjCp42z9A6FIAgKw0kOr9wkMwlYMY9VcZmXnptTf6taVMIOTHOEIl34RvneR8SRen0IObrQ342SA
	hSmvPk+2L+uRPfEBC10c5njJsanJKit2nD1HJf4oG/BbnBS0smmtQFbYPdj5GrjhROSWVHuYRqM5d
	SH7xuYkjTU4+FHXrl8ZYUGqZf5B2DENxi31G5udVgrWp8liauHV7VbAfjx1s8hN8aTB1hDa6Agym1
	ja+2d8ZiKkBu1nnicPvutiURJN1tSd+NHCnCMCLePNYS0rMqG2XXKRmFDw0kPyQ1emsEzKKhOx0kc
	vA0IkL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbsO-0000000Ecoy-3Xrd;
	Sun, 16 Nov 2025 12:29:04 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbsM-0000000Ecof-3M1H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=53I/2kcZjlKfPTnbOipCisLCf2u/EtrbHyC2OuS8iX8=;
	b=fTEGyHXso6w6OD78EhmpLqWOPHEMlaPYXyHdPMGO+bFPT6gGMX+WohQxl8Asng
	zR98VI700Twk7KiVyoN/+wyzTw32ab8dzNMrKBk1xs5Q6ZX/9Ukf2PzfnQVajvs5
	oz4I87vo9VTAf/tvBamJDmIyqYQa2IxkevUvyf1+dtdG0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3d2N0wxlpKqM7AQ--.7952S3;
	Sun, 16 Nov 2025 20:28:38 +0800 (CST)
Date: Sun, 16 Nov 2025 20:28:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Add missing LED enumerators for DH
 electronics i.MX8M Plus DHCOM on PDK2
Message-ID: <aRnDdLxl-2gKYcVl@dragon>
References: <20251104015031.219863-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104015031.219863-1-marek.vasut@mailbox.org>
X-CM-TRANSID: Mc8vCgC3d2N0wxlpKqM7AQ--.7952S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOzuWUUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOBauFGkZw3Z1JwAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_042903_158534_922B135C 
X-CRM114-Status: UNSURE (   7.30  )
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

On Tue, Nov 04, 2025 at 02:50:13AM +0100, Marek Vasut wrote:
> The LED enumerators are missing, which prevents the LEDs from being
> accurately told apart by label. Fill in the enumerators the same way
> they are already present on PDK3.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!


