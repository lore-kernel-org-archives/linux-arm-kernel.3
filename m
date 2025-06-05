Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA7C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W8nfA1bMXsn6PSlEDDAH4jqJvD0ggJSj0wpvqfC2iA=; b=TZ61S/PFDuoNCNx2YdPVOMvpjf
	gc2QbUA/OYTf8TU/vtWPnWKZR5AFlvAn8YZoyHogiRO9VTv+1ietLbOjbmRvKoZiY7c4ld3PE6Wvj
	kJBM5gCKOq9C+oWhjeqHgTYCga5MfFhC01kuARk/yM3HoFNI+a19d2m+1MIY2mOVuYN45VuxELpe3
	aEzYSDhXz+Ic1iCPfM0xDSYYoNcraJ1pdl/ow68HsPAbJ71jQemuyg+0AodJACBG+zMZC3lw58I73
	sRPrF/qk7dVggIyRX6YtFzhqFY+V6mC8/pg0FYry8xXIApxOLytCZkAvpktcIjdnfCzjYug5HtSuB
	QHcLMRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEcE-0000000GAe6-14DO;
	Thu, 05 Jun 2025 17:42:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEa1-0000000GASD-3PLL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 17:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40FFF44B3C;
	Thu,  5 Jun 2025 17:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D971CC4CEE7;
	Thu,  5 Jun 2025 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145241;
	bh=dEVPAHAs6GM46/4q8XuV29zFZGVWXGkMMYOk3Wo8Z9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exT4mXlpk1yVcJjGb6Npz3esjShXs3wJ6X82IbN5IwLhtb9p0A419mEWFimR/v39u
	 rFqm50o/z5Nnda/udtm0/EI0/SSBKw+qYws9UlT1Bs18BJdZW8ISJisB+UDx2ryTLD
	 X6ilWCN0sTtijfhB+mZns6o4vtmvBpT6bCeysaloloj2BPPfBXDM6mH7je4B0vf131
	 tyKcS+bPY0aBf6x6n69HVko8vIlifIMoI2+8G0drj2awLoa+oWl7aOat1MbvLPCOoR
	 f7LPRI+Lh2x7S74WB8eTTYBm/MYB/yT1wgDfL8Ate1SJi9BMHRUze37n78ph3IgiIk
	 Zuh5NzvI8evKQ==
Date: Thu, 5 Jun 2025 12:40:38 -0500
From: Rob Herring <robh@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Cc: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
	shawnguo@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <20250605174038.GA2911346-robh@kernel.org>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
 <20250604034246.3234837-2-Meng.Li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604034246.3234837-2-Meng.Li@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_104041_871873_758AA0A3 
X-CRM114-Status: UNSURE (   7.99  )
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

On Wed, Jun 04, 2025 at 11:42:45AM +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)

You missed Cc'ing the watchdog maintainer if you want this applied.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

