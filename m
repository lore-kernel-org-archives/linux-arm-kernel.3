Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F175FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzGjHDS+xi2DlOMgWkM/K6tjShNEfen6Tw2JtH1Zhpc=; b=pBnIh5Ggi4CP/e/H1tEcod1ze+
	SeJgpAZjl5wTaNNZx0wbGlmMpg0G1O0rFcMCmfzqkXasj9oPecCizmAVrdyu/C7P2pEolps71Rf11
	z6UKd+QjgcrTxTxIUVXkCL7+p2ip+cJH/UCwQv8kz5dMk6tvIuXCAraAHOV7cE9dRWdKHBKOeTMYz
	hSG52zfh3Y9+O+n1f9AoreSZRz5syk4nZj6uXYpwqhdS0eDXXIrir/KbpjrO720eckvPswa+3SH3i
	G9o5KiGkFb7jxvs0Ku5svPjgjKH/kipSiqx+ZrBJEgNNw9ssEWDMRhDuZeWomYzgk6enZSMpVkMyx
	PnAYfBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qbl-00000005NnF-1BUS;
	Thu, 16 Oct 2025 16:13:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qbj-00000005Nlk-0Qis;
	Thu, 16 Oct 2025 16:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LzGjHDS+xi2DlOMgWkM/K6tjShNEfen6Tw2JtH1Zhpc=; b=YO7nCjUg0lOAZ06BrtQN/foq60
	FRtIzvKAyVc0aBUZyVXPR9TqlhFdGo8LvIxQRaqIhOqycd9p6SPR3a8/vwKfzYKtXQeO+vabIVSO0
	WdHaXqKIuitJJcZPsftdcGhW0VNlXBZ2vtJT7eL7dquQS6nwiQqzmOcK56gHaF0fAvY4RTgi+bu+/
	9SpIu41HlD1P3odwoVMBc9TDjO1QQS4FYfpvBvF7foTXoiCM26Vn69pGpLdVHYxpnvnydl9j6r/kF
	Z1CkI2SWYF1id0oUtmlSV2YVuG8/SA/inubLbfJUDQ0eNEkKV3edTuyjHxW9noahkCpP53opn6m+N
	LoXcGbQw==;
Received: from i53875b4f.versanet.de ([83.135.91.79] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v9Qbf-0001Mr-58; Thu, 16 Oct 2025 18:13:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ulf.hansson@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
 sugar.zhang@rock-chips.com, huangtao@rock-chips.com
Subject: Re: [PATCH v1 2/2] pmdomain: rockchip: Add support for RV1126B
Date: Thu, 16 Oct 2025 18:13:34 +0200
Message-ID: <2176528.bB369e8A3T@diego>
In-Reply-To: <20251016134103.294636-3-finley.xiao@rock-chips.com>
References: <20251016134103.294636-1-finley.xiao@rock-chips.com>
 <20251016134103.294636-3-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_091339_159687_308AD7A3 
X-CRM114-Status: GOOD (  12.60  )
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

Am Donnerstag, 16. Oktober 2025, 15:41:03 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Finley Xiao:
> Add configuration and power domains for RV1126 SoC.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---

[...]

> @@ -1104,6 +1122,13 @@ static const struct rockchip_domain_info rv1126_pm=
_domains[] =3D {
>  	[RV1126_PD_USB]		=3D DOMAIN_RV1126("usb", BIT(9), BIT(15), BIT(15),  fa=
lse),
>  };
> =20
> +static const struct rockchip_domain_info rv1126b_pm_domains[] =3D {
> +					      /* name    pwr     req      wakeup */
> +	[RV1126B_PD_NPU]	=3D DOMAIN_RV1126B("npu",  BIT(0), BIT(8),  false),
> +	[RV1126B_PD_VDO]	=3D DOMAIN_RV1126B("vdo",  BIT(1), BIT(9),  false),
> +	[RV1126B_PD_AISP]	=3D DOMAIN_RV1126B("aisp", BIT(2), BIT(10), false),
> +};
> +

same clarification needed as for patch 1 ... is it aiisp (with 2 "i")?
As described everywhere in the TRM.

Other than that I checked the bits and registers against the TRM, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko



