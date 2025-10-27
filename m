Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B03CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 05:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ljd/GfWV/LpuXLPWohOtAse3dPFW/ARWxabMfHqOTJA=; b=VW/CuvyBYXQ+4Ffhv/Z27fEvuz
	XGg0dMIBl89xl2UCpPp0O/5dvalopTfRSNzx7w8GFHB3IgimRdljS9SgKFudY/C4Tu9Li15sUfUjZ
	6lRCZlp2YNAuxDEoFrZykgbPJX9pmtFkH5U32kRcKEZ16ODtoOB2pwK+tktxcPeG4T1R+RZVhiiIv
	IBTMVlJtvbekV4dfqpVEZ/Tx4c42TtBWCNLeYQRNVzwMgSLqQrneMuvwPalLpLwFD9MNKvb9RACoI
	xTX+Vw4b7zi78qxBn8HOtrSiIK+xgUl12Z0Twp/lhwTnXL5AJU5gZLXfATNSYmBLnpZPU8zNNLvrq
	iYyXdpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGCc-0000000D9nu-2KqV;
	Mon, 27 Oct 2025 05:55:34 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGCZ-0000000D9nK-2XRL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 05:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ljd/GfWV/LpuXLPWohOtAse3dPFW/ARWxabMfHqOTJA=;
	b=UGln7ZOVacTnbhninps24IXqlFlyB0RG1OMwWhYRwl2Q66TfPUDvmZ5zqU+Ilg
	lNSBDdkaX1WkqhLbbZh8cgtFdvdjG4N5XkL+WgoMa3UABxpAZEPfBkBM+F+FvST4
	Yut2bKfEvDVSHfm5iBPGs3QSKtbfZBAAJYc6aGGunIoGU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3371JCf9o49s+AA--.49824S3;
	Mon, 27 Oct 2025 13:55:23 +0800 (CST)
Date: Mon, 27 Oct 2025 13:55:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp: add idle cooling devices to
 cpu core
Message-ID: <aP8JScVXZo9nj4MY@dragon>
References: <20251013065903.35216-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013065903.35216-1-martink@posteo.de>
X-CM-TRANSID: Mc8vCgD3371JCf9o49s+AA--.49824S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUz8nYUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQtu02j-CUtMEwAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_225531_948882_EA1A7076 
X-CRM114-Status: GOOD (  10.36  )
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

On Mon, Oct 13, 2025 at 06:59:19AM +0000, Martin Kepplinger-Novaković wrote:
> The thermal framework can use the cpu-idle-states as
> described for imx8mp as an alternative or in parallel to
> cpufreq.
> 
> Add the DT node to the cpu so the cooling devices will be present
> and the thermal zone descriptions can use them.
> 
> Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>

Applied both, thanks!


