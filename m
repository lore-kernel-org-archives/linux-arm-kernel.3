Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1256BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odtBH0LCDjXXAC9EkbBCPzy/Jj9lMmjM6esmzhTWvMc=; b=ZognFTSj/6LJ8trgUfG0V+R5uv
	D8OJxpHYx45eMCZYkXq9kE5e33unVCT/YyX7+W3tHMZ7xJe4kICdeantBhaaAJmlqG2RJdzDAKfd1
	NP2SlkCmpmpXM51tcdz/cTl4UldDHZDGlesPly8yMfhzG8lQTPeRD43Ys2igxspyMxUpiua26Xtk7
	yyHuS0tEXj2NbxingwfjQrI7dNOO6aweWZaMs5Ak4rh9s3cpN8Bl8TGpZCFl/Y5Vvou1BGDgM+d+D
	scGD4WWfyUuOhvmY30mQJniXoEQIzk3pq5d8HrFzh26n1OS+m9hPw2OhFbUzwkEykcRpZUCidQsPg
	iHSSsIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1mi-0000000BtEa-3shO;
	Tue, 10 Dec 2024 15:04:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1ld-0000000Bt0y-1iXZ;
	Tue, 10 Dec 2024 15:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=odtBH0LCDjXXAC9EkbBCPzy/Jj9lMmjM6esmzhTWvMc=; b=bTt9MPRSsSxp9+UuhbHN5pkJiQ
	2x/ygyfPuP7/tANxYvUYhUgX/bkSe86zdbbaK+jZEs1zNJ0lgx6qxd+ECV3Gm4eV6n5xooC5CycPp
	KYpaZb8Dqt1CqDA0s26ryw8/0gS4UHUyhUnVI7KrceAm71GN9kCBeZkB1mQap4Dm5cd55JKSY2/+Q
	C50DTqQeNTH/RRfe69p1WzgIpLLTswWfkq3rOPI43XnzdvLfXUTuCWwOTy7N9Q24qyaq9pb1eIWCU
	2ov0n1vTa7dQ7dqc5JzgusiAVIIIeNdK45EcIxXem2c6C3WMTnbJ2rW+NeHchpVxak8PY9eAENja/
	J9Ai0xiQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tL1lU-0006rU-7b; Tue, 10 Dec 2024 16:03:08 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 13/18] drm/rockchip: vop2: Introduce vop hardware version
Date: Tue, 10 Dec 2024 16:03:06 +0100
Message-ID: <8259618.JRmrKFJ9eK@diego>
In-Reply-To: <20241209123330.2781991-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209123330.2781991-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_070317_465065_7CF1B8EB 
X-CRM114-Status: GOOD (  17.22  )
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

Am Montag, 9. Dezember 2024, 13:33:29 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> There is a version number hardcoded in the VOP VERSION_INFO
> register, and the version number increments sequentially based
> on the production order of the SOC.
> 
> So using this version number to distinguish different VOP features
> will simplify the code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

> @@ -798,6 +798,7 @@ static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
>  static void vop2_enable(struct vop2 *vop2)
>  {
>  	int ret;
> +	u32 version;
>  
>  	ret = pm_runtime_resume_and_get(vop2->dev);
>  	if (ret < 0) {
> @@ -817,10 +818,19 @@ static void vop2_enable(struct vop2 *vop2)
>  		return;
>  	}
>  
> +	version = vop2_readl(vop2, RK3568_VERSION_INFO);
> +	if (version != vop2->version) {
> +		drm_err(vop2->drm, "Hardware version(0x%08x) mismatch\n", version);
> +		return;
> +	}

style-nit: please add a blank line here.

> +	/*
> +	 * rk3566 share the same vop version with rk3568, so
> +	 * wen need to use soc_id for identification here.
> +	 */
>  	if (vop2->data->soc_id == 3566)
>  		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
>  

otherwise, looks good.

Thanks
Heiko



