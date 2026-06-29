Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1136AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9N54Uo+6f5J1Zku+s0K2g8NKpNqzGz70Q4dEIQnIo0=; b=eNdYIaKmoPb6ilVWHQtHRzU5YK
	AiPzlwLrDYOj3QhKRYBMCvbjpwGzpWCv5Fy+pyRT1N9mTXVuZhqXbP001MCDdboR28ho+l6956FKp
	cZmoY+SCMcDC+HbvW4TicIYUsnuMf9HM/VTero8wFLJQ4VjnRz8Q7f2JK7dme8IOsgq6zctwWaN1R
	iHc7/oQYT8LX/ykUExLjxEl8WDzHujdnfCVguG/v5MAGhmJBTXBsLlwCx3BU6iI3AyCDVaCpnY+4N
	i5px3P3ri1aihPEg+NNGN/+6VPva3doMDYAkayyBVUjFl0S2ccDzGcfEmrC0W0DQ9REEU4dKxZXPO
	Farqf4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWSz-0000000GpDS-0fSz;
	Tue, 30 Jun 2026 11:17:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWSx-0000000GpCv-0jFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:17:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9A9440AD6;
	Tue, 30 Jun 2026 11:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EB71F000E9;
	Tue, 30 Jun 2026 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818242;
	bh=s9N54Uo+6f5J1Zku+s0K2g8NKpNqzGz70Q4dEIQnIo0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gTbg79v7L36dOzuM+U/Q7Z6940qK1tdXGz+2H/8P1NvuUDV/jYJ6DQkITZteGIFfo
	 cAarfQxNTchQjbYA3opn7rt6PuK9a6pv4t9+J+gL0PmYzqigTEBIo4+ArloqKlTFJ0
	 vRpiSyjV7XJAu6m6qexbUNX3w2rO/8HTNMRLpuVF6H/byJGpJyTqAqJjrdV8xQWVwQ
	 9+B21NUniZaTikz4V0D0dDZuJT8hsgPl2+5IOqOzKbYmVJVZvFthgi7ZxgtdaWzNM3
	 EN2pAZwFwh+VfLunVBFbY1MEnc+fq+fnwdi/ktroQ2DB+3X0R+/BWBqMxoIqGZLFG0
	 rzttYjZIfIW2w==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
References: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
Subject: Re: [PATCH] dt-bindings: spi: st,stm32-qspi: Add power-domains
 property
Message-Id: <178275509841.47562.5600063205070514868.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:44:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aKfGsNB/rYGTPsm7SpBmxT4bJNWAAK7ysLKQHTgW/Mw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6W/8GPDC1xFkVsF6UiqKD20ycumS+LocYOKD
 65/p8iixkGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlvwAKCRAk1otyXVSH
 0E2oB/9bs442EaGu5J0NsN5932LvwU/hGEMRFI69vgX2nSqzxKDXiomxhhgttWGBwer1qQqgEqk
 GdZXoxBHk6EqAnnLNT61lA82YrskrQnJiYlbTIG0yP2CTx5zVGpjE+ksViW8BwAHOCVIsioyxRQ
 wRmIO1Zlt0uJfcvQ3qmpDq+rfiOZpWh9ykGqhfXOYvy03h99+Qy7j850TQAYzIfeYlqoSF7NfQN
 9kBoqJ4dPpKCHjPilVOMYN1Aart81IphDfx3UFRajWFZYPy29+JbERJF7NcyZCSEDQLRpXNC73V
 XqgvXKAjNTIzVQmOrrJ4QK8y68T0LUqvfJ5l9fnDzL2YJLsR
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

On Thu, 18 Jun 2026 08:46:35 +0200, Patrice Chotard wrote:
> dt-bindings: spi: st,stm32-qspi: Add power-domains property

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] dt-bindings: spi: st,stm32-qspi: Add power-domains property
      https://git.kernel.org/broonie/spi/c/7a0d22e632a6

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


