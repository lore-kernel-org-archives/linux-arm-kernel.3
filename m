Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00773C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9S0PRQYIzJ71HyYKuyuDHFoDnhVAjXRU7hWTT6uJjk=; b=r+pM1K27ejFLsUN79E1C/el4V2
	vcL9mhlRpiCgOLsYL63YZFp5UyXmaHmbzBLTyS/7HCm5+YQPMpMaiM1XlVhZHMD2HKDSKRUjd/gnI
	2aRQCKcupjTmnUrR4AT6UlglOSof8XSQSJcPNh0djJ6mofaH8cXmgTCM464z4HOvFYxQEF9paAizd
	XMrw4/K2bfD1X2L/pRXz5Vq8/Ph+NoRiHVEefRRVYDRF0WSaRHOLAuYYUnmXr0Bu7g3aWghDx+mov
	m6bSGT/42c0mlWK2MIMZqHvpK2KTdH07kUPwAzoc94LKxDtllUDJh671bJibGM8Ihp3qD9Bwv13E3
	cEa6nl6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6TB-0000000GtuM-19i5;
	Fri, 13 Jun 2025 15:37:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Xx-0000000GiYB-14Cq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F09EF5C6B45;
	Fri, 13 Jun 2025 14:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6CEC4CEE3;
	Fri, 13 Jun 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825500;
	bh=72UKJbZgygU3I/7FaNc+D1AwlBQQCsQR3FH9DEz2Bjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0NS+mN8VCm4FKZwvLmvdn8xaDq9PJGtAn4HpElss4XdTXDrBW6bMr4C+yYQO0Lm0
	 tBZrgumJJHZi/a0DYkLgTvGcBx/+B9FkVxNs6KKsQ7Z48YXuHQ1ELCrxDGT0n+ZfHZ
	 f7q2ucRnB0fpTwiOnAn78gmPhc1zLH3kpUX7ghVhqmNm8AqW5D/wtxJV00AlNrMWCm
	 DUMOm4eP7buiAYzEnoVLSUGMyi8cR1svDggvdzhmJiX2fGlLbFzhG2ztbd6lj/9QWC
	 kbDCwB8Og/kulnim7UGJERtyTCmO7tVwGWSxLtDTZvwrz+70ZTX5SD8k7bXP9gpDMD
	 JA0HaiKUfIALQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
Date: Fri, 13 Jun 2025 16:38:11 +0200
Message-Id: <174982533895.547352.10071865015714260186.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
References: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_073821_336420_1D14FCEE 
X-CRM114-Status: UNSURE (   7.70  )
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


On Tue, 10 Jun 2025 19:19:24 +0000, Sven Peter wrote:
> Fix the following warning by dropping #{address,size}-cells from the SPI
> NOR node which only has a single child node without reg property:
> 
> spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> 

Applied, thanks!

[1/1] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
      commit: 811a909978bf59caa25359e0aca4e30500dcff26

Best regards,
-- 
Sven Peter <sven@kernel.org>

