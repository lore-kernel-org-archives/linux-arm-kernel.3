Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBCBCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezo9AABzihn8v9w+EzLT2Oqew0alnRrS/G6JzrXB5K0=; b=p1d8gmAF+EyrRO75JtwXgQ8mb9
	y5P6Nx3yCsYabPyJNxVW2YtkoH7YV59U85UvAbILR7Nc7gp1hrtvjNM3dPTxC4nPMuPbYARobpro5
	XhW9puClki1Jtn8DK3/f8zGqbv3xw0gN1UU5QhRFuDOc4FOq1DrKRU6Jn8O+AYkKlWqi729dHljID
	/sGMy7D8l0wyJQFaT9DZ5czPhl3ynpeWFD9zD7S7T5Zfjvni/oCKwnfIKPsft8Vc2Ww9DGh/fQOzG
	uxfWf3db4A/N30Oy81SXyy+O+kFPNIrSRFxd7+HIANUKSxsb9UvBAl4fYd2tYwlxwIfGx8cgfJ7o+
	HvADpdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFBh-00000008eyz-1n6G;
	Thu, 01 Oct 2026 11:42:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFBf-00000008eyT-3BDF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:42:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6BCE60A55;
	Thu,  1 Oct 2026 11:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EED1F00898;
	Thu,  1 Oct 2026 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854974;
	bh=ezo9AABzihn8v9w+EzLT2Oqew0alnRrS/G6JzrXB5K0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z7bGx+9YjwQE9mmx5xOfDrWwbuyPcSv80D+JAIMF/rbGp+AAKEwfzI+EPb7nQsdJK
	 pK0KmwY+OHTVp2I1huCwyQFIXyUXy3IbfwBL6c/P089Bn46pBhVyEYJ5Gfcu1jV1Tp
	 Vj0QjTMV7Nwb8S6ea+60PhwGOA1LattBvoasIP7H7WZ13C1P/lk2Ydbhk5jyPA/yzM
	 uttRxmd8TJSFcv9+pQhG+RZrCrHq51nRqfqnuyefDqHLe4qN+xucigLvVBd05DwTRW
	 e2pjwmZJgo089MtmhNI+1kqpYx5e3KGU28SBQWzwq9A6Beg3t/x2///mazUmVJV+Kj
	 aE03LVf3B+8ag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Ridham Khurana <khurana.ridham222@gmail.com>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
 Brigham Campbell <me@brighamcampbell.com>, 
 linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20260921204204.797294-1-khurana.ridham222@gmail.com>
References: <20260921204204.797294-1-khurana.ridham222@gmail.com>
Subject: Re: [PATCH RESEND] platform: cznic: turris-omnia-mcu: Add missing
 MODULE_DEVICE_TABLE()
Message-Id: <179085497050.480978.17953690152528059792.b4-ty@b4>
Date: Thu, 01 Oct 2026 13:42:50 +0200
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


On Mon, 21 Sep 2026 20:41:47 +0000, Ridham Khurana wrote:
> The driver wires of_omnia_mcu_match into the i2c_driver's
> .of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
> module alias is generated and the module is not autoloaded when the MCU
> is probed from the device tree.
> 
> Found by code inspection. Not tested on the hardware itself; with the
> module built, the alias lookup
> 
> [...]

Applied, thanks!

[1/1] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/soc/soc/c/59797443846bc2451c35816026bbb79d281c9f23

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


