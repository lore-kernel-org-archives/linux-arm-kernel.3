Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C08CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 05:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bner0SsgdNSy6tdybRuNPu0GjFr53uKm1bBPGJ+rz1U=; b=IHdyh13K3Nx+R3Ft2CLfk5Kq5V
	3cT7yleX+E+TR+CqnM/BejbCAIb8raIWWgCCXoW+WvhYUjJAs5+g29/sHOECPZqG6dUA0tKXFcrZB
	nWwhFGT53fY9v/HD7I4gFuKU/UztP6tgT4WkU0USNj+HpbqhA+zWNxyAlwPUwWuE15Ve3KkYAt6+J
	v0IKEkQb1OR2C/Yv3h6ymMsBSt6T9CGTPCJRi6bSMBofEqPw7xtRwK1iwWFpQp/g5hNsKR6YqOTT0
	XU2Y9NNvVPMXG1SfKIJKogCtUTehU51NMNauAe2TdbGAV6k05V2kZ2wQdj5YX1hTpc+A/4OyxsSX1
	8OZ4Eh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmtt-000000053Cc-0XdZ;
	Wed, 30 Sep 2026 05:30:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmts-000000053CS-2HWR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 05:30:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1BEC60236;
	Wed, 30 Sep 2026 05:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03171F000FF;
	Wed, 30 Sep 2026 05:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790746239;
	bh=bner0SsgdNSy6tdybRuNPu0GjFr53uKm1bBPGJ+rz1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WaHO4EcxALHP0aw/fQYTf8ml8HCvmaKsZCZXQr89mBmFNRjmntjEJPUWFmbT/nNKl
	 dwAhmUrPJ9BJdw1+wdZi70OQTFuppDMz3Gz5e3VnMKxPhQpJTYKUMT1cY2/j39CGgn
	 5w1l5qzQKPSCCXW+bD8Oq6aAh09Oru7ctSyu+bTkYDhX+aA21VqAeNfJXbdFsRx7GZ
	 VLTmr1jo390M2nVx1IxfyhGZ4em+TTR6RuFoIyOoVdvgW0885RGpmxNBd/d+oLUjMR
	 apfIdU0lCWV44/Khqj70zER9byB6PKDZySKwlHrjErkxlF3FsKW/+EvE098ps/HgaI
	 WDJmWaXe1es6Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
In-Reply-To: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
Message-Id: <179074623441.18076.15900308242524005401.b4-ty@b4>
Date: Wed, 30 Sep 2026 07:30:34 +0200
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


On Tue, 29 Sep 2026 11:11:15 +0000, Peter Griffin wrote:
> Fix newly introduced DT warnings:
> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@5880000:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
> child "reg" or "ranges" property

Applied, thanks!

[1/1] arm64: dts: google: lga: fixup #size-cells DT warning
      https://git.kernel.org/krzk/linux/c/18686b294c6f6ba778cba66eccf01b9fcdf48988

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


