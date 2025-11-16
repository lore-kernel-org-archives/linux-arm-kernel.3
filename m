Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE4DCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jIKbfW5/v+xlkcfxLUv/ia3vHPY9nRhWo0buFo4Dk8=; b=Np3FflUgV2IsZ9v7PFi+pJ8hok
	JYCxTWrWDtUnX3pkMPthKs/9VzLpnv+58RLnZVnp/JKqwiO95x9x4ccgnpaQkZryPrnF3q1pVbDI9
	XM+P21T9XHp3S195R+BdAF1Lb0M+37/04AuJ+askJMygvX6OCAi1TCUwbNSF17i2wpWw9u9KdJsWX
	Td9vu4Cb7rsKzR/SfggU8KnT2kDfbAN1lv/sTE63ru7jAJIlBx5yXwfitxBjK654PiEOenWrshuT1
	3OHf3yxhX/lbcJtqbqY82fwpZaiaqOG02FMbdsoEMKc3VTYNbCERpL65lLBfD3VcaqNS1Ni3oV1XN
	cVdil09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcZA-0000000Eekk-2eB3;
	Sun, 16 Nov 2025 13:13:16 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcZ6-0000000Eejk-1IJD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+jIKbfW5/v+xlkcfxLUv/ia3vHPY9nRhWo0buFo4Dk8=;
	b=mq9OJ5vf7Ev/HLiDkw90zW2aui2AEu6fD2uwPDtcyAq8W1m2tgq5n9Mew1G6O/
	GgBh5hqG1YXpLuKciSK+ws4efl96uefQLGRkk+Fvy9+2zqA74dHgPi0UzF4X48es
	Z3BAUigA54rLGN28uodTyQAArKCU3QIPOimWLxsX6RysI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAH+7nPzRlpeBc8AQ--.7960S3;
	Sun, 16 Nov 2025 21:12:49 +0800 (CST)
Date: Sun, 16 Nov 2025 21:12:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: tqma9352: Add vcc-supply for
 spi-nor
Message-ID: <aRnNz3S5lp260-Dt@dragon>
References: <20251114083959.1463736-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114083959.1463736-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgAH+7nPzRlpeBc8AQ--.7960S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwxhlDUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBFIrWkZzdEqsQAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_051312_664849_74AD3412 
X-CRM114-Status: UNSURE (   7.17  )
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

On Fri, Nov 14, 2025 at 09:39:58AM +0100, Alexander Stein wrote:
> (Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


