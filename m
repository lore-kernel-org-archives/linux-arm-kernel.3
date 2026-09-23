Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA00C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yygsGnFltgurq/BUs7NOEEkRqO4i/4yT2EM6Ffixt0I=; b=Z/rBj9GoO1ev14c5w8NIKpgga8
	/liScOYGBrC8BVYbxSFtfzysDdKRw/iIEOG0nKQOqfaKDbAE07onGk8Ht2VETBabHUs/EpoCHfbmF
	3p+ZMZJUz5l9qmA4KZDJ7CJlR7PHDSicS/e57Q+ZrEKpUm5JJlv2MxmafrKU+Z51fPypHe7QuI0uP
	hdSFihrnUk63KQQO4JdIdS3Bq2SAw/2CqKsVXS1jM76aBPIE+BHWSktvxBMLNMu/f1XbRUnp9dR3e
	hL+fsO11seRm1wn7V0/WCElANbL4+r+rWLbeiDyccyq/5wQnK7LrCb6pPimWp0fR2zBb5tAZN8mQx
	d3wsINdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N2J-00000008ORV-0Mot;
	Wed, 23 Sep 2026 13:29:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N2H-00000008ORB-21V7;
	Wed, 23 Sep 2026 13:29:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38292402B3;
	Wed, 23 Sep 2026 13:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF3B1F00898;
	Wed, 23 Sep 2026 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170161;
	bh=yygsGnFltgurq/BUs7NOEEkRqO4i/4yT2EM6Ffixt0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PQLKHnVwZUq992EwT9XxYunWy7StzJ8SDWlJuS6BXUx2ML2YcVcWa8deQ5S5+I1qm
	 /f2tkB1o6819IlcnaM5Gl301ugGwLD4ytjK+wD2/7YwAaboC9Mntgpg8zsFuI64UrB
	 cO8Bxns1uZSVecWG91i37F2kclYWFWxlsWBuKgOhC6FplmQXNC5YIG/XI/qT8F/3aj
	 aaL6OLWfwoXSrgiCDQ5gZ6kEI8+cYSSfmsMyyR3O4L1GYZ7MtyD1UipwV9yGuwXpJn
	 nqL9EI+ZzKHi+ue9YNWdd1kcNhgpY1vsLc6Grbl7h8YH0Lu1o9Aly+G37aGPVxbLW3
	 wR56MBWFjAbdg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eugen Hristev <ehristev@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260922183121.289108-1-robh@kernel.org>
References: <20260922183121.289108-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Fix MT7622 clock count
Message-Id: <179015857689.322763.9242441046352881202.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:16:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gpCZr8u03L/1mMISk72o+fynNoTXxe+xC6jgX+XjSHc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs9QpI9twB4Gv9+NN/M39J9ZkvXSaphDuMFk1D
 LUDWGKB4Q6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarPUKQAKCRAk1otyXVSH
 0BkHB/0emvTrVyY0TSqs/nlBVFZ1EdFmOq368Cx57Hemx9emyUYCl5jzvH02iZv5hWg1FPvo1hT
 id0Yhv0pXJpOYzoCnIIl+UQiPQ/OrCecp2QV44XCpcrXRvFwb6jHjeaypIILZ5oLkWx2bmo0CDC
 L1+tLjqO0hvP9F7mBevuMNtD2pwRtOhfL+h6tf+3B4tRA8l1XCDMXUXRQgnN3FVgiOQtHjYsmG2
 JXBX3mZyYF6HXNDdkg5yDFZ6peiYPfpDNFqjzrxXOPBTZc2Yc/wLF8FjwLM4W3uAuqk2J1W/4/m
 EofulVVN8f5l4dIRpUqwEVjDynkS0Z/R2qS/gT9QgSEP0SCA
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

On Tue, 22 Sep 2026 13:31:20 -0500, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: mediatek: Fix MT7622 clock count

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: mediatek: Fix MT7622 clock count
      https://git.kernel.org/broonie/sound/c/2a2d659b835c

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


