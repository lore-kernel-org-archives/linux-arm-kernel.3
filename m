Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6128EF532C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6ftqYor6p18ZAb9C9ze1lNOzcp2Q04OwgAOC/07P2M=; b=jAHr6/ypm1IQ/fWGQ9gps5mFcu
	vMq1qaGRZjw86o0tMn/BTFzZMr5MST3BN7m4IP2h9QP+TKWdp/5Db8OkajGYZ9tP7WAnwYtp3YHmC
	KNMp5NTMYMPf/EYuDqzY8J2TuNOwDeI32U4L7cBSCwHzLNK/AUBI+m/4K1kVEO9jCbb3OWymavMGW
	OeO0upJDvSUbJrFZmgxfp5qWF2AtqyAil/hh7C6eupfCZof3vdA+k/qo5jOAgPXpxrtolJebi/DWh
	A5+wV5cI9DLhSW95TxRveLkc4hMImAYuCrSWwGHmssdCvXNC9LcDsvSYanWbDylxI7u2nVOWlKY22
	cCUGaMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pNW-00000000DIQ-12GE;
	Tue, 24 Mar 2026 00:12:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pNT-00000000DHE-3tdE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 00:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2F21437F4;
	Tue, 24 Mar 2026 00:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1A1C2BCB4;
	Tue, 24 Mar 2026 00:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311131;
	bh=fzzp9pPjHZ01Zmq5YuvtiG1A0Qb9NxE45c4ILsVDQ30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E65CzNXV/qMDhWcN4jqRbdigwxjL3g2fhBelx1hWWeKMZF91i+rEfT2eNpqul7NR9
	 CObyfBE+A6jOV9GXHYNULjN0CBaKE5858/14r2Ptxv6q9YK1EdLE66yLXiR9Tj3wYL
	 BNJyvCADfWbEaKguQ9XOB7UMmyb1zIvWusOpFDgNk5G40G5gAp+3iewMAvrX0c0SWe
	 59/1Rg9OGcZODZWewYByBINONqbr76z2zULlrJs1baVUCfp/cKB0+zpOx3fuNXE1v+
	 s2VLYS/x1Z7QRi9Rdh0IRgl/HTWaV9VaRRhKiegoXrvnKJrN9kTODq3eP2bJkjLDUZ
	 yQE1u6I1aJkYw==
From: Mark Brown <broonie@kernel.org>
To: linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg, 
 ratnadiraw@smu.edu.sg
In-Reply-To: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
References: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
Subject: Re: [PATCH] spi: pl022: update outdated references to
 pump_transfers()
Message-Id: <177428946630.537498.3740041984153015633.b4-ty@b4>
Date: Mon, 23 Mar 2026 18:11:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fzzp9pPjHZ01Zmq5YuvtiG1A0Qb9NxE45c4ILsVDQ30=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbYCrc+VxhI9fTAMG6rQaPJnTW2PjYTaKFN+
 iVWAHoyU86JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHW2AAKCRAk1otyXVSH
 0NSGB/9iw+bXso2wFRLcYwKkibQxiDoN5VD0moMK+Dr7D7txhXuCU+OsabTPdjgixBub/v/VaoF
 B1HZtl61Hbu+J7m85FUezDRTKKewmn6JYRX90UYNo/M9ehe8lPMOyVXaA7mnT2TKyI1nSh+Z+Wu
 XF820kSdziXGgAvfOjo7LPuMSBPTHTXyzO5fL96lCUUP1NHBTVa9sFSBO9nbPq+5O0pKRIIm0rf
 YFC8Tu0qL5LVAO+/D4sXuZCqEsG7qmEyVn7WJW1V7SfJNvSAZUs3/54QSTZ4YM5h1lKmgt6KBpn
 xwswgWlQnj0ZjkjbPQ2s78ZwhJGE5qNMREAllgYzqCDUqPzL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_171212_000900_4730834F 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On Sat, 21 Mar 2026 18:59:40 +0800, Kexin Sun wrote:
> spi: pl022: update outdated references to pump_transfers()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: pl022: update outdated references to pump_transfers()
      https://git.kernel.org/broonie/spi/c/a37fb5166be9

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


