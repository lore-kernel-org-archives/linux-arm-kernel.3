Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FCDCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OPyiJznobP/BHgzUxfvT09XKk0Ntk9H61WV3izV1lk=; b=QVuc6wgCmagXQRW1ORnZ3w4Cu9
	3n0gEfLQk1OuKoLu38YsY85qg+wEfr3VozCkXaiqc695SO+2EUbdmqKRluGC2eJtve5orf1g0to8M
	IFoMKzzCnhUoDQSZeLUnrwGTnDN/w+Bfj9c870xy4bGQEe1sM3zJMfnUrTfuAumXLjqXE56W0pdki
	hfrF4MdVVaxOj6sLxS3QYgF492/cvRhhZtuQLSF0frnhwK3RSNHxMs7fCu5yeYJJEoEoQO0vqgdkS
	NDTUOfDh7l/IS0Us8zhjyXIoDSH3Oazps0pUdUQiavFXjtvJ3WY0kYnheZwLLdFOsrg8doXR9DH3I
	1k24k+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbdn-0000000EcGf-37IS;
	Sun, 16 Nov 2025 12:13:59 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbdl-0000000EcGM-0rcQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/OPyiJznobP/BHgzUxfvT09XKk0Ntk9H61WV3izV1lk=;
	b=iTFGbxP+M1RUepI0KtUkpEd3L+aOtVf8Tn2bX/apDpjKL6YjvlFNTTlRTDoVwU
	g6nC2Ee1uOhQtuDA3zN6A6SPJJR9JgWsCGLEBAKYsQW3VwJZoWrx5jVlOSB/7Onr
	bMALZvZCmHLWwo5IPClwNV0LGRx8TtPRM0QjKMvSPR9HQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnMQj4vxlpXUglAg--.8013S3;
	Sun, 16 Nov 2025 20:13:46 +0800 (CST)
Date: Sun, 16 Nov 2025 20:13:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-apalis: add pwm used by the backlight
Message-ID: <aRm_-PWcJCW3SPsE@dragon>
References: <20251031125510.433175-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031125510.433175-1-max.oss.09@gmail.com>
X-CM-TRANSID: Ms8vCgCnMQj4vxlpXUglAg--.8013S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2eHqDUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxrONGkZv-pOBAAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_041357_620904_E38E959C 
X-CRM114-Status: UNSURE (   7.65  )
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

On Fri, Oct 31, 2025 at 01:55:07PM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Add pwm node used by the backlight output pin BKL1_PWM and
> reference it from the pwm-backlight node.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!


