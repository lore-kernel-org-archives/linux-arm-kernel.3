Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02767CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xzn1LftlB3eoCQT++TKuZqjrPTjcb34tmDJLzogUf4k=; b=IKZyx+MNO0L4Fd
	cykc+zS1I3xQcG7+fjog7T8+tyz1+Ro3eNMr3BPzmMz9Ctucdcbk25pUISfTmyXsK0AVmaIJdZBZ3
	I7+pd2M2gXeg8N9YRhYqjrWSDw3AQPphaWTJNJStKl/+AcrXpym36BLSBfURXJfIWUIravPdEQfJA
	CUHb2n+td/uTGDcKnINSbavdT/I+44IKZ5fQMwxslNND3HyeqaHQs2f4k7O5tuMs3iXDYzjZw2P2h
	bx27ta1fzWF7L/bVEKurHeZSHkI8WST4s7jFMDNHd0Z5RmFZlcvmrvtZC2XQ6Ms4qdu8mIVXxY0Ic
	pIu5E2k7kaeXihAnlpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxC61-0000000BouR-2jVe;
	Fri, 12 Sep 2025 22:18:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxC60-0000000Bou1-1BuC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 22:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F9266000A;
	Fri, 12 Sep 2025 22:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E5DC4CEF1;
	Fri, 12 Sep 2025 22:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757715499;
	bh=kLu6RnGhve72kIxJfLVveDvpDowMd3hCTSYR8/4G3dg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AuQxxHsaN1kg9VH6QnR7m0bHMqX1VI0Glu3XqOApBqq24YlRu6VMwLm513iS6Fhn1
	 lxhcWVmv9PHgENVqU0HmZMFLJtkgMidzxYDXbgVabu7aPo3CZw4r/wbxIECkSyAzBl
	 XZp4PDIWdjUyP+jIt/3QdivzrYG73wk5QEEznTmkHoHjyj3Dy3EizZN3+tZO9r/6zi
	 mFWY8Wtmn8AqMlpItl8DlN7/T/9zExzCQKm5YSfTU6YHuC3GFdfQmUfHs534G6vdbx
	 f7Wy/4+I8Vk+UtBlmPVDhHoX/Jh65Bzk67eaUjojsNRMqJlvqHtR3w8JCZXhAp6OiP
	 W6LhlAFdU8B9w==
Date: Fri, 12 Sep 2025 17:18:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] pcie: s32g: Add Phy clock definition
Message-ID: <20250912221817.GA1650405@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912141436.2347852-3-vincent.guittot@linaro.org>
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

On Fri, Sep 12, 2025 at 04:14:34PM +0200, Vincent Guittot wrote:
> From: Ciprian Costea <ciprianmarian.costea@nxp.com>
> 
> Define the list of Clock mode supported by PCIe
> 
> Signed-off-by: Ciprian Costea <ciprianmarian.costea@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  include/linux/pcie/nxp-s32g-pcie-phy-submode.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> 
> diff --git a/include/linux/pcie/nxp-s32g-pcie-phy-submode.h b/include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> new file mode 100644
> index 000000000000..2b96b5fd68c0
> --- /dev/null
> +++ b/include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/**
> + * Copyright 2021, 2025 NXP
> + */
> +#ifndef NXP_S32G_PCIE_PHY_SUBMODE_H
> +#define NXP_S32G_PCIE_PHY_SUBMODE_H
> +
> +enum pcie_phy_mode {
> +	CRNS = 0, /* Common Reference Clock, No Spread Spectrum */
> +	CRSS = 1, /* Common Reference Clock, Spread Spectrum */
> +	SRNS = 2, /* Separate Reference Clock, No Spread Spectrum */
> +	SRIS = 3  /* Separate Reference Clock, Independent Spread Spectrum */
> +};
> +
> +#endif

I doubt this belongs in include/linux/.  It looks like it should be in
pci-s32g.c since that's the only use.

