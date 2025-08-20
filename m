Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4BDCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ri17rr3sX6W5fPohDcqjw1paKXAg1PRfI2IyaWkhOQ=; b=xnLVLf69YT7U2o4BDvvEnEbCM/
	hoG3UvggnEsudM2jzZVNiR+q8NnBef6PwCv7B13rl23TgZp1WaQ2SzI08SspWmcw0dowkGgX4+rgZ
	n+OKWsO4Q2ctiwsHBuE2oe2p4hOwdUUl1IAeUGoDCXaQ4puopjBIzJU52ZvJgw34M6fvLTYAM2sEf
	Q6kviCN8fTGd2lz8nTUb/f4Flv2BaKwmlOI7OWp6V0XgqqGYBAzq33lVLNgJ5RbtzaHWb+9eMDME0
	FUOw8loF6EouuiOHvCt4Y5pxNRJFoSmcvOmXHGXD+lB1Lb+Xf3pP2bhcaVTg+P/Z5mCk5VH58fY9Z
	JlwZTohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosgo-0000000FFiE-0A75;
	Wed, 20 Aug 2025 23:57:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomDH-0000000ETKP-2Qu1;
	Wed, 20 Aug 2025 17:03:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 187205C67E2;
	Wed, 20 Aug 2025 17:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404CBC113CF;
	Wed, 20 Aug 2025 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709382;
	bh=SdAZlbYllqKMy/tSyr57ludQpWHmOjbfIk0uPZ7oZ1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YGR4Kexb2xFARGCmFQe3PJsORfVP72Cp0pmXbqH7lj7YL0H7uHY2uIUOe6LPehI0K
	 4NMDEBpG9LWwrQ7Amm89wPXBYyrWX6T3y7oak5MxavCws0azcd43kv6ZA+GZyzPURG
	 XSvP1X/yaZwkq50nc7x9kTOPqgkFh30bfUykLKQ0/wEwisRy/Jha98n4AS54MieU+O
	 IJVb4JNo056cE6zG+UQdTQrIuqQuqljl0yoCxOrnHKyf6879aG9821uO2/OvVheAQg
	 FwHni0aMIzRWucS1dTvgRRXcb+g6u95JW5U0MdlI4dBm0LwhmnlXYBJaGVgyVmtXTd
	 A1LY6+ydE5BWg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, heiko@sntech.de, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250814013943.2905307-1-nichen@iscas.ac.cn>
References: <20250814013943.2905307-1-nichen@iscas.ac.cn>
Subject: Re: (subset) [PATCH] phy: rockchip: naneng-combphy: Convert comma
 to semicolon
Message-Id: <175570937971.66459.9785527061700801116.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:32:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_100303_661426_4024E355 
X-CRM114-Status: UNSURE (   6.28  )
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


On Thu, 14 Aug 2025 09:39:43 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: Convert comma to semicolon
      commit: a8f9de937dbf7bdabda72bd0c51e201e550129c2

Best regards,
-- 
~Vinod



