Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1943CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6zXbnirHPfwURjTSzjf0yuewcHo8JAYP7+VOWSU0F0=; b=u0MGepnmI1aEDrKD1UYpKKE3Nk
	Z/O9w2eYKPPNALrXENlesnpcGS2m5AaWLOM6lB/7ke8ADK01gW6T1zQn3Y/z4igd0gtby9pdhfZE1
	avZ3/zl97fc9mLwY50CkbWO/lQ5TTx1F0bZL3/cXvI9laZwnl1fD3jkWKvuslT7RNMxp+qoy3htK+
	VSFC34WZSjrlMf12FUV1guoI13CQgw2SqbXUj0rG+pSbxT+d/dwd/l/rCNZSGrqVx8pzDf12p9qIE
	llQMZthMKgQzmRT7G1V9U1WYJi8wzidoNZExtr9X8rL6LduyRLvjZevW6HcWE6d03KyEy+/dQkMyN
	2Gd/d/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mW0-00000009ihK-2kT5;
	Thu, 25 Sep 2025 14:00:08 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mVv-00000009iZN-2lDR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:00:06 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758808798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6zXbnirHPfwURjTSzjf0yuewcHo8JAYP7+VOWSU0F0=;
	b=q/TpsiuYwjlQgxS8kmy2CYvW3WT+sO1+7Ax4CLGDFqC2d+RxkkegkWFQctwA7XxU7FItms
	DkURbfekIuXl1omweLieacGb0/N1V6+Bc8VetgeZgBkSdE1mL5KPnatcJrbdQpCaCwOtCc
	6w96VQwbYnxSsvpA7+8hWOyHqjCKpHUoLDdCmDAwZuHCQVzzwncHXC5D7vgQSJXIiHeMtu
	Soo6MIMISB35FMbJ+A9ZwJTcxJFyEEq1Fnyh68oEkZaEwJDSmV5R3GKqI0IvuWAg86zc3U
	OD7bJNjIHTOOr94Cxg9LPx8Qwhx27r9fRFv4OJWKklI2QJKN/EJnwWBQnzttDA==
Content-Type: multipart/signed;
 boundary=d1cbf490ecbd8c6ccce0deb6a66abc7d8a9e3325aeede4af7c494c5816b0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 25 Sep 2025 15:59:44 +0200
Message-Id: <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Heiko Stuebner" <heiko@sntech.de>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Jon Hunter" <jonathanh@nvidia.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in
 fw_devlink_dev_sync_state()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>, "Saravana Kannan"
 <saravanak@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <linux-pm@vger.kernel.org>
References: <20250925115924.188257-1-ulf.hansson@linaro.org>
In-Reply-To: <20250925115924.188257-1-ulf.hansson@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_070005_378385_ECEE82A5 
X-CRM114-Status: GOOD (  27.53  )
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

--d1cbf490ecbd8c6ccce0deb6a66abc7d8a9e3325aeede4af7c494c5816b0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Sep 25, 2025 at 1:59 PM CEST, Ulf Hansson wrote:
> Due to the wider deployment of the ->sync_state() support, for PM domains
> for example, we are receiving reports about the messages that are being
> logged in fw_devlink_dev_sync_state(). In particular as they are at the
> warning level, which doesn't seem correct.
>
> Even if it certainly is useful to know that the ->sync_state() condition
> could not be met, there may be nothing wrong with it. For example, a driv=
er
> may be built as module and are still waiting to be initialized/probed.

"there may be nothing wrong with it" doesn't sound very convincing.
So there *can* be something wrong with it, so warning sounds
appropriate? If there is (certainly) something wrong with it, I expect
an error.
FWIW: most of my drivers/modules are built as modules.
I do seem to run into 'problems' more then average because of that, but
to me it just signals there is something wrong ... which should be
fixed. Not silenced.

You're the expert, but I'm not so sure this is an improvement.
I do regularly check dmesg level 0, 1, 2, 3 and 4, hence it landed on my
radar. I do not regularly check all the dmesg msgs, so this change would
result it dropping off my (immediate) radar.

On Fri Sep 12, 2025 at 8:32 PM CEST, Saravana Kannan wrote:
> Please don't just disable fw_devlink using fw_devlink=3Doff. We want to
> fix any issues you are hitting with it. I might even delete this "off"
> option sometime. It was meant as an early debug option.

That response made a lot of sense to me. I haven't gotten around to it
yet, but I want to test all my (Rockchip) devices to see if they 'need'
that parameter to 'silence' the warning. I have a (vague) recollection
that some don't need it (for that).

My 0.02

Cheers,
  Diederik

> Ideally these messages should be at the debug level, but since the
> ->sync_state() feature is under an ongoing deployment and the prints
> provides valuable information, let's move to the info level for now.
>
> Cc: Saravana Kannan <saravanak@google.com>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Sebin Francis <sebin.francis@ti.com>
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d22d6b23e758..97eab79c2f3b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device =
*dev, void *data)
>  		return 0;
> =20
>  	if (fw_devlink_sync_state =3D=3D FW_DEVLINK_SYNC_STATE_STRICT) {
> -		dev_warn(sup, "sync_state() pending due to %s\n",
> +		dev_info(sup, "sync_state() pending due to %s\n",
>  			 dev_name(link->consumer));
>  		return 0;
>  	}
> @@ -1792,7 +1792,7 @@ static int fw_devlink_dev_sync_state(struct device =
*dev, void *data)
>  	if (!list_empty(&sup->links.defer_sync))
>  		return 0;
> =20
> -	dev_warn(sup, "Timed out. Forcing sync_state()\n");
> +	dev_info(sup, "Timed out. Forcing sync_state()\n");
>  	sup->state_synced =3D true;
>  	get_device(sup);
>  	list_add_tail(&sup->links.defer_sync, data);


--d1cbf490ecbd8c6ccce0deb6a66abc7d8a9e3325aeede4af7c494c5816b0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaNVK1wAKCRDXblvOeH7b
bu9cAQDgWb2pxgFG3UFhZ5AJ4XnkZoo6afbzYvPejyBq4VRNVQEA+D1rt5xMXzkr
wKGuYk+Gprw82liU5r/9UMBzEgnLcwE=
=qpi2
-----END PGP SIGNATURE-----

--d1cbf490ecbd8c6ccce0deb6a66abc7d8a9e3325aeede4af7c494c5816b0--

