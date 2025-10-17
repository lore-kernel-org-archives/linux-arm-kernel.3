Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199B7CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4zzfEVXv3kCRK1+tRhEDpGxTNtWTV7qUWhG7JQ8YIo=; b=CDitnnSYv/NbgSV1KiI2XHbgQ+
	hMGEci20tcg0lr7NtP4N7yO4svVWTuTrI1fQdr/l0VQtBlFZn54YjV4UdXZz4LSADL8dxuyd+b30D
	4aSh3kyLs0J3sGhrWKGRiKa3PVSYkFOprpiOYv8h9eH832cT4Yle5XCLKeE5ZyOw0Fq0hZTHflwhQ
	FeYTfFy+TR7ZywMmd3eU6/13/N3aJHLAU09faaIS5rHtw3OYqpLB7ghF0XobaJeIOdpYN+nTZeHOc
	s9fuMMY0dJcc7yZy4QhMx9w/8LIyTdKVGpamu3GRcrEv8mCyx4V0v2/rI57PCBm0inuoD7WvD+UNL
	Jgm2XH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9e1s-00000006nsc-1w6B;
	Fri, 17 Oct 2025 06:33:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9e1p-00000006nrD-3kM2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760682807;
	bh=l4zzfEVXv3kCRK1+tRhEDpGxTNtWTV7qUWhG7JQ8YIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=STF6XOptFjEdvztYJZwPnC0JyF6vqPLgDYj+odIW6iC4xrMsgOUu1dfvk5Hggrdfk
	 Z1nlI8gOrbCAB5obJh5jS0l47Ed0gTddOrs8sXOSM2qvt+AL3pcz2x3BlrqSPptDfb
	 Ghzz7Tsp1a83YtdmlKCHDDndNwStg1z+lbxlhI893/kEk5sgabe9Wkj8J/p/xxp0PU
	 OItXpZqj7Z7cNUNnxhjvgAdyBiYYHEr7ORzntoPlKozXdtE+XbDi5HtEOU8Sv/VsdA
	 EslNzMXdoPc8kCH2pGRB4AF/2Jjx2sOGSgxLLWhqLltHKnc89xnqVBcK+rHgVO+dVf
	 O4+fKXtQSvVNw==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E420D7702D;
	Fri, 17 Oct 2025 14:33:26 +0800 (AWST)
Message-ID: <8bf232de1d4254afc408b415d3476c2c2183a4ac.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: remove WDTRST1 assertion
 from wdt1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Date: Fri, 17 Oct 2025 17:03:26 +1030
In-Reply-To: <20251016052727.881576-1-chou.cosmo@gmail.com>
References: <20251016052727.881576-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_233330_133573_E1BC05F1 
X-CRM114-Status: UNSURE (   6.47  )
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

On Thu, 2025-10-16 at 13:27 +0800, Cosmo Chou wrote:
> Remove the external signal configuration from wdt1 to prevent the
> WDTRST1 pin from being asserted during watchdog resets.

Yes, this is certainly the immediate impact of the patch.

But what's the motivation? And if asserting WDTRST1 was the wrong thing
to be doing, why was it done to start with?

Please address both questions in an update to the commit message.

Thanks,

Andrew

