Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C446E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7f3mLAKs5aTYmrqkxyLkc8lw0Zm19/PnV18nFW9dUY=; b=Q93xjwLnCRy8HUbs+Hnk5SfiwI
	EIfrTCkx6d4D6ajEG9/h9N68jiFg+28ponheNUXRTnXqGoFs+EptF6FR/d9zPLzvPlKIBpVNnKywr
	G9rxtmSLL55YxCVymAbukyz16wv8qQ2abvaP8lS0LOc2INZSuqbbrBDPLEMFoFU9ajNhv2bEkcEiU
	tGJtAPbnV+vOqX1H6v/C5uFV3t7n/NmUPpPCylEQnJJIksZq6PVXGi9W8Z6gcoHjoMorJon8zL/ks
	HKQwJePK/VmpOlOGtHQtrSJUPNTzYow71wSFLgNFwSmts4pecMC4h2WXq1Brb+xF3l2Rbkdg/ANA8
	LG94jX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaAn-000000076Rh-0qfK;
	Mon, 09 Dec 2024 09:35:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKa9j-000000076Eq-2Qrz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=J7f3mLAKs5aTYmrqkxyLkc8lw0Zm19/PnV18nFW9dUY=;
	b=TW88fyEWWHpX4hPCESuPi0c1Ax5rCJkDSnFRDbMiTbK+UldlzYLHydGvoeDXsx
	usfdP5EulXo+sM5+frUA/6P5xRUP+D2wPok8UGyBzH5QVyqZcTFHQyf5lIdW30b/
	HgXezipCCOUPAKNeXzDnaZTcOXRnQ9hOiUoIdo8U7l7To=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3f3KAuVZnxPyNBA--.47131S3;
	Mon, 09 Dec 2024 17:33:54 +0800 (CST)
Date: Mon, 9 Dec 2024 17:33:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, wahrenst@gmx.net,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <Z1a5gBgVIl0BAJ4y@dragon>
References: <20241108153546.268695-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108153546.268695-1-eichest@gmail.com>
X-CM-TRANSID: Ms8vCgD3f3KAuVZnxPyNBA--.47131S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrGw47JrW3XrWxWrWDXFb_yoWDKrX_Cr
	n7Ww4kGwsYgrZruw18uwsa9Fs8uay8ursxWrnIqFyag3s0vrs8Z3Zxta4rZrn7Xa9aqayU
	JrykuwsIy343KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08Oz7UUUUU==
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBOwZWdWr8gxLAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_013419_931111_3A4DB650 
X-CRM114-Status: GOOD (  11.95  )
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

On Fri, Nov 08, 2024 at 04:34:34PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio.
> 
> With commit d469b771afe1 ("ARM: dts: imx6: update spdif sound card node
> properties"), the more generic audio-codec property is used instead of
> the old spdif-controller property. Since most i.MX6 boards now use the
> audio-codec property together with the linux,spdif-dit and
> linux,spdif-dir compatible driver, it makes sense to enable
> SND_SOC_SPDIF in the imx_v6_v7_defconfig. This will ensure compatibility
> with the updated device tree.
> 
> Without this change, boards that use the audio-codec property will show
> the following error message during boot when using the
> imx_v6_v7_defconfig and spdif audio is not working:
> [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Applied, thanks!


