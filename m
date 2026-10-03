Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9536CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZyZDLnfwvO5kk2IUmjVxda6yTo4+rC+T/RbkzEatd0=; b=k4fszLFHp0eVLaZ/f4DbCNSR2R
	AbRDJSNsZlMYFPD2DKppi5uelDRoq7jYjKI5NfUmxNxcP2F7AABxfvREvWAaB7Dlys+2DqA67H/G8
	spjhVsSX41E0F0GjIxb6FYzNluN/txwmCVb/fjnJ1nX4x9AVeC7lUOX8vInzr3mmPJM2jP+eU2t5q
	ZVNEItgCXfFmiHZzj4KuEC2NvgkeFzyn0AqAuTf/KzeVZf9OT9x50VHbu380NN8pM4rx1laQaW9LD
	IeWScRDHj8QXTM7Ibqqu09lVC6ddJk+w37MYUAOm/W9r2KJ4Nxrpu/rr7cFLZvJNP+hQtqQMDvcFg
	y6wk5jVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1t1-0000000DiFQ-0Gc8;
	Sat, 03 Oct 2026 15:42:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1sw-0000000DiEn-3sYg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 15:42:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 253204E41134;
	Sat,  3 Oct 2026 15:42:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9F80604FF;
	Sat,  3 Oct 2026 15:42:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 229461032827F;
	Sat,  3 Oct 2026 17:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791042160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KZyZDLnfwvO5kk2IUmjVxda6yTo4+rC+T/RbkzEatd0=;
	b=DDgjgpqyyVsAVzp23/SzSFOH8X0fG8JmMnd5s1lBmutM+/7B1C/A2n55Hb7Geb4mo1XCxq
	guOW1s0Q/AAeEJ0Vj1T2pzPBbzUIjSudnyJ1/Me+nr6zHQQD8QpsetCImQRsEwHkl8DKks
	su1EDRuvWdzQ/JjGGvx3srUsZ0OIrYspT7Jo4y/APJNohhSPgRDLgMTzC28dcslznvd4nC
	zCufdMUGo7/io0D0nmnDoyY1MyTtu2jhUG94u0/DAl1F65YqIdos0wMFY3lDqqRGfpkRFt
	sB70zarHOyPnGN9bYw5v2UEIpKvf1s1yTBoSJM74vI81MQMSmUb8CngGrzeCig==
Message-ID: <54177bb2-9fd4-4639-959a-2126f4ab4b04@bootlin.com>
Date: Sat, 3 Oct 2026 17:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v6 3/5] net: stmmac: Rename double VLAN references to
 svlan
To: netdev-bot+sashiko@kernel.org, ovidiu.panait.rb@renesas.com
Cc: recv.jo@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260928203441.34876-4-ovidiu.panait.rb@renesas.com>
 <179093026338.434549.16397575185437884627@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179093026338.434549.16397575185437884627@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_084251_659202_359D36C8 
X-CRM114-Status: UNSURE (   8.96  )
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



On 10/2/26 10:37, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The self-test renamed to "SVLAN Filtering (perf)"
>   (stmmac_test_svlanfilt_perfect), and likewise…

[...]

> 
> This patch renames the test but keeps it in this state, and the
> remaining patches in the series do not touch the selftests. Should
> these two "(perf)" tests be reworked or dropped?

FWIW I'm ok with dropping the test. It's still in the history, and
if anyone is interested in bringing the VLAN perfect filter one day,
they can bring the tests back too.

Maxime


