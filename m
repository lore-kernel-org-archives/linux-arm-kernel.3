Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B40CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD3VrrbFBqMD7ta6tnMBubYSY9n+il+4lLi4piuAG+Y=; b=Xk0QAqdfxMj7Jk+vXO7UEoH/ZK
	hkFC8pnAt0w/I11U6dUkUHNZTFU6AnW3ovkhQPzoy+gaBt90ii5v6uZ5BShaJ4MhNi3CqzJzFeGvn
	m3/MxfBkdLCgMv2Ey1W6vlBd1WUTqaZTfQ0PXfvH4cgdcdcYvS8R8qk5h4qwJvs86kTI43H2oIHyR
	/e670u8a7izKrvJP8Cw+Ek++7cVuF0IM/UcvQTItc2Igm+JgsSSHZ9lZKLOx/VDU35jlIc6472hQw
	zRe2eU0NjYzMsChzWoE34DOILM8ey2/VZ/o6QkK8/8xnB6qUtA0R/JUv57/XYd7YDzGLg8Wa1rZ64
	5FiKXMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcQe-0000000EeIq-3yhh;
	Sun, 16 Nov 2025 13:04:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcQb-0000000EeGG-0Y2l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xD3VrrbFBqMD7ta6tnMBubYSY9n+il+4lLi4piuAG+Y=;
	b=SU395HQKyIvH+JsnFgtI3ATcJ9pZgnYC8qEQZxwQyKZZn2ChggeDpaFB3CAswi
	hBmjEtPfkGqxJakgwE170LhK2yWMYs2H+o1eQ+6M267Uu6+5pMbsVkUAk/H62/4T
	k6r9tU8eo2OZJmKdAel4UETHwwd1vvo7DmO3mgWj2jY9Q=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHWRrFyxlpztElAg--.8401S3;
	Sun, 16 Nov 2025 21:04:07 +0800 (CST)
Date: Sun, 16 Nov 2025 21:04:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: stefan.prisacariu@prevas.dk
Cc: Frank.li@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v2] ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic
Message-ID: <aRnLxcWKk5Q48y6H@dragon>
References: <20251112144441.1827336-1-stefan.prisacariu@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112144441.1827336-1-stefan.prisacariu@prevas.dk>
X-CM-TRANSID: Ms8vCgDHWRrFyxlpztElAg--.8401S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF17CF4DAr1ruF1kKr43GFg_yoWkJFg_uF
	47Gr1kKr4xXFs5tw1xKF1kZryj9wnrXF1kZwnYgr1xGa1vyry5Wa10grnY9r13Cw48ZFs3
	Cwn8JFZ2gry3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1KFAPUUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAnFK2kZy8klwAAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_050425_585573_45004E0A 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, Nov 12, 2025 at 03:44:16PM +0100, stefan.prisacariu@prevas.dk wrote:
> From: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
> 
> Make SoM .dtsi SoC-agnostic by moving SoC include to board level
> 
> imx6qdl-var-som.dtsi currently includes imx6q.dtsi, which makes this SoM
> description Quad/Dual specific and prevents reuse from i.MX6DL boards.
> 
> Changes:
>  - Move imx6q.dtsi include from imx6qdl-var-som.dtsi to
> imx6q-var-mx6customboard.dts.
>  - Remove /dts-v1/; from imx6qdl-var-som.dtsi (dtsi files should not declare
> version)
> 
> This keeps the SoM .dtsi SoC-agnostic (it already relies on imx6qdl.dtsi for
> family-common parts) and allows boards using the DualLite or Solo to include
> imx6dl.dtsi instead.
> 
> Why this is needed:
> To reuse imx6qdl-var-som.dtsi on i.MX6DL board.
> 
> No functional changes for imx6q-var-mx6customboard are intended.
> 
> Signed-off-by: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
> Link: https://lore.kernel.org/all/20250925104942.4148376-1-stefan.prisacariu@prevas.dk/

Applied, thanks!


