Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5A4CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+gm3djY3aFRFTh0X94X6zEeIzmW+ZxYY8d+IIU0lJI=; b=NH+MwLJoI4tI99Chqr4jLk2iAB
	HR1FchZTu/a8Oy82ZnmnlF5klqDURCe7rHCFWhtMBxkiRKXztITt1Brqe6oQ0Hb7wZBHZpMLRK4mr
	jxz8/+1whes3g0LC56x/Y115oPKMSkFc7IwN3cF3qzNDdZjzZSvyOTAxsEqPpamj0qln9kcu1jAqT
	C7/qwvS8vK5DlSFaB9ZKjfSaMzOJz6gN/E/Zw8IC/5uiYXuz85SZX/F7PfcxflRH1grwinoShiMGH
	k0cybky86AoQbFyIE0S7c5SGvExQxLYjL1/zETXEfqyyonFM95UJzuaXpw3WzQPUt6RCancIb5x74
	6nCqS3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAodF-0000000DIZk-2CMU;
	Mon, 20 Oct 2025 12:04:57 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoZR-0000000DE8j-33Ov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h+gm3djY3aFRFTh0X94X6zEeIzmW+ZxYY8d+IIU0lJI=;
	b=C1VJkpK3CfvWSf6sIaUtBRMngG5pujyorUCWg1wLcL+NMBb2txWKY4D15MhUU8
	pV+BoYDgeWEhWRS5aH5IvLPJDnc4EOPVbgwHs2L4aJQcJbYCw2oKkx3fo4FL7h60
	av7TsfECecYTC3Cibf07k3gsF1G1YaprpJEqlfbACQp/U=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXRihlJPZonopTAA--.32146S3;
	Mon, 20 Oct 2025 20:00:39 +0800 (CST)
Date: Mon, 20 Oct 2025 20:00:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6ull-engicam-microgea-rmm: fix
 report-rate-hz value
Message-ID: <aPYkZXCtXyYYprp6@dragon>
References: <20250913091638.1003563-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913091638.1003563-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Mc8vCgAXRihlJPZonopTAA--.32146S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy7Zr1UZFyDAw4UCw1UAwb_yoW8Gw4xpa
	9xGr47Ar1ktrWUA3WUA3WF9aya9w4UJ3s8urs5Xr17Arn8WryFqr1Ivw1DXFWYkFy09Fya
	yF45Cr95WanxAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jebyZUUUUU=
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgTsZWj14CmiuwAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_050102_180140_4705BA15 
X-CRM114-Status: GOOD (  15.34  )
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

On Sat, Sep 13, 2025 at 11:16:31AM +0200, Dario Binacchi wrote:
> The 'report-rate-hz' property for the edt-ft5x06 driver was added and
> handled in the Linux kernel by me with patches [1] and [2] for this
> specific board.
> 
> The v1 upstream version, which was the one applied to the customer's
> kernel, used the 'report-rate' property, which was written directly to
> the controller register. During review, the 'hz' suffix was added,
> changing its handling so that writing the value directly to the register
> was no longer possible for the M06 controller.
> 
> Once the patches were accepted in mainline, I did not reapply them to
> the customer's kernel, and when upstreaming the DTS for this board, I
> forgot to correct the 'report-rate-hz' property value.
> 
> The property must be set to 60 because this board uses the M06 controller,
> which expects the report rate in units of 10 Hz, meaning the actual value
> written to the register is 6.
> 
> [1] 625f829586ea ("dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz")
> [2] 5bcee83a406c ("Input: edt-ft5x06 - set report rate by dts property")
> Fixes: ffea3cac94ba ("ARM: dts: imx6ul: support Engicam MicroGEA RMM board")
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!


