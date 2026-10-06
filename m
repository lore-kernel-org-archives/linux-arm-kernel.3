Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B5CCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oup34LMQK44s5+r/PArwLKN+1YdH0CvlQSNY8m4+Yg=; b=UzOJucoTNdL03c6hcHiYwLUiZE
	yjD4FHZ1Hxo70uhZXBqIf8VNa57dEZ3DDGC0o+CtlsrQR4VEv33OHmsc13iFpdKkguYsJQT5VLo4U
	Ehcii01eVZT09tMyF5SmBw85rAxkb6H/YvUIVp0xN9WjrWd4Jd7zJaouSeeRvUKfakE4COJ/7qqcU
	hQGhH2eGMWbJVBzKtXN8d4Zm81J23espbMQUdK7eUgRErCxPy0QR4agIqka6x8R1ODsGvOe5piveQ
	Vv3MYd5NUuKbq7+QesNY3u4u59wB8k/odai5TmLAK7SLqbJJI/yj1IrxZDQNwc2sCaC3ljxanATy3
	U4IW2ANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOpn-000000029DS-1G3o;
	Wed, 07 Oct 2026 10:25:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOpd-000000029BQ-1sCp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:25:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD94C60218;
	Wed,  7 Oct 2026 10:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C8D1F0089D;
	Wed,  7 Oct 2026 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368704;
	bh=7oup34LMQK44s5+r/PArwLKN+1YdH0CvlQSNY8m4+Yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ddGUB+PvBp/6ASSKJJLfA1NyxKGXNPcgBSh5J2NtpCIZx7OFuMYpTRt2uZtl2Qjhr
	 jjx1vr14soDI9JoWs1yx+BCDjpw96/7qMwMhcb1bZSZX1Z+gPk7f4a7DnpzMsFgl3a
	 AUo/EUuVQcfttuH3vayzdQBmq7mQlY/4DOXZIVVwu1VhKA3u5D7nCIHX4Eq456+SI6
	 OT03AJbHh6UsUU5dvEYbQF9AVVoxLv1AVk4eBU6ypF/OEr90hE0TbnmwBKP2tq9lca
	 cEtbLP3EsQYvGd7UxQmkV6HiuaCIHIGhFHV/yS1y9607Z34FgA2h36YspFv/NdsVoo
	 iVR99KNebMstw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cwweng@nuvoton.com
In-Reply-To: <20261006063643.198830-1-cwweng.linux@gmail.com>
References: <20261006063643.198830-1-cwweng.linux@gmail.com>
Subject: Re: [PATCH] spi: dt-bindings: nuvoton,ma35d1-qspi: Drop redundant
 SPI example
Message-Id: <179129615225.150114.3085056544164822355.b4-ty@b4>
Date: Tue, 06 Oct 2026 16:15:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FEmwUBDcBGQL9iiPxzMr4lPkRI/RrXqtCEB1d2RtwqM=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqxjsj9bj4RvlmLNui4hb5Lnqmn2dnZKfvRG9mNdj28Lf
 3zMVlHTyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMpOkN+z/rGPf6XRuF3HPk
 8i6sDU8QsznKpmLTJH1iw5QzUyU4DzT2NTOvYvD+4mh7Wa8kZrrHCls5y8Ju6ZpZspmqFaUMH93
 2bPC8k9WZf43/8V+NsxELjDKOLJn7b+m9YhuL1rjC08EM6bnGPxVeNfR98jjAESU/g/vikyksTP
 9+tG+w4NyVIxhtsuGO9hXNvdFlU7NfaT1TUpSvFvaKvGbf25gkrvXorLY7q6Yw20/fqJj+HwdD2
 +qP14UyFhz2Eq5/e/xZ3aNrITEHG/P+/Mx6F7FxSfmqrd/Tll53Ox1gafLR7iBn+d/V2V7JzTsV
 HjGdTVjL/jPW/KSVi1+SWJSWyIKG91sYlSR1a8UVD1sAAA==
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

On Tue, 06 Oct 2026 14:36:43 +0800, Chi-Wen Weng wrote:
> spi: dt-bindings: nuvoton,ma35d1-qspi: Drop redundant SPI example

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: dt-bindings: nuvoton,ma35d1-qspi: Drop redundant SPI example
      https://git.kernel.org/broonie/spi/c/921ecc459d4f

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


