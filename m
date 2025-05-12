Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A00C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrkCm+skgkNF6RDYYvLXHCocOvKLAgZooPpTDV9LMm0=; b=Q6QnKvTLINFB5yZbnyMNHtcgP/
	w5zLdo+eYEAwi76o1prWNOeaYfDmtCp98F33KccoRHxoVT/VlgBwmU3M6jeoEuJwg7ZlT1rHw9A9k
	rbZC21IRZ9+CB1lIwIjpoXqaNtFQXTmpmm68kpb0EMALp178lJ+g6jn+tw0d3Cr7sCy13UiA60UPI
	0iI35JhEz2nfFlgKLsnoA8ijt0GFN5r0lNmAcnUVbjIYuAzQZg95Cj8qjwbVUV1kTFhfURCWhH5Wn
	897QSxx++MPYSOrPqwBd7Ri4DCI6kphM1ZiWSH6nzf6a9aJycA4MsswWbkDypmwft2Hvt625RyX3M
	B7stYpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWAI-0000000A4a3-1zDs;
	Mon, 12 May 2025 16:38:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVhG-00000009yW6-1Xv3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:08:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D4114BF;
	Mon, 12 May 2025 09:07:54 -0700 (PDT)
Received: from [10.57.45.206] (unknown [10.57.45.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C3B543F63F;
	Mon, 12 May 2025 09:08:04 -0700 (PDT)
Message-ID: <77f7711d-f8e1-4c0c-af29-cdf4f4726683@arm.com>
Date: Mon, 12 May 2025 17:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C
 model
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20250512151149.13111-1-leo.yan@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250512151149.13111-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_090806_456358_4B17C4F2 
X-CRM114-Status: UNSURE (   8.00  )
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

On 12/05/2025 16:11, Leo Yan wrote:
> The FVP Rev C model includes CoreSight ETE and TRBE support.  These
> features can be enabled by specifying parameters when launching the
> model:
> 
>    -C cluster0.has_ete: 1
>    -C cluster1.has_ete: 1
>    -C cluster0.has_trbe: 1
>    -C cluster1.has_trbe: 1
> 
> This change adds device tree bindings for the ETE and TRBE nodes.  They
> are disabled by default to prevent kernel warnings from failed driver
> probes, as the model does not enable the features unless explicitly
> specified.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

