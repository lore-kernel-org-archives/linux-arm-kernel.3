Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECBCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIs/L9nMFFsSa08RdWrOq2uaV+8rOzjlesdJTXSIC7Q=; b=bvJoArJ2UhE829I8538GqgvksS
	JWlLO0oAW2gxmxCpSFKKTkIAUFxhaZp1rCKKJJJoDpcXS1OeOyS3KWThJI0qS/QDVoaIodlECIjcz
	eS45UgvCPpkOBbkgJ3o7MLvmPqxvS9Ja00UxbIjn1AY4fCUq8iUIEaZQiYcHdEC8oyy9e4XAd7oJ/
	BXI1SZNFCrks3Kuc6snTIfr/p97Cb0qSSjMGEw5HonOt0ceIw1JlSnEaBpVlis7uuXhBjT6WzgC9O
	c+DazIq1R4rJXLv7OXwdpC3PwzH4QaWSWksZ6DBLY3pjLz+HZRr7nNDfItSlXEAKT5sXstpYMxORX
	oAqSnwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9oB-0000000GPj8-07X3;
	Thu, 06 Nov 2025 23:54:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9o9-0000000GPip-1Mdq;
	Thu, 06 Nov 2025 23:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 792E3601A4;
	Thu,  6 Nov 2025 23:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E79C116C6;
	Thu,  6 Nov 2025 23:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473264;
	bh=nUgrKOEntcoxnLMXZVxWwUI9CbwzMYPoAkwMzotuOOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e9Cy1ioiBgg2IZziJsSnPM2e3+VSkoYpu53IVyPpk/ZevsKAMfAKMy/vnAV7iMFvq
	 zcJDzTr2Rrwb7/f7W5S4Tzgkil55/uSPYDuUtqONeK6kI+jvBl8LLq43BFFBVHdmLL
	 s/F1uLxE6o0gWJigWC7O0BO8o+/BDngSKtp0WI+jCozdVMlK8cJJOtk5jhmTqwt4eh
	 8JK5XpeQPd/aVEUtOGtxvU+j/PfpoZI6FtTgs2K/HUR+vVgKxz+ykI7KTJkpxa8H9a
	 x4VKQs0EwF0Nx/j7jnIRHbLWq682w0lLFnMKLs9CZdZbVmy79Nv12n/X59uLkJNZMs
	 Pgh+mvfTehB8w==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 wenst@chromium.org, igor.belwon@mentallysanemainliners.org
In-Reply-To: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs
 regulators and MFD
Message-Id: <176247325942.2483095.1363987867451171276.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:54:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
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

On Mon, 27 Oct 2025 12:05:18 +0100, AngeloGioacchino Del Regno wrote:
> Changes in v11:
>  - Removed unnecessary #address-cells in all mt6316 bindings
> 
> Changes in v10:
>  - Added "struct" prefix to structs kerneldoc
>  - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
>  - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
>  - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
>  - Some rewording of comments as suggested, addition of more comments
>  - Refactored IRQ domain handling due to deprecation of function
>    irq_domain_add_tree() to use the new irq_domain_create_tree()
>  - Fixed to use generic_handle_domain_irq_safe() to avoid races
>  - Added support for two interrupt cells in translation
>  - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
>  - Added support for handling PMICs without IRQ Group register for
>    upcoming MT6685 implementation
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/9] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
      commit: 40a7c5db9020079547358f486ef12d57c1a7aa1f
[2/9] regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
      commit: a87a7b3530728fb7477a74c27fc27e060bf5684f
[3/9] dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
      commit: d0f9f5b7a3356b43f78b37b9cc3671ecc7469356
[4/9] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
      commit: 3c36965df80801344850388592e95033eceea05b

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


