Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD43CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMycqlp4chuOd7Fhf2Y0kQgHwkZhH9Lp2pIekCxZrTQ=; b=beFoZpPHFrjiPtqFDy+YSzbeQt
	mhie0qfSIGT2KmEkJAqNE/FHMfCZMz6upPo41xA+IILwXbU9vGAgZXkz+XAjIqffGDpYsqeHWcmVE
	PI4+f0mKyJKwN175hOD8jKGLzWmFFJsH8U0q6KELMF0DwSemlYIjoFDDnAfxSa+PqM72SQyAnG3V2
	9qfQYrr6ZFvLhTEHNwdEIv0ZHEOOzNI7Yb/gmfP0L1KTfqe2dEeFMa2vw+luMEose2fz3ZPsEI+z9
	3nj9kA9LzlgSDG4DGL4DwBNo8TnBI5RoV++sGPKiuLy4xmwzawU7HKsPLPXgawSQrq0WCjEzRHmuW
	8f+6dZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbzL-0000000Ed4Y-3DlK;
	Sun, 16 Nov 2025 12:36:15 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbzI-0000000Ed3b-3IlP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eMycqlp4chuOd7Fhf2Y0kQgHwkZhH9Lp2pIekCxZrTQ=;
	b=h6Jzz2g7UtfaPGPYk4yVfbxFvKzZqUIRwe6qAEoyd3AQSsBwt+bEli5tLGL8za
	xtTiAmd3R+kap6AbEDUpqn4GU+gRNYR5UK3n+EfKPzbT98jN5afTswUJxPmC5PpD
	G6DoNmDwcBM70tSFRsyiactKzuFdmBvbodEI4cuwfQjW8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAn5MUsxRlpXbc7AQ--.8035S3;
	Sun, 16 Nov 2025 20:35:58 +0800 (CST)
Date: Sun, 16 Nov 2025 20:35:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6dl-yapp43: Enable pwm-beeper on
 boards with speaker
Message-ID: <aRnFLJneVeZoJeD-@dragon>
References: <20251106085429.2067699-1-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106085429.2067699-1-michal.vokac@ysoft.com>
X-CM-TRANSID: Mc8vCgAn5MUsxRlpXbc7AQ--.8035S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzYFADUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA4dgmkZxS49pgAA3x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_043613_251392_43912A8B 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, Nov 06, 2025 at 09:54:28AM +0100, Michal Vokáč wrote:
> Lynx, Pegasus and Pegasus+ boards have a speaker connected to the PWM3.
> Enable a pwm-beeper on these boards so the system can produce simple
> sounds.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Applied both, thanks!


