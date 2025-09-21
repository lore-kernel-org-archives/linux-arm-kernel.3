Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92479CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtNY3mZb+yYSBJf2rxALF2ewBk5OdFI056vRwJ4aepI=; b=n9OLMST5jOftqjF+pDw6WIs/Vu
	ph+XpbqE/Y+/djSC0YFjkVBp608lcDlH0xIFfXYdUQtPoYWIfkD6YuccheSdnpvx6fJphP3Rl8QjL
	yy+fyaKC6G2Z8KlLjLwd6sSbtpFFo3grjx+1hacpe8MQla8toNSLQN5nBpG+8o2bVmjg7hxE/O+Gv
	kZM1hO+SrGJ7+KXxb3OzUqZDrL7Itrft0wboDgUkBtUxEISeFjItyrMsBEjLwcYgbUN9bEhoEiHCo
	svcBWh3KGe3UzHq+MFBknuW9mEsT9w7TORAUR1QKS75jXznqyN0OkVHQRRqglqLub7PHNXkNCOfAa
	LGpJTdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MsQ-00000007lnV-0IYd;
	Sun, 21 Sep 2025 16:25:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MsO-00000007lmH-0nKw;
	Sun, 21 Sep 2025 16:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ACE4601AB;
	Sun, 21 Sep 2025 16:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300F8C4CEF7;
	Sun, 21 Sep 2025 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758471923;
	bh=OtNY3mZb+yYSBJf2rxALF2ewBk5OdFI056vRwJ4aepI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S27S9JadoG9UKdmIkd4Bwr0qPl6ZUGqVre7SQ2mnHuVVJ1mqZx2oc+qo52g0vPyNL
	 Wohf9xmDPeyAk/dAWAIRvvgPs+E7onwrD/NS3ccl6bRG2+k3RlNWQGMYN8biB9FgPx
	 W+tSm1NseZKdwlFwDX2HIsNnhOQSKHVxwhc1t/0TytdvrUMznpPIRKQlrFDrhE/iNe
	 L2pJEhskt7wNu8fYRtft+wYdAY0cqztve762qMKpu+aEpuchJVgQn5pgHAvsd37b7E
	 L6d4FycfLOwQ1qpNcWupZGiijOcBAD2HqCDlwnVQsHPHqS/QeB7FcsH+coEk9GPyck
	 CjP1eoHxgKkJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com> <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 3/5] clk: bcm: rpi: Maximize V3D clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:21 -0700
Message-ID: <175847192183.4354.13711226446879462833@lazor>
User-Agent: alot/0.11
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

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:19)
> Although minimizing the clock rate is the best for most scenarios, as
> stated in commit 4d85abb0fb8e ("clk: bcm: rpi: Enable minimize for all
> firmware clocks"), when it comes to the GPU, it's ideal to have the
> maximum rate allowed.
>=20
> Add an option to maximize a firmware clock's rate when the clock is
> enabled and set this option for V3D.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next

