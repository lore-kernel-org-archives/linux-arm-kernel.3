Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2432D5E364
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMPixpittUSQtC4V67E3ap7qOeN09OgTLEP0ENrCqYw=; b=opmS5Ifji1C5fZx4fKDFYiWfVt
	4GLNslpKIdfAbgo7yXY7kXbXHW5Kk5M2+sBeFkvJMOaZ0a7K8yYeA0vmRChHy6JigfuOTi1HCrhjB
	84nRyDd2MuAdPaOvtZcPTMC8oeohUKGllDYIOB65XVwQedIpEkohvMLVQ8NKnweQTODxDcb/DH6PW
	V3beul/jo3l5phW6lSB/hk/bFqZsg77ajb8mkufwR/AuRNBB1EAkbXGCzk0r2GRQJnkLWbM7F4yds
	9rfvptMG8r1D8QAOE2GhvnKFDja1kWO1vzAWQ+jkD6SNT1Zz2MjNrgCaq2fXU2/z6ExBLSkK/mWXl
	3ZLR6DBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9irx-0000000D5f0-1XrZ;
	Sat, 09 Nov 2024 10:39:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9iqC-0000000D5WP-0Sfs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 10:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6E695C483C;
	Sat,  9 Nov 2024 10:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4071FC4CECE;
	Sat,  9 Nov 2024 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148635;
	bh=gMPixpittUSQtC4V67E3ap7qOeN09OgTLEP0ENrCqYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kESBCsyGNRpT3fI0KfDVcXlzHelqP7VRXcH3vjamK0D32rsCSDYoxoB8A5rwYceLH
	 2yXUkp2hdtt66mW/etQmL9ER3njIORk7qwgYjqh0Fteq3fvrLZ6HP4hh290+ZpZ+ht
	 SLH/NWpArifonohcEnbtIWAwpWWbgWVgikm0XcvQvMDN90LFhDzmjkjqNoZR7ZJBa/
	 fZAvS/HZNQNN8vhzLNNOYyD119G+Qm2b41XThr8eVQk9TRxThsEKNBzO9ezidFeSaK
	 0v5YKwizxx4u4BrLZsASHF8c1jLiiMvI4UrjCHRT+KoNF3QsbuY1oU4SYgSWk5aWsh
	 xp8501EnZEDGw==
Date: Sat, 9 Nov 2024 11:37:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
Message-ID: <ri4oyjhoasvzcwpmsmbrbnydyc6eo2a5vybmgx3mw4k2j5hdtq@iz6oewkuf77r>
References: <20241108142946.2286098-1-danishanwar@ti.com>
 <20241108142946.2286098-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108142946.2286098-2-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_023716_214057_A4D49C56 
X-CRM114-Status: UNSURE (   5.87  )
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, vigneshr@ti.com, kristo@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, ssantosh@kernel.org, srk@ti.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Nov 08, 2024 at 07:59:45PM +0530, MD Danish Anwar wrote:
> Add clocks, assigned-clocks and assigned-clock-parents for ICSSG

Nothing improved. Actually got worse - not even accurate anymore.

Read carefully my last comment: I asked why. Where is the answer?

Please keep above guidance for all your commits. All of them must answer
why.

Best regards,
Krzysztof


