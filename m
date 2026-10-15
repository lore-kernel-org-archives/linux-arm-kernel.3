Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B9CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paziipE/XgaTDQwZRgtVHzDUAZZwAvePegn9nlvyFOo=; b=aeFSJ/lTZRoqiOAQM5ngCeBdC1
	ki54a7IIVrTX7nr/xzX2oRhNfwNG4qTOxUMrwicjhhuHh4GJiBEljN3rRtiWyVBCZcRoV2cWAgF77
	6E2Rv6n0lMyXFo1rMsHWctjv4sa/DNheGJGYMA2btm8OTOpvfgZAS3NEJY5xRs1i6DV+yjzp2cLXU
	O+xuh8JzQKU3NXUmkZX7YdzQ0OTloUVLVlk+Y0g+faNeDjCUk6hduB9hCsjRy9j8K/IQIo5Exb02o
	bdpknZMvEwkpDnzdgKm7oHC3CRz5iAlureztuZX+tZw2TVXR6VLKVtt2QSW4C5T7TqwK9n5mD80xD
	hVrBBUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHS5Q-00000001LRA-2ND1;
	Thu, 15 Oct 2026 20:30:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHS5P-00000001LQw-1goz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:29:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10B11600D4;
	Thu, 15 Oct 2026 20:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BF81F000C4;
	Thu, 15 Oct 2026 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792096196;
	bh=paziipE/XgaTDQwZRgtVHzDUAZZwAvePegn9nlvyFOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SydBT73QOm7ADkQtzSTlALUHTDfIvqukcaSkwd7aHkz0jLCygKgZu2nSIXcsFi1zc
	 ieWRF/jdQ/ru9sBRexMtit3utKEYfZEhPX24n5z9xTi9WI1AAhOW3fLMhbzsr2x9/l
	 Rv25FXKNX0HB2tGMFPd9io+7IaJJW0zisPg8WqwJunWwJmsrokagurzyUrRmDVhEn7
	 c07ctjZXRmn/h8T1otEGBU2WDbFJ1h3zppNywtI974u2iWH5esPOX0iM8vyG2sHPQ7
	 ag6FvCyOrRuVKtBmuPlbw3eVLhpbCgtlKd747tGsoxgZpweUdUolLYpgN1LVj9SKJx
	 oZ1qLt8bUwsdQ==
Date: Thu, 15 Oct 2026 15:29:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-i2c@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 05/11] dt-bindings: i2c: Add Cortina Systems CS7542
 I2C controller
Message-ID: <179209619291.3075035.14291560826684213892.robh@kernel.org>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-5-181bb0d23f4c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-b4-cs75xx-s2-v3-5-181bb0d23f4c@gmail.com>
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


On Tue, 13 Oct 2026 09:07:15 +0300, Fil Dunsky wrote:
> Add a binding for the I2C ("Bi-Wire") controller of the Cortina Systems
> CS75xx SoCs.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/i2c/cortina,cs7542-i2c.yaml           | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


