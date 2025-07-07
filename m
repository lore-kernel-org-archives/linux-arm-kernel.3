Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB58DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYX/8ebPYdpS41EyMmngCwqiXAfSXeLhLg4jCU+kiWA=; b=0zfRea6Eek8Y1dhAOqJmFPBYPS
	9LHhX8D18gRohWSsMoBJsAEX6GU3h6LTpUTFrvV8/FIx6xdUJ04J2b61UnKwrwwTRXCwUQ/cpPvxg
	cgJowbHGtvjSIr0Je/yZiTjc6tmbPIBLIABqw3kM4g6I2JtWi8DZHJ6WcOnlYNII4RL6YP7YlP1+Q
	IpJg4NYHhq0OXazIQJJK9AScdQNpWwEAzXox4yEF6aKWWRQmK6LXGeR82wlyTTq8kN0CGDjYxy/Jh
	C/NcfTCeXeJAnOQh/3/htyumH796GyJK0HPpfQ43xF+3t+a2kHA4Iwu29ddaC3DP+8BLgTkGGYVfQ
	tg1MQhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhsQ-00000001wKu-3OC9;
	Mon, 07 Jul 2025 09:11:06 +0000
Received: from proxy25213.mail.163.com ([103.129.252.13] helo=proxy41133.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgx3-00000001oz8-3b5Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wYX/8ebPYdpS41EyMmngCwqiXAfSXeLhLg4jCU+kiWA=;
	b=LHnDhd9GsZXNX1ANay97WouX3tk3XrUeICgpM53urvzr1D7DXARWl9dysQoJlB
	R0zHDZe6yMOwl7p7eQPlCbFIWcembZzb1GCmVjNIgVHRhVAjBse4l2FhsNG5XyJm
	xkykdDU3lBJ893oXW7Ffiyob9/rjaQjdCS5TpWQLOruXI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn_3v2gGtoAmE8AA--.26131S3;
	Mon, 07 Jul 2025 16:10:32 +0800 (CST)
Date: Mon, 7 Jul 2025 16:10:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
Subject: Re: [PATCH] arm: DT: imx6: Replace license text comment with SPDX
 identifier
Message-ID: <aGuA9gJj2cpCfIZ2@dragon>
References: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
X-CM-TRANSID: M88vCgDn_3v2gGtoAmE8AA--.26131S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryfAF1UGF4DWF18Ww4rKrg_yoW3AFX_ua
	y8Xw1UAw4agF48KrWfuF1avasrKFWDZr17XwsYqFy7Aa4qqrZ8XFnYgr90vr1DGa1fJrnr
	uFy5J3y2yw17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbSksDUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRhTuGhrgPgalAAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_011150_142077_030390C8 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, Jun 26, 2025 at 11:19:56AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a SPDX-License-Identifier:
> 
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waßmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied with a bit change on subject prefix:

  ARM: dts: imx6-tx: ... 

Shawn


