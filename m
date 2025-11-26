Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEACBD1119B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 21:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AeZLCA/ukJVy22YlmqoolDh7BmlQLUxhqcEr79cX498=; b=jDvuFAqQfQmZxH
	9ThsViMtbvhTQnAetK52v1ounSnTKYS3GgQOaqOamqjzC7ICO+Lg1d6uYWhfXONbTJeGQ3DuCtA92
	I+1MNAsXQavAVGKpbvEPAZqU3YAJAWNXynU82alCeNPKWPP4XJVCMKZuN4RV44IT989TcxJNJ7FHi
	FLnFDBUD4098BcZmo04QhR6K72E7uxQdz+SMXbtKfwzFa6OtHn/f/DsiR+nSBefPRpWzxXph5Xuys
	QWNoG/emkfdBvzRhC1W1otucMnDsUCPeU5TV4Kf1zMH+EoRNWRdyEp5hOrgxt9QNIC+Ow0n8Efz8q
	7mdge5cNgnNbe+jWUflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONGZ-0000000Ffuf-2tGU;
	Wed, 26 Nov 2025 21:41:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONGY-0000000FfuZ-1hDc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 21:41:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A7FE60139;
	Wed, 26 Nov 2025 21:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057E7C4CEF7;
	Wed, 26 Nov 2025 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764193293;
	bh=VKmA/6mAURUWzEVcZzYO7/+r+cvqBLcFui3VsZzeq5E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uns+OFKRel+FuTsKfHkbDzNE1hZXYrMcqFMDExplp/C29jVUpES+Osyp92ZmcK8d9
	 fPE87c5VtNVjjqPvM6B9/5uZeU/YtuZEh8MW2NATGIt5F2omL8gSk5wwFJJ3Nex4UB
	 5lbGQr6gCY2S5XfjnG0dZSPpeJMga/fOTN6csWcs+K2FZlGDBxWOcvqAHs/iQkX7SB
	 CKjx507RNExmTvkVFMjxFFEsQ6MtzOiw/J7ZLBkAC4oJu2JDBScX/9eX0AcwtPRCu0
	 wYazpiGdXgBpgp0v2Ed8Vm87xhgDo2kyIwzD+UCVOJhPeY9xSsm8/3aRQiQa7VCmvX
	 g1wNrWabfRBwg==
Date: Wed, 26 Nov 2025 15:41:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe
 driver
Message-ID: <20251126214131.GA2852425@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121164920.2008569-5-vincent.guittot@linaro.org>
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

[+cc Ciprian @oss.nxp.com, see email addr question below]

On Fri, Nov 21, 2025 at 05:49:20PM +0100, Vincent Guittot wrote:
> Add a new entry for S32G PCIe driver.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64b94e6b5a9..bec5d5792a5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3137,6 +3137,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
>  F:	drivers/pinctrl/nxp/
>  F:	drivers/rtc/rtc-s32g.c
>  
> +ARM/NXP S32G PCIE CONTROLLER DRIVER
> +M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>

I'd be happy to change to
Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
per https://lore.kernel.org/r/f38396c7-0605-4876-9ea6-0a179d6577c7@oss.nxp.com

I notice that most nxp.com addresses in MAINTAINERS use "@nxp.com"
addresses, not "@oss.nxp.com".

Let me know your preference.

Bjorn

