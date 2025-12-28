Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A076E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h5yVto7hjz6GKNGAZj+XeCohJWfbeiX1G6KGcAbeTg=; b=phQ1YZ4k84o60KSumTbVO7iRbT
	ZDgOdjNbddOvL+I4WFEribhkzfiy6utC+QcxfZ+1a4WCl+PGKnpZ/k4xbWP2xxj0ILgQ4Xa4oUNC+
	g0ShhhFhxJR/g99zrhfGemupQFpcBfdH1irM6AlmRE0v/irLnf1Qr81O5TdqaI59WM0MEwl84ooPk
	5WfEPPRb7UScVnSBd4YLsr57DfayLdd/F/Kdn/WWXTa7rCz2KpM2BWUbIO/K2c3oIn0b2uph6QWuI
	cI7/drsj3rkYT1ajPmztNKBF+xUXvQHQGlSKc5sYqdDps1tplbh7HwyxjHE5Gm+7M5D+XA+MSbmej
	0Mz8+IeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZp0i-00000002fEv-34SU;
	Sun, 28 Dec 2025 11:32:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZp0h-00000002fEp-370Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 11:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9421E60055;
	Sun, 28 Dec 2025 11:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E498EC4CEFB;
	Sun, 28 Dec 2025 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766921549;
	bh=n4K9RLEp9lrCFOR1ULBliIc1beBtnBois0mcOjw4yBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UYnVo/FaMsIVBGNkVo6vqQ1yLjPUAhZWHdNEz1+Z1QcIBfcBqJNAVB0M6rExYM4is
	 8It0+jVo54DKPQ7s/yw3SztC+CWm1yItASySJuAspwAxlAnpDUS2PqRBTk23xmIAGK
	 Qo7Wi9o7a8zu7OLsVtl+e2zB7Q3jupGLRLNULB2JGNmmJLh9JAmVMDucLKIpoS6yaC
	 VJrqbENQYLKF9a51RY6uuudLy0XB6npbUwOBaVIq27LgB3yx9Dmo7hvPIHzn72Ql8M
	 o8TSUFIFIxIrixkZ8R3pY0YVXOlnG0wMYzj602CPxR03DoDITmLNQJo99j20xRMMe6
	 LoyQTDRkD7DYQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] soc: samsung: exynos-chipid: add gs101
 support
Message-Id: <176692154663.58022.10187099781030304762.b4-ty@kernel.org>
Date: Sun, 28 Dec 2025 12:32:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 22 Dec 2025 16:30:04 +0000, Tudor Ambarus wrote:
> Dependency
> ==========
> Typical dependency of the DT patch depending on the bindings patch,
> thus the bindings patch could go via the Samsung SoC tree with
> Srinivas's ack.
> 
> Description
> ===========
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: nvmem: add google,gs101-otp
      https://git.kernel.org/krzk/linux/c/12da6f08a07ddaddd336af878350d30449d23a54
[2/5] soc: samsung: exynos-chipid: rename method
      https://git.kernel.org/krzk/linux/c/9133ae2119cb3c948675dc566eebf11cc4bb1681
[3/5] soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      https://git.kernel.org/krzk/linux/c/c38cfc303db9ab4d5f482ae8e36e5a677db8eee6
[4/5] soc: samsung: exynos-chipid: add google,gs101-otp support
      https://git.kernel.org/krzk/linux/c/732af51910960535382db3f6e0b33e2e2b0ff7b6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


