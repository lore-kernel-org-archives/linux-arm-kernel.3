Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BC8EFCE37
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEcBvlgDOlU2Rd3oSxTJUWRcDX4QT3/cp5xKxOwch4Y=; b=kO6DRW5a1ISNUsw/eYKyVVAtH2
	ZlnibBqlaV77vlpRNRNeE85z4xAe0WC33BFWz0qKIjlVjbX3IZnQVtUuHVWfuCIeOOvQ1aL2+He3D
	AiXYEHd2VrBLGybr31b+woHHfjRhAz2vGBJlJrqYXaL1kFBvaJ+nZv65IALD5y+MO2fcd1bUzeYO1
	4rT7ADgNecSwPftMF5RfcbPoZ9KXyccnqnlryhpHkP2DVCWQ/M+BwaMd/rIyH5MA0P6tUqTz3rfU6
	EkGfGLYh/ygTtw/9Qr7u37dKh1L2nN4hDaqBk2eAUEs8BZ7WC2zT8OLUsA7ysRzBKQVQV0BRi98LM
	hu8ThLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrM3-00000000McT-2jzo;
	Wed, 04 Mar 2026 18:53:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrM2-00000000McD-1VSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BD8460018;
	Wed,  4 Mar 2026 18:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E466C4CEF7;
	Wed,  4 Mar 2026 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772650433;
	bh=CliOUV72ekHmLpkXXmGJGc79ExY9Wz0CZYLwd8GDc68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvidYYT8yL6CWT3lD+7DPetAqKrnfZPzjX2EQv7G2N2aEUJS8MS5Z7CyUfGoBBHcB
	 ybV/cQ0tnoMnatekcKq9YLMmAoGv/DiQeC0QIWHiFI9waDIhcNdDj9CUF7mTcAoGdN
	 ZWm+tGy5cnDVqpj05GZGXCIciDHV3Zn9fYym7X7X9FdPZ2ByfYv6m4h/6G0IMfnlZy
	 A/tSx8U2xUlfqpGiWzYFHFJCrFdGKQGhLnpifMXoplKyFrKPkn5+cnHTJmLJJTuUEz
	 iNvlUyq8YcE+xVw1yIC8elPnvDyIuLpaO3BCNSkdVifPrdOg3gJeJ6rYg34gqZG50R
	 ok73WZyJiqTyQ==
Date: Wed, 4 Mar 2026 18:53:48 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: arm: Add print after a successful probe for
 SCMI power domains
Message-ID: <20260304-arrogant-primitive-mustang-990de4@sudeepholla>
References: <20260304101457.7470-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304101457.7470-1-ulf.hansson@linaro.org>
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

On Wed, Mar 04, 2026 at 11:14:57AM +0100, Ulf Hansson wrote:
> It can be discussed how useful a print is after a successful probe. In the
> SCMI power domain case it's seems valuable, as it let us inform about the
> number of initialized power domains too, which is fetched from firmware.
> 
> Therefore, let's add a print about this, which also aligns with the
> behaviour of the SCMI perf domain driver.
> 

I always assumed it was already there as dev_debug() but I am wrong.

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

