Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA3BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8zFqJWahQRYa7ooRRKZAoytsqOvdRBD6lYtjCz5PvU=; b=qN9t6tZKa4ahFaweaNtsAJatab
	M4huXRQS0ndiH1V5xQbC5jFWmH6LxGRfN06F+S0tLHK/erRWNmahGdQlyQuGV4uzY0oPl0itfZPtz
	NUE51gxjte8HDOy1H4cVoDxrW/psQPg1s1NVMNSKDa0Njlh7laGBmxm2SUhcWn5UrkhWgXmzJTmsP
	Pj5uNSWfr91h3XNdj3pzIQW+4WzqDjL6onfqqpM9FppkVV1UcmcV2ZcGn5ukpREr/MQ3OiRYCiTp7
	g2ixXK4Ui1ZzHC5yhKjNKqGq83FqP+bPu+UbQ4w+I7hTyfF7gBKc3o46abf5hLkn5wUwW8IkEiquZ
	YXmcPDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troP8-00000004LLO-2KnT;
	Tue, 11 Mar 2025 01:27:34 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troNU-00000004LGk-2Bh4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=X8zFqJWahQRYa7ooRRKZAoytsqOvdRBD6lYtjCz5PvU=;
	b=gHaW1dD8mxc/0Dcexj//CceELvKJ24O37TYm84942lK1bZIQ8oTx70PXyiM7kd
	5qjmaWtu9QHa88ycjdMIBgKJ63s4PJ7epivfDnaFWTk74ZAo3rtuZ7zAoaj/276P
	A3AJD1B8K5H9t06554mEUVwxfYTSLtMJ1XG2NPk4XzTdk=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHtkkKkc9nyXCuAA--.818S3;
	Tue, 11 Mar 2025 09:25:32 +0800 (CST)
Date: Tue, 11 Mar 2025 09:25:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mathew McBride <matt@traverse.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: freescale: ten64: add usb hub definition
Message-ID: <Z8+RCo8mGOLIck5a@dragon>
References: <20250129045352.10728-1-matt@traverse.com.au>
 <20250305001901.31594-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305001901.31594-1-matt@traverse.com.au>
X-CM-TRANSID: M88vCgAHtkkKkc9nyXCuAA--.818S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1UWw1xAry8ArWDXF47Jwb_yoWxtrXEka
	4UAFs2kws8Cr1DKr1fZryDAF4fKw1UArn0gryDKFyaya4UXa1DGwn3WryFv34fXFWDGr1D
	Ca4SgFWkta4fGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhYNZWfPVKmmBwAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_182553_071063_BEDC193E 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, Mar 05, 2025 at 11:19:01AM +1100, Mathew McBride wrote:
> A device tree binding for the Microchip USB5744 hub controller
> was added in commit 02be19e914b8 ("dt-bindings: usb: Add support
> for Microchip usb5744 hub controller").
> 
> U-Boot will consume this binding in order to perform the
> necessary actions to enable the USB hub ports over I2C.
> (We previously used our own out-of-tree driver for
> this task)
> 
> The Ten64 board does not have any switchable supplies
> for the voltage rails utilized by the USB5744, so a
> pair of dummy supplies have been added to facilitate
> operation with U-Boot's hub driver.
> 
> Signed-off-by: Mathew McBride <matt@traverse.com.au>

Applied, thanks!


