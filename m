Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FF8CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33Syhvsm5sZiiNLVJUS2RBNw63oGJetk1j5qZL/2MiA=; b=dcioW17WGjnSml8u68dEeFLjRd
	ZfjI3mSbm3Igdo4p9Ey3eeAY9MhSp3Qi3QrTg+3YLa61j4q/xpgtHlVakVUgEHL4/03pevSnBgAZp
	S4dfhx9mEc1N+nFXc0o5Y0xct6DMbstGaJhUgotPkOpdwhqHNI1vljzSs+w4LUJ7J6tsKbeMSko2Q
	wdpo3c7XeITP5gBJZMWiOu0owPrKsnPjhoNHgbKA6WGFI6KOTucFk11TQdC5TBZgbk8SSLumVOW33
	ZpoQBxk6qp4KSfPeI+atMRUyH+dbFY06gUnG2H+nms5oHe/GUDQpfR4IL1HbYZTjoVGOGZcogaQA0
	h9ai4jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYT7J-0000000CTu6-1Cmb;
	Sat, 13 Jun 2026 18:30:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYT7H-0000000CTtZ-4A8M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 18:30:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 418A26008A;
	Sat, 13 Jun 2026 18:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD001F000E9;
	Sat, 13 Jun 2026 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781375399;
	bh=33Syhvsm5sZiiNLVJUS2RBNw63oGJetk1j5qZL/2MiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxYmAgzIh9DscHcdrhGxGBo/5V60YWApEi+m/R6/XKqhQpada+bVWx36Cwy/hJ8zT
	 /t/sQdvOfQgAimhpLXCT+QrCsS+eieMQFvUXLEb/FqV8NpomYYexoW3aY0dwFRu87N
	 +LvVH1DXQB1WndVI5u9koNvgX/rYNNf8BiAQ3gTTEhpW1MEYktH1hiXyjBkLhhW8bT
	 kOk1G4c2yLfO7kftEP+lZJYJ0vUkNW24mNlj6z31pHfvVFYAc5a4l8lQwV/ycLXEEp
	 eE0qhrLquf8LArl+ukokd52mSH2yeQ7mYmLvNPRH6el5EV5EO54gpNZAk0RGfFqqwa
	 wr0vLKKk2rZEg==
Date: Sat, 13 Jun 2026 20:29:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geetha sowjanya <gakula@marvell.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, 
	will@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: perf: marvell: add CN20K TAD PMU
 support
Message-ID: <20260613-crystal-chihuahua-of-opportunity-deed7e@quoll>
References: <20260612095746.19679-1-gakula@marvell.com>
 <20260612095746.19679-4-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612095746.19679-4-gakula@marvell.com>
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

On Fri, Jun 12, 2026 at 03:27:46PM +0530, Geetha sowjanya wrote:
> Marvell CN20K SoCs integrate a Performance Monitoring Unit (PMU)
> associated with the LLC Tag-and-Data (TAD) blocks. The PMU provides
> hardware counters to monitor cache traffic and performance events
> via a dedicated MMIO region.
> 
> The CN20K LLC-TAD PMU is largely similar to CN10K, but differs in the
> layout of PFC/PRF register offsets relative to each TAD base. These
> offsets are derived from the compatible string in the driver and are
> not described through Devicetree properties.
> 
> Because of this, using "marvell,cn10k-tad-pmu" as a fallback for CN20K
> would result in incorrect register programming. Therefore, add a
> separate compatible string:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


