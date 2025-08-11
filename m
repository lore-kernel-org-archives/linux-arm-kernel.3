Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F38ECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoSRkGb0dSVui2kGtJMRO3df9aT4TuXtCWAU8XI+je0=; b=UaH8w/g7xTNpFWT6P5dgs1WJ78
	B7Vhhyn+fUA3plGlNNAlX/4Si4UzEY/wyzy2kTkWGoOUTH1NNXSFeiS0kEGoK034HGu47XphlJ14u
	hTASjwO63B3+kgNVTd1tSo45hm4Bqoy4MJjNyT/SPoaYewAguJNdEeJuRcASO9RGtn8HJfqaF5CqJ
	qO9TQO5FsDPlBPNMVJHvdlR/eRhQ6wNbsJz5PWE8EO0Wa6BV7593W/6hs+7j44nk6fmTEc3vgTq36
	A+HWO3GYGIXsxNXtL+ZfufM2OFkPXQNiPRUUiY5woMsxTLIyye/T+oZu9bRnFchuZVkqG6+cMielV
	Qv2PCiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVdZ-00000008SJA-1YrP;
	Mon, 11 Aug 2025 16:44:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTeU-000000083LZ-4Alk;
	Mon, 11 Aug 2025 14:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NoSRkGb0dSVui2kGtJMRO3df9aT4TuXtCWAU8XI+je0=; b=erg8R9/+VSQSatTiLHhlebP75P
	U+NhF7oAUdwhPfCtIOo9zP96Ns4yIcNv80x8QnpCQmd3H6PE96YtSC1SZvyNSLCXUK7lLi2U6W5yu
	zXniKGWtaKm9dUAAejJ7MXv0vJn4OtjekveU4VvOdsJJg0gi5/UyGW9SOyX+XInkgQA/lxI0yJ2jO
	y25aa/Vi2p+y5pPzz+uV4a1iRPr9af6zlaJhCVlYW91KF3eX8LDeG0A6//kW1T4WZ5y/2FMAQ+nwZ
	fUl/Q4kU4F9lTPurUJ3hN2PZxgQi8SVln0eVK7xa89KNcL2zarlBmYSbUfnfGuS9CAKRN4whudZIr
	xQjJOQpA==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulTeS-00021w-Ed; Mon, 11 Aug 2025 16:37:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Remove redundant
Date: Mon, 11 Aug 2025 16:37:27 +0200
Message-ID: <1894144.QZUTf85G27@diego>
In-Reply-To: <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
References: <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_073731_058762_5589DD62 
X-CRM114-Status: GOOD (  15.38  )
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

Am Montag, 11. August 2025, 16:03:45 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Dufresne:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

verif=C3=ADed the (new) definition of  pm_runtime_put_autosuspend()
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

But the subject could use some work, I only got
	"[PATCH v2] media: rkvdec: Remove redundant"

so maybe make that
"media: rkvdec: Remove redundant pm_runtime_mark_last_busy"


Heiko

> ---
> Changes since V1:
>   - Re-applied since the driver have been moved out of staging
> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc1f6a18b2d168ebdf20b443f2240e..445f7c92eee34f7d6f885bb51=
9d9eb24313da548 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
>  {
>  	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =20
> -	pm_runtime_mark_last_busy(rkvdec->dev);
>  	pm_runtime_put_autosuspend(rkvdec->dev);
>  	rkvdec_job_finish_no_pm(ctx, result);
>  }
>=20
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd
>=20
> Best regards,
>=20





