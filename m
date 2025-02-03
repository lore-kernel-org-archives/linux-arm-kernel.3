Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E30C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt3zpV9vsQVI5L3LLy1W/Dl6E45IKqZAYzeMSWLCo7s=; b=N7aLZdRoiexnAJXWQwC46Ea7gZ
	OSS/Dlk2UKRhXSPzCA9LdtpjEelM3Utke2X4TrjHZ7vC8RjwbSga7bg8GMZlA1fLOYnKSSGnxpCUO
	v+Z5lMeqzB32Xk0sXyKGGgX5wMDOwCkzWsMlhazOHYLoqDV+SgqsgN3hV0cWrGxso9ogmrkg+G0w9
	tp4j6JLYTMuM2XZMS30smRaZb0L+F6rnRVVmOaF/GGeBUz1B5SbMWlYbYAkdni1LCSdxh7MoFTKcI
	RFY8c/Dk2mPKYGRESKTvz8ucx3ay6e0UBa7p4s3fiS29lxAhE+xoxlF2e90mLz2+Cm+10HvsrJj1r
	kGehWXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ES-0000000GGjw-29NO;
	Mon, 03 Feb 2025 18:31:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Bu-0000000GG2G-0BA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15DD3A41ADE;
	Mon,  3 Feb 2025 18:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75A3C4CED2;
	Mon,  3 Feb 2025 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607341;
	bh=++UD51iTwuniLJR46IJQEfzBH5GAbL7MvDjMZ8Q/Uh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCXPy2w9w/LJ6eB2V1f/hzdsZLu3XYKPsv2marIvhqX89nkOtmYGeV/LV+ulmnfJM
	 +gVQtBwQcxD1g6UIc5CLUEPsi35KRNeRpHc4CPMK63ta3wxLuxOPeHCHQoShWfGNpn
	 1iwBrxDg8boyjB9wBqtfszd/ZRqPrx/VFkT/opZmoU1FA0DMRWHoRQroh8r2rcr9JZ
	 yD+A9+CJI2MyHW07Zo8suIvtXyRzqjVYfPB/ZWp4se8ofiKfN//KPRms0bvipdm4Ns
	 13Km+zoGBoDPo+OlrsZUvodxrlairLflxDbGjMk1LawUB+8dF6/xyw9Da1+w0LlwCj
	 FZ7lWqPhk9XuQ==
Date: Mon, 3 Feb 2025 12:28:59 -0600
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Anderson <sean.anderson@seco.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] dt-bindings: xilinx: Remove uartlite from xilinx.txt
Message-ID: <20250203182859.GA3352680-robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102902_160991_52418179 
X-CRM114-Status: UNSURE (   8.82  )
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

On Mon, Feb 03, 2025 at 05:28:38PM +0100, Michal Simek wrote:
> current-speed description has been added to uartlite description by commit
> 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for
> synthesis-time parameters") that's why no reason to have in xilinx.txt too.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> Fixes: 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for synthesis-time parameters")

Should not have a blank line in between and Fixes goes first. Will fixup 
when applying.

Rob


