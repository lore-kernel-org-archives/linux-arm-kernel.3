Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4950AC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+V+RCvpoAaGRFT4GZBhiApWS5v7S4yG0iss69ry+Po=; b=NfZipF4uSrw8p+al6MX5oURxEb
	hILJqeV8Zma8L0miuRoyRdJA1CkR5YCxB8MYrQo/fImHCtDSnMxPk5uBsneUV3ZmN/6TFguByS0Mz
	mMCAwqd3m9oJxS/EbqwNdwLgG4cyzW2/RE/H6JDTn16LN/Wk7dYxkO+YMilnWrgq2xpJ05TMv7bE3
	zVWcNOkMl7ih12fcfOTcxDU9DHcL64X/DU+3cAfS6dTT5RM+5O+CfFicPvtCmmEQmzIM3zgu0f7EK
	I2SpFLmnrBeFS47SdZgy2Wuabdh2/YUo9imA45+uGsYci7mZQdsRJAil+DLTFVcA1hekFiF1oOVNf
	2dHu3ZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETyR-00000009h9R-1hCZ;
	Mon, 12 May 2025 14:17:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETFu-00000009Z9k-2mS6;
	Mon, 12 May 2025 13:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=O+V+RCvpoAaGRFT4GZBhiApWS5v7S4yG0iss69ry+Po=; b=Co6n9zSvwNUsxs6gnNNk3Jo6KX
	xK5oFL4yQV10FygzxSVW0Lc9tRJk7exKi9G5xm2wAlQXL4BVmCeMdoc2Cw50s/XYPw5+hoEAz/Jh9
	HMfEey7XQqTz+Yt9jo6VIYtS8bziHyuO67q8DSaFZWsJH5erR2/8vTPEi6flXiM1bPXC9uFZVfKsa
	GrH7rIRVtUiGinhT8ZV/LUq+kDmXJRasTmq//5IT06hbOkOj8YJNbFyKazqHA5HpNekXp4+1z0wab
	2/9t/z5auo5hpJXvVA5VzCyuO3NALLe3R8vDuGqhk4E0H3uFMcFJJSEewW296QKk7sEArOw/w1Vd1
	YsgwY3Qw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uETFV-0006NF-9J; Mon, 12 May 2025 15:31:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, chainsx@foxmail.com
Cc: chainsx@foxmail.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 sfr@canb.auug.org.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 12 May 2025 15:31:16 +0200
Message-ID: <3612514.V25eIC5XRa@diego>
In-Reply-To: <tencent_D5C17F39C684CD6491505763B23BACCE5106@qq.com>
References: <tencent_D5C17F39C684CD6491505763B23BACCE5106@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_063142_717220_22216A6B 
X-CRM114-Status: GOOD (  13.53  )
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

Hi,

Am Montag, 12. Mai 2025, 15:20:48 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 chainsx@foxmail.com:
> From: Hsun Lai <chainsx@foxmail.com>
>=20
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
>=20
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
>=20
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
>=20
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

hmm, you seem to be using git-send-email, but your mails did not
get in-reply-to headers. Normally git-send-email should detect the
cover-letter + patches thing and tie them together to a mail thread
when you send them with a "git send-email *.patch" or similar .


Heiko



