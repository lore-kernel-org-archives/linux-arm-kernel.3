Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A243E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWf2SRUAPONd3o9w+I3+IyLZ4zeCRxLwJC7WvowYdVs=; b=AlNaDbNqK9ztZnFaKfzxWnhdUT
	IVVLn9UnL97Nir/qKCCH8yPP7MkuZmCaZsWIsZt3PFlCKxHOXOoNVg+0066LM03zb7t4XR4vG16Ru
	AmGaCfBTep+GmdnJF1kr0phdLixC5dzrZvwAEJ10jwPybin1trtNlN6VQ/6/xqwhHo6VbYRdgDWh2
	N1QUf0Bi505Pic9Ts9a56wOAyn4dU4CbGZWFSy0iDhPsZ/nHX7rps6LyKEQ5EYgUa9Mn8SLWogegK
	vjZH2RTahbpt7PmnkU9gVWTy8PtGTaR/GFeZn2PaVq1ue2MRg4X5e/0TmGoJSh3/ZMtpHDmYu1zaF
	xpCb07AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrCK-0000000GF12-1LsM;
	Wed, 18 Dec 2024 10:22:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrAT-0000000GEcW-28cP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1318CA42569;
	Wed, 18 Dec 2024 10:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A913FC4CECE;
	Wed, 18 Dec 2024 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734517236;
	bh=EjDZEwFG6yQIGgrFN0Tp7rulbbAbKfkU4zQLwsdW+1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJJNifdG7kJbecF+2ew9FNhbNhYPLGftl7NhSeT9UUGOqglvZCA401rs7bfQsarDf
	 Cbg1OVYICs+NLR5KMpye2xvCe1VpOThVuoNORAz6/GfRuS9RsmelfrUIgAXpe/sTfx
	 z1eWoHeeFLXKSGC44T/NgE5W0ckyA73P8aJ8NsPdbBdGFQ0sRAqfnVEPXB+fdl5vWl
	 6i1XEeMx8uJq+6T6Pw+SSQa+U32ML/L9qtq6uGUjguf0gG1EmkBG8MIQkuB5bi8H/s
	 NyP0DJ//ZLgGp5T+DrGoElpdiHXH4EYAPQnuOEoCFgrJ9vkYKKC3kTSYXBcpzD4MSs
	 e9soO1mXHOjrw==
Date: Wed, 18 Dec 2024 11:20:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
Message-ID: <ld6s5c3b6vfvn7l3yjxst6cyrq5xb3r4fmkqcjxawopjzoijjp@gt2ld2bm5562>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_022037_610084_5C6D21B7 
X-CRM114-Status: GOOD (  13.70  )
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

On Tue, Dec 17, 2024 at 09:40:21AM +0000, Tudor Ambarus wrote:
> The Samsung Exynos mailbox controller has 16 flag bits for hardware
> interrupt generation and a shared register for passing mailbox messages.
> When the controller is used by the ACPM protocol the shared register is
> ignored and the mailbox controller acts as a doorbell. The controller
> just raises the interrupt to APM after the ACPM protocol has written
> the message to SRAM.
> 
> Add support for the Samsung Exynos mailbox controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/Kconfig          |  11 +++
>  drivers/mailbox/Makefile         |   2 +
>  drivers/mailbox/exynos-mailbox.c | 184 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 197 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


