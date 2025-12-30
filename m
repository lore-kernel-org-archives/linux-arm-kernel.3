Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3BEE95A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AqddoiW7Opz7pA0e3HiSf7YAEV3AQA7WNjqsrkj34I=; b=rpSGVT1YgMOa2eeFACbdZBXwaA
	VDT2NGHjUD0xlZauYybNa4pf+QnV7DqSbW1QKWGvRMJIjNv8djcQ5FbhpV93GHsd2X6ehflzgoVRd
	WvwrXz5qHUioqpm/iafZoHjl6CyOZ06xWqV9uLFkPvtvxp3g15aqc/3tORv9VAkhsPBARWglWDnk2
	BcX4PZrJGkNd//6uNvo5BJyQsiZrHHO719/Xfu5rpAVBiKrWDeWIPSgmuiA5L0T9O1yFEiWspDEMm
	qpwB5ZeMZNZPgpid4B6zTjHJTegyzOCpqFQXYfxha1GbNhGlmRBbORowMGHZB9PIe1f63XcJxI9KE
	QSnES03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZOC-00000004q3V-03au;
	Tue, 30 Dec 2025 13:03:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZO5-00000004q2Z-02wy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D97E40698;
	Tue, 30 Dec 2025 13:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEA0C4CEFB;
	Tue, 30 Dec 2025 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767099824;
	bh=FA+7C0106/GPLstG+xuWAqAY5KHNYGoVkH57M2wUGCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4NoalH0144Y8uww34o0txkZL6Id5giljjwplRU8W2z3Cn8Z0SCKfsRzj5encJynJ
	 QVqniprtLfLmF6OtgZOquzwM+GWimeDfh+5S1D5QLC8WEEDvrJNFaWH1XWWzXpv+kh
	 RaDHx0CO0fRJhWeqCT9B36xKgCqxaTvPd0q+j0NMPoJgAja0ZIK65+xMcHF3vnnelU
	 KDHgq8G//YB+GSVcEMacH9pZ80Vz5fsn683htAwb8iG2kHxEaqqUXLoaRWqTcPCb0D
	 Lkqb3qRDsrhXLe4eNfWrw2J1MebWg72cajecD95l/bOe6C+BYdQ99uWfVvPQ6a0wny
	 FfkoNI3u+7Tkg==
Date: Tue, 30 Dec 2025 21:03:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: Initial support for i.MX952
Message-ID: <aVPNqQtzz-C-bvCb@dragon>
References: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_050345_074797_A6ACF44D 
X-CRM114-Status: UNSURE (   6.52  )
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

On Mon, Dec 22, 2025 at 09:42:13AM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       dt-bindings: arm: fsl: add i.MX952 EVK board
>       arm64: dts: freescale: Add initial device tree for i.MX952
>       arm64: dts: freescale: Add i.MX952 EVK basic device tree

Applied all, thanks!

