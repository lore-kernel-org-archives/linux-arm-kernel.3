Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817F1C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0gDnRbm3bQ6wCktrI/IhBGyh+4yYx2gykZBc7NbRV0=; b=qlpJHCOd4mC8AycTrrn9d0j3Ja
	EriE71RxaNa/zXukvmrgVDAuQVoDKCjDbTIvyb/Gba/w1jRdpU+Y+9EZ0ztloIcWxWrTaj9W/783e
	StUiNVKAkEzPDG1WqLNBfvxyKrz4X6ulX3XmGgzvaMSxQbTNawM+5c4mdp3m+00tPwmlca6xIEFjF
	/Prm9PgpzWiDDSE1leXFsHtRrJyL9cw2IVHqOPb1Z3L7egmMtrmNPKVz/R2z1abdKYRcJ4/M92i0/
	CsXi1ipbHFNVGJreO/oxq51RgNSJYnd26f/gQxrBnB2miCFTwQoAvgjhNJnC2KZQd7r2jm0F2Ar1v
	LDOJpsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGF2-00000008EMP-3CiN;
	Tue, 21 Jan 2025 15:32:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGDl-00000008EEq-3fVv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:31:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9A71063;
	Tue, 21 Jan 2025 07:31:45 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8743E3F66E;
	Tue, 21 Jan 2025 07:31:15 -0800 (PST)
Date: Tue, 21 Jan 2025 15:31:04 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Message-ID: <Z4-9rSwR3L9t7bHp@pluto>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_073117_951679_8B19F7D7 
X-CRM114-Status: UNSURE (   9.49  )
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

On Tue, Jan 21, 2025 at 11:08:10PM +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
> CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).
> 
> To manage M7 in a separate LM or in same LM as Linux itself. LMM APIs
> and CPU APIs are needed.
> 

Hi Peng,

I see that you are really starting to like vendor extensions
capabilities :P ... jokes apart I'll have a deeper look at this in the
next days (togetehr with your other pending patches...), BUT in the
meantime a quick one...where are the bindings for these additional
vendor protocols...seems like a patch is missing to add those in

 Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml

...even if bare simple protocol numbers (like existing protocol@81)
currently these are needed for the protocol to be initialized by the
core.

Thanks,
Cristian


