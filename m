Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B723606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I8iD6tiD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLqJU0U6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1etMSI00u4HSF77ZkDUFJOJI3+oHrW/cfMlWm+E9CKE=; b=I8iD6tiDRSaLvJ
	bVpmmDinOvFvhCsx45WB0KzIAdqApbggbOd+llSHYDh0Iw6Fj8jlf8mVbUUnfBdpLA5sWOgBYZxlt
	kaSoX8VFiWAbDSWOjygaQ+kk7FGxZ+QbAdZcM4Qw5KzgmIivFjHEoYN0ZUA1nP1md3SeIQOY0Jo7w
	uiamjp0SMy33QqK0T6XpT6npoJIMIrg7pKGCFmIQCZ6HVkRyWtWY6AAy3zutu3mB3zgkui9FB4Pnm
	JyGDWW/y4i7wEvpeqyb2TAZXuanGaUrpDC/Xw8QGxEVk1Tyo4SzqVJ0RSKCV67WVHQcWGd0+10PUf
	kojwwgYJ/MziUDmcTwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS2d-00000004HOC-3eC1;
	Wed, 04 Nov 2026 03:52:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS2c-00000004HNx-25pH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:52:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED2F843620;
	Wed,  4 Nov 2026 03:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8791F000C1;
	Wed,  4 Nov 2026 03:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793764321;
	bh=1etMSI00u4HSF77ZkDUFJOJI3+oHrW/cfMlWm+E9CKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QLqJU0U6pjLOfwlMdr6nKyJF31ICq98jK2ebIvNy+gHkszwNR52f4xJbwo3piEhY1
	 yoDhf/Raa867XWmMh16vuCbuvPAJRldwdpvpWz2QNlEmWd5Uzyu3Hg8y7JRsFzW0KK
	 h8MV4mM8V37D0TZbLjvL45CvRZu6jfZzCeLRnr7PpMAcBt12ukLvIjlJcnWjzFGRf1
	 RcaGKu0fYDU5ywB4gSIyCcGFwF7v257dMKV8e+6Dcptu82a3LQskQWbyRN8Kc67Sfu
	 XqNg5Of86xE21mMiqBRYTxS3Urcb2xV+KbKJdHSmOCLtYoZpx+Xl48aOcFC7OSGORO
	 3tOFASm40IHjQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261102233348.23117-1-andre.przywara@arm.com>
References: <20261102233348.23117-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a133: add ethernet aliases
Message-Id: <179376431988.76113.3054879706039363270.b4-ty@kernel.org>
Date: Wed, 04 Nov 2026 11:51:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 00:33:48 +0100, Andre Przywara wrote:
> When adding the DT nodes and properties for the A133 Eternet support,
> we missed the ethernet0 alias, which is required by U-Boot to generate a
> stable, device-specific Ethernet address.
> 
> Add the alias, to allow U-Boot using the Ethernet port, and also provide
> a non-random MAC address to the kernel.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a133: add ethernet aliases
      https://git.kernel.org/sunxi/linux/c/1cfd4392ab15

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


