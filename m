Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70887E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bup59zZG3t3lFq+r/T546DvznfRVEz2t58XKqqbKlU8=; b=QW/k1SusSUEyWxYwxzFjJ5nNPS
	hvDplpw4mxxXpvysI9wqNHNlPH6TXfW+PKTPVlXalzcZW7JJc2Is0oQIV4vyjh7gyRd+k04qCuogI
	dNDogn82WCBBNq14XArRoJJyM9NDEl7Lw1NCv3ZKWHiaYM8geYSmcwQu8WU/sz/3Wi2LbHuUjecg0
	YLajyjshjx6eFl/5Ii6Er4sv+NMyEo0e9slQ8mLh1FugSUhN3VPg5ZusSR/bJ8t4OJC1c8uwSTtu8
	bgY1kTCIfx0EWbDchRF+2mLOxj6VmMJTMfmyyOtexLO4aIWBHCm+4mBUaIV2S/fuU8GBDU0tk/Boi
	k4I4fR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHe9-000000082ji-2Cj4;
	Sun, 22 Dec 2024 08:49:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHcy-000000082c7-0KlT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 08:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7429F5C45F9;
	Sun, 22 Dec 2024 08:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066E6C4CECD;
	Sun, 22 Dec 2024 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857274;
	bh=aDmq08s7jSeCXUxMai9L6T3fSO6byx61vPUZaxu9+eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNKoXw1IpeNzqiZKqXv0VqGTbwCxaMoorfu7RigTW7FfMbAZa3vnPPJ92FwoA1p3e
	 MY1iYjfW4yHApPnfOroShL5KWgsfG3hRW0LLlBSi8bDtCXO6Kq4itkdtpaXWPussRg
	 m7s1Ruj+46Xc7UrYEnRcDMR1h3gvfQ5n9LjKgUx1LUY7gWpzOlB6Ts23veXSnSnToe
	 Ve30bf0jc4RVb2VYExERRK/yDs2ZYF78X3UmZ7LTDX445Pd5gSg0apbobvD4l/WS4Z
	 9xl9Y7KzAPpiN6ovFc6YKMDXe/ZsX9zz/lgIMqanvvLreU4xgBm3fhWqHgPZ3bbDXb
	 fRgXMxxTUdpNw==
Date: Sun, 22 Dec 2024 09:47:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v5 0/3] firmware: add Exynos ACPM protocol driver
Message-ID: <24gb4sffg7qgigtei7ons6hrmdkd7jiby672k6xvwv4y6jmfoo@x52v6iigm6rd>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_004756_181934_56394A50 
X-CRM114-Status: GOOD (  12.88  )
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

On Fri, Dec 20, 2024 at 02:32:50PM +0000, Tudor Ambarus wrote:
> Alive Clock and Power Manager (ACPM) Message Protocol is defined for
> the purpose of communication between the ACPM firmware and masters
> (AP, AOC, ...). ACPM firmware operates on the Active Power Management
> (APM) module that handles overall power activities.
> 
> This protocol driver provides the interface for all the client drivers
> making use of the features offered by the APM. Add ACPM protocol support.
> 
> Changes in v5:
> - depends on:
>   - Link: https://lore.kernel.org/all/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org/
>   - it uses the newly introduced mbox_request_channel_by_args() API
> - dt-bindings:
>   - drop redundant binding word from the commit subject
>   - remove extra blank line and update example with by complying to
>     #mbox-cells = <0>;
>   - drop Krzysztof's R-b tag as the example was updated.

This does not invalidate review. You just dropped argument from a
phandle, it's not even related to this binding. The format of phandle
depends on provider, not consumer binding.

Best regards,
Krzysztof


