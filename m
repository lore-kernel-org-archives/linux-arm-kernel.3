Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FC4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7QqRK+vJwix/ayKByAbEKb6eQ8RJStQ5RJixgEEBZM=; b=lK5G+MZ4bA46vFkf4lynD1Eos6
	GjGUWYYXtgj2qzTwmfo9C70wJFns/Cu7XCv9m2ZV7SdR4/6S4WA6nZawarqUDulGuEwZ5LUYFRvs6
	4OQOpNLrRPui5KN1w3MhgkhCSPWhyXgf5Y1CKOOaw6qa8nPzuFMf9JJ+AVgZIlZc05K5PtSkLgNj5
	avdvb8PCkpoqslDRGWUvHczDDvjSNqwF4kAm/eR0Z116vxcxY9G5KnYjRfTSkviP2g8MA/HYijNYT
	BAwpfFGH5Mg/iK9D+g9eUVTJrIvSUA81g4yNHBxiH4VGFYkvTNslXbirINckouyclqxPtCbJjum2C
	hg1fiEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUVu-00000005NNf-0s6V;
	Thu, 14 May 2026 11:46:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUVr-00000005NLl-0HbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 11:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A4A643F87;
	Thu, 14 May 2026 11:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB66C2BCB3;
	Thu, 14 May 2026 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759158;
	bh=2qY+QrMvacCd0TNq2vMKYHt/7+sltOZK495vCl1gMrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7HJM3UhSyxbHLmMV58PGUYajjFrgyPXrNAmfLHOY65Frnr3xSrYJCWygNqusOeco
	 6CeZAJw1n09L3Wj6Oe6Ps83sKMtZXUat3PA4xOY4XhMJctyD2f3ZWa1Z9s/SoWLgcg
	 qLDoBdpy+nCgUG086euRS14/HNnZoazSP+JXltdav4o3nP1ElfldjfJpjkwMXGbnTk
	 kF8n4Rtc4G/XWko662oc+pmMKB/cSv4NO0IPkkzruHVL7/TakExqmsnWu2w7x+mjTr
	 NAQs0plgY/WgdwbOb05WNWMSoaEGx603k+80/4q4eNwJlhmIedyPvatmK1wi3eAViq
	 oTB5ByaEVyZ2w==
Date: Thu, 14 May 2026 13:45:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Davis <afd@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Message-ID: <20260514-jumping-futuristic-condor-9f0503@quoll>
References: <20260513233447.2713737-1-jm@ti.com>
 <20260513233447.2713737-2-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513233447.2713737-2-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_044559_615724_D751B6DF 
X-CRM114-Status: UNSURE (   7.45  )
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

On Wed, May 13, 2026 at 06:34:45PM -0500, Judith Mendez wrote:
> This board is based on ti,am62l3.
> 
> https://beagleboard.org

Drop, it's just vendor website.

> https://github.com/beagleboard/BeagleBadge

Missing blank line. Please follow standard patch format.

Maybe that was supposed to be tag?

Best regards,
Krzysztof


