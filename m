Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F19E6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZXkEKg8UMMMm6kMsBNgepDvQgd83Ldg8fmPaQgqqcw=; b=QgQIjy9YLGeerOn2g5e6T/sgU2
	u6cKU/VdC8243xjINOrDYiH698rS++/KkPydOl17jdR88cOTE7PML33m/rRml14O47q2TXL3+DlZj
	qUdPiVx4oz7IDzucjmb3EubBw7UPwZDKZKBwYNrzPsif6MhtqcCuHiSh3VRolV903fzLmHQB0cmUD
	Ox48oxAzwvT7zWwi04zwAa9Z50GXTA7hZTBWl5PIyXd0eHCOAXTwGLO9tpJ8oplFCFPAlcsKS9i+/
	h/OB9neTc+DphrOwU5t3LWgj0PDfsbWVgFOahLVJVw9Tsgtq0DcVVHfNa6TgGYwUlA1f0J/xJCnZ0
	OHmNsCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oqR-00000006ZLh-2oxG;
	Fri, 01 Nov 2024 10:25:31 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ofU-00000006WeP-3Hap
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QZXkEKg8UMMMm6kMsBNgepDvQgd83Ldg8fmPaQgqqcw=;
	b=DoamlOQkoGTjoHdzVo7tQeH4A2jVJDBmBBFryVUJ8NQDNCBR1wCOyi9t/2KUrR
	Pi76EKmMpc8leqH6J55yIzLd7+30fHS8b9j+Y5+3cJXEOdFzv1Ijt8cezDJcGgUF
	aaz/qZGl+S91NCO2ezdxKp7i7EIZdvecONU3GSM2wTa4A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXFgfsqSRnPmpkAQ--.13510S3;
	Fri, 01 Nov 2024 18:14:06 +0800 (CST)
Date: Fri, 1 Nov 2024 18:14:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/1] arm64: dts: layerscape: remove en25s64 and only
 keep jedec,spi-nor compatible string
Message-ID: <ZySp7J4JTrrnT62R@dragon>
References: <20241023201129.1382895-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023201129.1382895-1-Frank.Li@nxp.com>
X-CM-TRANSID: Mc8vCgAXFgfsqSRnPmpkAQ--.13510S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4kuw48Xw4fAr4UZw1UWrg_yoWxCFcEya
	y7XrnxG3y5CrWIgryxCa1rW34xWrWYvw18Xr93GFs5t3y5Zr15Was8Kry3Jws09r4YkrZx
	Z348Jr48AFy5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8RHq7UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhuKZWckdPudrAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031413_156131_18AB83B3 
X-CRM114-Status: UNSURE (   8.51  )
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

On Wed, Oct 23, 2024 at 04:11:28PM -0400, Frank Li wrote:
> In jedec,spi-nor.yaml:
>   SPI NOR flashes compatible with the JEDEC SFDP standard or which may be
>   identified with the READ ID opcode (0x9F) do not deserve a specific
>   compatible. They should instead only be matched against the generic
>   "jedec,spi-nor" compatible.
> 
> en25s64 already in drivers/mtd/spi-nor/eon.c. So remove it safely and fix
> below warning:
>   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: flash@2: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['en25s64', 'jedec,spi-nor'] is too long
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


