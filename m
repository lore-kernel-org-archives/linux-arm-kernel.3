Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEE0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iz16ggPl0fT3RVXnz81iuKxXxLF6gIVdgoLvPtuFQ9A=; b=3NlCHkzS8l4rlmiUDOHMq92yTJ
	yLiqpbOgbsEfwRB/StEqgxP51LzOMxpfPk0bA8Fhn1zlcF9MDw52QJ1v9GvfEfYzS6OWB1c4w6igP
	rCB+9ucxWnglF/ZK0TmLdIQ0z9Xlj4vrA7PWa+PspH8w9qIkErC9PSAU+AphIlWElUDJabXQ206QQ
	yr13A1/U7Byf/WOoMhUrmfwS+vhtJkqwju+nT2mqiqzQXlILQBySnYtMfoEBuzIXwYTqTo2bI6i5E
	DyXyNjFxcSYYyEs14BDkvKidxCpM8uHNuNpTjMvWiHe8HvljMGLcr9qM9dXmae1+ecg3anOhCDT5l
	Mn/uWo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2i1-0000000GdtD-1P19;
	Thu, 21 Aug 2025 10:39:53 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0J0-0000000GBaN-1IPF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=iz16ggPl0fT3RVXnz81iuKxXxLF6gIVdgoLvPtuFQ9A=;
	b=ai6YzjaK3ckMOnwi5QSbxs8PgXPTVvpjONez8ZQ/0W3fyxptM7Al1gNuq5ig53
	QgsUpi8zdz6jFn5xw4dn5YPNxAzx9duXbM3peyAhT7RzOxmRh+XHCTbqtTByC2jU
	9NAD+TPJ738FqKdYgIKr6xbd3um4NdW3SnylxE8brn3To=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3vvYo06ZoTvMZAw--.64178S3;
	Thu, 21 Aug 2025 16:04:58 +0800 (CST)
Date: Thu, 21 Aug 2025 16:04:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device
 tree
Message-ID: <aKbTKJqoxwKKJsu_@dragon>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
 <95b3a17e-a5a2-4d84-960c-2539af9d5450@kernel.org>
 <e4c5fe15-87c8-42d5-b4d7-09e3d1f7e712@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4c5fe15-87c8-42d5-b4d7-09e3d1f7e712@suswa.mountain>
X-CM-TRANSID: Ms8vCgC3vvYo06ZoTvMZAw--.64178S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy7Zr47Xw1xCF1rZr4Utwb_yoW8JFyxpF
	W5CF1jyrWUtrWfAwn7J340gF45Zws5WF98Wry8u347CFZ0vwnYqF92grWY9w15Wrs5Gryx
	AF4aga4xCa4DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrOz3UUUUU=
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwvCKGim0yuvEgAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010554_693273_DA99108D 
X-CRM114-Status: GOOD (  18.78  )
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

On Fri, Jul 18, 2025 at 06:21:00PM +0300, Dan Carpenter wrote:
> On Fri, Jul 18, 2025 at 08:58:19AM +0200, Krzysztof Kozlowski wrote:
> > On 17/07/2025 00:46, Dan Carpenter wrote:
> > > Checkpatch points out that this should use spaces instead of tabs.
> > > "ERROR: code indent should use tabs where possible".
> > > 
> > > Reported-by: Xu Yang <xu.yang_2@nxp.com>
> > > Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > 
> > Patches were not merged, so this should be squashed there... or you
> > meant they went with Greg USB? Then no, that's dissapointing, you are
> > not supposed to send DTS patches to Greg's subsystem.
> 
> I worry that I have accidentally stepped into politics...
> 
> Yes, it went through Greg's tree.

I don't find two DTS patches in v6.17-rc1.  I tried to pick them up, but
this one doesn't apply.  So you may want to resend them.

> I'm just using get_maintainer.pl.
> Looking at it now, Greg and linux-usb weren't even on the Cc list for
> the DTS patches.  There was probably some b4 magic which let him apply
> the whole series.
> 
> How was this supposed to have worked?

The DTS changes should be sent separately from usb driver ones.

Shawn


