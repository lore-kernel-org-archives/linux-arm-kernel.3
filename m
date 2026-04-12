Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C262EE937F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJOjGgBOVhd3jh2b+dn4FpDEV+MkzCTVQfoJwc0KxkU=; b=kwev2W6MyURw6Hwlb0E+a9hWx+
	c/gF44q7BnGwKfWaldrKqY7VWwY/YKbHDbXP3n93EZXfjrjXBQ2QXRoattQit63g7y708X7tpN1VX
	8ohnRDt6Id6vI6NDHE317+ttvd6egGdlNyyQR/JDBwJ8SlqHJScAjhH798yTTpZzBvhqLEZMH0qFg
	MQaIZ46d2pj8HChQB91RAAgs1+Sr+kVv/9OVlkyqgzSIV70pnFJf1P7k7O8w2BB1kOmNL0Eji4YW1
	0TiezVv0UqkMneTBvMVCwuUBfQOILZ5feeDKj0zQ4Su5qqx3SpepSZUoNP892wfAVvcODScZz/CBU
	QdOZ2YWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBzgc-0000000EaqL-3dvb;
	Sun, 12 Apr 2026 18:37:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBzga-0000000EaqB-37kH;
	Sun, 12 Apr 2026 18:37:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69C7560142;
	Sun, 12 Apr 2026 18:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B15C19424;
	Sun, 12 Apr 2026 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776019051;
	bh=PijWu97k4FMC/JNTJB1uwPX/IYoDgzxrqr5gykmeuRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HwOTT/MdaGfSu+lMQ15reO4of2vDxHPOhy60wmT07ZTYlFrDnmz8INj9fBtd4caew
	 4ZW2fqlV130b6Z+hApmwdjnf5GI7QJ1lkWeKMcByVPD4pl/MM8dwmBH2n4XT/zKSbQ
	 QARPweAiFbTHS6oeSQ23qBLUkj6rr2Pe+xYDsxJySlDKR6xuGPzwo5pliOqgwvmzBp
	 2ogHKHjqXjypMBtmdq6o5meV2IexDa2cyK+hoaYpFsxj0LJJh5kMD9mw/+73uw1ukI
	 /wam1h2nO/e9hikCt9OUe25qUbTz29N1ebg7wJWBVvN3qNbkYX3gz6U0h7c/4kBtq1
	 E8ZivocZctjZg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Anushka Badhe <anushkabadhe@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260410055532.60868-1-anushkabadhe@gmail.com>
References: <20260410055532.60868-1-anushkabadhe@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: rockchip: convert
 rk3399-gru-sound to DT Schema
Message-Id: <177601109152.15951.7045747169563150515.b4-ty@b4>
Date: Sun, 12 Apr 2026 17:24:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PijWu97k4FMC/JNTJB1uwPX/IYoDgzxrqr5gykmeuRg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2+ZozNSjOGljh51Zr9GW6/olODr+U0bCjFa7X
 5XkH5n3dleJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadvmaAAKCRAk1otyXVSH
 0Ag+B/4nyiSibB/tBisuOvNzVo5Gh7bWuT2pSAqxItMWJeEeUjqvdKRLFLS6GQ/F8aW6MK8zBTs
 QorTnmTl1R4/ZsdhXRcoOVGIwI1SFpSRk3UpTo8NKjYR9Sqt8OBTrM//GrdI4iHQ5LWqv2tHNYL
 1qTndO450NNIt3qhRjWhLafyIdPSKVs+tCEHdE2qr+xDNUaUa8HP+59iXyPpH+IE3afytQ0OQAX
 yeS68p8Y9t+1X5ULY5z6pFVM3n/rJ8kzOKjMzJMjKGRHzAmt024aBk4wCvK6a9dkYVg167VEnuZ
 SjzhRomJGhNCIWp+ei542H0iiHu6Pzg324qyEo8ZbSjhYAS7
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

On Fri, 10 Apr 2026 11:25:32 +0530, Anushka Badhe wrote:
> ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema
      https://git.kernel.org/broonie/sound/c/115e7d764dad

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


