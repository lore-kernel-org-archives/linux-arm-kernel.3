Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF0C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvxmsL8bBryD13yQT4Sh8NN03a7Rkbq2gIRrlYpwI50=; b=1TqHrBXdTTXPPLHftnQnt1Ke8H
	t1AUgBAV53ApOgGqacPQ4jYE2sPEKfMIMhePEFCaKK5Jvb777PI4z4QZUdF5TCYhUrGwlyWgLDha5
	JeEheKyqh2z+BfidIXSnvHjYtHY0ZUQzl3ZRbbTB8RV5pUKCJyYRywtuVSlotO2R8vbEWcUEdfLuw
	BMfEr4hK9a0JJWzM3r7B/wTq3BYzC43AWD9Wg0J9D4vOMptjTh7r2nHXhhF5v+35VfJvvcaIRKpnO
	4YT+d9k2+E2L74+N/WKd9s6p8YIGW58qKvt+84wJYnBfCdf2kAwgD5WnYZ9SeeJ6NbQPEel8xvhLU
	qKDcjIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ra6-00000009asw-0g2Y;
	Wed, 16 Sep 2026 15:29:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ra3-00000009as4-3Q5h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:29:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31EC06020C;
	Wed, 16 Sep 2026 15:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B371F000FF;
	Wed, 16 Sep 2026 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572590;
	bh=QvxmsL8bBryD13yQT4Sh8NN03a7Rkbq2gIRrlYpwI50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j9MMBGAbLsrRCAD0MM1rs/mTSCMpMA5e0VeHa0Bulw8MSzsgIJdNw2tw6lSu3hOS8
	 E80ewJgQTR/QmnQo1row9OYYxEqevjyy1DOsRy9EIaAXLLBKaKZqXvdj8YBdxsQNa+
	 Dp1+UqV7fkz9xX3TrbsmjEIGnSvNwrMF+OsjuY9JbTdFKwyEwYm7HR7of3XL7sb/D5
	 U+vhqLa1JB8YFN8NSR3SWSnzN5DYQ+VXOtI6ZEU0hsjQEzuXif1EaiQ/NMnKFDUJfZ
	 Dl5YCQmdP3Mk3n9O+ow9NZDVmvu5IwIp4ZOuUYTLLuGpqm7E852hlVecAkFX9zchz2
	 CusGF5wlZDHeA==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907045526.18873-1-hemanth.selam@gmail.com>
References: <20260907045526.18873-1-hemanth.selam@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: ab8500: Fix typo "interupts" in
 comment
Message-Id: <178957258952.1739336.2506970336565641469.b4-ty@b4>
Date: Wed, 16 Sep 2026 16:29:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 07 Sep 2026 10:25:26 +0530, Hemanth Selam wrote:
> Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches a
> comment, no code changes.
> 
> Since v1 the subject carries the driver name and a capitalised
> description, to match the MFD subsystem convention.
> 
> [...]

Applied, thanks!

[1/1] mfd: ab8500: Fix typo "interupts" in comment
      commit: 708222feb63451ecadfd0a70a5d99f96c7d021de

--
Lee Jones [李琼斯]


