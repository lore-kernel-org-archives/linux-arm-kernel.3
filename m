Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED4EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4OupiokonmaT3wNszk5u9zEUs1gDf9dGzr5JcCmGAM=; b=GsuUt9BaSBIcsaAKs1LMfg15vi
	LwU3Sg+Tw5Rqfq3eJr0dh2aYnEH8xZuV/P6RLseQ1jXgypZod56IlKzyEotjjUeUPW3wI2Wqj3YyQ
	gllc2CmpnAPNBhBghoCvlBvQUqZp06L5JaIDCJg85qOPBN6mWOha5eBjlWa3T6sSvae5CAns8gyeQ
	qIelWFbNe77sb1N49r6w3OqGzaZ+2isNnZVcZ9vn/ex/MTORn7z8twiLKjiTZ5EMXxrMVEi8I0dgJ
	0DVXDCzNEmwfZHz/I+SgUMkO4b50qAzRjETz4olErb5+74kD1SHsqcVqT+MEVjC+T+PI/h9Nc3kQZ
	/G3pashg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaXy-0000000Emld-18Pd;
	Wed, 06 Aug 2025 09:34:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaLs-0000000El0N-37Gr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:22:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9270619F0;
	Wed,  6 Aug 2025 02:22:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C96E3F738;
	Wed,  6 Aug 2025 02:22:26 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:22:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Spell out acronym
Message-ID: <20250806-first-godlike-basilisk-d7fb5e@sudeepholla>
References: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_022228_829162_35FAFC3C 
X-CRM114-Status: UNSURE (   8.83  )
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

On Wed, Aug 06, 2025 at 01:03:08AM +0200, Linus Walleij wrote:
> When I authored these bindings I had no idea what "AEM" stood
> for. Now I know: it means "Architecture Envelope Model".
> Detail this in the bindings.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

