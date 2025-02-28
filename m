Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4DAC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cH46OOSgHwOcrsTmEvl62W+8vy7UREwxuS3rPqQGW/c=; b=FyLixHJb2NWa4gQkNiwHJcUDNk
	0B+MKOijHPpqaVy7LOp8zI3xEGEMG2smTZrR90ddPw1LaplmqC+ZU8OJMClPZGGc+kdrl7Paq+xu7
	gGT3av2ALERq97lm1Q/yaE7jikQIMzbhWjghCIjg1HvmRmP3/jdxHCop7leLruSi1W9AgXEwMSVPF
	kw0O4BUG5SPK6+JXl3SmL50onvwaMKyyQ0ZowOJFEgLkRxsfAI49+iDsCP7ESvs1wLMXtcWaHeMkJ
	AHh+SZtHKS/sF8YHmztEInrnCftsDIEAutO4dHVu3rPKanNQfFKcReFPpW48WQtim6GogeqKwdxv2
	ess4qLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxB1-0000000AU6e-3W86;
	Fri, 28 Feb 2025 10:01:03 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx5v-0000000ASuw-3ZMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:55:50 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DA92E1FC79;
	Fri, 28 Feb 2025 10:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740736541;
	bh=cH46OOSgHwOcrsTmEvl62W+8vy7UREwxuS3rPqQGW/c=; h=From:To:Subject;
	b=LlhH6219zn1GoFwymXnt7mcFEYsJ0UWvq75dykzDgcV57guXyevGzRMHZR7emmEBY
	 TBHxpwBMq69/INNYcU+UhEDOG7rsRJ9SCHXGYE1PkrGfW3MJwjkZcUB6JCZ8oi8B6Z
	 CPPphU+PJ2DdzpFGLWjeoMuKUkmUKwFp50QL1cOO5dR7dCEXXKJjOnN4AZpudg4HHf
	 CrLw+j7UfAYshsKO7Vys0/0fzhKCezJET9bx8u7B5sPtQ4BtmuCdCJnUjln5lQC7bo
	 hlnQxDXmj1Nvfo2y+wCigz7G+66J4io5kp78P1fWQbQDJHCqVN2Lyx7jzn+O6fwqkL
	 jcPgkjgPEWkOQ==
Date: Fri, 28 Feb 2025 10:55:37 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
Message-ID: <20250228095537.GA16617@francesco-nb>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
 <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_015548_914832_E76A1374 
X-CRM114-Status: UNSURE (   8.16  )
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

On Thu, Feb 27, 2025 at 06:04:52PM +0100, Ernest Van Hoecke wrote:
> Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
> part of the SOM. It's self contained within it, therefore, disabling it
> is not the correct default behavior.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


