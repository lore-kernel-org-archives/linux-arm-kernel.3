Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9D7FD4F01
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Dz/OMdPvIQTsygrn0Zl8C5qWhun/IaJyrtYcn7X2+4=; b=05Ch52nJWTL52spDuvOYkx0YV1
	eAn36ix79fsxUK0OIgsIf9feON5ZhOWtRlnDyJMNf+xyom06kQDjEdM5Hfr/8Mh0v10MGR/58QMy4
	5l3QYQ0dJiciAzwa86jgT9za0Z24nHMdP20Ii9fMi0l3l5vS1rLgaXuEbLZUwmYOzOZWjEztzusgf
	LNhX+7aWWtPA3ppY82WnbNuULyaYxJa3y0WRFlg97qoqBuw8Krp6AZpdMhbGtLL/4MYo1BG+aUkvj
	R2HTsFCaWU3DzbXhAzPqnezdOD3lFaj2I8RL5ODjqBozzvJmt6p5SLzQNr7wuE9g6RqgJ6BcZcxY0
	4Ag392/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzZi-00000009slf-3XZt;
	Tue, 10 Mar 2026 16:04:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzZh-00000009slC-2SLu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C92A600C4;
	Tue, 10 Mar 2026 16:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2BFC19423;
	Tue, 10 Mar 2026 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158688;
	bh=599XQUj+u0HpLGnVBeL+8eF691wPvbQV+mEAtH2dpcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IWp/paplcXI+fO43fgIA/0YwOPbsNrc2e2RPNDN02NErSMHWxitNc5q1SmafqbW1P
	 go3kHt/ut2euvOZeMofHJ1UHlqSf1P0nw2BdACPabWlYYws67f0q6U20jXWvNNqDCa
	 7QXwFAFEWddJqUU5IvEhetZ6YeBlQhcDmcDm9y81J3F/fB1zrqL1s9/BRn2p6q7bOn
	 SBhhRNbDT+MQ/InMvqFp4LYNLhiG6b2TCYuJZMd2HuJCWW+7nOepCVkjLKtEFz6F+W
	 IfLn8zwIHdNHjZckfsbAGBOgnqMmEaaD4A6bQkRKW7dPBEVSIcOQrZullQS6eTYMJ3
	 cE0jMxJv5Ssgw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/5] ARM: dts: exynos: Cleanup I2C
 address-cells and size-cells
Message-Id: <177315868659.219585.16811317225740215009.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 17:04:46 +0100
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


On Thu, 05 Mar 2026 10:09:23 +0100, Krzysztof Kozlowski wrote:
> No functional impact expected.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/5] arm64: dts: exynos7870: Move I2C address/size-cells to DTSI
      https://git.kernel.org/krzk/linux/c/41dadc6f78150b7bf0308269fba7ba8a1a516392
[2/5] arm64: dts: exynos8895: Move I2C address/size-cells to DTSI
      https://git.kernel.org/krzk/linux/c/90f771a9745476a5e2b95b5efe225a943c090bb9

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


