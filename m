Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214B2CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku00qaicxZefmnje9SkxWtMUgvb2Vl4elij8jTv31fI=; b=KQdwT3tFKAquKM1gOpAf0PeSL9
	fFHMmO5EkDSs4Zh0eE0CpEkaqUXp64ZCTXcFFO6kVmP7jbZciuh4fRdlg1YVXiEEKx6HillyT0DHC
	bcDl0nO9TJmsfATkSN2JJG3wCFC3OcoLdFRCIchmwWGGWnXSmvo1ds6JfGebQzPfIiFAjgypm0cYO
	m/uS9w8r1kiUV+kjvDZ5n01dZhTrfbbLxyYESgzdSOdP/DeL4lPuiFcT1cBJafId0LjcrMVSEDaO0
	hYWcJIoZHaxJucYM11ztBQ74RRatFQ+VwdO4jJwlq08jnROmYzN7LhhiU9h0Bx3Ll4RoKULjsBG6y
	BxMJdy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVUq-00000005Iy9-3eOS;
	Thu, 28 May 2026 07:49:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVUo-00000005Ixg-20D5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:49:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACFAB41A9E;
	Thu, 28 May 2026 07:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE6B1F000E9;
	Thu, 28 May 2026 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779954577;
	bh=ku00qaicxZefmnje9SkxWtMUgvb2Vl4elij8jTv31fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vn8fajq4rrGBfOzzXS5P/YIxcunbyso+GFTWEKmLWETN8PyBnTHwan0mddYSQ3vF1
	 AsV9kTuCnQy7WiEkNQ5saEonR1XA7o73d8l2fcu9o/g79jQTqWrtjGnqfe8a9IkmYu
	 MPIKJ18GoYi3Whdx0Uiy/aMseZREwOniS9L92lUjySUa079yDBArUB/ILacxT3yMzD
	 p4byqhqBh40HOci4WLzCFYIXw98geeizc7r2OyH3CxGyEV79/usXq7B4I2dG3e6/8b
	 Jmxq8Qckf3J39Pvtovam7jbd7YGhkGzSFsS2phg7x3wgS3eLhiGy1QlJ06kIdKRDhc
	 4Ay/Y8/EEGdZA==
Date: Thu, 28 May 2026 09:49:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, 
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: perf: marvell: Add CN20K DDR PMU
 binding
Message-ID: <20260528-unbiased-affable-bobcat-0adec6@quoll>
References: <20260527154118.12884-1-gakula@marvell.com>
 <20260527154118.12884-2-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527154118.12884-2-gakula@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_004938_536341_995CC316 
X-CRM114-Status: UNSURE (   7.65  )
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

On Wed, May 27, 2026 at 09:11:17PM +0530, Geetha sowjanya wrote:
> Marvell CN20K SoCs integrate a DDR Performance Monitoring Unit (PMU)
> associated with the DDR controller. The block provides hardware counters
> to monitor DDR traffic and performance events and is accessed via a
> dedicated MMIO region.
> 
> The CN20K DDR PMU is functionally equivalent to the CN10K DDR PMU, with
> minor register offset differences.
> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


