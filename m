Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700F7EC1E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW5vB/Vw3XfpAvtftR7uGU0e8QnnsppX33V2Z5JCWjs=; b=0TKomB87/Id/hRQHXtiSjkwgtZ
	UCdGrp4tp+ZVFF3miaPY1iiuYs2rJRZlfUJ1jbdBeUqZ0TPisZTCiSWXffU5Dp2yLEp222OhRdU5y
	hxwgDU1+Y6CTHbZHm/UIYTg43SXq7j1v47drJtL6jlsbLALAC2m3UBhhY30cZkCXAHSE0GnOuY5gb
	DG3c5Hvs8CteljcH3trjS0OXbZMsSpZqr8I37BWMR+arofHC4S8LZoEre8ievwSV3Px3LhE8BcthE
	RhLFNvoXsy1f9zGQ4Lia1CikXyzw6jKOyW3gt+RfUYoOklaRO+KTNRnW3qF8jss+8/y06jnc/fUcY
	LcxrReww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxDl-00000009onw-0jl0;
	Thu, 05 Feb 2026 11:08:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxDk-00000009onq-0fn8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 11:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32481600AD;
	Thu,  5 Feb 2026 11:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD8EC19423;
	Thu,  5 Feb 2026 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289702;
	bh=KRr5bjxloleM+AjFGvAP5BAhi15uf5B/cBZt51MJT3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jR7ve9k6a0TtuqoQ3bWHXpWD9u+XVhWUBrE56+vmacl1cQVpOJ9GNIOPvskj0RDDh
	 QHcRGtRnXVmUjazf/jtkjGXsznxKSr/IENSXB2B9f+QYfTN5Hbrkz5SR7eVPtxlpEg
	 TBsDErnK8kc1iWdXBFiBQNpylip4bm+nQN0SzX0VxsbAa0ukcNe55c8yHtJy1cVZ8S
	 Hq3OXx7cKJXXAhmJT03KmmWkZKqG5dz9J58RkSIP2N7azfewAZ0ILSRyNNGg8zdnCd
	 UT5YqwNX29RX5pjsqyr66kHnYeYvykyNeRNTTm/1ZACPnubk4U2eQgHrCBYs7hA9JN
	 ZcvHBJoXdZnsA==
Date: Thu, 5 Feb 2026 11:08:18 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Debbie Horsfall <debbie.horsfall@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <20260205-intelligent-intrepid-robin-df42bd@sudeepholla>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
 <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
 <20260130-light-piquant-termite-fcbec4@sudeepholla>
 <aYHmDTboOtkgac00@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYHmDTboOtkgac00@pluto>
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

On Tue, Feb 03, 2026 at 12:11:57PM +0000, Cristian Marussi wrote:
> 
> All of this madness was the best way I could find to address the problem
> of supporting such new unidirectional mailboxes in the SCMI while NOT
> breaking backward compatibility in the absence of mandatory naming from
> the start.
> 

You can attribute this to my expecting an overly ideal scenario with
bidirectional mailbox channels across all platforms using SCMI. At the time, I
did not anticipate the range of configurations that rely on unidirectional
channels.

-- 
Regards,
Sudeep

