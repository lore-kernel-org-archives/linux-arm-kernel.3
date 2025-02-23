Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17959C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y4HplaZVCu1QQjMAnhjKML9wwHJeOFR7OdXRZKJR4s=; b=4p4IgWBLXQI/nZF8SgQ1Zf8Wv2
	1kD2lTE+YQbe14vKqPupaRr5bGiCMGlfR+JrrnSjDORTiuLR2StXbbeEecDkkSzZWX0XuNTrpPBgg
	AZPC+XwoJvxgQ3hdkJg+oqjKeb4eey6Nbz5xCy1UOLyRLWlHNi1MIwM5NMMbRCx15sOaFHIKDVhy9
	HeYczDDJ1YPxTK6wdS5zx4M4jt1pER4nP2ILEQAxZuNOY+BmDgkXHPV/aWefsGVGj2aKm375X/jor
	Fl4Mxs50g2h2iocb3rE94mSmWhXedsE+65G3qFliHh1Nm738+73QYe521L63Zf/1oDuVW26g1mR88
	SQ84ZRjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6Kk-0000000AaV8-17QW;
	Sun, 23 Feb 2025 07:23:26 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6JG-0000000AaNb-1C6S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 07:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9y4HplaZVCu1QQjMAnhjKML9wwHJeOFR7OdXRZKJR4s=;
	b=EXuso7zTjRTSduWNS6SUjCikx4WLdlc5rZmclXdlA/4OTl/VNctCXl0HhEX5jI
	DGA06+qWahBDZyhHrB0z5anwOLLSWiKaC7/JjW7VYCj6/YS19TGs7e7oSFwz2f69
	YqtVXwxG/33r2ZtT4iTBFw6vx6Knh6mV0Ng07gholDUCE=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnC6x2zLpn1yKfCQ--.22908S3;
	Sun, 23 Feb 2025 15:21:27 +0800 (CST)
Date: Sun, 23 Feb 2025 15:21:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Brown <broonie@kernel.org>, soc@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on
 ARCH_MXC
Message-ID: <Z7rMdg7+m6qa0Hft@dragon>
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
X-CM-TRANSID: Mc8vCgAnC6x2zLpn1yKfCQ--.22908S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1xZr17Jr13JFW3tryrJFb_yoWxAFXEv3
	9Y9wnrC3s5GrZ7KF10gr1ayF1Sg3yqg3y5Jw1IqF4agFySq34xtF4vy3s3WF1S9FZ2grya
	kas09rsI9ryaqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0uMKJUUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgb8ZWe6xy0Q-QAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_232154_654198_4E8F36F9 
X-CRM114-Status: UNSURE (   9.20  )
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

On Wed, Feb 05, 2025 at 03:41:43PM +0100, Geert Uytterhoeven wrote:
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
> 
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the patch, Geert!  But I have just picked up the change from
Uwe [1].

Shawn

[1] https://lore.kernel.org/imx/20250204101531.233549-2-u.kleine-koenig@baylibre.com/


