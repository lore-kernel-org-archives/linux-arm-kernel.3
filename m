Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86133C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mUtAqBNAG2Y3wKsn9Ml8fQdmF2okXPnjTRPvoLO9ds=; b=fPkiGQY0slUq3HDG7zBF5poADK
	DLGFnfa0kPtAUsLUGDsJJDzDO6RNPOCJOrGcnYdyee3FNihXgUUzIMK3NTTZIPvdOcoy05B/MRBh2
	g37/9J0mWs8FHTihyRnytHVZQLtqgtpN5Gyn7Ke9zhiwOWHqchRg+hIFsX/+4dYL3OFs6ugTmZjGu
	XbNK76Qwt2Tw0FO50kfApKhDakaTvnAHLGddN9ftQa4utIcWF8wrE//V4uliUM8DdcbdgJb2KIZTI
	V1vekyfN82531i/p3rK7VUmksKRFZAfw690lH7qrZnm1sZoriFEfMnCGM6sNRGOLcuuZnjqVb2CKQ
	5Eu4cs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY8P-00000006DJ3-18Q7;
	Tue, 18 Mar 2025 14:41:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY4X-00000006Cc5-1L83
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B54B85C577E;
	Tue, 18 Mar 2025 14:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D910CC4CEEE;
	Tue, 18 Mar 2025 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742308656;
	bh=NX4c/xiPn8V+9BjqrR5JwjDS1CkFsXXkJIJk9bxYP4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sevystGn180FbiON8S/zJKGGF3BOsRnLdgGsUvnNWU8O3duETbTUCDSDd9Pmk9Drf
	 wr27QJbX/SilnlDN6FyFay7AmoJATbfM3Tt6bauURmkos++yd/++F4mejG9zY9jnH2
	 UIdFAZ7WN8cG/zXcs67XhDeUMgCPg0rIF5VpOIl00HEUVjyGGOjdkEV+MSpBD3tdOb
	 +95FzuLkYxB7LsKvEWIgV1DFZnh1Rd/rhXkiTuGR3mVCDnwgMGr5/bDR4alrwGffgX
	 3m7Mnnhadkp512WY+AAS5PKqGn/fG/JjEpmLJoY8042ibRznJKcqDC0FYWrXcz4cCm
	 g6PTnACR8ZfRg==
From: Mark Brown <broonie@kernel.org>
To: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250318045549.1711502-1-peng.fan@oss.nxp.com>
References: <20250318045549.1711502-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] spi: stm32-ospi: Include "gpio/consumer.h"
Message-Id: <174230865462.108912.8267700120820923591.b4-ty@kernel.org>
Date: Tue, 18 Mar 2025 14:37:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073737_418518_F231DA76 
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

On Tue, 18 Mar 2025 12:55:49 +0800, Peng Fan (OSS) wrote:
> of_gpio.h should be deprecated, use "gpio/consumer.h".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Include "gpio/consumer.h"
      commit: cc1273dfac2697545adc9418c890ac194f18f523

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


