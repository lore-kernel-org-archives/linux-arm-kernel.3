Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD30FD4F02
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAnyRGN8z6xKLGZlYFMgLp/A5pT+TAMariqUx9yE0P8=; b=GRR0NeBpdtV6c8IUAEIvw5BESt
	OkZS1GQrb7UpdP8dylDmYn/2Wbjq8CC3qJ72acoor/C02SAmgpqMFFy/HGQbboCc/1ZEP/0XYOygP
	ByNtmriXTZxKYHv90jWLdbFD6kR7o3ymbaXv6wqNJCKXenj/fNxF1h20QFCSfZRBJiW54XlB3YzXt
	pD0zB9PtK0CZ7cbHphMQbq15GXYAUpXVbllYe0UTP0ukLbY4uTXZSWPumFfArbG1Vp8djWMIkCpxL
	5ML+8pUEce7jMSK5YLw5gNyDUAOv6/AoWFlfz6VJBfo5bc+75BUhaHrRfz4N+W2I3zxuqLnrWsKxh
	5zZ3rTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzZ4-00000009sfg-28aR;
	Tue, 10 Mar 2026 16:04:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzZ3-00000009sfX-0rm4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6336160054;
	Tue, 10 Mar 2026 16:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE80C19423;
	Tue, 10 Mar 2026 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158648;
	bh=3vTsoiQM6i7kY7LrHCQyDmM3Co4y6Ipej73O1XI5CsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EGxdc25XWo0m5WaJOlbYKFD2CecpSF2u65CUxLs5LEg+VBgWNwY+oKu8IpH5Voncu
	 emt1beNypaOnGxnIlmF9AZz12RflrU1hUk7NidW9H6zQrPQXnvuyW5Q0Su5rbBOAtq
	 CxYiU52nMOyBLweyAfIyE42P2HrUXwDnDxVD9e58t/fm0EKeHqJHbTWc87NdOcSJ+n
	 578Lq8rhSGOHkTxIgqmqJe5OfwVaWUIgawi6s+Wa46ctUwthyo6qeRGsu69wC2F5qu
	 Sd0+a8Jt0763wt1YtC7ApZk2h7/LmGlOIZ+1M2fCDKoMaLpOPqWqtXdKuD6OYUPClD
	 HlGsndZNM77aA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/5] ARM: dts: exynos: Cleanup I2C
 address-cells and size-cells
Message-Id: <177315864595.219146.1067906832304585370.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 17:04:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 05 Mar 2026 10:09:23 +0100, Krzysztof Kozlowski wrote:
> No functional impact expected.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[3/5] ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      https://git.kernel.org/krzk/linux/c/cb243c21bbe14739406b5be680c850cdf20c9739
[4/5] ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-cells
      https://git.kernel.org/krzk/linux/c/7c40913bc532f3645c522a89886070a08b1ad23b
[5/5] ARM: dts: exyons4412: Drop duplicated I2C address/size-cells
      https://git.kernel.org/krzk/linux/c/44ee52a030a6dd2f6e0ecb3632ecf8b263114619

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


