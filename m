Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A44C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UT5JWESlIqMK88Qm0fZJYn8VJFoNxpbvjgrdMRXN5E=; b=SXRJ7dEZpCf0dhgkGGa11cirQU
	/tu21pH/YeY9v9jLu1Su/Xen6sTtPyHj3LIGKgQk5D7GCK1gpTLbfNfFj5VI1Vn+ewsNCR/IBMCT9
	mCrqymdUmXNhhsgyreJUNENroYhrfaoV7j/5CdMKtJ0MEi/JVlmjh8qEkS2Yz1kHp5f3wLaCs75wk
	zSAGu6DZgqq8kbT5svDatby5lWk/U5GfKRwx3YMQ1EWJngbLUajn6E52MrCiESuoJ1p5AtdxXryRl
	JgTuVoy8M8JHJvQLXnMl83nl1AkZQX14A7h35v2oE/+r0FUq53MU2B2i3g8XvQfyH+kz32vaAKPWj
	dpTj12pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trppU-00000004TVl-0lGf;
	Tue, 11 Mar 2025 02:58:52 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpnq-00000004TPC-0SWF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2UT5JWESlIqMK88Qm0fZJYn8VJFoNxpbvjgrdMRXN5E=;
	b=bZN/HkxAw8pLxgZlkQiT5Uevk+4WAvRTFDqPITaWXNqhsjzQM27BtnVpAqTS+O
	tUKdb3R6e3galk+evy/LBZmavjIEHvB6B55Z2DriV8CjulaoOsj2Hy3xklw0zMQJ
	liWMaEFT+JF4XsDbDQ5vF/y3RqtwkOsdXEdJBeTRBDhX4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXbUZxps9nP+awAA--.43587S3;
	Tue, 11 Mar 2025 10:56:51 +0800 (CST)
Date: Tue, 11 Mar 2025 10:56:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resend v3 1/1] arm64: dts: imx93: add ddr edac support
Message-ID: <Z8+mcZw9yjOr3m/y@dragon>
References: <20250225192159.2907320-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225192159.2907320-1-Frank.Li@nxp.com>
X-CM-TRANSID: Mc8vCgCXbUZxps9nP+awAA--.43587S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVvedUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNROT+GfPpnP3ogAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_195710_462671_EE6EF9F6 
X-CRM114-Status: UNSURE (   6.03  )
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

On Tue, Feb 25, 2025 at 02:21:58PM -0500, Frank Li wrote:
> Add ddr edac support for imx93.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


