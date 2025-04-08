Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22525C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQetPFscRm+tw89JrmZexTgz87W5g+njCQ4YRLk6zic=; b=wmkydLt8bUM2EVpdIWvITKx6bj
	2toNA+WH3mQmFjFjjfLTPU8qheqBCwkZ2EYEWMifrz7vHR6Y1DH1V/qGOZ8+ceWjY5uV5DkIO8p8/
	oaY3bk9vJaXGrgzceYnF9Eyw5rWlM1w3smMGwzWitxghVQWru4IJ3U0mgQrQEfdRY4MPYqbZNZ4OB
	yuIhByh1rTgpu8UDBM3kbTjtFTgvDTTnrNBxJT12iAPCdQQB0tw12Ieqzs1PBS0oLwDBufEad9RD/
	lk9oZlCwPqNA15Tam0hrErQHJsUcl3ktBas/uBJYk5hQ2QPyC8BVztuzDPMQbGi69cvPCIRzwmrW2
	Zmdtk1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F00-00000005HAF-10YO;
	Tue, 08 Apr 2025 19:52:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EyF-00000005Gzw-0wCC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AD2F68442;
	Tue,  8 Apr 2025 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B76C4CEE5;
	Tue,  8 Apr 2025 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744141853;
	bh=Cl6FMiR8V/WqCdufAIYky9qQP+eWaJzEf8Abe6gD4do=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oAXWz1SxIH94bJE5hQcX3QcDb7RE41fDs5qfkhPHCjriewW32cSx64hKSoTVD8C4T
	 PdmYuHtgTBh+pkh4EVaKfcTEWqUjo5R+obn7NdcvUb/In/eDBrpoABs74s+PAye+U/
	 5Bl4BbX+sOsbhrWiNYcLFrJn/PZtfWQTdbRTLmmiqUxP1VPgIODC5VzzYXJ1hpmQPD
	 zZhlMmyrksSzjYFLRsqxrrLp18hbU4NCxk4tfLM9FfhNvrjFBABL7mqZDyHgTHgtLa
	 cUGwwHjEcHpOnYA07e7fvmTW1YuHJnxFuv9OVG6QbwVUcTwbJbeYuWqJp91+UD/2JY
	 2Tbt2M9uNgP7w==
Date: Tue, 8 Apr 2025 12:50:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Richard
 Cochran <richardcochran@gmail.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 0/5] net: stmmac: remove unnecessary
 initialisation of =?UTF-8?B?McK1cw==?= TIC counter
Message-ID: <20250408125052.50615419@kernel.org>
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 7 Apr 2025 19:58:01 +0100 Russell King (Oracle) wrote:
> In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
> register"), code to initialise the LPI 1us counter in dwmac4's
> initialisation was added, making the initialisation in glue drivers
> unnecessary. This series cleans up the now redundant initialisation.

Failed to apply patch:
Applying: net: stmmac: dwc-qos: remove tegra_eqos_init()
error: sha1 information is lacking or useless (drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0001 net: stmmac: dwc-qos: remove tegra_eqos_init()
-- 
pw-bot: cr

