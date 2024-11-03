Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FE4E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JTO3pXa6iKx5Hb/VSB98fJK/UCMUDuzcS6whwJ9WpM=; b=fOG1Y81QnPuXFBDNqRAc+dvKDC
	Q+imV3c/umVfMC8iw1leotxGUleUTUM9YcvLewFmRWLzTbFNglhnlu2GqJp3HC4UOMlbQx5AIAS2O
	GmZZKClPQds1Ze8MO5psJbTmRVptyvkmHVF/DzHyS3zAZBR3NOhIgQRx4Z14bWkme2KiISgwnozLU
	fXb5CUfTwRyL3NLDJn0tTKZ38V+fvk+Fg7cLgcaSVgPeRwjNK5/g9FiL7q1hWh0uM1OL0P6FUvhCY
	LycBFi9UgUAbVVqMNidCRKYgATpIPpJUqgb1DUEca06zSaRtQwLkWzt6ZDCPFBfq9a7rUppGvoAZI
	Snzz5uGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7WSl-0000000BCDL-2AIT;
	Sun, 03 Nov 2024 08:59:59 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7WPS-0000000BBw0-3Kpr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 08:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8JTO3pXa6iKx5Hb/VSB98fJK/UCMUDuzcS6whwJ9WpM=;
	b=Xd3pJv91sb3iFpnuMZ4Z6yxTWRvSdC9/iFW/Rcrd8JrLd+4lqUsG5Qv+CX/4DY
	2TF1HEuRrc+ezfjKgo7E6ci2apbiIuhkM3ygZ5ig4RWiToeo7WvxvJevHcNYWsyF
	BoBy+GYRJdFNhKiau1xMYZKXGBzbCF/Tsux2HGxJKhQiQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHo5K4Oidn1XaRAQ--.16068S3;
	Sun, 03 Nov 2024 16:56:26 +0800 (CST)
Date: Sun, 3 Nov 2024 16:56:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: imx8mm/imx8mp-verdin: add
 single-master property to all i2c nodes
Message-ID: <Zyc6uEcPys1On65L@dragon>
References: <20241025095915.22313-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025095915.22313-1-eichest@gmail.com>
X-CM-TRANSID: Mc8vCgBHo5K4Oidn1XaRAQ--.16068S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1UJr4kXFW7tr45Jry8uFg_yoWxuFXEk3
	ZrKF1Ik3yYgFWrKw4Ut3ZrZr909rW8Wwnag342qFWSvr93Aan3CF9Yqryfu3WxXa1xJFsF
	kryxZ34SyFWUCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn6nmtUUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERiMZWcm9u9uJQAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_015635_169348_C7984BB6 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, Oct 25, 2024 at 11:58:01AM +0200, Stefan Eichenberger wrote:
> Add the single-master property to all i2c nodes on the iMX8MM and iMX8MP
> Verdin modules. This will allow us to use some single-master
> optimisations on the i2c driver. Together with the following series, now
> in the i2c-host branch of Andis tree, we get rid of a timeout problem on
> the i2c bus with a SMBus ADC:
> https://lore.kernel.org/all/7ts577rxed4mmfkfin7kfdjfjkb6iak2y4vtgtz6merwxkzz6w@h5aefbvyx44u/
> 
> Stefan Eichenberger (2):
>   arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
>   arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes

Applied both, thanks!


