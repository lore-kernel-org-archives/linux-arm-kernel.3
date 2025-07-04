Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaM0NNbZRvViiEdTJlyIueFfujxZh/7+S5Oou/xEwsA=; b=UQSwtqB2LIY8j+UpkjtUL+Jmq2
	O/visBrca5GvuIcnzX5SV8vE75lrK259tjurEDzeOuTi2I6Ecy7AgSeVw5CSVIwPVKfQVjT6NzYKS
	iLCQPa2+HiInJ6zniWRoletYHkdsGXCXnKPFcMT9M2BegaoxZJGrzs46JjykeR54Zz7FK/nJFSC85
	JV0dKzedFaWgtwgNk/4vplgN8vjfMgvXqRBhT54WTkEnebAcP9AfH8QbwdueaaPXyR5hHf/RFr+W+
	8zt5zBVOahK/Y2MOakvZQ9FnqrQlbOJoY38+Dwjxt2TIvaKRKp3LHicnd19rLPZ6+QjZVV7TyG4Ek
	zxDahbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXlAj-0000000FEhC-40Kh;
	Fri, 04 Jul 2025 18:30:05 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkrS-0000000FB1s-1MDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 18:10:12 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4D8E61FA59;
	Fri,  4 Jul 2025 20:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1751652603;
	bh=IaM0NNbZRvViiEdTJlyIueFfujxZh/7+S5Oou/xEwsA=; h=From:To:Subject;
	b=iadyuOg2VBXUiKIe7yS0dzy5UqhoUm1OC3BN8PYKA3+VAYoPghMOqiU+UPqKL7lS8
	 j/4wGPd0TM3xNo65vS18VUamul5aXqseIFimp5M4j5tWCyzAlEcmni64tQL7refLxG
	 l5T5tdmFp+HT65umPjMjDKRQDGy63czJQ3K5k/9UwgDLJklcE4+XOA82bcbL4xXjyY
	 X+OV+h/TUWg91SuaUQeg9oiuQclk5R232SIMlTkSblUAL1cqWsjiB66CECnhDteVu7
	 6i56ss+AIzCdKs86ibYtmyRrPqKCkK18mDFCXoXprmcDfdf0RFviFoCZL/AhHb+usB
	 3JG7wVDgmoD/Q==
Date: Fri, 4 Jul 2025 20:09:58 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Parth Pancholi <parth105105@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-verdin: fix PWM_3_DSI GPIO
 direction
Message-ID: <20250704180958.GA6379@francesco-nb>
References: <20250703084534.1649594-1-parth105105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703084534.1649594-1-parth105105@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_111011_409029_28C4402E 
X-CRM114-Status: UNSURE (   9.20  )
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

On Thu, Jul 03, 2025 at 10:45:34AM +0200, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> PWM_3_DSI is used as the HDMI Hot-Plug Detect (HPD) GPIO for the Verdin
> DSI-to-HDMI adapter. After the commit 33bab9d84e52 ("arm64: dts: ti:
> k3-am62p: fix pinctrl settings"), the pin was incorrectly set as output
> without RXACTIVE, breaking HPD detection and display functionality.
> The issue was previously hidden and worked by chance before the mentioned
> pinctrl fix.
> 
> Fix the pinmux configuration to correctly set PWM_3_DSI GPIO as an input.
> 
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


