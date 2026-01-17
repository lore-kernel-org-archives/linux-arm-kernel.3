Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1399AC98303
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39lst4n809hNLpvEVLjO/Jd51/WfHE8qZxOMPRbNOrI=; b=SPLkq6aYsiazzQkIfD2KLh5rix
	DVvgfML2P08wwMGsDa/QFNIM20RmQ1ueZnr8ncB1Hd1RWFz5n53W+sO8cFHWbXj7IUD4vVWi6ac1n
	bZJojxu/J+3urhtQHrDgOAH+gZ+LVMHibYMEAZrCC9C2DdVlk4iJVFPMSD/MZ1nnaJ3L8Y+5ct5PW
	KpGcsAQwHWKqmEzXWWlV4uLQ1X5JB1hDFn5LK/GDY+b1QwdaLYgOSaLccsnUIKIraoUxQ+I+sPbv/
	pFx1gESf7rVx+xYZ8KgtxU7xxGPCxeiexdR86j0jhNNR+Lydz0WUP9noAFkJYaMaq04joalrZr45q
	xf0nH9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgwEO-0000000F8hD-3lCA;
	Sat, 17 Jan 2026 02:40:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgwEM-0000000F8gv-2zog
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 02:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E55754427C;
	Sat, 17 Jan 2026 02:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58579C116C6;
	Sat, 17 Jan 2026 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768617601;
	bh=Oo9C9eIHexmndWqq4weLNVea2ly8DZIkz1rKY/arHW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZVolOei8IUUJfVrVLMpDxlMCNlxuLKvN59rLMO3Mll/KZU4DhUoMwLssNnz9jjbW
	 WIPiE1tz8Uw6zaKniVdcSCXOcem8qxL7DL+qH5cUh1XGBzMsva5+tWnziEqhTmHteY
	 HVCSZfNfV0Zet5CU+32hbqKwLdZab8bPnXhaTfDaOsN0oGWXxnt96+D7BofSZPyLfo
	 jIaGAn0ReCrZzCAlIbqXKhQZfHI6fxcd9qeDQr9S0Gzd/5B7MmEQGl4DisrJyKbwk9
	 Y1oEp7RsR/CVv5903c84N93SrrAOW4lRabPHzJnXbymGpwU+XVBnBBlYGCywL8/WMq
	 dk4m2rAa0QXtA==
Date: Sat, 17 Jan 2026 10:39:55 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: imx: cleanup most gpmi related CHECK_DTB
 warning
Message-ID: <aWr2e7xwVM6Im1XR@dragon>
References: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_184002_778715_9F35B0B4 
X-CRM114-Status: UNSURE (   7.07  )
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

On Tue, Nov 04, 2025 at 05:27:11PM -0500, Frank Li wrote:
> Frank Li (3):
>       ARM: dts: imx6qdl: add '#address-cells' and '#size-cells' for gpmi-nand
>       ARM: dts: imx6sx: update gpmi #size-cells to 0
>       ARM: dts: imx: move nand related property under nand@0

Applied all, thanks!

