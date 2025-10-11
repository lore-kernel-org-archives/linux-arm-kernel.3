Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB650CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cET2HC+7vrNrLy9D4JAd65Kczd4lwCNYCnv06jKL71s=; b=pb6brkWZFjP3x/YHLfsk/FUXdB
	66ZqevwdR/zNtD0pcI+405WiPsgQM291aKsAf5MM5E3Dpz9rxojgSbmnt01xeSkN33sC1teTcsfJo
	oXRY9xQHH1jfCUvcvfnEm+x4C+ojA8de6Hh07lMYvp8exQgk/Nbfysfm3fci5Z1nnDNxe4cGPsIN+
	v6N3K1Drd1vAvkuZwJWq8I5NONfNBeIci78riCUoIQCXay0PNHIqG9ljpazKHAZ0JZuLaLn6ag6mv
	quNIZrDSw6lkbwuUkKD29PPnDrbmhAiBUutMuoODmBgyIChLYxwI1S+Xb0KG0zbU+61vBH1Pv+2qJ
	QWQbLJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7XES-0000000A4i5-14zD;
	Sat, 11 Oct 2025 10:53:48 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7XEQ-0000000A4hT-15yP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 10:53:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckL7h05P2z9tCk;
	Sat, 11 Oct 2025 12:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760180016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cET2HC+7vrNrLy9D4JAd65Kczd4lwCNYCnv06jKL71s=;
	b=fve4MErzyatUtq4fK/pZqeWJ0IROlfMPj0YUTLVH196Q2qB2w7aQS+J10BzZkfO23zwPsS
	WgXM+f7G7O4P6JLDn8yqeJciIKYYrSTqM4nsTwSgd4EWDoT53twVL/eO8yDHR3m8fPOs6a
	/iGLCp2/5y6MeJdtreqJGlzb+1BRw0e9KY9ak50T0heKE+vvMYz7YzP2TfgcSOMSeSA6Fu
	2+GAZFBUaxfiPrOUcVT+rc2zsJu/DC3pnxAJ2ippOLF6Voz7bl+54irST5A3YSaWBxKmLM
	qVljdkOdy8HrdAaS8bqSTm2JFsTBjnXiu6JLV8qyyO5ligdSjOkwIp5fbojbYA==
Message-ID: <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
Date: Sat, 11 Oct 2025 12:53:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, "Jiyu Yang (OSS)"
 <jiyu.yang@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Xianzhong Li <xianzhong.li@nxp.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 308735b9ca49f66d617
X-MBO-RS-META: 7yn9f7gznupwzzxdktpfnnjhbjkkresu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_035346_432435_7CDE9C7C 
X-CRM114-Status: UNSURE (   7.26  )
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

On 9/25/25 10:38 PM, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
Is there still anything that should be changed with this patchset, or 
can it be applied ?

