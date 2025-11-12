Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8914CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiZE3hQizFnhdp/VeXI8ApvLLjfsYd46TOeyEg+7cjA=; b=nvZXb9Fx4UGUEbu9sfS09xuQwi
	YFvC6jESU+1Jl7q8qYynIT9BRUAiwxT1aSlYpskeG3jisXH1Gk+DhbeyNxBMIZTRohuzlozfQ1MyF
	Icduwd/aVjC6FyjmLbMKfv8FwY+ON3W90MmkggnVybGU3D2UFp8idQOWRzAYu7N8IeZAeOQWvNnVQ
	qfUj7B/f631MJ6Uk0lfJrAIYGWaOQu8dMbs7ZsFWhG7KoHS8fcjjRne4+QBlaLViWhZ9C9oYuR9A1
	dnbU8EYN5hZg3UEzEz/ooevRE5uq4iRYq9PHeIZKCrZd2o3Udj+1T4dXU1g3NOS8ZJ9h7MKtsjMz8
	pBLJ2dkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7yE-00000008Y7G-3utw;
	Wed, 12 Nov 2025 10:20:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7yE-00000008Y78-0gu1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42ED26020F;
	Wed, 12 Nov 2025 10:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55556C4CEF5;
	Wed, 12 Nov 2025 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942856;
	bh=BjbMbn6QXuES5GSmGzJYQMBQyUywLDkryqleK8Yl/iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnfEQmj1uZS0TGaWKSAdADLFlu8oZecWfpLq1rdx4dQ/8lV7AWqVTXLhFTOOfgGHT
	 uROw5hHAKgy1wnTlRXE29p2DOem+o3fTD8DuxWSXAJQEF7aBjGP0SA7s20cl9dEYjg
	 xR37clnTdSJ582ojs//Mw/i6t1b4Fgz4lI3APhbTp9v0Mb1goh4mbVH3fwOYvdTZhn
	 5E2C/E8XrkA41m/eVgxiLnNQ/44X6QfqXwmQ5HvS7AlF9do4VJT5TiNQlDhsec6JN9
	 bfOPEUH1LH4G8d2BpjjXabyEiDdkof2BuyXY2maoGNZ6G5HOQJe6EgunyVsnHGmoU9
	 OTS+ZPZTHtO0Q==
Date: Wed, 12 Nov 2025 11:20:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
Message-ID: <20251112-airborne-tungsten-chupacabra-1c668c@kuoka>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
 <20251105-guillemot-of-demonic-courtesy-6127ac@kuoka>
 <CADrjBPog8u8sRsUjcgKNG87kdcF5HHx94tUXPdTrCUG-PxSXWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrjBPog8u8sRsUjcgKNG87kdcF5HHx94tUXPdTrCUG-PxSXWg@mail.gmail.com>
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

On Tue, Nov 11, 2025 at 10:18:47AM +0000, Peter Griffin wrote:
> Hi Krzysztof,
> 
> On Wed, 5 Nov 2025 at 08:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, Nov 03, 2025 at 08:03:10AM +0000, Peter Griffin wrote:
> > > Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> > > "syscon" compatible") it is possible to register a regmap without the
> > > syscon compatible in the node.
> > >
> > > Update the bindings for google,gs101-pmu so that the syscon compatible is
> >
> > That's an ABI break...
> >
> > > no longer required. As it isn't really correct to claim we are compatible with
> > > syscon (as a mmio regmap created by syscon will not work on gs101).
> >
> > ... with kind of a reason, but then the question I have: was the
> > standard MMIO regmap exposed via syscon ever working for any part of
> > this PMU?
> >
> > Original posting here:
> > https://lore.kernel.org/all/20231209233106.147416-2-peter.griffin@linaro.org/
> > did not change PMU driver and did not express that the syscon is broken.
> 
> With the benefit of hindsight, no, PMU write register access was never
> working for any part of the PMU.

Please add it to the last paragraph of your commit msg, that this was
never working in practice thus changing ABI is justified.

Best regards,
Krzysztof


