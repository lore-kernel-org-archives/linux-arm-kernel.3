Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D8xcIiL/B53PrISjZmLTQU4Q1DqEytDTcdKmGqFAkE=; b=AWdufHEJDyET4xE7/W+jGjnh1a
	PO4Ufpsjg7mOz2WDNtMXi8YfieZ+nawu9M17pkgQX7M5fEjQ9xENJl735daU57BQCveLGQtI461wW
	L5dgqAuclW2ZaryO7HF/mXt8R0oGGnSkAOToCqh7lrIRS+IQEtAThgQHfiWFzig6Q/ySnhUeDNaIU
	agI6n/BqF5jGh2BKddDnumCNkENbnS/M8Q5gzkhXFtrFoTI5iADLFW5QICjGZeHfaKIS+Y5+W2/ps
	39YDqX8IBil7uU2HnZ7YzXzZq45KUEiPRDP73/fn3bUzP9YZ9OGy1fMTO3r27NS1s6SP3A9gBrGl9
	IVFj+kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOU-00000004okc-2LaD;
	Thu, 02 Jul 2026 15:32:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOT-00000004ok2-0nR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:32:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A160B601CA;
	Thu,  2 Jul 2026 15:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304361F000E9;
	Thu,  2 Jul 2026 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006320;
	bh=2D8xcIiL/B53PrISjZmLTQU4Q1DqEytDTcdKmGqFAkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LALP5/0ywp3OC8ZL7OzXukibmCm0vLntQpem22wvj/qnLYFf/GhUyXMV4nbaXYbd6
	 Nim+HFnm0LYLGKoD7mK7B7sdVx14DkNlXkS/ITlXGzV1BafeBM9z9MRJgznsOQcWZD
	 OkwDiIvT6LTjfGzPnqAv8VihxbUuuJeBMqV53b9v35oJfZUppqcV93d9OTBBNe8F/C
	 WjcEKsRl8B3DZqnwmpEfktPn5nn6UM9pb8BQcTNC3sVTkK3IaTwHmkFwa2E/JKvIRr
	 7URRcB/IEdzoyrNB50sKZDdtZke8s5b4JJa3gNiGXrgpR3bjuw4pgyt551nhVXk4pb
	 aDa/EIIwoLKmg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, michal.simek@amd.com, radhey.shyam.pandey@amd.com, 
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260625161016.1249570-1-suraj.gupta2@amd.com>
References: <20260625161016.1249570-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH] dt-bindings: dma: xlnx,axi-dma: Restore
 xlnx,flush-fsync as u32
Message-Id: <178300631680.735405.5286832164780431530.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:01:56 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 25 Jun 2026 21:40:16 +0530, Suraj Gupta wrote:
> The DT schema conversion incorrectly changed xlnx,flush-fsync from a u32
> property to a boolean. The original binding documented values 1, 2, and 3
> to select which VDMA channel(s) flush on frame sync.
> Restore the uint32 type with the documented enum values and fix the
> example accordingly.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: xlnx,axi-dma: Restore xlnx,flush-fsync as u32
      commit: 287bdea77529e6abac5fe15461d93c1acdcb07e9

Best regards,
-- 
~Vinod



