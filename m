Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D66E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk7buamFfFI6/2HjY0gbql0NsZ6Tp5ACkyyKhCcE+Cs=; b=vWflq0wKJrGHaKFGpO0Pdscm3b
	82DphGrgagNFU/NYw4Zq04EUTRq7Kp8Z/wv2cX14QwcY7YzpenCIsJfkdhD7g0WAT10mSsU5wCw+G
	Q+/VeCqAgAwpS1PcENh/Dc35LH7lFu4r6FkU5AuWZ9964XD/SCqC/UfH3Kh2Etz+dsnRmBalTA+kk
	W2XnRZLl7QUe9PwdC1anKRjN7mBmwsg3BG8qDcZK2s50mDdby7QDUWPnQVe5KFzed8u3u2bNBA4ny
	gRmFfuOFzc4N7bNA1bUYPDMdTDWVGeF+DInpMQ64QAAYz43j4zZCpKyyt8SFjce9HnEcnjedTnFki
	Pqh+MEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLigW-00000000PkQ-2TAV;
	Thu, 12 Dec 2024 12:52:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLifR-00000000PeS-3cnl;
	Thu, 12 Dec 2024 12:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA2AB5C578F;
	Thu, 12 Dec 2024 12:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9352C4CECE;
	Thu, 12 Dec 2024 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734007904;
	bh=oGXtoPx45D5829J+m52KpKDc1mjPcUrynCRTW7p6Glc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gKE5esdb+JZid2Zing04LqmZtMK4qXG6ucEdMtgrWLIFylmyLOdwvKyWvrd+pMU62
	 NNwzBzi2oD6X3zTbxqb72WqV3SXdjq5DDgl3YkVG5v6QyIpBXTQp3UcCnH9RxE5sT3
	 Rt691hmrFz3oKTXzexw21eN76rPy/qboMqzHOa8GyK5hImrOOA2pMFTyyD+lL4b1ya
	 L9wylYUB+rsepevcpuAHCEguRmlkRQ1kKq+wiWcSYR/8K5zcr1wM3tD/MuzhYnk6MY
	 K0hbAAQw3ukHfGij9cNUX4dZSfYxZzf7G7JcO9Y6cI9zr2mTmy6Zj3v1Cij8Fvy/f9
	 eTNMljcBbFt1w==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/8] arm64: dts: mediatek: Drop
 regulator-compatible property
Message-Id: <173400790262.46374.4565987048605318462.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 12:51:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_045145_947533_A5BE5457 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, 11 Dec 2024 13:24:18 +0800, Chen-Yu Tsai wrote:
> This series drops usage of the long deprecated "regulator-compatible"
> property from MediaTek device tree files. The property was introduced
> in 2012, and then subsequently deprecated after two months. It was
> never carried over during the binding YAML conversion.
> 
> Drop the property from the MT6315 regulator binding, and all MediaTek
> device tree files. IMO it should never have been used to begin with.
> This also gets rid of any validation errors [1] related to them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/8] regulator: dt-bindings: mt6315: Drop regulator-compatible property
      commit: 08242719a8af603db54a2a79234a8fe600680105

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


