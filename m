Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3691C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSzgSwaz8xtCGQAnlakPMmyg5CmRJ4QZ2MQI2tc6d2w=; b=Gbh2EatTQu/n7YMIGctX1aKdmr
	trdrISlEoo+ZPtZ7L6APWJjaAOE3sXgwIdzpvshxAuesIagwY1bEu27J4jA1bfqFubhay/cWImltK
	BaaXneF9aQG+PdWHVXYfuMlKY6CWSXGfYHrDxB3tJjyP9EIFoCUJiLheQdCbqHolG//PK1ZX3PVnB
	QWQdcZuO/+f5NgPELPtj6T59MDUR+DxTevjCYty87U0Fw7sWKgZPsghyfb/Z65HZKy9Lq/1mvgRo5
	0crZuCr/rFDIK2Qwe+BnZDN1+vdgTQJew2uFt017B26h7RkzvvUNDv1pGpo/BnRxKZkqUWQIgK7ug
	6v9yB0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSvW-0000000G6ZE-1vUC;
	Tue, 30 Jun 2026 07:30:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSvU-0000000G6Yr-1Uh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:30:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F008640662;
	Tue, 30 Jun 2026 07:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4FE1F000E9;
	Tue, 30 Jun 2026 07:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804635;
	bh=RSzgSwaz8xtCGQAnlakPMmyg5CmRJ4QZ2MQI2tc6d2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cpu4G/H26AcVeVXFJxpHzSyl0lzKZzwWBQ1IJN5P7IjOXBdCFO/Gc+KEFOa2+LuJR
	 vAEfAH2EselAro7jmyYW3nF2tebyXDLjkdn18+GtWE+9+T9/MfUIEyVknMADUvxfq+
	 OBUli5zGon8DPBjZmBfY/iSt9UamKRJIpF0O3f+rxIgcGPIwp5rMRZrugCqmooGJxX
	 SOvWWDDiu8+pf4TXZ6bh238xjw5jIy5pFgAVfUn5RXUHERJPdsnlJmXflGm8AWlqPv
	 sHY5GkMJ6FmvYYspZ3c2kcQINYcVMV3Z3jk2ZXOw9m+TYlUZHobM98TBmduCBiwWcB
	 1BK3l6/GtQdHA==
Date: Tue, 30 Jun 2026 09:30:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Steev Klimaszewski <threeway@gmail.com>, bhelgaas@google.com, 
	bjorn.andersson@oss.qualcomm.com, jingoohan1@gmail.com, jonathanh@nvidia.com, 
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	lpieralisi@kernel.org, robh@kernel.org, will@kernel.org
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
Message-ID: <4ombnzmepb5eswlilmkxd7fhic64nveiyznkltod6mha3hyk37@c5lutu2cwhia>
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
 <20260629211614.6942-1-threeway@gmail.com>
 <bc3cb302-5463-4e43-9b92-d141cafa2b8c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc3cb302-5463-4e43-9b92-d141cafa2b8c@oss.qualcomm.com>
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

On Tue, Jun 30, 2026 at 12:01:15PM +0530, Krishna Chaitanya Chundru wrote:

[...]

Please trim the message while you reply.

> HI steev,
> 
> Can you also share dmesg logs also with console suspend disabled mainly
> suspend resume logs, in both the cases.
> 

Do note that these are production devices, so serial console won't be available.
Once the device enters suspend and crashes, there is no way we can get the dmesg
log.

We should try to repro the crash on an internal Makena CRD device that has
serial console access.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

