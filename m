Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7F210A88E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIya/yXWUYb7Hn12dPmSA3BcAhJu2LrfmXZjKpsWrSg=; b=1q33QRoQKwxbp/qgDvkQ/GRZ9c
	57IB9QiawyKWS9B9vt7KzeqRozw7z5+UINHLtKA+7KC5jnnbXa082NRuwcMvm4Bm+HUByV7FVW3+s
	wAlv3/wE9Z2uOuLIwKhUyxxjvzvcLCGR+9+BIqqULOKcMZskJb0miThBG8HT2IY4IJWWPIl9hIvan
	RRyOLe5XyxTzt5FMjxcID28U8sH6tzDvKCiSK4CYoT1btcx9/5rcfgpWRzeTszZH5touFpqlAzACw
	CHs9xwUW6IQcGz+xPxNRZzCVedxSNTFf9DaaiLPb3Z7NQO1iXyHArGS9imXrl9uvyeNAyZL8LPaZi
	SqyyWfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oWm-00000005wqb-05F9;
	Thu, 26 Mar 2026 17:29:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oWk-00000005wqU-395g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7DA1600C4;
	Thu, 26 Mar 2026 17:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF9BC116C6;
	Thu, 26 Mar 2026 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546189;
	bh=+1oNWwkOQNqPFvhgNYp/LhaQS4lNd0Ijc16A6Wr40VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIE9gC6CRKFa3gJhsAbOAdhI5cxa7+OV5UzYRCYu4G/pOrB0cGkzcmTvUrL+/FBbN
	 1tOCKs/tIjNA1xaBTUww4zks7IdYSdQ4uOUwhK9wIbYHvyZKQuCBcwBc545xDP/NR8
	 PddxWnO21H75JtgNkorAIMByVCU/jRXG2ac5HzJdT0/WkLA6p8WRTV0RXRfHySkH/v
	 dFFIZMaNXoP4ObiZTCNyf7l3j3mhAwmJ80q3e/Xq0FLY3CPhQIk42fYPdroFGtp3Yu
	 vH8Ly8nnwDTm0BL4Al8TE8b9x+/wNffcoqEcWwZS4Qf/JUfRSArQcs5ShoLS243RWK
	 rfPH+4IP8zh5Q==
Date: Thu, 26 Mar 2026 17:29:43 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next 1/2] net: stmmac: remove axi_kbbe, axi_mb and
 axi_rb members
Message-ID: <20260326172943.GR111839@horms.kernel.org>
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
 <E1w4ydo-0000000Dlpb-34jd@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w4ydo-0000000Dlpb-34jd@rmk-PC.armlinux.org.uk>
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

On Tue, Mar 24, 2026 at 10:05:40AM +0000, Russell King (Oracle) wrote:
> axi_kbbe, axi_mb and axi_rb are all written, but nothing ever reads
> their values. Remove the code that sets these and the struct members.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Hi Russell,

FYI, AI review suggests that these fields should also be removed from
Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst

