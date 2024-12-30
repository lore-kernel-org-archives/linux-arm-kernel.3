Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0776E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHCKVh2AbwLhmjzcOxs27mhHQlsL+IhUrIYG091MgwE=; b=lRE1xXqJAw6q+B0hAM9Ea/oIaN
	VJ33olY2DZSwT8Iq1dhDJ1tpDYwkkvBJTCrXJ3ITIV35EWV0Q3ltjGepZnmIcp3luOGu8Fzk3Q33B
	ZgWOBc147Sx/qzpAjJB/1fNDR6EINwNcT+oNocuMjlP++Q/HF3YS9m+ndxEjW2IkB/2tdN8d9CUJ+
	AljuUgLGuugK9Ob/RALK2RNIg8T+4sgstpWTu8evddz0t7io/LMmVRd9xfa32BPJPBxGw5tsq7L9i
	dwqZIYb+1nPmXRUOUvE6Uyzrujjvj4GoiIvNxhxzFVI8GSBLFRtD9aZ5eX9HsZodNu9BQvGxSE3kB
	2QBaxYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7Vs-00000004WRr-0tXS;
	Mon, 30 Dec 2024 04:36:20 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7Ue-00000004WJF-33Qp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 04:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SHCKVh2AbwLhmjzcOxs27mhHQlsL+IhUrIYG091MgwE=;
	b=GxUP7SioHjonTfr4b20xM8MrFUAdAUExWHwq+2lBAjygliCst890X2bkyHZ6gZ
	OJ8NQ5EOpkjNNATNNnf4VH7HMxBNVWKcblAoATr83uhLEOxePcRMC6snXk3PdGO0
	IXHRwQO+GgzKifBvpeZn8+FCWjtRZEqQLuEOrAmShqi30=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnH0bpInJn7NkDBg--.18117S3;
	Mon, 30 Dec 2024 12:34:51 +0800 (CST)
Date: Mon, 30 Dec 2024 12:34:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] arm64: dts: imx93: add pca9452 support
Message-ID: <Z3Ii6WzpgAlfXn5q@dragon>
References: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
 <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
X-CM-TRANSID: Mc8vCgDnH0bpInJn7NkDBg--.18117S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsk9NUUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEh-FZWdyDiVSFQAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_203505_145613_9DB6CCA8 
X-CRM114-Status: UNSURE (   7.35  )
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

On Thu, Dec 05, 2024 at 11:51:13AM -0500, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> Support pca9452 on imx93-14x14-evk.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


