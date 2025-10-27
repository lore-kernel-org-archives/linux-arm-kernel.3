Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A54CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 00:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpsDspoPGuFN+kp23Nw2bUNjubccczLt1s7VeJsKJOk=; b=ue9EidgNJn5nxZsD6W2U/gwKdK
	K1TXEV4hlkksn+TTeYVaUBWF5Z8bxiMCBxjq3ThtqPyx18fzGj0Fe+hd8vKAtzt/1u96xky727b69
	er1Yxv39WAe9dENvBuSucLKxkLepDh+148Kf4qw36HExoAh3IR0gLlmgHNi7jBlsPQRpYly3hNf2X
	h1b1sX+lVWSBoKIbEffuCZQuo87Sn86J9/wRLm4h/fn+/tY5OMIwbJH7zMq4DAo8XHv5cj99rVyRn
	2KQTlmy8+D4l0daZC3+MYRoXWO3jlv2T4qv1NYj/fv87mh1e1vxAgKCrt7z5ghFJoWCdM9CHbidXC
	yj1io2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBYd-0000000Cuyc-1k9N;
	Mon, 27 Oct 2025 00:57:59 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBYb-0000000Cuy9-03L0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 00:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PpsDspoPGuFN+kp23Nw2bUNjubccczLt1s7VeJsKJOk=;
	b=NsIBY0WA+Au1ix8V6Sl8Z5MmPiwBy52G8n0Qe/AeNT7C3G/kQd8avI0eZY253p
	PIn35Kfwc4n8VZusktlXchPO5r4Yde1LqxFSHfyzcyEv9brPQmgAj1xiFcSK4c2z
	MUkTcily0JRut8Ib72/ddchydzz22+pB7stQ4u2MtlY18=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3H1lkw_5o1DK6AA--.23343S3;
	Mon, 27 Oct 2025 08:57:10 +0800 (CST)
Date: Mon, 27 Oct 2025 08:57:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aP7DZCMk1pQ7wsFo@dragon>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
X-CM-TRANSID: Ms8vCgD3H1lkw_5o1DK6AA--.23343S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0NtxDUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwHzZWj+vk4QWwAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_175757_424129_6A290C8E 
X-CRM114-Status: GOOD (  10.92  )
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

On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
> On 9/25/25 10:38 PM, Marek Vasut wrote:
> > The instance of the GPU populated in i.MX95 is the G310, describe this
> > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> Is there still anything that should be changed with this patchset, or can it
> be applied ?

I'm waiting binding change to be applied first.  Or is it already done?

Shawn


