Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1B4CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bAnrOtRdIsc3omVj8pzR/BbI+fOSQczz6AsAKVXxRg=; b=yt2b77tCw8z68jRqeYyKhBZeA+
	YCqs+z+/10BZJXB/Kz5UcLoIlqCBdQ38biTVlv4dz5SYATth9H4iZWYOYSZ3S49nWLMS9QyC8AQto
	6kj7awSsUw8izGQH9Sp8ujKPfNv50f+ijrG0dv2IlFp3GSsuhX0+1X4hhLXdDQ2ZoEMg62Ig+GNBi
	SYeqUqYFxnuCjl6ipZlRVY8i96GJviLLo/r2v1Xu4NqilxDdzEnYcO8kfmnwcPM0WLJxjZ6/+1Ldh
	xwMYJ1JAYpAcMlK0clVjKYdTEuQIRPgrNpD5BgWZwToaLe8cxn7/xULiacDlXsB5odWbi0kC/dVQQ
	qoDG4dmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcY6-0000000EeeM-1427;
	Sun, 16 Nov 2025 13:12:10 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcY2-0000000EedY-4AaY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1bAnrOtRdIsc3omVj8pzR/BbI+fOSQczz6AsAKVXxRg=;
	b=TuwwCpKF5TN26ytgn8rs8S957dSI+8IU5Fmg2m0eCIFSVM+2WV64zM157nXm0E
	xURcr1UrtM0QArIIW9IgZ55EaoGQlNHn5o2isNxAatuD7d8EgWM6Vb/mxb/IIlXq
	F4i8JU/inkfsNHQCm2gLUvl1Ym1FVWabS8jl42lWgTKmI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnHEyOzRlpmY0YAg--.8000S3;
	Sun, 16 Nov 2025 21:11:44 +0800 (CST)
Date: Sun, 16 Nov 2025 21:11:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: mba8mx: Add MicIn routing
Message-ID: <aRnNjnyUPc82GVZp@dragon>
References: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgCnHEyOzRlpmY0YAg--.8000S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUw4SoDUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxA4nWkZzZBtmQAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_051207_347825_20347CA9 
X-CRM114-Status: UNSURE (   5.91  )
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

On Thu, Nov 13, 2025 at 11:48:54AM +0100, Alexander Stein wrote:
> MicIn is connected to IN3_L. Add routing including the Mic Bias.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!


