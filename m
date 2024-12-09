Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E626DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDcyAUm7weadxplw3iWC3WRLmtSv74le9OVm0hGb1gc=; b=dXhRYDiPpG06WkB3v/Y7PGTx0j
	jE2PgyWGjals9xgyVCQ95vs+MDhmuVsKmbacp4/6QINhh/cc1vSMv497UfIT+IyoK0Pgk8LalbW4/
	43DXOQej9T/tDYKsZHNqK+PzLXt8bFFmgFk6yLMS1seJQ5jE9SqMkraw0wQbXFFCmFlVAl50+yjjW
	2hzYfLAhpt+qBx6WwO3hJvRKzLJLYsND/coN86BElbHYZulXpJ1cLbAH1P8lL/J7vDG3w3xG7yEPj
	2QsZtVTgspDEQY/LLpKAqOGElpaaDcbaiX6fNfEdJ6L/E0C1EEqARJqNrBek2jifw4n9vUpcEa+n8
	SX9jlKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYbe-00000006mvI-2FFo;
	Mon, 09 Dec 2024 07:55:02 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYaY-00000006ml3-3qQ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wDcyAUm7weadxplw3iWC3WRLmtSv74le9OVm0hGb1gc=;
	b=jdt+PlMB9IkuE4x45jZUUVpzKIJ3Pu3iuarObGCypbL86BoY6PG7ysV7rWsNkQ
	ghvmrclznVS1oWeqINSA6aCKfaR1o5e3fFgST/KHSUgOSj4EshUORS7x5PINitX/
	qD8wqG2wNw5ipwMvq8DAlhuXoQYMesXNUAUq2u9d3uRy0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHiNsGolZnqoeMBA--.47519S3;
	Mon, 09 Dec 2024 15:53:44 +0800 (CST)
Date: Mon, 9 Dec 2024 15:53:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8-ss-audio: add fallback compatible
 string fsl,imx6ull-esai for esai
Message-ID: <Z1aiBrlz5qjw7LVY@dragon>
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
 <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
X-CM-TRANSID: Ms8vCgDHiNsGolZnqoeMBA--.47519S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWrDUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxqwZWdWeOyxRQAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235355_276966_7274E2BE 
X-CRM114-Status: UNSURE (   7.93  )
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

On Mon, Oct 28, 2024 at 03:49:32PM -0400, Frank Li wrote:
> The ESAI of i.MX8QM is the same as i.MX6ULL. So add fsl,imx6ull-esai for
> esai.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for 6.13, thanks!


