Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496F0C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUchE1Zh7ptn0AzvKmzY84GNBKfh/QkAkDlMN6pv/uc=; b=fFyQTLSJ3FIuPZA15f/srcRUvK
	RuMJR/RYczkXuEgZwbcWyo++VRWQfJKxh0EJ3wQeN+XenLyNAFBm83eJLqNaAp9/1IweywoeBoxI0
	bX5XA+nE8TLUbthGltTSFopg4yx5DEkpHlWGE/aVRbvP7QJYnmI8Jkr0O5kJ6unS1rl93mOtJSUYh
	jq5w+Rp3yYJ2nfI5vM0WFRwhq8TP47f+TNaWAtHIfY2b6CXv1OqoopabkI6gOHzn9OHkV80eeEyJL
	oUEdKxsaTiC6bRYdaST96xU+eCo1/+rjOsfUyvRgAQog99q0M5Wn/aVyBChLLLocUOOtZjoGfxON/
	quJEZ9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N3C-00000005OUq-2gqJ;
	Tue, 15 Sep 2026 06:53:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N3A-00000005OUQ-2zsw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:53:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3545600D1;
	Tue, 15 Sep 2026 06:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0681F000FF;
	Tue, 15 Sep 2026 06:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789455231;
	bh=cUchE1Zh7ptn0AzvKmzY84GNBKfh/QkAkDlMN6pv/uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J5MvIzGv+Dci9Dofw9ky6uwD9+X0OI+FIS5OkosuOl9CYRKS4/YdyZlQ5I/i+BezT
	 loq9ybmRbtTcesAHwvc74xFl5ucQFN6HmJ5e2DdEVtksjpZ5scwaNysWWcz5uK9SjE
	 9D9tm11oIq38cxnN7uNYE99m4ltoI6TFAVar+0rJypbMNtNLrqXJJBYcvVFUZ+07P6
	 1W4/lsWp86wMdbAK77jvE+QAMXwJocOvZAW+q000bZ87OUQD2ezT3T8o3dAJ1AZaXM
	 PssUmWyuJLdA9Ntz+E60Ut79PtmxGVQ7B9NV7ieWemMC6qxnfxNV6YdJ/j+/e5OqbE
	 BsZczW2N/ozsw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
References: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
Subject: Re: [PATCH RESEND v2] arm64: dts: exynos850: Add ap2apm mailbox
Message-Id: <178945522767.39169.14365156505199938615.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:53:47 +0200
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


On Mon, 14 Sep 2026 17:32:45 +0100, Alexey Klimov wrote:
> Add mailbox node that describes AP-to-APM mailbox, that can be
> used for communicating with APM co-processor on Exynos850 SoCs.

Applied, thanks!

[1/1] arm64: dts: exynos850: Add ap2apm mailbox
      https://git.kernel.org/krzk/linux/c/61c04d2173896eb36f2bf55ce1804f7f8477d0e8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


