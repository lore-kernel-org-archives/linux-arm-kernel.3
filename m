Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C0CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 05:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JD8XR0rMxrds3N4D+/LhBdcJlCyVkkK883MJ9eIDgs=; b=GGB+5ZnaMJK05f7wvBjuKmJuOO
	/M1BxwoG+Cm9ZHgjSYQpVZsXmJ5t/PeGLXO6G4IeTM9bCP+obs+Q28XSedH4rtp7AHdcIYav2obnQ
	Wky0DwhIgEdgu1G40yEkYjRAJTLWOgR4DJFqIUiHAL6y+0nxQkPkD0vbp1iNczToClnE8mzHbU8PE
	kTbiSf+SRyOQlO/MnTZorivF8w0kLGj8+xvHGsaJs5WkOVT+X8EjeWm1jCYTnkj5ar7Z0Y18UvcM0
	jRO6CqnkJz09eiSZS65p2ce5IbX/kzCmW/O8fOihfWV1t6dHzx+AW3VjyFS1ZpPZSlDAVDNi75fYn
	6UEvbrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGBm-0000000D9gL-0wg2;
	Mon, 27 Oct 2025 05:54:42 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGBj-0000000D9fF-0Q6F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 05:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9JD8XR0rMxrds3N4D+/LhBdcJlCyVkkK883MJ9eIDgs=;
	b=EPgcQSvShWq7imV9BCWPHd9qQa2e8o8GJVLiQs+Jg7ox33hUKaJgfvHtt6/LQW
	V/nFlr+f04/BLnZFz+9NLsKikk89T6+E1f+pL+R0QNMBZi6lSwgPPhVydYyWQR6x
	SLafhlxzl56UEJUnXi56d1yT1sOCU+Vw7pdvEJkesb3B4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDX_1nCCP9ojEW+AA--.29661S3;
	Mon, 27 Oct 2025 13:53:08 +0800 (CST)
Date: Mon, 27 Oct 2025 13:53:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, ebiggers@google.com,
	ardb@kernel.org, dario.binacchi@amarulasolutions.com,
	martin.petersen@oracle.com, alexander.stein@ew.tq-group.com,
	stefan.eichenberger@toradex.com, lukas.bulwahn@redhat.com,
	tytso@mit.edu, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: imx_v6_v7_defconfig: enable ext4 directly
Message-ID: <aP8IwcTzRuj542A5@dragon>
References: <20251013121709.104546-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013121709.104546-1-andreas@kemnade.info>
X-CM-TRANSID: Ms8vCgDX_1nCCP9ojEW+AA--.29661S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5mhFUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQRNsmj-CMRJcAAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_225439_489903_4A47F251 
X-CRM114-Status: UNSURE (   7.28  )
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

On Mon, Oct 13, 2025 at 02:17:09PM +0200, Andreas Kemnade wrote:
> In former times, ext4 was enabled implicitely by enabling ext3 but with
> the ext3 fs gone, it does not get enabled, which lets devices fail to
> mount root on non-initrd based boots with an ext4 root.
> 
> Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thanks!


