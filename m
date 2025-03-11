Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86A8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPjzWEIRgrMC7GoOBG9nlVWAbgBUY/TGQT4CORiN6s4=; b=NxbfNPz9DPRjDy2KD8QPh1Cohj
	xZ5besmRSeYpMFspJ0/mbuWE8DC0NdEIkrDlGiiQxYdl22HHpDWlaMoz8rdG4cOEWhaJ6Gj2I5A46
	tcqY9j/B2qYLkf62svNVerA6nCGXHFOKiUNB0khdZg+XXjN24PIYunlvz1JYL9pay1e/yJ8n4R4uE
	MQP/TDeOmROsOaE2ZCyOtNMDHKMJ7oiqpOETxx3RjNu/5EKSZ6dT3sCJS/tx3EiHoxnTGo7KP5/kE
	YBCcVQxYwBwbZ1rpFnxj2Q+LRdAXvEr/PUr6hV8zayPLy+Pli1ATtpVhaecSduQG/sCW3hip5y5Cj
	3qG80iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpx3-00000004U5I-3LCF;
	Tue, 11 Mar 2025 03:06:41 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpvP-00000004Txy-3Nbi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 03:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=tPjzWEIRgrMC7GoOBG9nlVWAbgBUY/TGQT4CORiN6s4=;
	b=Nu4Z8q8BfhcwGD/Cfdj8iKpZDOrY2WE5lT8uJsA6KpfyUxls4/rceTJeEasYV+
	GOywZ15Kq318QEyWn+WHn5c8CnrT6OVRE8ChQE5SR/r6ySHlwIInvTem+6AadQEP
	S6qUwhZ4PaTN+F6KjFXYbGAyFVrkTk9DG3EMsgcn1yXO4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXlUJGqM9nrs20AA--.48493S3;
	Tue, 11 Mar 2025 11:04:40 +0800 (CST)
Date: Tue, 11 Mar 2025 11:04:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to
 AUDIOMIX block
Message-ID: <Z8+oRjW7YN+kw73/@dragon>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <20250226164513.33822-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226164513.33822-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgCXlUJGqM9nrs20AA--.48493S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI1CGUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQgKb2fPqEj92gAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_200500_195450_9B98C06A 
X-CRM114-Status: UNSURE (   8.01  )
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

On Wed, Feb 26, 2025 at 11:45:12AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Needed because the DSP and OCRAM_A components from AUDIOMIX are clocked
> by AUDIO_AXI_CLK_ROOT instead of AUDIO_AHB_CLK_ROOT.
> 
> Fixes: b86c3afabb4f ("arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Applied, thanks!


