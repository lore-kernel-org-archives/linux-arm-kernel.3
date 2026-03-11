Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48C2FCC9DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TnpEu3N3Wg7VpR+WRJAYIJe62zec1Zk48SN+3Vy2Uk=; b=yGWCQtamJiyfp3SHnBIqTXrNIY
	CEYl0tsKM2VosmjjQxEbTZofjgRXFVpdzylsr3Ca2LQIM/EwTxaCk+Ymcls3lzh0wOTlYjH5AlTgD
	9Yvvw1G77LVByN6mxPjcgosvFvXmk4cm7eeI0iZlVFaKctpf3bBRGf/IjnnO4Id8KHy9qQgpb8PQ2
	DtPqQ4FRlerVJrZgeCYUR8c/gg3uH59gaj+krhRQseL+R1p5JbZ1+QcP35amZS5+wrCbgFyvvG1f3
	QQgoi0PSUT8l28cwN5/hq52xM29V4Sxix9G1olbaVj0ELwjP+GikBWphpbl4piYky2IDGswN1PME5
	fCniF/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CtV-0000000AuYI-0HD0;
	Wed, 11 Mar 2026 06:18:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CtS-0000000AuXk-3waw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 06:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4978F41ABC;
	Wed, 11 Mar 2026 06:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990ACC4CEF7;
	Wed, 11 Mar 2026 06:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773209886;
	bh=+TnpEu3N3Wg7VpR+WRJAYIJe62zec1Zk48SN+3Vy2Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ER78y/T4wbCKahMJTXQyD37d1K5V2ARZEJ6uQtzLepoASt3iZ2FpZz1Kj8CRD0qlS
	 1G1t8oOECb23RA2UsV3ZyVToUesKNao5w0SOSU4UrJLtGbgFGbCYrNMTF0cVIs7/1U
	 35qE4faGd2RnFiQjlS3zrCxIy4jokHlx5A99hGs/G99qvu02NPEiv2Fz2oeq0sVX+O
	 lX3KDU8sqCnvRQnvqzTsi0e9STWbomld1dVkx4nAnQRBl4t0ZGfojzZCxCZd0Gh6Ps
	 7Y0jFwqc9SAd0s+3WoLEgSKQ+Zg3ptCsVxMkI2JlWZjPHggN0pzVaUtiguZHTNRH1l
	 2Ef+hIpMklArg==
Date: Wed, 11 Mar 2026 07:18:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: PCI: pci-imx6: Change maxItems of
 clocks and clock-names to 6
Message-ID: <20260311-invaluable-nondescript-manatee-a3c4cc@quoll>
References: <20260310075459.726495-1-hongxing.zhu@nxp.com>
 <20260310075459.726495-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310075459.726495-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_231807_003568_71570790 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Mar 10, 2026 at 03:54:56PM +0800, Richard Zhu wrote:
> Previous commit 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external reference clock input")

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>


