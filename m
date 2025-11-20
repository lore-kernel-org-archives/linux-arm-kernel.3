Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E540CF8866
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NW0E6zw6+N4EVYunRxqvywnAZKjfIKATNFDV1e9Bku4=; b=umW7YmzCymFTFrk1hEevch8G3J
	A522WfEyBiEvqlWMPzbDFm1C1BSo7yVPpM4rxWoSbfq6cgae70vGRWukxrFcNXD176vc4g8ZK094e
	ph/MfhojKYTuJSGnj8V7R2bvkRyBCyY+dEG+zjqRHXqEYIGzJyiXz2OpxmQkcanTV5enR78pLT060
	D4uZOZ9aEAEXMMbp1J5pJwzMmcVq8IR56E1SAAo/rHRXz7Ha9IuEufPsQoBf/WDiA4+ShF4bnZhOF
	uSUifn47y42zJT39EkiVsE8mLHo2NJjM5gI8KaHZQyrFv1nLD5TdoS3H764UV/aPuuZOPzVqVcqYc
	UDHcv2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6Vc-00000006uVV-1scR;
	Thu, 20 Nov 2025 15:23:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6Va-00000006uV8-12Wa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 15:23:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E92344058;
	Thu, 20 Nov 2025 15:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338A2C116D0;
	Thu, 20 Nov 2025 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763652221;
	bh=0MNEyCDiMjE2vsbrKi6Sd2Jmx0BtFcSOJN/HQidrjv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biRg2KjbGYCiUsqPAXuvHTgF4YX5ZoSPv9h1d4D0oeMQj7/06VDWNGkAEoNo2LBTH
	 qw2JrtQykNbJWU0AkAGZmlr5WbQQIBcQ+bVFLcklUy0cF6sG221e28gQVlS2eOaurB
	 hLTZeFCg6dGqnX4yFnlW6J9+BSmRf9FwTHxEsyMHWmftTO9Po1a6Rpj+siiVbIqL+r
	 gLFjlGph03p2zYFEbg1ICzd4zMCHgJ+7ebnfDqiFJjslw+Bi1KoLKM+GcqQYxUlLsT
	 D8h4AzcgzLloBdvZRSSy7u0ViK/XOT8Id3A96dRgin2lc+WR0e/6zWcWP24/yrU298
	 O/H/iK+Fyo99g==
Date: Thu, 20 Nov 2025 09:23:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ionut.Vicovan@nxp.com, linux-arm-kernel@lists.infradead.org,
	bhelgaas@google.com, linux-kernel@vger.kernel.org,
	ciprianmarian.costea@nxp.com, conor+dt@kernel.org,
	linux-pci@vger.kernel.org, s32@nxp.com,
	ghennadi.procopciuc@oss.nxp.com, imx@lists.linux.dev,
	kwilczynski@kernel.org, jingoohan1@gmail.com, Frank.li@nxp.com,
	larisa.grigore@nxp.com, chester62515@gmail.com, cassel@kernel.org,
	bogdan.hamciuc@nxp.com, devicetree@vger.kernel.org, mani@kernel.org,
	lpieralisi@kernel.org, mbrugger@suse.com, krzk+dt@kernel.org,
	Ghennadi.Procopciuc@nxp.com
Subject: Re: [PATCH 1/4 v5] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <176365221942.1402463.4737452946243069736.robh@kernel.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
 <20251118160238.26265-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118160238.26265-2-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_072342_330783_C61AED5F 
X-CRM114-Status: UNSURE (   8.13  )
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


On Tue, 18 Nov 2025 17:02:35 +0100, Vincent Guittot wrote:
> Describe the PCIe host controller available on the S32G platforms.
> 
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


