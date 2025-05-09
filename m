Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A290C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZet+ff0CAqKdEihq0J4KoIwRL/wzE3KoqwUIYv73Sw=; b=CUwcbCCNbDR5fgOKOIUPsp2Tp/
	k2tZedFVy6/uLo9HxMZKxZlji4QiLk5RB7LSifKXMEOaIguDQ3Hu+EYatcyDwa4A5pf3NhkqZZYWz
	St81FHZuBUizW2rFAFIypVGyJW1W4NDdGnKc/lgf9Uax+XDVdNhLHuxxjHAE1oVbF0Ebmrc+/jsrN
	2MJmJSZgQV2rSW+86FN512q7x49IKAzB0vzutdJC/33B9plK4WGx8/59xZ/rM1pWC0DG3In1Kc9g2
	RN7eyCB1DnHJoEUYKYjQKugGhzCB0bfNlR4ythi5KXqeO/gru9t9gF7biL0HdwtH5qk3fqdrQ5nQp
	LGF8dlBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRBe-00000004OaY-2p4D;
	Fri, 09 May 2025 17:07:02 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOn5-00000003xOo-2GT3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KZet+ff0CAqKdEihq0J4KoIwRL/wzE3KoqwUIYv73Sw=;
	b=pAXhJYTbNRJtQHK6fCd0ea3DhgtshwYydPx04PrJS2UaqOYzyginNzWLkXJq1F
	exjsqMWvuiU4N54hvvVh8NGwq2HSySo67N5rqG2xBPbmO607qao0hMED2UpTyKdB
	CRolNhVdC2YvbsiKfZ5BVqqovzV6OaRrgMt9YVsxYeJGE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33xEbEh5otAutAA--.15781S3;
	Fri, 09 May 2025 22:33:01 +0800 (CST)
Date: Fri, 9 May 2025 22:32:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <aB4SG1a8A2OvIBNB@dragon>
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgD33xEbEh5otAutAA--.15781S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcg10UUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR5IZWgd36zXkwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_073331_967960_5AA7860C 
X-CRM114-Status: UNSURE (   7.23  )
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

On Mon, Apr 28, 2025 at 03:59:08PM +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


