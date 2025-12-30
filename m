Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CB0E94109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ1VnFwYVH1MJxsx8oOt6VKrIp0Fnp16YvWC4lxiSz0=; b=ZlocEbMf8PSll5kXsLz5Kj/Ap+
	lCK2apjB57Lkv3iV5hWdGar/+H5SaP6TNORA+wNoJl1mrLi+XnAQvmZL9ML2+3WgTGBIsTQjCLCqD
	nItO8qZI+JQGFiMYP0PWSPmFRGjb6RorpWmX2m2oBneGRtntac7bmLQmkL972qkyF9GxVrW9Vewpw
	WWenWyFGIGTxDMho/XmU2cRt3W7bGEDgEc/CzzWI1dagOd8mmCfpEiI1RH5RJnqWYraa0P38AD/V6
	JNytW4+nBqaVXNcTbewXJ53T9LxQ52qa/GoN118KswDajoxBPNKS5ioWm0o0klsEQWPxFYnvi2eLG
	NI/+LrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVMl-00000004b5z-1Kcz;
	Tue, 30 Dec 2025 08:46:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVMi-00000004b5c-238q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEFFC42AD2;
	Tue, 30 Dec 2025 08:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2F1C4CEFB;
	Tue, 30 Dec 2025 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767084363;
	bh=xNRxgng69p3lmr7nvljneo8pSEZGbXBkepxe7xcVWUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZccvwS6/l4VeKZTE7+rbQjozC8NX/4D+ODnTRkL8SyUZVvriInFIXCZHsEdYmfg+
	 EGO27xwYekMT9cBJhc9pUzVWSNNopUDGPruYsQWNx7nSbaxLz1A+xKQ+VtUjvJ4npx
	 eHyqfEV3FIBOF7HfeG2rL+i+uF7KQllF9YlehO2f+tZVNRlxsTQf/QO6DZpGFAtxNa
	 wpCgwLKrMyl62jxdN9Fk4E/DAcuLRI7wRrLl7NBmrzr1wUL07Rf2j5pTaBrWYBqxni
	 JhLD2q9F6aYxeR8H17XwJOG6tzNfhBfo5GPIBHs6uxlgVWVIZFW3d07yehdoQZzFSC
	 YQWV4S6R3ThGg==
Date: Tue, 30 Dec 2025 16:45:53 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jan Remmet <j.remmet@phytec.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de,
	Yannic Moog <y.moog@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>
Subject: Re: [PATCH] arm64: boot: dts: imx8mm-phycore-som: Update eth phy
 impedance
Message-ID: <aVORQQlMpbgonBlw@dragon>
References: <20251218-wip-t-remmet-phytec-de-bspimx8m-3841_upstream-v1-1-2ea15181aaf2@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-wip-t-remmet-phytec-de-bspimx8m-3841_upstream-v1-1-2ea15181aaf2@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_004604_546327_BD4A02B2 
X-CRM114-Status: UNSURE (   7.56  )
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

On Thu, Dec 18, 2025 at 01:00:06PM +0100, Teresa Remmet wrote:
> Update the DP83867 ethernet phy impedance settings to
> to optimize signal quality and reduce potential signal integrity issues.
> 
> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>

Subject prefix "arm64: dts: imx8mm-phycore-som: ..." is good enough.

I fixed it up and applied the patch.

Shawn

