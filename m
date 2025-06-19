Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73437C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quvcjZIyZdHXE2r5su/BoIFtXlfUorFHohW6xpcB5B0=; b=NJKwnrfAFZiZtXRNS62lLyEw92
	UQ/qMJS5UhMdJbqTNA1ZOKXdy6A6FBM2TRXFL1Pq//GpLkwF9qFp4QcbwBuqYWLJNEu9Il4nlSTga
	VtSsP2nrpx5SFdLkvF3mqQ3RP6//wxjMN1VGH+/mhs70h6ZgIr3Ra25zh18LGm04pPXieVivJeUkj
	I8Nx1OlMXa47zeI9rCn9CJqh6HCv2qqDPgpL1+B460o4ay+wmVoTYMDS5j/ocnPG8b3FaJ8XfSpN5
	Ncl5LuBU3jSRafr0OySj1/TwyeR070/IVNHbw7o21xuLoejMuQb28ZcOSqNKXilOSHblotWxLDq+h
	IGN7JxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6bV-0000000ByBx-28V0;
	Thu, 19 Jun 2025 04:10:21 +0000
Received: from proxy25211.mail.163.com ([103.129.252.11] helo=proxy41131.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6UZ-0000000BxJi-3bjh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=quvcjZIyZdHXE2r5su/BoIFtXlfUorFHohW6xpcB5B0=;
	b=HsAkH6o7CAehFoLWGauWTIMSs9aU+tPr6b4AO3hzKV+m/HV3WbbWoAYQgC2Ff/
	CC8AbNo32cE/q7bzmRTjRNzWgKj+hN4hjlAfrSnC5RhpTMv18cfGlAuiiiQ2iKsQ
	6BsnaF+zvMqplGN1/zwXCx9X3bsySvbSWPFm8CK5Wps0M=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_zq0i1Noom_2AA--.60308S3;
	Thu, 19 Jun 2025 12:01:58 +0800 (CST)
Date: Thu, 19 Jun 2025 12:01:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 2/8] arm64: dts: imx8mp: Add pinctrl config definitions
Message-ID: <aFOLtHeAMaCLLDdL@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-2-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-2-a8f0195420aa@gocontroll.com>
X-CM-TRANSID: M88vCgDX_zq0i1Noom_2AA--.60308S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0EfOUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQJxZWhTi3sBCwAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_210312_142402_93104113 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, May 20, 2025 at 08:34:51AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


