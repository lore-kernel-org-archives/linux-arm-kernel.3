Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F9BCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAm9KYDGmoWGIoypJdL3/5p96DaHo0z/EOUgYKjNC0Y=; b=s3GYP0h/oCHPmLX1AYHsTiExB0
	1kpNlbrd0y91EUF0+vEgRyQLompLaXo4qRQNb2IS+d94Yg4d0RgN6Zmv8nlPWRUl3u6WNujfY3hNy
	eB/gF22Ao/LsvEpDdki2gd3X4gy3l9Gg/E0A4Dy8RE2F1lGnNRfzxyJo2KH7tjru57pu71PaeAhie
	FfbPxuDgam9S5zUpHZs8Cj13amqesIFB5JTLSBulj8TKWNe9+mKXTFhI2CLWunEtxefyalHZg1w/3
	RkeZ7SFHyALSgj6+CcSz2xhR3osr122inOYxnNYFZlN+TBKigGsiY63Sh3RkXsAxtLO6yjxUc3qvk
	IO3bt7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0t3-00000000Ju3-2z1x;
	Tue, 06 Oct 2026 08:51:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0t2-00000000Jtt-2D10
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:51:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CE8D403E5;
	Tue,  6 Oct 2026 08:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7421F00893;
	Tue,  6 Oct 2026 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791276660;
	bh=XAm9KYDGmoWGIoypJdL3/5p96DaHo0z/EOUgYKjNC0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E8LU7oYuUo4ErsWhLhHh0iFCumgQrpLE/7pAc/t2GknntDjMH5a8FgvB0uHfb22zk
	 HsH/Dd4FE3lnpNnKPSSrgSoLULyy3eM+2MwMLD5vS71cEFa64jmFQFtlAy5Usmh1aV
	 TBSWUdjzLVC0tTptszn2DYfpCLsUmA8EyRAzwjvjoHI7+5EuFsd5s420VMNvNUlBjV
	 jEMCJCX8rqaIB7N92oMi6cMbuUbtm/0u5SjZ8nP0v6Ex2R93nCUYgORCdoXymp2ME/
	 RuuYV4JWc0SYxt2Vk8BxWESnSpBSNnoYokarkGDMjVVjmQ9kJ+uCPuFHE1+Wk6MBdU
	 BR9DRdk37d1kQ==
Date: Tue, 6 Oct 2026 09:50:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: arm: corstone1000-a320: Fix GIC
 redistributor region size
Message-ID: <20261006-important-malkoha-of-faith-073aa8@sudeepholla>
References: <20261005210506.2118052-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005210506.2118052-2-robh@kernel.org>
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

On Mon, Oct 05, 2026 at 04:05:06PM -0500, Rob Herring (Arm) wrote:
> The Arm Corstone1000-A320 has a GICv4 which means the redistributor
> region should be 4x256KB rather than 512KB. This issue didn't become
> apparent as SMP was disabled as a work-around in early versions of the
> FVP.
> 
> Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Hi, this still hasn't been applied.
> 

Sorry for the delay, I missed v1 when I was away. I have sent PR for v7.4
already, will send this as fix at -rc1.

-- 
Regards,
Sudeep

