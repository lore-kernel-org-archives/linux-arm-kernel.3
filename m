Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6At0GdwrBbQRQtGqN9J/OMjpky8vIXhTBbHz6TrbWzE=; b=3c/CiNtOhjTYj1k0PYemgeGLbp
	eCespGUUxtE5ajaoJYAeFpqIyqjZDtQvqIHuYuhSoHDgpLthfwmt5K+LZVt0C0fRJByYG1ufPy6Pc
	UmPvRmUY68u3BpGTBEp6jC5LnfY89LGQOqBsnTmEtZp/oTvMSXw0kxqieoCQQS5sdt2GqZDq8RLMj
	Y5T5NrWPFkqF+GjRXObyFE9+VgyKzr0uE5VUy3sc3HH4BgKtPL1MYqF0oYhyshnQ9RJjEb9eMLZrd
	WPWJwJUXKjswoHtw15/xW1SpgQt6EubNuVjhragDyS21PdZu1CBqrOYdKrN7cSnBsBvXyX0v3w3n/
	jb7t+adg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZR1-00000006yvI-2CnQ;
	Mon, 09 Dec 2024 08:48:07 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZPz-00000006ymP-1shC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6At0GdwrBbQRQtGqN9J/OMjpky8vIXhTBbHz6TrbWzE=;
	b=lPkb5FsQmQQdQWYcOzNMDtKfRo1KvT3RUdQ65WJyafYZMQH73wbDb4z/tBVvXp
	EPf7uwabkJEdy02G4PoQDCh2m0gVWNxAAgU1Bx319nuoUnhIhRrY5ndrT1KBNsAt
	janG84vU51iRqBU7JeilP008ItQrUcHMePQOX294kZG0A=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXPuxxrlZnKVSNBA--.47957S3;
	Mon, 09 Dec 2024 16:46:43 +0800 (CST)
Date: Mon, 9 Dec 2024 16:46:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <Z1aucR3ueKIxOjSX@dragon>
References: <20241107085705.490940-1-lukma@denx.de>
 <20241107085705.490940-3-lukma@denx.de>
 <20241119165236.69438f75@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119165236.69438f75@wsk>
X-CM-TRANSID: Ms8vCgAXPuxxrlZnKVSNBA--.47957S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4CD7UUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgiwZWdWlR95wQAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_004703_794071_7875292F 
X-CRM114-Status: GOOD (  13.24  )
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

On Tue, Nov 19, 2024 at 04:52:36PM +0100, Lukasz Majewski wrote:
> Dear Community,
> 
> > The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> > some extend similar to already upstreamed XEA devices, hence are
> > using common imx28-lwe.dtsi file.
> > 
> > New, imx28-btt3.dtsi has been added to embrace common DTS
> > properties for different HW revisions for this device.
> > 
> > As a result - changes introduced in imx28-btt3-[012].dts are
> > minimal.
> > 
> 
> Are there any more comments / suggestions for this patch set?

Patch #2 and #3 look good to me.  That said, I'm waiting #1 to be
applied first.

Shawn


