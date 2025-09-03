Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1B9CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtrd6xpWnMtyDYZbGX7GH294jW546d8V9NnUoyiNCbc=; b=zq/n0as4Le+kenuDqApOdOaYM6
	9ycADsD71gldH9ovRmcoFDvpwOFdYuGDZKuJfarxe7ZkdJoyoGpAq8dIi9PRRH9UfuQZTKZU8oyEI
	y15PIp8QDYwVTvZhelmMhMNM1MaxIuNjhxm3FoxejwghN/rtA2qz84UuXAVsNo0VFN1Xkxwa3RxOY
	r1R4KLFzoVJxXwyKTBS/0YW3JhrYT8eJVYxgR5nn9ucB1HBImFJHQMousMm8wd95/76ULsWyfZ/11
	37iNPTPvM9e3o3ry9OzFXuDy72mOIV6VlTF93hapjh1pu1XzemWk+ZZKRZmsSX6HvC1U9UHulCvO2
	7HYmtOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlyP-00000006Ge1-1Ipu;
	Wed, 03 Sep 2025 11:48:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkrb-000000067Du-10f0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A353C6013B;
	Wed,  3 Sep 2025 10:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3DBC4CEF0;
	Wed,  3 Sep 2025 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756895834;
	bh=d84xsn1/XRPPl7BGLeHHOGgmU77ohZxDzmlv/AfyDw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JagdKvI8miQa5QU7EjHTmmx38UccgHBf+y4JG2z00Rs4G9HpUWFt2V2O98t6rwop+
	 KfdV8PWQvBmLTOzCUO+fc2xYR1nOif+qzvXXvuyf2UvCJtdLLAUA5EjPouLyjiDdCs
	 9t8gdC8k7wO0kWhiRJi7QGpL7MzsXVkyhkCnvpknNxkf1+I5ktiDvq50RoLlGXG+0J
	 /AffNlIajhVrersLo/ImtmYqD+Z2Z8qRTCYPIPOW8KxzjycNgj8qshE3/ZgdohF+LQ
	 9NZwPbFa1xCn5g6EePXMkk2N4yi18Dk5npv0aKktqPdNKdbHDJg1D/AZXn+/M7M9yZ
	 HTu8OS/OR3Kdg==
Date: Wed, 3 Sep 2025 12:37:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: s3c2410: Drop S3C2410 OF support
Message-ID: <jllb7g27r72hvfusjzetcj2tyio3w73hz7jey4hnwq2iohxqtz@wbshht7hqp2s>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof,

On Sat, Aug 30, 2025 at 12:36:02PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.
> 
> However, there is still a user of "s3c2410-i2c" platform device ID,
> S3C64xx platform, so that part needs to stay.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

both patches reviewed and merged to i2c/i2c-host.

Thanks,
Andi

