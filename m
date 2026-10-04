Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D18CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rinosCynbc2xpe3rDyj7sc4OtS5EUsnctpcqA6exJpo=; b=sd4GQFUogu6ZRXSThQNyPBhx3z
	3LDIRtDzqi/vc63irgGyyD80vHeWKqP5njeRkwRXgoUg9+EU7O9Qf1CWRh1NFAQExxpZrq5xGMkIh
	tyx1RFGEzqugWuICrfbauNcn5e9nDQsNySZTk+76/1dTenrd33kyqQSqPUvgsUMjmt4nY62NjI4Eh
	nOFzc0mz3UKgENEO30DAQX16WZc0700YyxlsT0+wZbvwR69YcYXPGs6tP9bLvoG7VQ2dl4QmTpHqa
	8VboFp8QkpzFn2ae1MnH/xnjbALSC1kdALt1HfhDARuEb/6chQOwo1JvcyRZR2zpL+hAYlmvFIHuh
	praztL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiWj-0000000GV1W-1qn7;
	Mon, 05 Oct 2026 13:14:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiWi-0000000GV0w-09nN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:14:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DC3760236;
	Mon,  5 Oct 2026 13:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DF71F000FF;
	Mon,  5 Oct 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791206082;
	bh=rinosCynbc2xpe3rDyj7sc4OtS5EUsnctpcqA6exJpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JZEOtb4nZaXBOW/R96TfohV/XC08ptl4jMwaJKP0DJ4Sax9/HHj6kpL8nLvOCMxJW
	 cS5ZW4x3BpU0WpJ837UZmPRP58PrCjMBEs5VU9m1LLLby9W/2szifjJVHrIjtzDmUS
	 7wELp05B88pySbsjbxNSaIs5PZ7AqMZJhQJ7D5DZGl6YO8nk7jJLDvf/DkRL/42myA
	 rwl+XJV74yYuPJfclqishkZ5H22Dqy1zo3rAe5QmaRWM0tvjuFQa2K0lMmGFx95PPb
	 7hkzrSl9L2ocSaEv55GfEd5XBJZ//Gm26T0I5YaxuyiOczE83GVq8XjFI522C1LMmR
	 PHiPRJ/WKoaog==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com
In-Reply-To: <20260924-ti-davinci-spi-v5-1-ed811dc6cd89@gmail.com>
References: <20260924-ti-davinci-spi-v5-1-ed811dc6cd89@gmail.com>
Subject: Re: [PATCH v5] spi: dt-bindings: ti,davinci-spi: Convert to DT
 schema
Message-Id: <179113445460.150114.379419426296382402.b4-ty@b4>
Date: Sun, 04 Oct 2026 19:20:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KVGeYyZ+6WVVLz3FLkcRdwWY/D8tnkeZOopq1PLkY8M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw6K8qMhKJZ78dWWvOIYCkRZyq8g5Ma6N73h/Q
 js71uWZHHuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOivAAKCRAk1otyXVSH
 0EmZB/9QWH3BLvEK/ETB7ZJNoIzT142mol77BtQOPzpHXGrhAEFxBKIQrAPgMhvhepeE2o/Q4VB
 HYJNF/qkDIBnJlCEd6hqHUClo2uLi+qUe/Y6U5tl9hJ89L4LL57uWTa3YgpP3EGMStkmXIcaRN9
 PgRDe7HVxOpqshzVX1eu0o+LUm6g/VLKL5cpX9/WpPtIRibIYdVFmBQnrKLCqnpISjIGTBIyweR
 AVeTK5gjOe4lj5VA04JYvtFnaFRoUQh+QsHgx8biXX91Nb/+/xC3e+u0JDuaYKx+kIZXP4yxqEF
 /4GdJIVfMpzf3r/2ZftpBkQ0BCCjzl92AQUTQeLkxgf5FXUU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 24 Sep 2026 04:12:40 +0530, Bhargav Joshi wrote:
> spi: dt-bindings: ti,davinci-spi: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: dt-bindings: ti,davinci-spi: Convert to DT schema
      https://git.kernel.org/broonie/spi/c/38ee6caa8d10

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


