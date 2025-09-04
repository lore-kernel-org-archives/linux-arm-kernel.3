Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8A5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P14jZkTZ2+u7vI7hYdRXpcT9fXkr0x5aIO0upkvLBic=; b=lZEA8ozCzyE7toMEGMbQEssWVg
	X1QgP6FR7r7nuoyzntouSRdIaAcBh6MnDxV5RR7dFGWFaVYzWVPLmHP2yI2RzgkzuU/Fl9I/L/C+t
	L1Zl+JeiI6mrUVbdkPzAwWt1/ib1KxUiV8srId+bxVi541Hioh/YZVVSyvru6/bm0SaLskvcpvmg8
	wNR3iY0B7wyutTT9/F/bXKqg4NY4gmfrKspD+SAFvC6uZjT3V91EuRYv9wkUl3fih5+/zIAvJWLWU
	EIV2Yfz1niRFftlHCtc7PVNkYvWbY0bNBBGaxhJt7s8ThMUpu8WbyQWZRPs0PRGMDzqKrIW14k3fE
	gBwT44rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnl-0000000CuKN-0SiB;
	Thu, 04 Sep 2025 16:27:09 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9vF-0000000Bqxf-2NVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:22:42 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHgBS3z9qz9tDy;
	Thu,  4 Sep 2025 15:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756992144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P14jZkTZ2+u7vI7hYdRXpcT9fXkr0x5aIO0upkvLBic=;
	b=ANIvYDKCbjfVCwXbxl//QcpZCl00FYQAsZeTQhF/42edtJJGpI09Vfl7JMYSBlaP9pxHWS
	fBaYazKItq1Ofg+Qrq6zBaF/Da+HWWCzGhVMqhUETpHZsYZvgx+89lC2TUvn/9yDC+W4ig
	jKPXkccLdZUoUkBzfnJMETQeNntPyI9AQRUUJc9hDWWlQ48lmRUJeu3RRedhkN+4bhtBYn
	r8AMQiULzbktNaDG8XnmbJWGS7ENypY0VJ+mrABI2vocgz/dD8sR8TBonw9n5HacupYuwq
	ivFBCujJ5KRXJplhjItVx5tlfDFkJu4Nl4ZA9dxv1MUCleM8mSdb1VVvGrkDlw==
Message-ID: <ff353bd9-500b-4d73-86d3-32283774082c@mailbox.org>
Date: Thu, 4 Sep 2025 15:22:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Peng Fan <peng.fan@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de> <6144881.lOV4Wx5bFT@steina-w>
 <20250904095435.GD13411@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904095435.GD13411@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9f0efbf0e2d99046b6c
X-MBO-RS-META: 9wx1ezgab7qjqngeykn69ohkyf1cs1n1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062241_738857_4AE36EAC 
X-CRM114-Status: UNSURE (   9.07  )
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

On 9/4/25 11:54 AM, Peng Fan wrote:

Hello Peng,

>>> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
>>>   			};
>>>   		};
>>>   
>>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>>> +			compatible = "nxp,imx95-gpu-blk-ctrl";
>>> +			reg = <0x0 0x4d810000 0x0 0xc>;
>>> +			#reset-cells = <1>;
>>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>>> +			assigned-clock-rates = <133333333>;
>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>> +		};
>>
>> With the SM release lf-6.12.3-1.0.0 AP does not have any access to
>> this BLK_CTRL anymore. See [1]
> 
> Right. In configs/mx95evk.cfg, BLK_CTRL_GPUMIX is assigned to M33P, and
> System manager will automatically handle this reset.
This discussion will get interesting, because there are systems in the 
field where this is not the case, and they cannot easily update their 
bootloader. How do we handle that ?

I can still update most of the systems I care about, but this really 
isn't the way to handle this, because this reset part is part of 
firmware ABI, which has changed now.

