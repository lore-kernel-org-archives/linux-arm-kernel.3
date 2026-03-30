Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93611061B27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zAq89DFX5oBUWHG0rF8OkIz5yQMy1m9cdp9RIxyIpQ=; b=BrH/JK/ZW71O5t+4VCkH5+hU/d
	GRlkcEcEakoKCXpK5aaeOJ0aGkNdUItf3qna1dcLIfMG2CHoCqe+AUfPmGgOrZ91Fd4/TafsZqrLR
	h01pytbdDUQOkllozHxoN+yONj8hhiPy627klooDA+08PqEypIbYDtSQpmVOEp5fu4lbkuJw1jv5f
	ToO+QFCIJuE0hMNZbpjsA+kbDj5PpKlgAF+ZVSmdH5qQ1z9GkjnnP4cj+j2fTUkcH8S7hrxdodPXg
	EGexVDAgqnujrPYaHftlRTOdg01JSoIuRX3LAimvlF/REDmoApiP3LzDJzS/nF4Vpe62JGOkIa9H6
	RDR2TX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LJU-0000000Bz4d-2Bxh;
	Mon, 30 Mar 2026 22:42:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LJR-0000000Bz3y-2uU0;
	Mon, 30 Mar 2026 22:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 698A540809;
	Mon, 30 Mar 2026 22:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C9C4CEF7;
	Mon, 30 Mar 2026 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910543;
	bh=KEFQLZc20GWW8sgN2/76iip+g3PEt4uQ0FT8+1KvwXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dJnLxUBU5LnSUHF1d1WPIyOzKVijcgeaimKRu14Cf4v/aA1HMdZhuu5gSsYU6NALA
	 5+cIDn0blVJBbe87OIwjOAxMUFACHt1Zm55YRn4pWl0EtUmG1ncOPgQBippmBkvcLm
	 0DHcCIwoZd20JaJimS+0tfuAiTIcsDYD3BcFLNOeMofld5ZL+7TxgUGojmE8MNLWHX
	 PM7/hDtUf0esLdcycLnyMtzS/yJyEKf09FszjvYvZbWCC14ngLTZvswolbRcFibFCK
	 2409zxujVFUvq9OjpOMoT+lGs4jHEmjJgwlkqUo5NbWk+bGjvHyzey87GhqFPp096V
	 sU+BypcC13RuA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/2] regulator: mt6315: add regulator supplies
Message-Id: <177488194606.167050.13383296010943273438.b4-ty@b4>
Date: Mon, 30 Mar 2026 15:45:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KEFQLZc20GWW8sgN2/76iip+g3PEt4uQ0FT8+1KvwXQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxMA3ShhadjMJFm+yMuBgo1epnMA7LXIqnTb
 TaKpUtyeuKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8TAAKCRAk1otyXVSH
 0I5PB/9S8zgjJrYgaMUtuHun1Hsk1sZ5p3dpGcZqX8Xo24uvgAYM+mudCYj3OzvEhU4hDQXF9In
 HWmR+w098C190BNhR+dtPdBNP/SlSyLFxSuqaC3jZY9jlryM7d8uedsO14MGwnXhOZddk8Yi53d
 7J7bXsTk4icZTaA6ABms4xsL4Y8OKSS5HqJ1WzLxR9J9AghNHDfLDNLlaN9rnDfbtnT5p4q8GGG
 Gs+6BZMoJbWoK0/RVf5n7lBRQHIfwlUTEv5HxNh4nMuL/MwWGJnzsAittPyQbcY8mYBAaaQsKHd
 msOE9yKHKNFSI6SD9ZU/SO7tsyZvN82gzHm2YzTogAv8R0ES
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_154225_766062_D6B5E2EF 
X-CRM114-Status: GOOD (  12.47  )
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

On Thu, 26 Mar 2026 16:10:47 +0800, Chen-Yu Tsai wrote:
> regulator: mt6315: add regulator supplies
> 
> Hi,
> 
> This is v2 of the "Add MT6315 regulator supplies" series.
> 
> Changes since v1:
> - Link to v1: https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
> - Move supplies to top level node, at the same level as the compatible
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] regulator: dt-bindings: mt6315: Add regulator supplies
      https://git.kernel.org/broonie/regulator/c/d15d0f1a27b2
[2/2] regulator: mt6315: Add regulator supplies
      https://git.kernel.org/broonie/regulator/c/292d64fb98a2

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


