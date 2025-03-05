Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915A6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIIiVrmnQiSyC0qANF3E4rCBVrPxyIXdjH1aVgIu9w8=; b=RFrVhi5fxfviK7jC8IBlZWrme9
	MvbGauInVhBjVu9NycdgZ/9Z63+CxbzhGzbnV0dED+O6jFPB6qN5jPkKluJYwYHAjdPbyzotwG5x1
	aJohGkwBJGnS9JevB+dcLNWMkq6x83ztMEmnb4xSnNnc9hOJVMJ6O+zFQ3AzsJaSZObVnDngttRKW
	nak0UIN1az1zT/5XrMTcYVlHI+DZ962jWAjgx1VZ589aY+m9TmOmwFlYvjBPj5lLslM86c/2IUaGH
	q9HYf3693SKy5Hk81zVNawBiNNi2yU8vAkWijgf3T8L9a0j16CZNdME0Lk0giOBLKIfrnfaoRIWUC
	zc1cFqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsrM-00000008pua-0lJ7;
	Wed, 05 Mar 2025 17:48:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprsA-00000008iET-1e64
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E43985C68DD;
	Wed,  5 Mar 2025 16:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44266C4CED1;
	Wed,  5 Mar 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741193129;
	bh=a79LJ8dE3ma4v7t2qwXAq36pAAKFq9q6whg86nhPw/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQVBuKCV3aenPt1tOXmQ8qWVFYaHkJ3HO+Tv4aSzhqwQ2CLIvzl/w5v/mJ3fv73+X
	 EV/4lTWIhT5Z0gYRUVi65s6Ni+L8DyqvMDV5WHixHA8DRnIDG82zF3Yyr9NY20wC1s
	 5dOXksUekCGosTTxfMFj1FWe7/s1WruHXX4nZlfeM8YkDO5YAbewuoyJPgUyu0NU+z
	 W9YkTHtg8XDc3nLqRh3nhis1D7MztwMYjZvXpdE6FevkXfSBVHccLcITShxGlIDzU2
	 kY3o27C7vmY+smfUTrBq6DaLpDC6CHEpwHF0St59viSNMnwhz5ADLanZC1hGfTGQjq
	 hWrM+puQjHidQ==
Date: Wed, 5 Mar 2025 10:45:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/15] dt-bindings: irq: sun7i-nmi: document the
 Allwinner A523 NMI controller
Message-ID: <174119312747.2117747.1409262151131178032.robh@kernel.org>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304222309.29385-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_084530_488546_2E8C2E21 
X-CRM114-Status: GOOD (  11.50  )
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


On Tue, 04 Mar 2025 22:22:59 +0000, Andre Przywara wrote:
> The Allwinner A523 SoC contains an NMI controller very close to the one
> used in the recent Allwinner SoCs, but it adds another bit that needs to
> be toggled to actually deliver the IRQs. Sigh.
> 
> Add the A523 specific name to the list of allowed compatible strings.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


