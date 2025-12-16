Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD97D5C0F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kG8wWtk9UYxtDex/W1sRegQdhtndd9i5/A7IW6x9Gmg=; b=h80UXx01QoH3xIh+/DgOPmawcH
	CxCFJJoXdPuqYvqd0sJAiIMcGOfhQPpvCVwGS0OF+RW2DZN1p+HJEEvWN0hVXK1Tm+U4UXjXnv8hd
	dZpkzFUuNrzaUBLZDJSGJy7lxoIU6UBwjB1GQrOF0ZKu07Cw/KvcLOfklY6EkcMrR9VLroYKmbzF1
	ZjaNUU5MtD2GZSDIFQSVMJXdBXV4ubL7EXmBFzNFcARG1op93Yvwq577i1MabMPjzi+ZBep2RwDtP
	z8yH1iFs57xoLgcqyIGyxU1Oud5IzJbysHmHrjqrPRgjGbOBNRczfzuBi9/213FdgFYr834taUGw1
	khM1J5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVR93-00000004yRT-2IsF;
	Tue, 16 Dec 2025 09:15:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVR90-00000004yQY-2ePC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 09:15:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C057FEC;
	Tue, 16 Dec 2025 01:14:49 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E70C3F73B;
	Tue, 16 Dec 2025 01:14:54 -0800 (PST)
Date: Tue, 16 Dec 2025 09:14:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: vexpress-config: Update clock and
 regulator node names
Message-ID: <20251216-proud-centipede-of-reward-ad165b@sudeepholla>
References: <20251215212914.3323741-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212914.3323741-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_011458_711846_D68BCE12 
X-CRM114-Status: UNSURE (   7.29  )
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

On Mon, Dec 15, 2025 at 03:29:14PM -0600, Rob Herring (Arm) wrote:
> The clock and regulator node names were updated to use standard node names,
> but the binding wasn't updated.
> 

I assume you will be taking this via your tree itself.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

