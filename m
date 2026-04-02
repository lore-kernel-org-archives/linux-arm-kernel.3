Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ADECC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QISEkODBJ45ZFU+4DgvpgN2E4nHMulfHsRAgUfZNt3c=; b=1M4N3uRnCQ5SqjnFNEqxB4Hqv1
	lT9wyMScdWpnR+1V5cIDvDCQ3dfhMgNjZN9o8GgfhqE8CJOYD+l4olcaQjJ8jpIgttqBaRCbFCMY6
	AeogwQnxsadOa7PWfcSX0vUr/Oo/ulJOCyKkcEc/jFpg/Mei/iOCaaESk5LluZH6yQRhfwWE4bpzN
	aMHp5TFIc4D7S4mkz3UCAzdu8EqL0y2YzBtESUvosbPBlZK84F7UFEPML+9Xr76W0DaCSyBgPH2EI
	lprVDE8qSpBft5TQMbj4W8T6d6s5JmdlC5hSH4CHkVdu1UkP5+R9AMMc1NLLqYQaluXOTv6cda7pe
	bL9VRRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CeB-0000000H6Zj-1BQl;
	Thu, 02 Apr 2026 07:39:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ce9-0000000H6ZX-3rfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:39:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3299161858;
	Thu,  2 Apr 2026 07:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584F9C2BC9E;
	Thu,  2 Apr 2026 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775115560;
	bh=no6QOf/VFhguYHVORKuUHdwtLtBKZ2459unNnteq/hY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBnzc+PXAxhL6UdbS47xiK1BwjKryy20q1Pgr+/C6MN38wbFYU56toFcHxODXn0T7
	 iXlH0O7X2+kz8nzHtc04NSUetwgJPs4pzEKF+SCRaqZABPls9tSs8CFAxYuhEJBSDI
	 n8eQFP5D56x6YNeaHdFKzA/zqvxwpRaKpM/dnvDCBukxZM8diEqyUBXbGbfFNoxpsJ
	 GAFQLmX0QUaLAy0nMAhreIMcrhKk3LVpPLdpe7tOIeXEXxMuA3rYAK+31ioTj3NFIa
	 LbiqVvi9XmsyY0RVB7BE+H8P6nCAzZ3DHjbXa1cE5QZmzrz1o6ng1Djpqf9AiehDH9
	 qDd6ZFdbuqGUA==
Date: Thu, 2 Apr 2026 09:39:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akashdeep Kaur <a-kaur@ti.com>
Cc: praneeth@ti.com, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, d-gole@ti.com, vishalm@ti.com, 
	sebin.francis@ti.com, k-willis@ti.com
Subject: Re: [PATCH v2 2/6] dt-bindings: opp: ti-cpu: Add ti,soc-info property
Message-ID: <20260402-sweet-wise-coyote-138ff8@quoll>
References: <20260401105404.1194717-1-a-kaur@ti.com>
 <20260401105404.1194717-3-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401105404.1194717-3-a-kaur@ti.com>
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

On Wed, Apr 01, 2026 at 04:24:00PM +0530, Akashdeep Kaur wrote:
> Add ti,soc-info property to allow OPP tables to reference the SoC info
> device (chipid) for establishing device link dependencies.
> 
> This is used on K3 SoCs (AM625, AM62A7, AM62L3, AM62P5) to ensure proper
> probe ordering between ti-cpufreq and k3-socinfo drivers. The ti-cpufreq

Nope, sorry, DT purpose is not to perform probe ordering.

If I change Linux to load k3-socinfo before ti-cpufreq, then the binding
becomes invalid?

Not a DT property, drop.

Best regards,
Krzysztof


