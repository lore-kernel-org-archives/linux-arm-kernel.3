Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE41FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHmRpheChnnsyaf0Fu8oTmfR5ycf3JOSEouN7NBJXTM=; b=kheHgtxnTKhUvEmUIEAzMHBDpg
	L1s5hQ9hmI5XIYT/YHXPZ6Dbw4L6DBDZs5X3E8ZGiQ3BDDuJAjBBevIfJnJfrbaVcrva1tafYxhNs
	0deqKoQKeEDxzfeTW7Spq52aQATnvArbxwA9yoig0afIswAPiJKZrWL5SBLkjkoUBAdx/aSudpo2X
	DIXlT+IYNPBnfM7RnCNKEBPWppi3xUtugfwVijYM5KoNtVL2yhMf3Us3JVAHvLW4X3owYnyjERk8u
	RGithcZCzMerj+Jiac79lIC+cwZwJOejspigDbrXr+zfLFPjqHyrYF1O+Dboouxg46gtxI+YK4j0z
	3RKnT91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8nX-0000000FvPR-40ym;
	Sun, 26 Apr 2026 23:21:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8nW-0000000FvOs-1lY5;
	Sun, 26 Apr 2026 23:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13CAA60145;
	Sun, 26 Apr 2026 23:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D66EC2BCAF;
	Sun, 26 Apr 2026 23:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245716;
	bh=rA86lA0g7W/+V7BO/FVvGSvEuTg3X2fgF21kbHGVYgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JoCrGdD3YOaO1Yk1P3J7IOlXL66bvP/5+YTJhI2rldp6s2OaEPH1R6XjYzQmMTuH/
	 HH45cpNz7VrG+fuzWz8by4DqC0JZWyPmKFt4hRJUaZa8ZddGLFD8hhGmnmyhGRtXmJ
	 uLRoUZ3wiHX9kwMqCSHiDuAO+VEhm9CCu+j2vNArLuxvItw0mb9qbReQhC3gdie3Z9
	 FS04F0t93/kUZb7Ifz+LriW83o2y584m2Vjn8369M9No6m0nbg1nI0/kYoT1teMAUb
	 Z/MQh19RP6WpAHseo88+dGKMbnv5tXGsh0mKC1LvLVSLYA2vYjiG5ykDxk/RE49QGq
	 YCDOLXJKF0+pg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Gene Chen <gene_chen@richtek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
Subject: Re: (subset) [PATCH 0/3] Mediatek Genio 1200-EVK: MT6315/MT6360
 PMIC regulator supply cleanup
Message-Id: <177724330298.266775.14132313883869438377.b4-ty@b4>
Date: Mon, 27 Apr 2026 07:41:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rA86lA0g7W/+V7BO/FVvGSvEuTg3X2fgF21kbHGVYgo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4RN+O47GpsvyrSWQ01EVchEW48pBlZVoTbr
 uiw1p0XiXyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eEQAKCRAk1otyXVSH
 0CRAB/wL2SMaWjRhWwuhdNYcG4TzAg1zkfTQqVHM79iM+l9cygxMo2mcBEhZ1Cc2/VJGxgPxQ6d
 irFFH+YlHSWmH8ReXi/9AQshr6NRvVfpVG3+bbko9WweZdMVCSuyNChqShzZz890FZOxFkIrmBn
 z9mpTTcvOdpmrRS4d6jzYUlnSzPZ/IZLbRLO7vrcY1GrVpp/Yf4PvGtJlx0IkSAwczvpsb6r7ur
 p9r73MUc6r3oLH9LPk5NnFs/yNpV7dxWvUApOKHQ0mnMKjzlApi3wdMIxgaRyFm8ztAmZ1mzji+
 4Ms8Dwn/lELwQu7M6xOleeg+qrcbQ5eknSANDHyd54uMaayA
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

On Tue, 14 Apr 2026 13:44:09 +0200, Louis-Alexis Eyraud wrote:
> Mediatek Genio 1200-EVK: MT6315/MT6360 PMIC regulator supply cleanup
> 
> This series goal is to cleanup the power supplies of MT6315 and MT6360
> PMIC regulators, that are either missing or incorrect in the Mediatek
> Genio 1200-EVK board devicetree.
> 
> Patch 1 completes the MT6360 dt-bindings by adding the missing power
> supply descriptions for its buck regulators, that already handled by
> the mt6360 regulator driver.
> Patch 2 adds for the board the MT6315 regulator supply properties, that
> were added in the dt-bindings by [1].
> Patch 3 adds for the board the MT6360 regulator supply properties and
> fixes the existing one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/3] regulator: dt-bindings: mt6360: add buck regulator supplies
      https://git.kernel.org/broonie/regulator/c/a8fccc792f42

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


