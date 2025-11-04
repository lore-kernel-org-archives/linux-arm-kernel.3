Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47672CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acjutq4oYtn238t5xHhyqykBwixbji6v7lYcp6vJWv8=; b=tStZ6r4rHncNAXbZppVpd0O1ct
	JZss5FyLUoh3lMQ/ccZ/zgNplJCeI0dIpJfunU6NOhsRgPv2zLsasNdGHx6WGMXbNG3TZw1Zz+T1T
	Ay1N/dc0ZWqMysEhOoH8KQabyETVnfI/Se0kC96tenXHfYvNx1EcUxVJAo/j6Jq3y77SE6/gIXlUp
	6gaHV/dZMrndaVv2K5bOwVrEbWSt+WXsXMbKV9ZT3tBNmoa7D+dTyIWvFA3dFMXjd8z3dxvjzuk4F
	Tu0FnfkvAks6z6nE0t5FnNUfrUhWHrhpAs/6xZOQbukC5rlXVmIGK6K5E4jtYwbJHCWKx7MBTZU0F
	JbBluzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCKY-0000000BPyY-04sE;
	Tue, 04 Nov 2025 08:23:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCKW-0000000BPyE-3F0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 351C1600AC;
	Tue,  4 Nov 2025 08:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53442C4CEF7;
	Tue,  4 Nov 2025 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244631;
	bh=eKJUNYg3k9kAkrM1K2ms5vRzV9lqnBJj9YdqG9NsI/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7xPuPhqwQgc1yr+DO7h4WkCGNei9+hjF1Durdj40HMkGetEt2MlQf1UwAtmR/OdP
	 0Z0fed1MgnO0sqfaZ08FG5I9RpRfyLFByqVk4NhbwWOzDxC1xGCShg9d/2w67ynwTU
	 fAHfpCUZ7elvCf9gS9g9TdjZyrFSlydFrcMazhxmqu8wmNkLDpeta9BThCMfTJ9n+1
	 AP+FUi8Nwzm2+LjkB6M+oP7HjD78qo4TboLvFaYCxOboDq+g2gCVAgu0l5//MbMm68
	 OGIql1KTzpd5dBQ67isXeSb/vVcfQTdbnCmMNrghRIR51IZeBGrCKwiwsK5knMcSr7
	 XNoAtlHGa9dSw==
Date: Tue, 4 Nov 2025 09:23:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Shen <sjg168@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	peter.shen@amd.com
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add Device Tree for Facebook
 Anacapa BMC
Message-ID: <20251104-fantastic-merciful-giraffe-0cbf87@kuoka>
References: <20251103093320.1392256-1-peter.shen@amd.com>
 <20251103093320.1392256-3-peter.shen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103093320.1392256-3-peter.shen@amd.com>
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

On Mon, Nov 03, 2025 at 05:33:20PM +0800, Peter Shen wrote:
> Add the initial device tree source file for the Facebook Anacapa BMC
> platform, based on the Aspeed AST2600 SoC.
> 
> This device tree configures the platform-specific peripherals and
> aliases for OpenBMC usage.
> 
> Signed-off-by: Peter Shen <peter.shen@amd.com>

Broken DCO, see submitting patches and checkpatch.

Best regards,
Krzysztof


