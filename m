Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDEDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnMwhEnzZlDnNZbKeqVTyqH7UMhTN8QyA0rAjVzJafc=; b=RmQtA6npwkEI6sfK7/BZz9NE60
	zmUrU/XlS71GZzl+wk3AJQG4R5cB3MlASnU9MMXh4rR8hlt3z7z3f+VLmd/ee2g5g7fCWyon6WEcd
	1Dm/eDK3vkBHnNvbHKM6rgC2YkhXb1Xc6G2OX+BfXmBpxB2RHJkGT//1SYTrjT5WZGxHXsKBwRoJp
	xUJFLRVMfraWz6Jcqyh61Xk4byZrDzq6YL07OGNbbXhVKbk9a8fD4av5EBLAjlrzNMAKhGT4sVUse
	N0IgVOPhZythMBwzQWcEDSZIYClv9PkiLGxq9pGrN7PNw7n9bFcdpgf2gwfLfoClOsoODWEEOvuVz
	c1JQGOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKiK-00000007ixD-3zvl;
	Tue, 18 Feb 2025 10:20:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKTQ-00000007f34-2SV6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NnMwhEnzZlDnNZbKeqVTyqH7UMhTN8QyA0rAjVzJafc=;
	b=d6aJvRm4llb3gOD6zts96Oakj9u2LBColm3KDmfsYfTOQMe9qeOv3HB5ibEtDh
	OAYDxeaAM3nSSNL86qafeA39uqxR6SfIy2salA/w5hDcYJriQt/wBtIFNj+0/tt1
	buHNCmBLC0t1f/Alhyl1HF512pgdN5/P4w60+RUbW8hbk=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCH28hCW7RnZJAnCQ--.17115S3;
	Tue, 18 Feb 2025 18:04:52 +0800 (CST)
Date: Tue, 18 Feb 2025 18:04:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v5 0/3] add I2C DTS support for S32G2/S32G3 SoCs
Message-ID: <Z7RbQqBfKtM+AtsM@dragon>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID: M88vCgCH28hCW7RnZJAnCQ--.17115S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdgAUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxn3ZWe0TnUxPgAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_020504_941171_BE4FC2EC 
X-CRM114-Status: UNSURE (   6.60  )
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

On Mon, Jan 13, 2025 at 01:05:09PM +0200, Ciprian Costea wrote:
> Ciprian Marian Costea (3):
>   arm64: dts: s32g: add I2C[0..2] support for s32g2 and s32g3
>   arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
>   arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4

Applied all, thanks!


