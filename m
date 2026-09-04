Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE53C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KibasY7gpdgaN9Q7GqAgR1twuwFAQB+blBRQI0vIILY=; b=AvACeR+aE1US70hG8aKSYvN+eY
	+hPVNmIlZJpJdwiWZL6ScZFhjoMVeq64g2Ndm9gmVTnLmm4WPi9k5BIVyq64UzhG2oLNxUoawHmhn
	vB8pqJDYfn5GeevnZUugMPV+MarSPOz9aWpbOTD2N0p1uwjThs+czrAE5Q2vMz/EUkbROdl9BStkU
	64rSl4jnD2tc2JjtfNc+hqG+UUVsexxKFmfFDUEzu+EE7jP5fE2fGPyKvTjGH1eRCkpvneMiaPeZ6
	KYhtq3FNEZoYCF4rFF1w9cz1p+RcpjLdBFupgiIPPu+914Ne4qUbejMyEG0sUPEDzcMO8mdqIXMdK
	fWrFA2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vqv-00000002WsK-2blG;
	Fri, 04 Sep 2026 15:29:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vqs-00000002WrS-373a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:29:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6F066022A;
	Fri,  4 Sep 2026 15:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEAE1F00A3E;
	Fri,  4 Sep 2026 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535753;
	bh=KibasY7gpdgaN9Q7GqAgR1twuwFAQB+blBRQI0vIILY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cibmYrhymjL0SsnFwru3t1Uu+E6WKrpYbX54VbW02xonPBzi1I+DzvOLHHndbrUMV
	 ZdbQIev+plC7QfzXBn7Y2hKqc/jfvIjerDzbEVZFqPlLZwzZCqVKlhsMH2YZ/NJPCA
	 EwtarzwbR2ujUvkgKRQbtiMQqvFE+6J8jb3DR6QpiB6YsfYwz/GzcHv5P7xw8vjTqv
	 J44YzugBNAI4SMvuMSnzsOXVY7U2HeJFTuwV6cFoUX0+v55LQz9z3OXLPZj2M/KMXu
	 mcQNQGi53xVsexFRxVdbXpuqpH4iv54y2xT/HrCExWb5nZGJz2ZWjnmqKMzJJnsDXP
	 PnGRNSlnM/geA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
Subject: Re: (subset) [PATCH v3 00/10] Remove support for platform data
 from samsung keypad
Message-Id: <178853574810.59617.2944881892778371302.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:29:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sat, 11 Jul 2026 19:12:41 -0700, Dmitry Torokhov wrote:
> This series converts the Samsung keypad driver and the Cragganmore 6410
> board to generic device properties, allowing the removal of legacy platform
> data and GPIO lookup tables.
> 
> We rework the Samsung keypad driver to stop using platform data, utilizing
> a new compact matrix keypad binding. To support this on the Cragganmore
> board, we add infrastructure to associate software nodes with Samsung
> gpio_chips, and add software node propagation support to the wm831x MFD
> core to route DVS GPIO to the PMIC regulator.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
        https://git.kernel.org/krzk/linux/c/27d305325d2f3929e61105d465ef968ea39502ec
[02/10] Input: samsung-keypad - handle compact binding
        https://git.kernel.org/krzk/linux/c/e8812411863552ebb153d7c856e60ef6deecfba4
[03/10] ARM: s3c: register and attach software nodes for Samsung gpio_chips
        https://git.kernel.org/krzk/linux/c/a01394e260d51b0b028735a9d71476c5c74280df
[04/10] ARM: s3c: crag6410: switch keypad device to software properties
        https://git.kernel.org/krzk/linux/c/78b8efc99aa61c99c77ad1bf6129ba182a27b52a
[05/10] Input: samsung-keypad - remove support for platform data
        https://git.kernel.org/krzk/linux/c/235cb99d39db4c80e3120d59e4c572dbb408f524
[06/10] ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys
        https://git.kernel.org/krzk/linux/c/c67c110d141b4347b864aa08ca86a1a492bff776

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


