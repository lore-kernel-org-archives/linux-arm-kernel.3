Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C74CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3eHqZZV2gqT+p9Q8iQrUB9KYNIfrSpCQhcQKHtEUIs=; b=apHTP3Bb1b1wLdDpxrTB+TspVr
	sThXR0K45m3vUOvDlhkoKCDa4pR6JQtqMIXYHzAvL0rwuD+Z0sU+ZnT5bLF9FGj8lCLahnnMNZjCr
	vZYgddTaX+c3Q+3KUlJ6bQFqA/FMR1Py/jt2uX3e3GeYnW1Swe0ij6q+eYFy2h57xc3DXTZZd3K9l
	UKi/rECoRI0yvT9MfL+4c1GpGLZgFsE/8urYV1UormYTBr8ubY0uIu2HJCigId1OV4QDhxphb6d4z
	GKAkl+4/pS8QJ+hm/mjZom+fkIPueuMMTxUbvBn0rHIJ010mFB318Rg1hf72edpZ5U9W+TruhJcAi
	XwlI1I0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1ll-0000000GQCN-2tPJ;
	Thu, 21 Aug 2025 09:39:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozTh-0000000G49a-07lt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 065704568F;
	Thu, 21 Aug 2025 07:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAC0C4CEED;
	Thu, 21 Aug 2025 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755760370;
	bh=FWxGFvQTaapdzLI5+1ZbNCfPnYXpL37LgOOTiok+nck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZEfGI3pJKC9x4yDuPEq68uBSePJeLjOV2zeQcPAYB5XSTyIwmUlLRJ9XCCHlZuUN
	 VKYCEtB0SgE/aD5TiJjZEq2/xBepqr+TuppMesuM54MKLrjAEktHTdbDFVm+0CL6Hf
	 iMVrraKV0wkBlcCHqcUg9Ewm/AnLzlKxQ+hnmbmLyDofbTQ9LWX3MIqcdl2aOfNngY
	 gW7BdGcMS9sT3y2i7+QzSQ/8Uj0A7bJYTiu4odA6EqfbcirtmdIDEJ2UBWsxOiaEDh
	 loGtM9wvwiiKqJgDcaKLantSxlmluUD3S085Kl5hitaXbBBm0OdEbRGg4m5N70VVf1
	 duo1x7hp/wZ+g==
Date: Thu, 21 Aug 2025 09:12:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add Nvidia's mgx4u BMC
Message-ID: <20250821-bouncy-robin-of-witchcraft-0bef2a@kuoka>
References: <20250820-mgx4u_devicetree-v2-0-ccd2831b29ac@nvidia.com>
 <20250820-mgx4u_devicetree-v2-1-ccd2831b29ac@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-mgx4u_devicetree-v2-1-ccd2831b29ac@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_001253_088539_E3477266 
X-CRM114-Status: UNSURE (   7.76  )
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

On Wed, Aug 20, 2025 at 06:32:51PM -0700, Marc Olberding wrote:
> Adds a compatible string for Nvidia's mgx4u BMC board.
> 
> Signed-off-by: Marc Olberding <molberding@nvidia.com>

And that's it? Why patches from nvidia repeat the same mistakes over and
over?

Best regards,
Krzysztof


