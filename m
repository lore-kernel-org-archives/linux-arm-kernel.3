Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKBOtlXp8ng5QEyGAub8zaIMu1YiwgrkREeZrIipJE4=; b=Cmjdjqq6Ryk9ZSoZZzuPQklpwY
	UfePw9Q+dYn51Iez5td5aVv8h3aWRR+BY1KmNNrBuSzcMl83TVT5Iru8y+RWDUJstTzhi39m9R7r5
	3al0a6Sadsv/xHvOZgOhVRIqudV1hWGypo7zQV8/VphbH66IZwRwxADZb/62OX8jWGJnmBgljkAtd
	ArN5C6H1qD/Y4ciIRDOFoOyo5JS81NcjGQxAnSkz2TG9PpcHua3wdbJWPfwkFTWoBm1OcvTMadOR1
	a2bjK4vTXizy5aWBBoh3ra+rH/J+GbbxHcYQz23ZGukE71u7JgEgcmbIUIpJtgKbNKDY9b0/8Gwq2
	qbdx5p5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6xK-0000000CbLH-424d;
	Fri, 28 Feb 2025 20:27:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6iB-0000000CWYG-1JCn;
	Fri, 28 Feb 2025 20:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E34225C102A;
	Fri, 28 Feb 2025 20:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42051C4CED6;
	Fri, 28 Feb 2025 20:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773514;
	bh=LQsJDstkxtElAiCGOGeiQuO6nIrsIZNsGdbOQX7SOh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGSJVYQep/MefGALVYWjcRJDSFo/1tqOlYoo7cQ37ROrU4OauDU5cFyZnhLQcljdH
	 HCEVU5JwN4Okst/HU6FZhZRPwviOmTFMNDLVvu/4/zpdbDwwwXoMIWoo79rzVBRyxO
	 TyBI/+o4BaK9IMx/kridDvL+CRzBcTJ72JHXR23+M3po2BJ47guvqDQe4k6KjJ9Y9y
	 YmJvZDfvcogBcU8Vy8uTH0eJE0PrzxS0EODpaUONylhjNY2s0jLoJ8M8w9//mMXZLt
	 Zpn/upccseshhGN4Ch0o4YqNIRM7SGD7kaUqW/P7YNmTWst28V2Qp2hEafneY0k3lj
	 oE15PcY4Rndrg==
Date: Fri, 28 Feb 2025 14:11:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Xue <xxm@rock-chips.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, heiko@sntech.de,
	linux-pci@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 01/15] dt-bindings: PCI: dwc: rockchip: Add rk3562
 support
Message-ID: <174077351138.3532182.7064020347463101186.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121155_395697_67F700F1 
X-CRM114-Status: GOOD (  10.03  )
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


On Thu, 27 Feb 2025 19:18:59 +0800, Kever Yang wrote:
> rk3562 is using the same dwc controller as rk3576.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3:
> - Rebase the change base on rk3576 pcie patches
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/pci/rockchip-dw-pcie.yaml        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


