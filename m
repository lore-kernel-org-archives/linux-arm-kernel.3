Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCFFD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc8x99YdVmUKFwconVmRLhif/4NQtt7lsOn5AiqwVeI=; b=KJfv/C889g+MLI6s7Py0Bs+nui
	CeQVourEuFU3Iz7RaeYFa8lHqUCYSRlorwQRb3eQq0Gd4gp82JVOspQ5CS9AP7sABPFodrggAD49R
	MoJkz8s8qHQD3F2vI0SwvWSFWLMxaSGgNihKN1fyigeBWgjXo2JbMKvzhNcQzxtH8PVLe5rdJpVmB
	qZ82MQyWCs9Ew61KJNMtOWINggsiIkNHVk3prCk1NIcx0uKP/8Nh8Da6OmZRDvBWGHpHulfvvk92d
	ik0A6aIelRqQY0FURf9lkCwnG8vMcT0iA5AB9DDH2frwil170CUkY9H4d0fVfcnSK//yqvcxWOmVe
	kmQRd7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9fc-00000006vn5-2tRC;
	Mon, 02 Dec 2024 16:53:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9dh-00000006vOa-3V31
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:51:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99A9BA40FAB;
	Mon,  2 Dec 2024 16:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CCDC4CED6;
	Mon,  2 Dec 2024 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733158272;
	bh=ZdAQdXXjCYljteTFBRHsVw/rpxpZmdzMc5aDBqCIVy4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iSPWq743CIYZAfEvP/0i+dSExVhNx/pKe3BLTKkZnq3y/0UZ77r7x0LTj+kgtS7AR
	 A1TjutON18aDwgk8Bt3aBPP13pwhirJDhK2wXkAWoyfkA8nBqev6K824bYl6YSm0wD
	 KYe+90UjI6hP4o7JrCVXKE0ciu0xWPLIEl1+rvz2Bs3T0rYacZrvYHsxcEvOEDIPqS
	 KP1GOM2kzMsD/oZacBAaaiikbsaPezHv2LkjfnenxqyQczcoUfMhezH8hcqzvK/ieK
	 /afc03wEG5xP+oJNb8TU3bhqI2GkTTLV0FgF1fhgzZSMkklV5R+Hj4k8iLSbrb1YtG
	 AFGisWHbX9mWA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-spi@vger.kernel.org, shawnguo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, lukma@denx.de, 
 Fabio Estevam <festevam@denx.de>
In-Reply-To: <20241023120015.1049008-1-festevam@gmail.com>
References: <20241023120015.1049008-1-festevam@gmail.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: misc: lwn,bk4-spi: Add
 binding
Message-Id: <173315826769.126887.7195905602758530196.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 16:51:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085113_937164_F4079645 
X-CRM114-Status: GOOD (  11.33  )
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

On Wed, 23 Oct 2024 09:00:13 -0300, Fabio Estevam wrote:
> Add a lwn,bk4-spi.yaml binding for Liebherr's BK4 external SPI controller.
> 
> Currently, the compatible string used for this device is "lwn,bk4",
> which is the same as the board compatible string documented at fsl.yaml.
> 
> This causes several dt-schema warnings:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: misc: lwn,bk4-spi: Add binding
      commit: 36e7886075262429158aec6f258e6a5a92f025b1
[2/3] spi: spidev: Add an entry for lwn,bk4-spi
      commit: 096c34ddf5835f02f5260719cd8a16fcf5e5e56f

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


