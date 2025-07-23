Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A7DC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 03:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IHy8ivxs39eTBU/SWAdJtHvh2xPSXz6vyUHZ6JxPlU=; b=xpDwCZ5I7tWyzhrZKysbVvv5j4
	5/v9MP22ZfsfLBkzss5vTPPoG69bVr69qr/vWm9xK81Jw50FI9XcPsl29VpZys/oimxRTy/xSDBDh
	QlpUL03L3efq8eD62vXt2EgY2SeXobEb7IaMP7tMP23Y4jdIH27CB5yMUZi15solAMZFvmk/ognAh
	9o1rBxIZBruJxmjr/iKbTYT04b3li3DXuBu6Egai5/8dKKtjqP88JRHYy8TKhzXf8OZyWZwrlLzow
	doOkWMqlArF+HVDhHg3xx0ae/wQpJVbObjfFaRkS/elBJhGzhBx4rQKQM/+a3iiJDf+eMM3Dbd5Yt
	k77KljAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQa0-00000003ws5-0WdC;
	Wed, 23 Jul 2025 03:55:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQOT-00000003vZ1-1rvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 958A1668E2;
	Wed, 23 Jul 2025 03:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26966C4CEE7;
	Wed, 23 Jul 2025 03:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753242228;
	bh=c0ej2Kns9rl083bMiPIHU275OymET5kYSruEwdejPpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmrJOsnvor7OfN90OWaFh5OF/kmeJyVH6vNafHsAc7HENXRCNIMmwiAvGWyk2UaGT
	 Qu5OLnZaYrRTSwslDmaAf4F6UMhw2JHg4drmwiLLpQWNC1C22QcvWgKV5fB6VfhPVi
	 dFjN9u8qO3Cx40lBl6A9cCH12+Eh8rShmEbOE4eYEFUfHnqHVJwC1AYlzM6kqH9rYx
	 /XsouUAvOm5WQHgA0sFp1kQmGi0dRcnh/J/DTkhnQyygGKwO4Jbw9G+ngLNapiXb2S
	 pEemqPaplwcu+MCzOggL1pq7TS6m07b+uxUMg+QwfDYBenPxKkNmQtsO8vRF4z05/r
	 SExWMGZRiZwHA==
Date: Tue, 22 Jul 2025 22:43:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Message-ID: <20250723034347.GA1025052-robh@kernel.org>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-1-7e4bd11df72e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-vt8500-timer-updates-v5-1-7e4bd11df72e@gmail.com>
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

On Wed, May 21, 2025 at 05:00:09PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
>  .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 52 insertions(+), 15 deletions(-)

There's no reason for this to wait on discussions on the driver, so I 
applied it.

Rob

