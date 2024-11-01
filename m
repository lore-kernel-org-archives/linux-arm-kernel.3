Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE6E6B244
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+ww708aRc0qAteUCkjthXfj1VPpWdpi32cBrs7jx40=; b=rolP+T0v6YN2VZvKijh06JGUAw
	5PspkP9LhLVHGi5rqHBTK/rkbbsP/aD6PxFwJfwhQ1GNfxLnpXhBO60lswtei/BjHmAx2r4oqyHiD
	r0Zqyf/PLG5lSJ4gxbSJr66s8gigw19RbQW3Gg/FwFMRQjuZRORAG9/9MJLrSScdTRDiBJmTk//9s
	gH4uVnhns44ud4DGbKy7VCsI3KgHGzPPFsTXza/2XUUY6dKdNXjAEVI2X5XAV76fy8rnXT5yVlG+Z
	Q0KzKGl//atXya5vVMiDLxCQJTNzDuB8ROUxawqrnGfcj4NZu2BE7oAhNaCS9mJs9e8Z8chLACe6z
	q0qQs7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q3a-00000006mqN-3ME6;
	Fri, 01 Nov 2024 11:43:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q1l-00000006m78-0OtG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=c+ww708aRc0qAteUCkjthXfj1VPpWdpi32cBrs7jx40=;
	b=PWBHOkBeUaF7mXHNKxJLf+YgphM25RjX5LqSCZLkCvuMz5RQTODLV+3SIEUMem
	vWWdt5Xxr9lFpGM+3Wh88y4mPHmOjr+CfR8zcJHXGOS7Sh5yukjMRjTkKBTUcXgH
	u/0gyluq3eZs9QSbBZgBRWGtzTmFei0Z9moJZKXVst09g=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXvSdGviRndu1qAQ--.14047S3;
	Fri, 01 Nov 2024 19:40:56 +0800 (CST)
Date: Fri, 1 Nov 2024 19:40:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix
 coexistence of output-low and output-high in GPIO
Message-ID: <ZyS+Rm8rRkPX6L8S@dragon>
References: <20241023210313.1390767-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023210313.1390767-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgCXvSdGviRndu1qAQ--.14047S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF45ZF47tw47Zry5uw13CFg_yoWfKFXE9a
	sYqw4xJ348Crn0kwnxCwsY9rW29r1xWrnIqr1Sg398KFWFvanFyF10vrySqFW5CF4jyr9r
	G34ktw1UXrWF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGJUUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgeKZWckfBi+WgAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_044117_603354_867AB0AE 
X-CRM114-Status: UNSURE (   8.65  )
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

On Wed, Oct 23, 2024 at 05:03:13PM -0400, Frank Li wrote:
> Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> tree overlays. Since /delete-property/ is not supported in the overlays,
> setting 'output-low' results in both properties being present. The
> workaround is to disable these hogs and create new ones with 'output-low'
> as needed.
> 
> Fix below CHECK_DTBS warning:
> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb-hub-hog:
>    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
>        is valid under each of {'required': ['output-low']}, {'required': ['output-high']
> 
> Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR overlay")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


